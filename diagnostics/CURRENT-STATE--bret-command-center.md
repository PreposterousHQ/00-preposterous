# CURRENT STATE - BRET DIGITAL COMMAND CENTER
## Last Updated: April 13, 2026 (early morning - Sessions 1-2 complete, Session 3 in progress)

**Resume next session with:** "Resuming - read the current state doc and all project files, then pick up where we left off."

---

## SESSION LOG

### Session 1: April 11-12, 2026 (overnight) - THE FOUNDING SESSION

**1. Claude Code installed on Windows laptop**
- Version: 2.1.101 (native install, not WSL)
- Auth: bret@bretwarshawsky.com (Max plan, Opus 4.6)
- Git for Windows installed (v2.53.0.2)
- Git identity set: "Bret Warshawsky" / bret@bretwarshawsky.com
- GitHub CLI installed (v2.89.0), authenticated as Bret-W

**2. Full laptop diagnostic completed**
- Saved: C:\Preposterous\00-command-center\diagnostics\laptop-diagnostic-2026-04-11.md
- C: drive 475 GB (211 free), D: drive 116 GB exFAT (Samsung phone dump)
- Dev tools: Git 2.53, Node 24.13, Python 3.14, Notion 4.16
- Single Windows user profile: bretm

**3. The Preposterous Ontology - designed, documented, built**
- 8 top-level dirs: 00-command-center, 01-mental-wealth, 02-storylivingry-studio, 03-esp, 04-realization-labs, 05-operations, 06-archive, 07-media-assets
- 69 subfolders on BOTH laptop and Google Drive
- Naming: kebab-case, no spaces, numbered prefixes on top-level only

**4. The Great Migration I (Laptop) - COMPLETE**
- 35,600 files / 36.14 GB migrated into Preposterous
- OneDrive: FULLY UNINSTALLED (34.29 GB reclaimed)

**5. Infrastructure-First Mandate + Bootstrap Playbook** - documented and loaded

---

### Session 2: April 12, 2026 (afternoon-evening) - DRIVE + GMAIL + AUTOMATION

**6. The Great Migration II (Google Drive) - COMPLETE**
- 43 legacy folders + 715+ loose files migrated
- Google Apps Script "Preposterous Migration" created (permanent)
- RESULT: Drive root = Preposterous/ + migration script only

**7. Google Drive for Desktop - REINSTALLED CLEAN**
- Drive remounted as Y: (Stream mode)
- C:\Preposterous syncs TO Google Drive (folder backup)
- Sync verified both directions

**8. Google Account Reset**
- bret@bretwarshawsky.com is default Account 0

**9. Gmail Ontology - DEPLOYED**
- 103 labels created, 99 old labels deleted
- Auto-sort: every 15 min (permanent)
- Bulk sort: every hour (temporary)

**10. Startup Programs Trimmed**
- Disabled: bdagent, Fathom (HIGH), msedge (HIGH)
- Kept: GoogleDriveFS, WhatsApp

**11. Downloads Router - DEPLOYED (PERMANENT)**
- Script: C:\Preposterous\00-command-center\scripts\downloads-router.ps1
- Windows Scheduled Task: every 30 minutes
- NEVER deletes by file size - large files moved to review folder

**12. _triage Clearout - COMPLETE**
- 291 conversation transcripts moved to 02-storylivingry-studio/storyliving-screenplay/characteur-bibles/raw-conversation-transcripts/
- New folder structure created on both Drive and laptop
- Google Apps Script function: moveTriageToScreenplay()

**13. FULLOFIT Legacy Decomposition - COMPLETE**
- 40 items decomposed across 6 Preposterous destinations via decomposeFullofit()
- Realization Labs folder -> 04, ESP FUND -> 03, BRET WARSHAWSKY LLC -> 05/legal-entity
- PARTNERS -> 05/partnerships, Private Journals -> 06/personal
- Substack -> 02/syntony-times, Storyliving Screenplay -> 02/storyliving-screenplay
- Unbreakable Spirit -> 01/one-mind-show
- Conversation folders (Bret & Mona/Satyen/Sahar/Eva/Jason+Bart) -> raw-conversation-transcripts
- DSS/HALO AI/SX/Superhero Academy -> 02/projects
- 4 initial errors retried successfully via retryFullofitErrors()
- Empty shells trashed via trashFullofitShells()
- FULLOFIT'S INDUSTRIES no longer exists on Google Drive

