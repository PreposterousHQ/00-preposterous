# CURRENT STATE - BRET DIGITAL COMMAND CENTER
## Last Updated: April 15, 2026 (Session 5 complete — Gmail/GCal wired, briefings live, corpus parsed)

**Resume next session with:** "Resuming - read the current state doc and all project files, then pick up where we left off."

---

## SESSION LOG

### Sessions 1-3: April 11-13, 2026 — FOUNDATION + ARCHITECTURE
(See previous current state docs for full details)
- Claude Code installed, laptop diagnostic, Preposterous Ontology built
- Great Migration I (laptop: 35,600 files) + II (Google Drive: 43 folders + 715 files)
- Gmail Ontology (103 labels, auto-sort), Downloads Router, Google Drive for Desktop
- Calendar color-coded by pillar, GitHub orgs created (PreposterousHQ + Storylivingry-Studio)
- 12 repos audited, OpenClaw researched, Synergyworks architecture designed

### Session 4: April 13-14, 2026 — DROPLET RECON + METTA CONDUCTOR
(See SESSION-4--engineering-report--2026-04-14.md on Drive for 828-line deep dive)
- SSH permanently established, complete droplet recon
- Noosphere safely parked (agent-loop stopped, snapshot saved)
- $15 API credits loaded, auto-reload OFF
- OpenClaw upgraded 2026.4.5 → 2026.4.12 (copy-and-swap after OOM)
- 2GB swap added permanently
- Metta Conductor deployed and alive on Telegram
- GitHub Pages site for Consortium PDF
- stonesynergysoup.com DNS configured

### Session 5: April 14-15, 2026 — GMAIL/GCAL + CORPUS + BRIEFINGS + VISION

**1. Both Telegram Bot Tokens Rotated**
- Conductor token: revoked via BotFather, new token installed in openclaw.json, gateway restarted
- Mandelbret token: revoked via BotFather, new token installed in /opt/openclaw.env, service restarted
- Both bots verified alive via Telegram smoke tests

**2. SSL Certificate Provisioned + HTTPS Enforced**
- stonesynergysoup.com: Let's Encrypt cert approved, expires 2026-07-13
- HTTPS enforcement enabled (http → https 301 redirect)
- All URLs working: root (PDF redirect), /juneevent (Lu.ma redirect), direct PDF link
- Fix method: removed and re-added custom domain in GitHub Pages settings to restart provisioning

**3. Security Cleanup on Droplet**
- Dead workspace stubs archived: metabolism/ → .archived-metabolism-20260414, syntony/ → .archived-syntony-20260414
- Permission drift fixed: 60 dirs changed from root:root/777 to openclaw:openclaw/755
- Note: files inside agent dirs still root-owned (not blocking, soul-generator bootstrap artifact)

**4. Gateway Memory Leak Mitigation**
- Confirmed: ~450MB growth in <1 hour, reproducible across restart cycles
- Daily restart timer deployed: openclaw-restart.timer fires at 04:00 UTC daily
- Timer is Persistent=true (catches up on boot if missed)
- Swap (2GB) prevents OOM during growth windows

**5. gogcli Installed + OAuth Authorized**
- Binary: /usr/local/bin/gog v0.12.0, statically linked, installed from GitHub releases
- OAuth: bret@bretwarshawsky.com authorized for gmail + calendar scopes
- Keyring: /home/openclaw/.config/gogcli/keyring/ (encrypted with GOG_KEYRING_PASSWORD from /opt/openclaw.env)
- Capabilities beyond Gmail/Calendar: Drive, Contacts, Docs, Sheets, Slides, People, Forms, Tasks, Chat, Classroom, App Script
- Both openclaw and mandelbret services have GOG_KEYRING_PASSWORD via EnvironmentFile
- Verified working commands:
  - Gmail: gog gmail search "is:unread newer_than:1d" --max 20 -a bret@bretwarshawsky.com
  - Calendar: gog calendar events primary --from "$(date -u +%Y-%m-%dT00:00:00Z)" --max 20 -a bret@bretwarshawsky.com

