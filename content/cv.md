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
      <a href="https://github.com/lillecarl">https://github.com/lillecarl</a>
    </p>
  </div>
  <img src="/cv-photo.png" alt="Carl Andersson" class="cv-photo">
</div>

<h2>WHO</h2>
<p>Pragmatic infrastructure operator with a preference for battle-tested software and declarative configuration. TGIF Sailor, slope-skier, gamer and nerd</p>

<h2>COMPETENCIES</h2>
<p>
  <strong>Kubernetes</strong> •
  <strong>Nix</strong> •
  Cilium •
  Python •
  <strong>Terraform</strong> •
  BGP •
  Prometheus •
  <strong>NixOS</strong> •
  GitHub Actions •
  VXLAN •
  Docker •
  EVPN •
  <s>Helm</s> •
  <strong>Linux</strong> •
  PostgreSQL •
  FRR •
  AWS •
  SOPS •
  <s>Terragrunt</s> •
  Vault •
  GitLab •
  Cumulus Linux •
  C# •
  IPv6 •
  K3s •
  <s>Ansible</s> •
  PowerShell •
  Grafana •
  Kubeadm •
  MikroTik •
  GitLab Runners •
  bash •
  QEMU •
  fish •
  libvirt •
  <s>SaltStack</s> •
  VMware •
  <s>Azure</s>
</p>

<h2>CERTIFICATIONS</h2>
<p><s>AWS SAA</s> • <s>MikroTik CNA</s></p>

<h2>EXPERIENCE</h2>

<h3>Evolvit <em>- DevOps</em></h3>
<p><small>Aug 2025 - now()</small></p>
<ul>
  <li>Kubernetes, Kubeadm, ClusterAPI, Nix, Keycloak, VMware</li>
</ul>
<p>Consulting for Evolvit building an on-premise Kubernetes cluster with many bells and whistles, training Evolvit staff in Kubernetes, Nix and Linux</p>

<h3>Helicon <em>- DevOps</em></h3>
<p><small>Sep 2023 - Feb 2025</small></p>
<ul>
  <li>AWS, AWS IoT, Terraform, Ansible, Nomad, Consul, Vault, Python, Nix, Yocto</li>
  <li>Kubernetes, CloudNative-PG, Nix, Grafana, KeyCloak, GitLab, BankID</li>
</ul>
<p>Consulting for a large energy company managing a HashiCorp stack in AWS. Consulting at a smaller energy company managing AKS clusters + friends</p>

<h3>Viaplay <em>- SRE</em></h3>
<p><small>Sep 2022 - Aug 2023</small></p>
<ul>
  <li>AWS, OpenStack, Terraform, Saltstack, Ansible, Splunk, Python, GitLab, MAAS</li>
  <li>AS202093, MikroTik, Cumulus Linux, Palo Alto</li>
</ul>
<p>Manage hybrid cloud environments (with focus on on-premise), 20-30 racks under team management. (Underlying infrastructure for K8s clusters at previous assignment)</p>

<h3>SDNit <em>- DevOps</em></h3>
<p><small>Nov 2021 - Sep 2022</small></p>
<ul>
  <li>AWS, Terraform, Kubernetes, EKS, RKE2, Splunk, Gitlab, Python</li>
  <li>Keycloak, RDS, MongoDB Atlas</li>
</ul>
<p>Consulting for Viaplay, deployed and managed on-prem (RKE2) + EKS K8s clusters and friends</p>

<h3>Dialect <em>- SRE</em></h3>
<p><small>Mar 2019 - Nov 2021</small></p>
<ul>
  <li>AS205834, Cumulus Linux, MikroTik, Cisco, FortiNet</li>
  <li>VMware, Hyper-V, Veeam, Cohesity, PowerShell, Zabbix, PagerDuty</li>
  <li>MikroTik & Networking teacher for all Dialect branch offices</li>
</ul>
<p>Technical responsibility for a small-ish datacenter (6 racks) working just below the CTO in decision making, planning purchases, implementing virtual machine workloads</p>

<h3>Previous Experiences</h3>
<p><small>2014 - 2019</small></p>
<ul>
  <li>IT support</li>
  <li>Sysadmin</li>
</ul>

<h2>NIX PROJECTS</h2>
<p><a href="https://github.com/Lillecarl/nix-csi"><strong>nix-csi</strong></a> Delivers /nix through Kubernetes using the CSI protocol</p>
<p><a href="https://github.com/Lillecarl/easykubenix"><strong>easykubenix</strong></a> Render Kubernetes manifests using Nix</p>
<p><a href="https://github.com/Lillecarl/dinix"><strong>dinix</strong></a> Render dinit configurations using Nix</p>
<p><a href="https://github.com/Lillecarl/registry/commit/96e3e3120f200dbf0c83cad2e2a3448f1acd0d8e"><strong>registry</strong></a> Create Nix derivations for all providers in the OpenTofu registry</p>
<p><a href="https://github.com/Lillecarl/flake-compatish"><strong>flake-compatish</strong></a> Minimal flake compatibility layer, avoids eval from store</p>
<p><a href="https://github.com/Lillecarl/hetzkube"><strong>hetzkube</strong></a> Cheap Kubernetes on Hetzner using easykubenix, nix-csi, dinix</p>

<h2>OTHER PROJECTS</h2>

<h3>RC-Butiken</h3>
<p>Build a C# daemon that syncs 20000+ SKU's from Minicars(Askås) to Shopify</p>

<h3>Dialect O365</h3>
<p>Use browser automation to transfer 1000+ O365 tenants between CSP partners</p>