---

### Session 3: April 12-13, 2026 (evening-overnight) - CALENDAR + GITHUB + OPENCLAW RESEARCH

**14. Google Calendar Connected**
- MCP tools loaded and working
- 6 calendars found initially, 3 dead ones killed (limicon2024, Suprasex Club, Masterminding EDEN)
- Remaining: primary (bret@bretwarshawsky.com), spiritualphilanthropy55, US Holidays, Bret A. Warshawsky (contacts/birthdays)

**15. Calendar Color-Coded by Pillar**
- Tomato (11) = Mental Wealth — Calvin SOUL Work, Billy/Lincroft presentation
- Blueberry (9) = Storylivingry — DSS sessions, film events, NJ Film Expo
- Peacock (7) = Realization Labs — Zubin weekly team meeting (Mondays 3pm)
- Graphite (8) = Operations — car insurance due, car payment due
- Tangerine (6) = Health/Personal — therapy (M/W/F 11am), acupuncture
- Basil (10) = ESP (reserved, when needed)
- Recurring events color-coded on the recurring series (applies to all future instances)

**16. Default Browser Changed**
- Windows default browser set to Chrome (was Edge)

**17. Pillar-Specific Claude Project Instructions - DRAFTED**
- 4 pillar instruction sets written: Mental Wealth, Storylivingry Studio, ESP Fund, Realization Labs
- File: PILLAR-PROJECT-INSTRUCTIONS.md (available for download)
- Decision: upgrade existing Claude Projects gradually rather than fresh start

**18. GitHub Organization Created - PreposterousHQ**
- URL: https://github.com/PreposterousHQ
- Free plan, billing: bret@bretwarshawsky.com
- Two repos created and cloned locally:
  - PreposterousHQ/00-preposterous (system brain - ontology, mandates, current state)
  - PreposterousHQ/00-synergyworks (ClawBot workforce)
- Clone location: C:\PreposterousGit\ (separate from C:\Preposterous to avoid Google Drive sync collision with .git directories)

**19. Existing Storylivingry-Studio Org - FULL AUDIT COMPLETE**
- 12 repos audited, all cloned to C:\PreposterousGit\
- Only 3 have real code:

| Repo | Shape | Key Finding |
|------|-------|-------------|
| message-bus | Python FastAPI + polling loop, 1,167 lines | Reference agent runtime. 10 agents on DO droplet. SOUL.md per agent. 60-second polling loop. |
| kengram-agents | Python soul generator, ~500 lines | THE AGENT SPAWNER. Pulls entity from Bonfires graph, calls Claude 5x, generates full OpenClaw workspace (SOUL.md, IDENTITY.md, AGENTS.md, HEARTBEAT.md, MEMORY.md). |
| fractal-impact | Interactive HTML dashboard, ~3,500 lines | Canvas + synergize UI, password-gated |

- 4 HTML landing pages: storylivingry-studio, storylivingry-frontend, slaas, syntony-times
- 5 README-only stubs: storylivingry, content-archive, passion-of-the-heist, xprize-submission, syntony-bonfire

**20. OpenClaw Research - COMPLETE**
- OpenClaw = open-source persistent AI agent platform, 350K+ GitHub stars
- One Gateway process, multiple isolated agents, each with own workspace/SOUL.md/skills/Telegram bot
- Three multi-agent patterns: multi-agent routing (persistent), sub-agents (task workers), orchestrator pattern (depth 2 max)
- Constraints: max 5 children per agent, max 8 concurrent globally, max spawn depth 2
- Model routing: Opus for complex decisions, Sonnet for division leads, Haiku for routine tasks
- Skills marketplace: 5,700+ community-built skills on ClawHub
- Heartbeat scheduler: agent wakes every 30 min, checks HEARTBEAT.md checklist
- Memory: Markdown files on disk, per-agent isolation, opt-in cross-agent search

