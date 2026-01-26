---
title: "RC-Butiken: Syncing 20,000 Products to Shopify"
date: 2024-02-15
description: "Building a product sync daemon that handled API rate limits, state tracking, and business intelligence for an RC hobby shop."
hidden: true
---

RC-Butiken is a Swedish RC hobby shop selling radio-controlled cars, spare parts, and accessories. Their website was outdated, and manually managing 20,000+ products wasn't feasible. I built a C# daemon to sync their product catalog from their main supplier and keep it updated.

## The Problem

The shop's main supplier, Minicars, published their entire product database daily as a downloadable file (CSV or similar). This included product descriptions, images, pricing, and inventory levels. The goal was to use this data to populate and maintain the Shopify store automatically.

The challenges:
- **20,000+ products** to manage
- **Shopify API rate limits** prevent bulk updates
- **Daily changes** in inventory, pricing, and new products
- **Business needs** beyond just syncing - they wanted insights into supplier inventory

## Architecture

### State Tracking with SQLite

The naive approach would be to push all 20,000 products to Shopify every day. That doesn't work - you'd hit rate limits immediately and the sync would take forever.

Instead, I used SQLite to track the state of every product:
- Store the last-synced state of each product locally
- Download the daily supplier data
- Diff against the local state
- Only push changes to Shopify

This reduced daily API calls from potentially 20,000+ to just the products that actually changed - usually a few hundred at most.

### Selective Updates

Not everything needed to sync continuously:
- **Inventory levels:** Updated daily (critical for avoiding overselling)
- **Prices:** Updated when supplier MSRP changed (most of the time we followed their pricing)
- **Images and descriptions:** Only imported once, then shop's responsibility to maintain

This meant the shop could customize product descriptions and images without worrying about the sync overwriting their changes.

### Business Intelligence Reports

Beyond just syncing, the daemon generated daily reports:
- **Inventory changes:** What went out of stock, what came back in stock
- **Price changes:** What got more/less expensive
- **New products:** What the supplier added

This let RC-Butiken make strategic ordering decisions. If they noticed a popular part was running low at the supplier, they could order quickly before other retailers cleaned out the stock. They could also spot new products early and decide what to carry.

## The Traxxas Crawler

Traxxas is a major RC brand, and their website had excellent spare parts categorization - every part organized by car model and category (electronics, suspension, body, etc.). RC-Butiken wanted similar categorization on their site.

I built a web crawler that:
1. Scraped the Traxxas.com parts catalog
2. Extracted the car model → part category → part relationships
3. Generated tags and categories for the Shopify products

This was a one-off import mostly - the crawler was fragile (web scraping usually is), so for new car models they handled categorization manually. But it bootstrapped a much better UX for browsing spare parts.

## Technical Details

- **Language:** C#
- **Database:** SQLite for state tracking
- **APIs:** Shopify REST API, custom CSV parsing for supplier data
- **Scheduling:** Windows service running daily

The Shopify rate limit handling was the main architectural driver. Without the SQLite diffing approach, the project wouldn't have been viable.

## Lessons Learned

This was a "boring" project in some ways - moving data from A to B. But it taught me:

- **API constraints shape architecture.** The rate limiting forced a smarter approach than brute-force syncing.
- **Business value isn't just the sync.** The daily reports were arguably more valuable than the sync itself.
- **State management matters.** SQLite was overkill for this, but having proper state tracking made everything else easier.

The system ran reliably for years with minimal maintenance.