**6. Morning Briefing + Evening Wrap DEPLOYED**
- Initially tried OpenClaw cron (failed due to sandbox restrictions — gog not accessible from agent sandbox)
- Switched to systemd timer + bash script pattern (same proven approach as restart timer)
- Morning briefing: /home/openclaw/briefing/morning-briefing.sh, fires 07:00 ET daily via morning-briefing.timer
- Evening wrap: /home/openclaw/briefing/evening-wrap.sh, fires 21:00 ET daily via evening-wrap.timer
- Delivery: Telegram Bot API → Bret's chat ID 379982638 via Conductor bot token
- Briefing format: calendar events + unread important emails, filtered for promotions
- First test briefing delivered successfully (message_id=65)
- Both timers DST-proof (America/New_York timezone), Persistent=true
- Old OpenClaw cron jobs disabled but preserved (IDs: 7180d838... and f4aef833...)
- Briefing state tracker: /home/openclaw/briefing/briefing-state.json

**7. Substack Corpus Parsed (Syntax Bot)**
- Syntax parser: /home/openclaw/.openclaw/workspace-conductor/divisions/creative/bots/syntax/substack_to_wiki.py
- Input: substack-export.zip (6.19 MB, copied from media/inbound to Syntax workspace)
- Output: wiki/ folder — 595 .md files, 5.9 MB total
- 606 articles processed, 0 failures
- 375 articles with real dates (2023-04-04 → 2026-03-30), 219 undated drafts
- 35 year/month subdirs + undated/00/
- Master index: wiki/index.md (108 KB)
- Virtual environment: .venv/ with markdownify, beautifulsoup4, pandas
- Publishing rhythm: 2023 (109 articles), 2024 (120), 2025 (140), 2026 (6)

**8. Facebook Data Export Requested**
- Requested via Meta Accounts Center, exporting to Google Drive
- Both FB profiles included (Bret Alan Warshawsky + R Bretminster Fullofit)
- JSON format, high quality media, all time
- Status: cooking (24-48 hours typical)

**9. Telegram Bulk Export Started**
- Telegram Desktop → Settings → Advanced → Export Telegram Data
- Format: JSON, all chats/groups/channels/media
- Destination: C:\Preposterous\06-archive\data-exports\telegram\
- Status: running (laptop must stay awake)

**10. SynApp /memos/ Deployed**
- Directory: /var/www/memos/
- Caddy route: handle /memos* { uri strip_prefix /memos; root * /var/www/memos; file_server }
- Content: Andrew Alan memo ("We Found the Scroll")
- Live at: https://165.227.85.162.nip.io/memos/