**21. Synergyworks Architecture - DESIGNED (not yet deployed)**
- Two swarms, one gateway: Noosphere (existing 10 conversational research agents) + Synergyworks (new operational workforce)
- The Conductor = top-level agent, routes commands, spawns division leads
- Four divisions: Operations, Communications, Strategy, Creative
- Agent spawning via kengram-agents/soul_generator.py (graph-grounded generation from Bonfires entities)
- Hand-written SOUL.md permitted as fast-path for first 2-3 bootstrap bots
- Inbound first (Bret -> Telegram -> bots), outbound Connector Agents deferred to phase 2

---

## CURRENT SYSTEM STATE

### Google Drive
- Root: CLEAN - only Preposterous/ + migration script
- Full ontology populated, FULLOFIT fully decomposed, _triage empty

### Laptop
- C:\Preposterous\: 35,600+ files, syncing to Google Drive
- C:\PreposterousGit\: Git workspace (NOT synced to Drive)
  - 00-preposterous/ (seeding in progress)
  - 00-synergyworks/ (seeding in progress)
  - message-bus/ (cloned from Storylivingry-Studio)
  - kengram-agents/ (cloned from Storylivingry-Studio)
  - syntony-bonfire/ (cloned from Storylivingry-Studio)
  - passion-of-the-heist/ (cloned from Storylivingry-Studio)
- C: drive: ~207+ GB free
- D: drive (SDXC): 116 GB exFAT - Samsung phone dump (untouched)
- Y: drive: Google Drive for Desktop (Stream mode)

### Gmail
- 103 Preposterous labels active, auto-sort every 15 min, bulk sort every hour

### Calendar
- Color-coded by pillar, dead calendars removed
- Recurring rhythm: therapy M/W/F 11am, Realize Mondays 3pm, Calvin Tuesdays 5pm

### Automated Systems Running
1. Gmail sortInbox - every 15 min (Apps Script, permanent)
2. Gmail bulkSortAll - every hour (Apps Script, temporary - disable when caught up)
3. Downloads Router - every 30 min (Windows Scheduled Task, permanent)
4. Google Drive for Desktop - continuous sync

### GitHub Organizations
1. **PreposterousHQ** (new) - 2 repos: 00-preposterous, 00-synergyworks
2. **Storylivingry-Studio** (existing) - 12 repos, including message-bus and kengram-agents

### Digital Ocean Server (165.227.85.162)
- storylivingry-agents droplet
- OpenClaw installed, 10 Noosphere agents running
- message-bus (FastAPI + Noosphere API)
- agent_loop.py polling every 60 seconds
- 10 agents: AndrewAlan, Metabolite, Trimtab, BuckminsterFuller, TheTenThousand, DesignScienceStudio, XprizeFutureVision, SyntonyTimes, BonfiresPlatform, $KnowTokenomics
- Secrets in /opt/openclaw.env (ANTHROPIC_API_KEY)

### Google Apps Script Projects
1. "Preposterous Migration" - Drive file router, verifyCleanRoot(), moveTriageToScreenplay(), decomposeFullofit(), retryFullofitErrors(), trashFullofitShells()
2. "Preposterous Gmail" - label ontology, auto-sort, bulk sort, deleteOldLabels(), enableBulkSort(), disableBulkSort()

---

## SECURITY PUNCH LIST

1. **message_bus.py:583** - hardcoded "preposterous" bypass password in plaintext. Move to /opt/openclaw.env on the droplet.
2. **message_bus.py + agent_loop.py** - ANTHROPIC_API_KEY read via open("/opt/openclaw.env").read().split() — no envvar, no secrets manager. Acceptable for single-operator but fragile.
3. **Bonfires client fails silently** (message_bus.py:20-29) — agents can run without graph grounding and you won't notice. Design decision but worth monitoring.

---

## WHAT NEEDS TO HAPPEN NEXT

### Immediate (next session)
1. SSH into DO server - see what's actually running, reconcile with repo code
2. Update OpenClaw to latest version on droplet
3. Configure The Conductor as first Synergyworks agent on Telegram
4. Stand up first Operations bot (File Sentinel) as proof of concept
5. Test the loop: phone -> Telegram -> Conductor -> File Sentinel -> action -> report back
6. Seed 00-preposterous repo with system docs (ontology, mandate, playbook from Drive)
7. Commit revised Synergyworks README to 00-synergyworks
8. Fix security items (move hardcoded password to env file)

