---
title: "nix-csi: Replacing Container Images with Nix"
date: 2024-03-10
description: "A Kubernetes CSI driver that mounts the Nix store into pods, eliminating the need for traditional container images."
hidden: true
---

I don't like working with container images. The layer system is clunky, caching is unpredictable, and you end up with a lot of duplicated data across images. [nix-csi](https://github.com/Lillecarl/nix-csi) is my solution: a Kubernetes CSI driver that mounts `/nix` into pods so you can run applications directly from the Nix store instead of baking them into container images.

## The Problem with Container Images

Container images work, but they have issues:

- **Layer sharing is limited.** Unless you're extremely disciplined about base images, you end up with lots of duplicated data across images.
- **Build caching is fragile.** Change one early layer and you rebuild everything after it.
- **No real SBOM.** You can generate one, but it's derived from the build process rather than being intrinsic.
- **Size adds up.** Every image ships its own copy of common libraries and tools.

Nix solves all of these problems at the package level. Every package is content-addressed, dependencies are shared automatically, and you get reproducibility and SBOMs for free. The question was: how do I use Nix packages in Kubernetes?

## Existing Approaches

[nix-snapshotter](https://github.com/pdtpartners/nix-snapshotter) was the inspiration. It integrates with containerd to provide Nix-based container images. The problem is it requires modifying containerd on your nodes, which rules out managed Kubernetes. It also can't share page cache across containers unless you use read-only root filesystems.

[Flox](https://flox.dev/docs/k8s/intro/) recently released their "imageless Kubernetes" approach, which is similar in concept. Worth looking at if you want to understand the general idea.

## How nix-csi Works

nix-csi takes a different approach that works on any Kubernetes cluster, including managed ones like EKS or GKE:

1. **DaemonSet deployment.** nix-csi runs as a DaemonSet with no special node modifications required.

2. **Node store.** It creates `/var/lib/nix-csi` on each node as a hostPath volume. This is the "nix-csi node store" - a Nix store that lives on the node.

3. **Hardlink views.** For each CSI volume request, nix-csi creates a "hardlink view" of the requested store paths. This is a directory tree where files are hardlinked to the actual store paths.

4. **Mount modes:**
   - **Read-only:** The hardlink view is bind-mounted directly into the pod. This means pods share inodes with each other and with the node store.
   - **Read-write:** An overlayfs is created over the hardlink view, giving the pod a writable layer while still sharing the base data.

5. **Store path farming.** nix-csi can read pod specs and automatically identify which store paths need to be present. Combined with [easykubenix](/blog/easykubenix/), you can reference Nix packages in your manifests and have them automatically pulled and mounted.

## The Magic: Shared Page Cache

The hardlink approach is the key innovation. Because files are hardlinked rather than copied:

- **Inodes are shared across pods.** Ten pods using the same package share one copy of the data on disk.
- **Page cache is shared.** When one pod loads a shared library into memory, other pods reading the same file get the cached pages. This significantly reduces memory pressure compared to having each container load its own copy.

Docker image layers can't do this. Even if two containers use the same base image, they each get their own copy of the files because the layer union filesystem creates separate inodes.

## Usage Example

You run a base distroless image and specify the Nix packages you need as CSI volumes:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: my-app
spec:
  containers:
  - name: app
    image: gcr.io/distroless/static
    volumeMounts:
    - name: nix
      mountPath: /nix
  volumes:
  - name: nix
    csi:
      driver: nix-csi.lillecarl.com
      volumeAttributes:
        paths: |
          /nix/store/abc123-python3
          /nix/store/def456-my-app
```

With easykubenix, you can reference the packages directly and let Nix figure out the store paths.

## Tradeoffs

**Advantages:**
- Works on managed Kubernetes
- Excellent deduplication and sharing
- Shared page cache reduces memory usage
- Full Nix benefits: reproducibility, caching, SBOMs

**Disadvantages:**
- Requires a Nix cache accessible from nodes
- More complex than just pushing images
- Pods depend on the node's nix-csi DaemonSet
- Not as widely understood as container images

## Current Status

nix-csi is written in Python and is in active use in my [hetzkube](/blog/hetzkube/) cluster. It's functional but still evolving. The main thing I'd like to improve is the integration with binary caches - right now it works best when you're pushing to a cache that nodes can pull from.

The code is at [github.com/Lillecarl/nix-csi](https://github.com/Lillecarl/nix-csi).
