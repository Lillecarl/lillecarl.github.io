---
title: "hetzkube: Production Kubernetes on a Budget"
date: 2024-03-15
description: "Building a full production Kubernetes platform on Hetzner for less than 30 EUR/month."
hidden: true
---

I wanted a proper Kubernetes environment for personal projects and learning, but I didn't want to pay cloud prices for it. The result is [hetzkube](https://github.com/Lillecarl/hetzkube) - a production-grade Kubernetes setup running on Hetzner Cloud for under 30 EUR/month.

This isn't a toy cluster. It has everything I'd expect in a real production environment: proper control plane management, production networking, observability, secrets management, and SSO. The constraint was the budget, not the feature set.

## The Stack

**Control Plane:** ClusterAPI manages the cluster lifecycle. This gives me declarative cluster management that works the same way whether I'm targeting Hetzner, VMware, or bare metal. The control plane runs on a single 4GB node (3.50 EUR/month) - I've tested with 3 nodes but don't need the HA for personal use.

**Nodes:** NixOS on all nodes, rebuilt from scratch with the latest configuration on every node initialization. No configuration drift, no snowflakes. One worker node with 8GB RAM runs the actual workloads (~5-6 EUR/month).

**Networking:** Cilium handles everything - CNI, ingress, Gateway API, and network policies. I run full dual-stack (IPv4 + IPv6) with Kyverno policies enforcing that all services are dual-stack. No exceptions.

**Custom IPAM:** This is where I saved the most money. Hetzner charges for floating IPs and load balancers, so I built a custom IPAM that reuses node IP addresses as LoadBalancer addresses. Each node gets a /64 IPv6 from Hetzner, and I carve out addresses from that for LoadBalancer services. Kyverno ensures all LoadBalancer services have the IP sharing annotation, so multiple services can share an IP on different ports.

**Storage:** hetzner-csi for persistent volumes, local-path-provisioner for ephemeral stuff. I'm planning to add OpenEBS eventually.

**Observability:** kube-prometheus-stack gives me Prometheus, Grafana, and Alertmanager. Loki for logs is on the roadmap.

**Authentication:** Everything goes through Keycloak for OIDC. Kubernetes API, Grafana, pgAdmin, Headlamp - if it has a web UI, it's behind SSO.

## What's Running

Here's the module tree that shows what's deployed:

```
kubenix/modules/
├── capi.nix
├── cert-manager.nix
├── chaoskube.nix
├── cilium.nix
├── cnpg.nix
├── coredns.nix
├── external-dns.nix
├── external-secrets.nix
├── gateway-api.nix
├── hcsi.nix
├── headlamp.nix
├── keycloak.nix
├── kube-prometheus-stack.nix
├── kyverno.nix
├── local-path-provisioner.nix
├── metrics-server.nix
├── pgadmin.nix
└── vertical-pod-autoscaler.nix
```

All of this is defined in Nix using [easykubenix](/blog/easykubenix/), my module system for generating Kubernetes manifests.

## The Budget Breakdown

| Component | Cost |
|-----------|------|
| Control plane (CX22, 4GB) | ~3.50 EUR |
| Worker node (CX32, 8GB) | ~5.50 EUR |
| Storage (varies) | ~5-10 EUR |
| **Total** | **<30 EUR/month** |

The custom IPAM is critical here. Without it, I'd be paying for floating IPs and load balancers, which would blow the budget.

## Deployment Workflow

I use [nix-csi](/blog/nix-csi/) for deployments, which means I can build and deploy from the CLI in one step. The workflow is optimized for single-admin operation right now - I know how Argo and Flux work and I'm planning to add Flux eventually, but for personal projects the direct deployment works fine.

## Why Bother?

This started as the personal evolution of work I was doing for Evolvit (building production Kubernetes on VMware). When that project went on hold, I continued the work on my own infrastructure.

It's useful for:
- Learning and experimenting with Kubernetes components without cloud costs
- Running personal services (I have Stremio in there)
- Testing nix-csi and easykubenix in a real environment
- Having a reference implementation I fully understand

The code is at [github.com/Lillecarl/hetzkube](https://github.com/Lillecarl/hetzkube).