### Architecture decisions needed
9. **Two orgs or one?** PreposterousHQ has the meta-docs, Storylivingry-Studio has the code. Decide: merge, keep separate with cross-references, or transfer repos.
10. **Noosphere agents + Synergyworks relationship** - two separate swarms sharing one gateway (current plan) vs. eventually absorbing Noosphere into Synergyworks
11. **Bot naming** - functional titles (File Sentinel) vs. character names (anthropomorphized)
12. **Telegram routing** - one bot fronting The Conductor (simpler) vs. one Telegram bot per agent (more direct)
13. **Concurrency model** - max 8 concurrent globally means most of 15 planned bots are dormant. Confirm this is intentional (event-driven wake).

### Architecture priorities (after Synergyworks bootstrap)
14. Pillar-specific Claude Projects - upgrade existing Projects with new instructions
15. Notion setup - Preposterous ontology databases
16. Phone sync strategy - Samsung + D: drive
17. Data export mission - Facebook, LinkedIn, Twitter/X, Telegram, WhatsApp, Fireflies, Fathom

### Automation layer
18. Zapier/automation connecting Notion, Drive, GitHub, Telegram
19. Google AI integrations with ClawBots

---

## KEY FILE LOCATIONS

### In Claude Project Files
- PROJECT INSTRUCTIONS - BRET DIGITAL COMMAND CENTER
- MANDATE--Infrastructure-First-Always.md
- CLAUDE'S VOICE
- CURRENT-STATE--bret-command-center.md (this file)

### On Laptop (C:\Preposterous\ - syncs to Drive)
- 00-command-center/diagnostics/CURRENT-STATE--bret-command-center.md
- 00-command-center/scripts/downloads-router.ps1
- 00-command-center/diagnostics/downloads-router-log.txt

### On Laptop (C:\PreposterousGit\ - NOT synced, git-managed)
- 00-preposterous/ (PreposterousHQ repo)
- 00-synergyworks/ (PreposterousHQ repo)
- message-bus/ (Storylivingry-Studio repo)
- kengram-agents/ (Storylivingry-Studio repo - contains soul_generator.py)
- + 4 more Storylivingry-Studio repos cloned

### On Google Drive (Preposterous/)
- 00-command-center/mandates/MANDATE--Infrastructure-First-Always.md
- 00-command-center/playbooks/PLAYBOOK--BRET-Bootstrap.md
- 00-command-center/ontology/ONTOLOGY--preposterous-unified.md

### On Digital Ocean Server (165.227.85.162)
- /home/openclaw/.openclaw/workspace/<agent-name>/SOUL.md (10 agents)
- /opt/openclaw.env (API keys)
- message-bus code (FastAPI server + agent loop)

---

## CLAUDE OPERATING NOTES

- **Model:** Opus 4.6 for architecture/strategy. Sonnet for execution.
- **Voice:** Robin Williams + George Carlin meets Kerouac + Huxley. Crisp, fun, alive. NEVER patronizing. Don't tell Bret when to sleep or stop.
- **Infrastructure-First Mandate:** Always build permanent systems. Every task is an architecture opportunity. The epic win is the only win.
- **Budget:** Ingenuity first, willing to pay when ROI is clear.
- **CRITICAL FIX:** Claude must proactively think 3 moves ahead. Present: (1) how it changes daily workflow, (2) what's automated vs manual, (3) next logical step — WITHOUT waiting for Bret to ask.
- **CRITICAL FIX 2:** Claude must research before designing. Do not scaffold architectures without understanding existing codebases and tools. Audit first, design second.
- **Cowork:** Not needed. Claude Chat + Claude Code + Drive sync covers everything Cowork does.
- **File workflow:** Claude writes content in chat -> Bret copies -> pastes into Claude Code -> Code writes to C:\Preposterous -> Drive sync handles cloud. OR Claude uploads via Drive API for cloud-first items.

---

*Three sessions. Foundation Layer complete. Four autonomous systems running. GitHub org created. OpenClaw researched. Synergyworks designed. 12 repos audited. The Preposterous machine has its skeleton. Next: it gets its first ClawBot.*
