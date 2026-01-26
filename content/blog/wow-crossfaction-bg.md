---
title: "WoW Crossfaction Battlegrounds: A Gaming Archaeology Post"
date: 2024-03-01
description: "How I wrote the first public implementation of crossfaction PvP for World of Warcraft private servers, and how it eventually became an official feature."
hidden: true
---

{{/* AI note: Even though this is a blog post, it's hidden and should be written as an extension to the cv/resume not as a story. */}}

About 13 years ago, I wrote the first public implementation of crossfaction battlegrounds for World of Warcraft private servers. It's now an official feature in retail WoW.

{{/* AI note: This is typical AI speak */}}
## The Problem

World of Warcraft has two factions: Alliance and Horde. In PvP battlegrounds, you can only queue with your own faction. This creates a problem: if one faction has more PvP players, their queue times are long while the other faction gets instant queues.

On private servers, this was often severe. Some servers had 80/20 faction splits, meaning Horde players might wait 30+ minutes for a battleground while Alliance got instant pops. People would reroll to the minority faction just for faster queues, which made the imbalance worse.

The obvious solution: let players from both factions fight on the same team.

{{/* AI note: This is typical AI speak */}}
## The Implementation

I was playing on a private server and looking at the server codebase (most private servers were based on open-source C++ cores like MaNGOS or TrinityCore). The battleground code was complex, but I noticed something: arenas already had a mechanism for temporarily setting a player's faction.

In arenas, this was used for spectating or specific arena setups. My approach was simple: reuse that field in battlegrounds to set some players as the opposite faction for the duration of the match.

The main work was:

1. **Faction assignment.** When players enter the battleground, assign some to the opposite faction using the arena faction field.

2. **Packet manipulation.** The battleground scoreboard packets needed to be modified so the client would display players on the correct teams. Without this, the UI would show everyone on one side.

3. **Queue logic.** Fill teams from a single queue regardless of faction. I implemented two modes:
   - **Simple:** Longest-waiting players get in first
   - **Balanced:** Match average item level between teams, with gear-swapping disabled (except weapons, which were excluded from calculations)

The gear balancing was a nice addition - it prevented people from queuing in bad gear and swapping to good gear once the match started, which was a common exploit.

## Reception

I published the patch publicly, which was the key difference from previous attempts. Other servers had implemented similar systems privately, but this was the first public release that any server could use.

It spread quickly. Queue time imbalance was a universal problem back in 3.3.5a when Alliance racials were wildly overpowered, and this solved it. Within months, most active PvP servers had some version of crossfaction battlegrounds.

The implementation has been reworked and improved many times since then - I haven't maintained it for years - but the core concept remains the same. Private servers still use crossfaction BGs today.

## Blizzard Adopts It
{{/* AI note: cross-faction dungeons came before any CFBG AFAIK */}}
Years later, Blizzard added crossfaction instances to retail WoW. First for dungeons and raids, then eventually for battlegrounds. The feature works essentially the same way: players can group and queue together regardless of faction.

I'm not claiming Blizzard copied my code - they obviously didn't. But the idea of crossfaction PvP queuing was proven and popularized on private servers first. When Blizzard was looking at solutions for faction imbalance (which retail WoW definitely had), crossfaction gameplay was already an established concept with years of proof that it worked.

It's satisfying to see an idea you helped pioneer become an official feature, even if the path from private server patch to retail implementation was indirect.

## Technical Notes

For anyone curious about the implementation details:

- **Language:** C++ (private server cores are C++)
- **Core changes:** Battleground player loading, scoreboard packet construction, queue system
- **Client compatibility:** No client modifications needed - everything was server-side packet manipulation
- **Complexity:** Honestly not that high. The hard part was realizing it was possible, not implementing it.

The code isn't online anymore (at least not my original version), but the concept lives on in every private server that runs crossfaction BGs.

## Why This Matters for My Career

This was one of my first real programming projects - modifying a large C++ codebase to add a feature that thousands of players would use. It taught me:

- Reading and understanding existing codebases
- Thinking about edge cases (what happens when a paladin uses a faction-specific ability?)
- The satisfaction of solving a real problem that affects real users

It's also a good reminder that interesting technical work doesn't only happen at big companies. Sometimes it's a teenager modifying game server code because queue times are annoying.
