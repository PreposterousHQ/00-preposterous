# Peace Room Briefs

Structured handoff channel between Claude (Desktop chat) and the droplet swarm (Conductor, Geodessa, Kerouac, others).

## Why this exists

Claude in Desktop chat has deep context but no direct pipe to Telegram agents.
Conductor and other droplet agents run 24/7 with Telegram access but limited context.
This folder is the bridge: briefs written here propagate via rclone cron to every
agent workspace within 15 minutes, giving them context they would otherwise lack.

Bret stops being the ethernet cable. Agents get what they need by reading, not
by Bret relaying.

## When to write a brief

- Session-end summary (what landed, what is next)
- Agenda decisions (priority order, what pillar, what output)
- Strategic reads the swarm should know about
- Context the Conductor needs to answer a Peace Room question
- Anything Bret would otherwise verbally relay from laptop to phone

## Naming convention

`YYYY-MM-DD-HHMM--<topic-slug>.md`

Examples:
- `2026-04-21-1245--session-10-close-and-session-11-agenda.md`
- `2026-04-21-1500--mhr-consortium-brief-context.md`
- `2026-04-22-0900--kerouac-first-output-direction.md`

Local time. 24-hour clock. Kebab-case slug.

## Brief structure

```
# <Title>

**From:** bret@laptop (via Claude Desktop)
**To:** Peace Room (Conductor + Geodessa + active agents)
**Date:** YYYY-MM-DD HH:MM local
**Topic:** <one-line summary>

## Context
<what the swarm needs to know>

## Decisions
<what was decided>

## Actions
<what the swarm should do, if anything>

## References
<paths to state docs, commits, etc.>
```

## How to publish a brief

Option A -- via prepo.ps1 (recommended once credits are back):

```powershell
cd C:\Preposterous\00-command-center\scripts
.\prepo.ps1 -Source "C:\Preposterous\00-command-center\peace-room-briefs\<filename>.md" `
    -Dest "00-command-center\peace-room-briefs" `
    -Commit "Peace Room brief: <topic>"
```

Option B -- manual while prepo is waiting for rclone cron expansion:

```powershell
Copy-Item "C:\Preposterous\00-command-center\peace-room-briefs\<filename>.md" `
    "C:\PreposterousGit\00-preposterous\peace-room-briefs\" -Force
cd C:\PreposterousGit\00-preposterous
git add -- "peace-room-briefs/<filename>.md"
git commit -m "Peace Room brief: <topic>"
git push
```

Either way, rclone cron picks up the brief from Drive within 15 minutes and
lands it in every agent workspace mirror at
`/home/openclaw/.openclaw/workspace-<agent>/gdrive-mirror/00-command-center/peace-room-briefs/`.

## Important: rclone cron needs peace-room-briefs added

The rclone sync script at `/home/openclaw/rclone-sync.sh` currently loops over
this subfolder list:

```
SUBFOLDERS="diagnostics mandates ontology playbooks references scripts
templates transcripts tool-evaluations clawbot-configs"
```

Add `peace-room-briefs` to that list so briefs actually reach agent workspaces.
One-line droplet edit. Happens next time the swarm is live (post credit reload).

Until then: briefs land in Drive + GitHub, and agents see them once the cron
script is updated. Not lost, just not yet routing.

## How agents should consume

Conductor and Geodessa (and future agents) should check
`gdrive-mirror/00-command-center/peace-room-briefs/` on heartbeat.
Newest file first by filename (they are timestamped).

If the latest brief is newer than the last one they acknowledged, they read
it and act on it. If the Actions section is empty, they log that the brief
was read and continue. If Actions are specified, they execute or delegate
per standard Peace Room protocol.

## Versioning

Briefs are immutable once published. Follow-ups are new briefs with a clear
reference to the earlier one, not edits.

Correction pattern: if a brief turns out to be wrong, publish a superseding
brief with topic slug `correction-<original-topic>` and explicit reference
to the original in the References section.

---

**Convention established:** Session 10 / 2026-04-21
**Status:** LIVE (folder exists, awaiting first real brief + rclone cron update)
**Naming convention parent:** `BOT-CONCEPT--<name>.md` vs `BOT--<name>.md` pattern
established same session in `clawbot-configs/`
