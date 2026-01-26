---
title: "CV"
type: cv
---

<style>
/* Your CV styles here - this won't affect the rest of the site */
.cv {
  /* Override site max-width for CV if desired */
  /* max-width: 800px; */
}

.cv-header {
  display: flex;
  justify-content: space-between;
  align-items: flex-start;
  gap: 1rem;
}

.cv-header-info {
  flex: 1;
}

.cv-photo {
  width: 150px;
  height: 150px;
  border-radius: 4px;
}

/* Add your own styles below */
</style>

<div class="cv-header">
  <div class="cv-header-info">
    <h1>Carl Andersson</h1>
    <p>
      <a href="tel:+46736330876">+46736330876</a><br>
      <a href="mailto:carl@postspace.net">carl@postspace.net</a><br>
      <a href="https://github.com/lillecarl">github.com/lillecarl</a>
    </p>
  </div>
  <img src="/cv-photo.png" alt="Carl Andersson" class="cv-photo">
</div>

<h2>SUMMARY</h2>
<p>DevOps/SRE engineer with 10+ years of experience across infrastructure, networking, and platform engineering. I prefer declarative configuration, battle-tested software, and solving problems properly rather than quickly. Strong background in network architecture, Kubernetes, and Nix-based infrastructure. I've worked across the stack from physical datacenters to cloud platforms, and I build tools when existing ones don't fit.</p>

<h2>COMPETENCIES</h2>
<p>
  <strong>Kubernetes</strong> •
  <strong>Nix/NixOS</strong> •
  <strong>Terraform</strong> •
  <strong>Linux</strong> •
  Cilium •
  Python •
  BGP •
  Prometheus •
  GitHub Actions •
  VXLAN/EVPN •
  Docker •
  PostgreSQL •
  FRR •
  AWS •
  Vault •
  GitLab •
  Cumulus Linux •
  MikroTik •
  Grafana •
  ClusterAPI •
  PowerShell •
  C# •
  IPv6 •
  VMware •
  QEMU/libvirt
</p>

<h2>EXPERIENCE</h2>

<h3>Evolvit <em>- Infrastructure Consultant</em></h3>
<p><small>Aug 2025 - Present (on hold)</small></p>
<ul>
  <li>ClusterAPI, Kubernetes, NixOS, Keycloak, VMware</li>
</ul>
<p>Building a production Kubernetes environment on VMware for Evolvit (formerly Dialect). Full platform including ClusterAPI-managed control plane, Cilium networking, and OIDC authentication. Training staff on Kubernetes, Nix, and Linux administration. Project on hold due to client capacity constraints.</p>

<h3>Helicon <em>- Infrastructure Consultant</em></h3>
<p><small>Sep 2023 - Feb 2025</small></p>

<p><strong>Stockholm Exergi (AWS)</strong></p>
<ul>
  <li>AWS, Terraform, Nomad, Consul, Vault, Python, Nix</li>
</ul>
<p>Managed HashiCorp-based infrastructure in AWS. Led Terraform refactoring to improve state management and infrastructure reliability. Recommended Kubernetes migration path which client later adopted.</p>

<p><strong>Kraftringen (Azure)</strong></p>
<ul>
  <li>Kubernetes, AKS, CloudNative-PG, Grafana, Prometheus, Keycloak, GitLab</li>
</ul>
<p>Maintained production AKS cluster with full observability stack. Built extensive CNPG monitoring for TimescaleDB workloads in Grafana. Managed Kustomize-based deployments and version upgrades.</p>

<h3>Viaplay <em>- SRE</em></h3>
<p><small>Sep 2022 - Aug 2023</small></p>
<ul>
  <li>OpenStack, Terraform, SaltStack, Ansible, Splunk, Python, MAAS</li>
  <li>AS202093, MikroTik, Cumulus Linux, Palo Alto</li>
</ul>
<p>SRE in the Media Asset Management division managing hybrid cloud infrastructure. Responsible for 10+ PB storage infrastructure, transcoding compute clusters, and on-premise networking. Architected AWS-to-on-premise connectivity for MAM workload distribution. Part of team managing the physical infrastructure layer underlying Kubernetes clusters.</p>

<h3>SDNit <em>- DevOps Consultant</em></h3>
<p><small>Nov 2021 - Sep 2022</small></p>
<ul>
  <li>AWS, Terraform, Kubernetes, EKS, RKE2, Splunk, GitLab, Python</li>
  <li>Keycloak, RDS, MongoDB Atlas</li>