**11. Syntony Times Memo Overlay (PARTIAL)**
- Card + modal added to /var/www/syntony-times/index.html
- Gold-bordered featured card + full-screen classified briefing modal
- Memos nav link added to SynApps bar
- Status: deployed but may need debugging (Bret couldn't see it, possibly browser cache)
- Backup: /var/www/syntony-times/index.html.bak-20260415T035046Z

**12. Synergyworks Division Leads Named + SOUL.md Files Written**
- All written by Metta Conductor during Telegram conversation with Bret
- Stored in workspace-conductor/divisions/

| Division | Lead | Signature | SOUL.md |
|----------|------|-----------|---------|
| Operations | Geodessa | "The dome holds." | divisions/operations/SOUL.md |
| Communications | Mercury9000 | "The message gets through." | divisions/communications/SOUL.md |
| Strategy | Clairvaux | "The landscape is visible from here." | divisions/strategy/SOUL.md |
| Creative | Kerouac | "The road is the poem." | divisions/creative/SOUL.md |

Sub-bot: Syntax (Substack archivist, under Kerouac) — divisions/creative/bots/syntax/

**13. Vision Document Saved to Drive**
- File: VISION--Syntony-Times-Transmedium-Universe-Holopedia.md
- Location: Preposterous/02-storylivingry-studio/
- Content: Holopedia concept, character extraction + agentification pipeline, transmedium pipeline (screenplay, graphic novel, sci-fi novel, Netflix bible, ARG, interactive website, XPRIZE), Karpathy LLM Wiki comparison, build sequence (4 phases)

**14. Research Completed This Session**

Gmail/GCal Integration Research:
- Path 1 (gogcli heartbeat): IMPLEMENTED — simplest, proven
- Path 2 (openclaw-gmail plugin): documented for future upgrade
- Path 3 (Google Pub/Sub): documented for real-time push (Phase 3+)

RAG/Corpus Tools Research:
- openclaw-rag-skill (ClawHub): ChromaDB + local embeddings, no API keys, READY TO INSTALL
- chromadb-memory plugin: auto-recall, fully local, Docker container
- RAGFlow: enterprise RAG, official OpenClaw skill (March 2026), deep document understanding
- ClawRag: Docling + ChromaDB + Vue.js frontend, built for OpenClaw
- OpenClaw v4.0 roadmap: native ChromaDB integration expected mid-2026
- OpenClaw Memory Wiki: already in v2026.4.7, persistent structured notes
- OpenClaw Dreaming: grounded REM backfill from conversation history
- OpenClaw Active Memory: automatic recall plugin

Karpathy LLM Wiki Comparison:
- Published April 4, 2026, 5000+ GitHub stars, 3600+ forks
- Similarities: persistent compounding knowledge artifacts, LLM-maintained wiki, cross-references
- Bonfires advantages: graph-native (36K nodes vs flat markdown), community-powered (multi-contributor vs single-user), generates agents from graph (kEngram pipeline), was doing this in 2025 before Karpathy published
- Strategic implication: market validation, Bonfires is the next evolution

**15. Seven-Corpus Strategy Documented**

| Corpus | What It Feeds | Sub-Bot / Owner |
|--------|--------------|-----------------|
| Substack (606 articles) | Holopedia, transmedium pipeline | Syntax (LIVE) |
| Telegram | Character bibles, communal intelligence, Bonfires convos | TBD parser |
| Gmail | Relationship arcs, backstory, commitment history | Specialist bots (JanetLink etc.) |
| Facebook | Autobiography, TEDx talk, personal timeline | Autobiography sub-bot under Kerouac |
| ChatGPT/Claude exports | Thinking process, creative evolution | "Bret clone" training data |
| LinkedIn | Professional network, career arc | Mercury9000 outreach fuel |
| Fireflies/Fathom | Meeting transcripts, verbal commitments | Meeting memory for all agents |

---

## CURRENT SYSTEM STATE

### Google Drive
- Root: CLEAN — only Preposterous/ + migration script
- Full ontology populated, FULLOFIT decomposed, _triage empty
- New: VISION--Syntony-Times-Transmedium-Universe-Holopedia.md in 02-storylivingry-studio/
- New: CURRENT-STATE v4 in 00-command-center/diagnostics/

### Laptop
- C:\Preposterous\: 35,600+ files, syncing to Google Drive
- C:\PreposterousGit\: Git workspace (NOT synced to Drive)
- SSH key: ~/.ssh/id_ed25519 → root@165.227.85.162
- Telegram export running to C:\Preposterous\06-archive\data-exports\telegram\

### Digital Ocean Server (165.227.85.162)

**Active Services:**
- openclaw.service — OpenClaw Gateway 2026.4.12, 11 agents registered
- mandelbret.service — Telegram ops bot (@Mandelbret_bot), token rotated
- message-bus.service — FastAPI :7331, in-memory holons

**Parked Services:**
- agent-loop.service — STOPPED (cost control), restart with: systemctl start agent-loop

**Scheduled Timers:**
- openclaw-restart.timer — daily 04:00 UTC (gateway memory leak mitigation)
- morning-briefing.timer — daily 07:00 ET / 11:00 UTC (Gmail + Calendar → Telegram)
- evening-wrap.timer — daily 21:00 ET / 01:00 UTC (inbox summary → Telegram)

**Workspace Files:**
- /home/openclaw/.openclaw/workspace/ — Andrew Alan + 9 kEngram subdirs (Noosphere)
- /home/openclaw/.openclaw/workspace-conductor/ — Metta Conductor (Synergyworks)
  - divisions/operations/ — Geodessa SOUL.md
  - divisions/communications/ — Mercury9000 SOUL.md
  - divisions/strategy/ — Clairvaux SOUL.md
  - divisions/creative/ — Kerouac SOUL.md
  - divisions/creative/bots/syntax/ — Syntax parser + wiki/ (606 articles)
- /home/openclaw/briefing/ — morning-briefing.sh, evening-wrap.sh, briefing-state.json
- /home/openclaw/.config/gogcli/ — OAuth credentials + encrypted keyring

**Web UIs (Caddy-fronted):**
- https://165.227.85.162.nip.io/network/ — Synergize Dashboard
- https://165.227.85.162.nip.io/fractal/ — Fractal Impact (OUTDATED LINK - was /fractal/)
- https://165.227.85.162.nip.io/syntony-times/ — Syntony Times + memo overlay (needs debugging)
- https://165.227.85.162.nip.io/memos/ — Internal Memos SynApp (NEW)
- https://165.227.85.162.nip.io/slaas/ — SLaaS page

**Telegram Bots:**
- @Mandelbret_bot — mission control (token rotated Session 5)
- Metta Conductor bot — Synergyworks conductor (token rotated Session 5)
- @SceniusAI_Metabolite_bot — Gateway-bound (Noosphere)
- @SceniusAI_Trimtab_bot — Gateway-bound (Noosphere)

**API Credits:** $14.75 loaded (minus Session 5 usage), auto-reload OFF

**Security Punch List (remaining):**
- message_bus.py:583 hardcoded bypass password → move to env (OPEN)
- Mandelbret logs full Telegram bot URLs at INFO level → fix logging (OPEN, but token rotated so old exposure mitigated)
- Duplicate ANTHROPIC_API_KEY in /opt/openclaw.env → dedup (OPEN)
- Stray lines in /opt/openclaw.env (base64 strings without KEY=) → clean up (OPEN, not blocking)
- message_bus.py + agent_loop.py run as root → move to openclaw user (OPEN)
- Files inside agent dirs still root-owned → chown (LOW priority)
- OpenClaw cron sandbox blocks gog access → documented, workaround via systemd timers (RESOLVED)

### GitHub Pages
- PreposterousHQ/mental-wealth-public — live at stonesynergysoup.com
- SSL: Let's Encrypt, approved, expires 2026-07-13, HTTPS enforced
- /juneevent → redirect to Lu.ma event page

### Gmail
- 103 Preposterous labels active, auto-sort every 15 min (Apps Script)

### Calendar
- Color-coded by pillar, dead calendars removed
- Recurring: therapy M/W/F 11am, Realize Mondays 3pm, Calvin Tuesdays 5pm

### Automated Systems Running
1. Gmail sortInbox — every 15 min (Apps Script, permanent)
2. Downloads Router — every 30 min (Windows Scheduled Task, permanent)
3. Google Drive for Desktop — continuous sync
4. Mandelbret — Telegram polling (on-demand cost only)
5. Metta Conductor — Telegram-bound via OpenClaw Gateway (on-demand cost only)
6. Morning briefing — 07:00 ET daily (systemd timer → Telegram)
7. Evening wrap — 21:00 ET daily (systemd timer → Telegram)
8. Gateway restart — 04:00 UTC daily (systemd timer, memory leak mitigation)

---

## WHAT NEEDS TO HAPPEN NEXT

### Immediate (next session)
1. Install openclaw-rag-skill + ChromaDB on droplet — ingest 606-article wiki for semantic search
2. Deploy Geodessa as first live division lead agent on the droplet
3. Fix Syntony Times memo overlay (browser cache issue or HTML patching problem)
4. Term extraction pass from corpus → seed the Holopedia
5. Character extraction pass from corpus → seed the Character Bible
6. Clean up remaining stray lines in /opt/openclaw.env

### Data Export Pipeline
7. Process Facebook export when it arrives (24-48h from request)
8. Process Telegram export when it completes (running now)
9. Request LinkedIn data export
10. Request Twitter/X data export
11. Request ChatGPT data export
12. Export Fireflies transcripts
13. Export Fathom recordings + transcripts

### Architecture priorities
14. Deploy remaining division leads (Mercury9000, Clairvaux, Kerouac) as live agents
15. Build the Holopedia v1 as navigable wiki
16. Agentify 3 pilot characters from the corpus
17. Feed Holopedia terms into Bonfires graph (the Bonfires Bridge)
18. Begin Mistaken for Madness screenplay treatment from corpus
19. Update Session 5 engineering report on Drive
20. Write Current State v4 via Claude Code (with SSH verification of all states)

### Revenue / Patron priorities
21. Morning briefing → investor outreach pipeline (Clairvaux territory)
22. Content automation → Syntony Times publishing pipeline (Mercury9000 territory)
23. Consortium event at stonesynergysoup.com — continue momentum with Janet Werner / Calvin / Sara Kenigsberg
24. Call Serena Zuppardo at CSPNJ: 848-342-8147

---

## KEY FILE LOCATIONS

### On Google Drive (Preposterous/)
- 00-command-center/diagnostics/CURRENT-STATE--bret-command-center--v4--2026-04-15.md (this file)
- 00-command-center/diagnostics/CURRENT-STATE--bret-command-center--v3--2026-04-14.md
- 00-command-center/diagnostics/SESSION-4--engineering-report--2026-04-14.md
- 02-storylivingry-studio/VISION--Syntony-Times-Transmedium-Universe-Holopedia.md

### On Droplet (165.227.85.162)
- /home/openclaw/.openclaw/openclaw.json — Gateway config (11 agents)
- /home/openclaw/.openclaw/workspace-conductor/ — Metta Conductor + divisions
- /home/openclaw/.openclaw/workspace/ — Andrew Alan + Noosphere
- /home/openclaw/briefing/ — morning + evening briefing scripts
- /home/openclaw/.config/gogcli/ — OAuth credentials + keyring
- /home/openclaw/snapshots/ — Noosphere state snapshot
- /opt/openclaw.env — secrets (NEVER cat this file)
- /etc/systemd/system/morning-briefing.timer — 07:00 ET daily
- /etc/systemd/system/evening-wrap.timer — 21:00 ET daily
- /etc/systemd/system/openclaw-restart.timer — 04:00 UTC daily
- /var/www/memos/index.html — Internal Memos SynApp
- /var/www/syntony-times/index.html — Syntony Times + memo overlay

---

## CLAUDE OPERATING NOTES

- **Model:** Opus 4.6 for architecture/strategy. Sonnet for execution.
- **Voice:** Robin Williams + George Carlin meets Kerouac + Huxley. Crisp, fun, alive.
- **Infrastructure-First Mandate:** Always build permanent systems. Every task is an architecture opportunity.
- **Budget:** ~$14 API credits remaining. Ingenuity first, pay when ROI is clear. Auto-reload OFF.
- **CRITICAL:** Research before design. Audit before building. Never scaffold without understanding existing code.
- **CRITICAL:** Claude Code is the safety officer. Trust its pushback on destructive operations.
- **NEVER cat /opt/openclaw.env** — use shape-only probes (grep key names, wc -l).
- **Droplet access:** ssh root@165.227.85.162 (key at ~/.ssh/id_ed25519)
- **Script-file pattern** for multi-file SSH deploys (apostrophe-safe).
- **Walk-based redaction** for openclaw.json reads (never hardcode redaction paths).
- **gogcli commands** (verified): gog gmail search, gog calendar events primary --from
- **Sandbox limitation:** OpenClaw agent sandbox cannot access host binaries (gog, python3). Use systemd timers for scheduled tasks that need host access.

---

*Five sessions. Foundation complete. Noosphere mapped and parked. Metta Conductor speaking. Gmail and Calendar wired. Morning briefings delivering. 606 articles parsed. Corpus strategy documented. Vision crystallized. Seven data streams converging. The Preposterous machine has its skeleton, its nervous system, its eyes, its ears, and now its voice. Next: it starts acting.*
