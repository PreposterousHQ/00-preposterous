# COLD-START PROMPT
## For any AI picking up BRET Digital Command Center work

**Version:** April 24, 2026 (post-Session 11)
**Use this:** Paste this into any AI (Claude, Codex, OpenAI, or future model) to resume work with full context

---

## THE PROMPT TO PASTE

```
You are resuming work on the BRET Digital Command Center. Read these files in this order before doing anything:

1. BRET-IDENTITY.md — who Bret is, the four pillars, the vocabulary, the vision
2. CURRENT-STATE--bret-command-center--v11--2026-04-24.md — everything built through Session 11, current system state, what's next
3. MANDATE--Infrastructure-First-Always.md — the non-negotiable operating principle
4. PLAYBOOK--OpenClaw-Agent-Registration.md — critical technical knowledge for swarm work
5. SYNERGYWORKS-ROSTER.md — every agent, their role, status, and dependencies

All five files are in the PreposterousHQ/00-preposterous GitHub repo.
Current state doc is also at C:\Preposterous\00-command-center\diagnostics\CURRENT-STATE--bret-command-center--v11--2026-04-24.md

After reading, confirm you understand:
- The four pillars and the meta-pillar (Preposterous)
- The current swarm state (Conductor, Geodessa, Mandelbret, Kerouac = live; others = planned)
- The corpus pipeline (corpus-api.py at 172.17.0.1:8765, 3,709 chunks, Kerouac queries via Node.js)
- The financial context (Max 5x = $100/mo, API credits Frugal posture, Realization Labs job ended April 21)
- The Infrastructure-First Mandate and override protocol ("speed mode")
- The voice: Robin Williams + George Carlin meets Kerouac + Huxley. Crisp. Alive. Never patronizing.

Then ask Bret what he wants to work on, or state the current priority queue from v11 and ask which to tackle first.
```

---

## GITHUB REPO (canonical)

**Organization:** PreposterousHQ
**Repo:** 00-preposterous
**URL:** https://github.com/PreposterousHQ/00-preposterous
**Branch:** main
**Latest commit:** 0023893 (v11 state doc)

**Key files in repo:**
```
diagnostics/CURRENT-STATE--bret-command-center--v11--2026-04-24.md
BRET-IDENTITY.md
SYNERGYWORKS-ROSTER.md
COLD-START-PROMPT.md (this file)
mandates/MANDATE--Infrastructure-First-Always.md
playbooks/PLAYBOOK--OpenClaw-Agent-Registration.md
clawbot-configs/workspace-kerouac/ (full Kerouac workspace)
references/VISION--Multi-Corpus-Doppelganger-Agents.md
peace-room-briefs/ (agent handoff channel)
tool-evaluations/ (INDEX.md + 6 entries)
```

---

## LAPTOP PATHS (C:\Preposterous\)

Everything on the laptop syncs to Google Drive (Tree 2, laptop-synced, canonical).
Working directory for git repos: C:\PreposterousGit\ (NOT inside C:\Preposterous\)

```
C:\Preposterous\00-command-center\
├── BRET-IDENTITY.md
├── SYNERGYWORKS-ROSTER.md
├── COLD-START-PROMPT.md
├── diagnostics\ (state docs, audit reports)
├── mandates\ (Infrastructure-First Mandate)
├── playbooks\ (OpenClaw registration, GitHub Pages, Bootstrap)
├── scripts\ (prepo.ps1, corpus-api build scripts, registration scripts)
├── peace-room-briefs\ (agent handoff briefs)
├── tool-evaluations\ (INDEX.md, status folders)
├── clawbot-configs\ (bot concepts + workspace files for each agent)
└── references\ (vision docs, deep dives)
```

---

## DROPLET (165.227.85.162)

**SSH:** ssh openclaw@165.227.85.162 (passwordless, key at ~/.ssh/id_ed25519)
**Root SSH:** ssh root@165.227.85.162 (for systemd, kill root processes)

**What's running:**
- OpenClaw Gateway 2026.4.15 (check ps, not CLI status — CLI has bug)
- corpus-api.py (systemd service: corpus-api, port 8765, bound to 0.0.0.0)
- rclone cron (every 15 min, 10 subfolders × 2 agents: conductor + geodessa)
- systemd timers: morning briefing 7am ET, evening wrap 9pm ET, gateway restart 4am UTC

**Critical config:**
- /home/openclaw/.openclaw/openclaw.json — 13 agents, channels, bindings
- /home/openclaw/.openclaw/data/rag/ — ChromaDB (3,709 chunks)
- /home/openclaw/.openclaw/workspace-kerouac/ — Kerouac's files + skills + holopedia

---

## CRITICAL TECHNICAL RULES (hard-won, do not re-learn)

1. **OpenClaw tokens:** in channels.telegram.accounts.<n>.botToken — NOT in agents.list
2. **PowerShell SSH:** two separate commands, two separate Enter presses — never concatenate
3. **Complex SSH quoting:** always script-file pattern (write .sh, scp, ssh bash)
4. **Docker isolation:** agents at 172.17.0.x can't reach 127.0.0.1, only 172.17.0.1
5. **Gateway CLI bug:** openclaw gateway status reports "stopped" even when running — trust ps
6. **Hot-reload:** Gateway 2026.4.15 applies config changes without restart — check logs first
7. **Kerouac has no curl:** uses Node.js for HTTP calls — works fine, don't change this
8. **One Preposterous tree:** Tree 2 (1UcXcsFldtCA2qIQj2_zZanjuAnA9ryxO) is canonical. Tree 1 trashed.
9. **Secrets:** never in any path that syncs (not C:\Preposterous\, not PreposterousGit, not Drive)
10. **openclaw config set:** for ALL config changes — never raw jq editing

---

## SESSION PRIORITY QUEUE (as of April 24, 2026)

**Do first:**
1. Syntax auto-ingestion — weekly cron to keep corpus current with new Syntony Times posts
2. kerouac_outputs ChromaDB collection — recursive memory loop
3. Add peace-room-briefs to rclone SUBFOLDERS in rclone-sync.sh
4. Rotate Conductor + Geodessa bot tokens (pasted in old chat sessions)
5. Delete register-kerouac-final.sh from laptop (contains token)

**Do next:**
6. Mercury9000 deployment (publishing workflow)
7. Clairvaux deployment (R&D Scout)
8. Kerouac's first full Syntony Times essay (1200+ words, corpus-grounded, publishable)
9. Janet Email Intelligence Pipeline (Krishnamurti bot)
10. GraphRAG evaluation (log in tool-evaluations as Active Consideration)

**The vision (deferred, sequenced):**
- Multi-corpus architecture (other Substack authors)
- Doppelganger agents
- Storyliving Screenplay as emergent artifact

---

*This document was written April 24, 2026, end of Session 11.*
*Update the version number and priority queue whenever a new current state doc is written.*