</ul>
<p>Consulting for Viaplay. Initiated and deployed Kubernetes for Media Asset Management. Managed both on-premise RKE2 and EKS clusters with supporting services including Keycloak and observability tooling.</p>

<h3>Dialect <em>- Infrastructure Engineer / SRE</em></h3>
<p><small>Mar 2019 - Nov 2021</small></p>
<ul>
  <li>AS205834, Cumulus Linux, MikroTik, Cisco, FortiNet</li>
  <li>VMware, Hyper-V, Veeam, Cohesity, PowerShell, Zabbix, PagerDuty</li>
</ul>
<p>Technical responsibility for a 6-rack datacenter, reporting directly to CTO on infrastructure decisions and purchases. Managed 300-400 VMs including MikroTik Cloud Hosted Router instances for customer network isolation.</p>
<p><strong>Key achievements:</strong></p>
<ul>
  <li><strong>Network architecture redesign:</strong> Eliminated chronic STP looping issues by migrating customer connectivity from L2 tunneling to L3 routing, requiring subnet migrations across the customer base</li>
  <li><strong>O365 crisis response:</strong> When parent company went bankrupt, wrote PowerShell + Puppeteer automation to create admin users and accept new CSP partnerships across 1000+ Microsoft 365 tenants</li>
  <li><strong>Internal tooling:</strong> Built PBX queue monitoring with notifications, custom TeamViewer auto-registration installer (before native support existed), HTTP API for physical phone PBX group login/logout</li>
  <li>MikroTik and networking instructor for all Dialect branch offices</li>
</ul>

<h3>IT Support & Sysadmin</h3>
<p><small>2014 - 2019</small></p>
<p>IT support and Windows Server administration serving 50+ SME customers (5-50 users each). Built high-quality support function from scratch together with one colleague. Specialized in MikroTik networking including site-to-datacenter tunnel infrastructure. PowerShell automation for cross-customer environment provisioning. This role established the networking foundation that led to my later datacenter and infrastructure work.</p>

<h2>PROJECTS</h2>

<h3><a href="https://github.com/Lillecarl/hetzkube">hetzkube</a></h3>
<p>Production-grade Kubernetes on Hetzner with a strict &lt;30 EUR/month budget. Full platform: ClusterAPI control plane, NixOS nodes, Cilium with Gateway API, custom IPAM for IPv4/IPv6 LoadBalancer address reuse, enforced dual-stack via Kyverno, kube-prometheus-stack, and OIDC authentication via Keycloak across all services. <a href="/blog/hetzkube/">[Details]</a></p>

<h3><a href="https://github.com/Lillecarl/nix-csi">nix-csi</a></h3>
<p>Kubernetes CSI driver that mounts the Nix store into pods, enabling container image replacement with Nix packages. Uses hardlink views with shared inodes for memory-efficient page cache sharing across pods. Works on managed Kubernetes without node modifications. <a href="/blog/nix-csi/">[Details]</a></p>

<h3><a href="https://github.com/Lillecarl/easykubenix">easykubenix</a></h3>
<p>Kubernetes manifest generation using the NixOS module system. Composes cleanly, scales well, and lets you override with mkForce instead of JSON patches. Renders Helm charts into the module system for compatibility. <a href="/blog/easykubenix/">[Details]</a></p>

<h3>WoW Crossfaction Battlegrounds</h3>
<p>First public implementation of crossfaction PvP queuing for World of Warcraft private servers (~2012). Balanced queue times between factions by allowing mixed-faction teams. Implemented multiple queue modes including item-level balancing. Still used by private servers today, and the concept was later adopted by Blizzard as an official feature. <a href="/blog/wow-crossfaction-bg/">[Details]</a></p>

<h3>Other</h3>
<ul>
  <li><a href="https://github.com/Lillecarl/dinix"><strong>dinix</strong></a> - Render dinit service configurations using Nix</li>
  <li><a href="https://github.com/Lillecarl/registry/commit/96e3e3120f200dbf0c83cad2e2a3448f1acd0d8e"><strong>registry</strong></a> - Nix derivations for all OpenTofu registry providers</li>
  <li><strong>RC-Butiken</strong> - C# sync daemon for 20,000+ SKUs from supplier to Shopify. SQLite state tracking with daily diffing to handle API rate limits. Built inventory/price change reports for strategic ordering and crawled Traxxas.com for spare parts categorization. <a href="/blog/rc-butiken/">[Details]</a></li>
</ul>
