---
title: "easykubenix: Kubernetes Manifests with Nix"
date: 2024-03-05
description: "Using the NixOS module system to generate Kubernetes manifests instead of Helm or Kustomize."
hidden: true
---

Helm templates are ugly. Kustomize patches are awkward. I wanted to generate Kubernetes manifests using a language that actually composes well, so I built [easykubenix](https://github.com/Lillecarl/easykubenix) - a tool that uses the NixOS module system for Kubernetes manifest generation.

## Why Not Helm or Kustomize?

**Helm** uses Go templates, which are painful to write and debug. The templating is stringly-typed, error messages are unhelpful, and complex logic becomes unreadable. It's also hard to compose - you can't easily take a Helm chart and override just one nested field without understanding the chart's entire values structure.

**Kustomize** is better in some ways - it's declarative and doesn't require templating. But the patching system is limited. Strategic merge patches work until they don't, and JSON patches are verbose and error-prone. Overlays get complicated quickly.

## The NixOS Module System

The NixOS module system has been managing complex configurations for years. It handles:

- **Deep merging** of configuration from multiple sources
- **Type checking** with clear error messages
- **Overrides** at any level with `mkForce` and `mkOverride`
- **Conditional configuration** with proper dependency tracking
- **Documentation** generated from option declarations

This is exactly what you need for Kubernetes manifests.

## How easykubenix Works

You define your Kubernetes resources as Nix modules:

```nix
{ config, lib, ... }:
{
  kubernetes.resources.deployments.my-app = {
    metadata.namespace = "default";
    spec = {
      replicas = 3;
      selector.matchLabels.app = "my-app";
      template = {
        metadata.labels.app = "my-app";
        spec.containers.main = {
          image = "my-registry/my-app:latest";
          ports.http.containerPort = 8080;
        };
      };
    };
  };
}
```

This composes with other modules. Want to override the replica count in production?

```nix
{ lib, ... }:
{
  kubernetes.resources.deployments.my-app.spec.replicas = lib.mkForce 5;
}
```

No patches, no overlays, just a direct override that's clear about what it's doing.

## Helm Chart Compatibility

I didn't want to rewrite every Helm chart, so easykubenix can render Helm charts and import the resulting resources into the module system:

```nix
{
  kubernetes.helm.releases.cert-manager = {
    chart = "cert-manager";
    repo = "https://charts.jetstack.io";
    version = "1.14.0";
    values = {
      installCRDs = true;
    };
  };
}
```

The rendered resources become part of the module system, so you can override them like any other resource. This isn't perfect - some Helm hooks and lifecycle features don't translate - but it covers most use cases.

## Integration with nix-csi

easykubenix works particularly well with [nix-csi](/blog/nix-csi/). You can reference Nix packages directly in your manifests:

```nix
{ pkgs, ... }:
{
  kubernetes.resources.deployments.my-app.spec.template.spec = {
    containers.main = {
      image = "gcr.io/distroless/static";
    };
    volumes.nix = {
      csi = {
        driver = "nix-csi.lillecarl.com";
        volumeAttributes.paths = builtins.toJSON [
          "${pkgs.python3}"
          "${pkgs.my-app}"
        ];
      };
    };
  };
}
```

Push the manifest, and nix-csi knows which store paths to pull.

## What I Learned

I built easykubenix partly to learn how the NixOS module system works internally. It's more complex than it looks from the outside, but the complexity is justified - the module system solves real problems around configuration composition that other approaches handle poorly.

The main limitation is adoption. Everyone knows Helm. Very few people know Nix. If you're already invested in Nix, easykubenix is a natural fit. If you're not, it's a harder sell.

## Current Status

easykubenix is in active use in my [hetzkube](/blog/hetzkube/) cluster. It handles all of my deployments including cert-manager, Cilium, kube-prometheus-stack, Keycloak, and various applications.

The code is at [github.com/Lillecarl/easykubenix](https://github.com/Lillecarl/easykubenix).
