---
title: "Hetzner Online GmbH (Your next VPS)"
date: 2026-01-26
description: "When Hetzner Online, why Hetzner Online"
hidden: false
---
<a href="https://hetzner.cloud/?ref=B8AOT3O43YXw"><img src="https://www.hetzner.com/_resources/themes/hetzner/images/logo/hetzner-logo.svg?m=1766152009"/></a>
started in 1997, privately owned (not inherently evil), Europapan and very affordable, what is there not to like?

# Hetzner Cloud
What differentiates Hetzner from other affordable providers is how you manage your servers, you buy them hourly with a montly cost cap, you provision them in no time using either their WebUI or their API.
There's a [<s>Terraform</s>OpenTofu provider](https://github.com/hetznercloud/hcloud-python), there's a [ClusterAPI provider](https://syself.com/docs/caph/),
there's a [Python library](https://github.com/hetznercloud/hcloud-python)... Yeah you get the gist, they built their cloud to offer you machines as you want them.

Other providers in the same price segment bind you for at least a month, you have to order through their shitty control-panel and pay up front, with Hetzner you pay for what you
use at the end of the month, just like with the big boys.

## Server lines
The **CX** line is their cheapest machines, they're well-booked and it's a bit of a toss what hardware generation you end up with, but 4.36€(incl VAT!) for a CX22 with 2 cores, 4GB RAM, 40GB NVMe SSD and 20TB egress is WILD.

The **CAX** line is their second cheapest machines, imagine CX but with ARM Ampere CPU's instead, great for verifying your workloads build and run on ARM.

The **CPX** line they call "regular performance", newer hardware generations, less overbooking and great price/performance

The **CCX** line is their dedicated CPU line, you get your cores for yourself. Crazy fast and still cheap.

For your personal projects you'll probably want to run CX/CAX, less cost-sensitive users do whatever you want.

# Dedicated servers
For the absolute best performance per dollar you'll want dedicated servers, I haven't used them in awhile so I don't have an opinion, but following
[/r/Hetzner](https://reddit.com/r/Hetzner) suggests you don't want to keep them around for half a decade, you'll run on hardware they want to get
rid of (HDDs has been an issue for some)

# [Datacenters](https://www.hetzner.com/unternehmen/rechenzentrum/)
They've got their own datacenters in Finland and Germany, colocation in USA and Singapore, we'll focus on the Europapan ones.

They've designed their datacenters with slanted roofs and in naturally cold locations which allows them to pump and filter outside air straight into the floor, up through the cold isles and
then naturally convect out through the slanted roofs and back into nature. When it's cold outside they recirculate the inside air to maintain 20℃, they only run their AC systems occasionally
because of their datacenters efficient design.

HEL1 is in Helsinki, except it isn't really in Helsinki at all but in some adjacent little finnish shithole (Tuusula). This is the theme with all Hetzner datacenters,
they'll build where land is cheap to offer you the best performance/€. The networking in HEL1 is juicy, 800G to Telia, 400G to Lumen and 200G to Cogent,
Hetzner's network is a true strongpoint. 

FSN1 is their crown jewel, it's flippin HUGE and they've got crazy good peering and transit. If you want to reach central Europapa this is where you'll want to host your
servers. 800G to Telia, 800G to Lumen, enough private peering to be full for a day.

NBG1 is another German DC, it's about the same size as HEL1 but serving the central european market, availability is lower here but it's still a Hetzner DC.

# The ugly
While Hetzner is great they are definitely not perfect. It usually boils down to "do it yourself" but there are things that aren't great.

Old dedicated servers lines will get second-hand harddrives installed if existing ones fail because they don't stock the old models, icky.

No backups for HCloud volumes, you can backup your servers but you'll have to sort out backups of volumes yourself

Object Storage..... Yeah their Object Storage (Ceph Object Gateway) launched about a year too early, it's been unreliable in every way imaginable

# Wrapping up
Hetzner is a bit like shopping at LIDL, it's probably not gonna be your only IaaS/Cloud provider. You'll buy what they're good at (cheap compute) from them while buying services from other providers too.
Care about the environment? Hetzner! Don't wanna fuel the American war machine? Hetzner! Price sensitive? Hetzner! Great performance? Hetzner!

And we can't wrap up without mentioning, their community manager Katie is hot!
