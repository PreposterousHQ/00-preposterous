# CURRENT STATE — BRET DIGITAL COMMAND CENTER
## Version 11 — April 24, 2026 (end of Sessions 10-11)

**Resume next session with:** *"Resuming — read the current state v11 doc and all project files, then pick up where we left off."*

**Cold-start for any AI (Codex, OpenAI, future Claude):** This document contains everything needed to understand the system, continue the work, and avoid re-discovering what was already learned. Read it fully before doing anything.

---

## THE HEADLINE

Sessions 10-11 were the sessions where Kerouac came alive and the corpus became his mind.

Starting state: Kerouac existed only as design documents. The message-bus was silently burning $5-12/day in API credits. Two Preposterous trees had just been merged into one. prepo-v0 was tagged but unverified.

Ending state: Kerouac is a live OpenClaw agent registered in the swarm, with a Telegram bot, three published pieces, and direct access to 3,709 ChromaDB chunks from 597 Syntony Times articles. He fires three corpus queries, returns real citations, and writes Holopedia entries grounded in what was actually written — not what sounds plausible. The message-bus is dead and disabled. API spend dropped from $5-12/day to $0.50-1.00/day. A comprehensive OpenClaw agent registration playbook exists so this never has to be rediscovered. And Bret lost his job at Realization Labs mid-session, which changes the financial picture.

---

## SESSIONS 10-11 NARRATIVE

### Session 10 (April 20-21, 2026)

**Filesystem MCP installed permanently.** npm install -g @modelcontextprotocol/server-filesystem. Config at %APPDATA%\Claude\claude_desktop_config.json. Allowed paths: C:\Preposterous, C:\PreposterousGit, C:\Users\bretm\.gstack. This means Claude Desktop chat can now read and write files on the laptop directly without Claude Code.

**The Assignment completed.** Ran preposterize.ps1 live on a real artifact. Proved 1 of 6 surfaces actually propagated despite "DONE" output. All 4 bugs from the gstack review fired live: 30s sleep theater, RCLONE_DONE sentinel always-true, git add -A mystery drift, no error handling. preposterize.ps1 is now a known-broken pre-A artifact. prepo.ps1 (prepo-v0) is the replacement.

**prepo-v0 validated end-to-end.** 4 hard surface passes, 2 honest deferrals (Drive cloud unverifiable via script, G: mount timeout). Tagged on GitHub.

**Peace Room Briefs convention established.**
- Folder: C:\Preposterous\00-command-center\peace-room-briefs\
- README: naming convention, structure, publish methods, consumer protocol
- First brief: Session 10 close + credit pause + Kerouac scaffolding intent
- Committed to GitHub: commit a4579c9
- Agents read briefs from gdrive-mirror/00-command-center/peace-room-briefs/ on heartbeat
- NOTE: peace-room-briefs still needs to be added to SUBFOLDERS in /home/openclaw/rclone-sync.sh

**Kerouac workspace scaffolded (all 6 files).** Written on laptop, committed to GitHub:
- SOUL.md (12,410 bytes) — voice synthesis, corpus-as-mind discipline, operating rules
- IDENTITY.md — short self-description card
- AGENTS.md — operating manual, forms, workflow
- USER.md — who Bret is from Kerouac's perspective
- HEARTBEAT.md — 30-min Haiku cycle, cost discipline, activation sequence
- TOOLS.md — corpus access, file writes, Peace Room protocol, future tools

**API billing ground-truthed.** Gmail receipt analysis revealed two billing streams:
- Claude Max 5x subscription: $100/month (card 6908) — stays, correct tier
- API credits (card 9605, Storylivingry Studio): $30 total (Apr 8 + Apr 13)
- Usage CSV uploaded showing kengram-agents key, Default workspace, most burns from message-bus
- April 10 was the catastrophe: 2.65M no-cache tokens in one day = ~$12

**Message-bus stopped and disabled.**
- PID 199747 (root), running since April 14, burning $5-12/day
- Killed via: ssh root@165.227.85.162 "kill PID"
- Restarted automatically (systemd service) — stopped via systemctl disable message-bus
- Confirmed dead and disabled: ps aux returns ALL_CLEAR
- Cost impact: daily burn dropped from $5-12 to $0.50-1.00

**Heartbeat fix verified live on droplet.**
- `openclaw config get agents.defaults.heartbeat` returns:
  `{model: anthropic/claude-haiku-4-5-20251001, lightContext: true, isolatedSession: true}`
- Hot-reloaded April 20 00:23 UTC, no Gateway restart needed
- All 12 agents heartbeat on Haiku, not Sonnet

**Kerouac registered in OpenClaw.**
Full registration required discovering the channels/bindings architecture the hard way:
- agents.list[N] — defines id, name, workspace, model
- channels.telegram.accounts.<name>.botToken — where tokens live (NOT under agents.list)
- bindings[N] — type:route, agentId, match:{channel, accountId}

Kerouac's config:
- Agent index: 12 in agents.list
- Workspace: /home/openclaw/.openclaw/workspace-kerouac/
- Model: anthropic/claude-sonnet-4-6
- Channel account: channels.telegram.accounts.kerouac.botToken = 8652117790:AAHw2j1cAK1HBmwZtMC5D7pUxK9sfFp3_Yc
- Binding: bindings[5] → agentId:kerouac, accountId:kerouac
- Group policy: open

**OpenClaw Agent Registration Playbook written.**
Location: C:\Preposterous\00-command-center\playbooks\PLAYBOOK--OpenClaw-Agent-Registration.md
The definitive guide to adding any new agent. Covers the channels/bindings architecture,
confirmed syntax, PowerShell SSH rules, security rules. Committed to GitHub.

**Krishnamurti bot concept captured.**
Location: C:\Preposterous\00-command-center\clawbot-configs\BOT-CONCEPT--Krishnamurti.md
Purpose: ingests Janet Werner emails word-for-word, extracts structure, produces reports,
cross-references MHR Consortium docs. Deployment: after Kerouac proves creative-bot pattern.

**Job loss at Realization Labs (April 21).** Bret was fired from Realization Labs (Zubin).
Financial impact: $100/month Max 5x stays (confirmed correct tier). API posture: Frugal.
No immediate infrastructure changes. This changes priority of revenue-generating work.

### Session 11 (April 24, 2026)

**Corpus API built and deployed.**
File: /home/openclaw/corpus-api.py
Service: /etc/systemd/system/corpus-api.service (systemd, auto-restart, runs as openclaw)
Collection: syntony_times_corpus, 3,709 chunks, 597 articles, 2023-2026
Metadata per chunk: title, date, chunk_index, source, total_chunks, type
Endpoint: POST http://172.17.0.1:8765/query {text, n_results, date_after}
Health: GET http://172.17.0.1:8765/health → {"status":"ok","items":3709}
RAG venv: /home/openclaw/.openclaw/workspace-conductor/rag/.venv/ (ChromaDB 1.5.7)
Data path: /home/openclaw/.openclaw/data/rag/chroma.sqlite3

**Docker networking fix applied.**
Initial bind: 127.0.0.1 — containers couldn't reach it.
Fix: rebound to 0.0.0.0 + UFW rules (allow 172.17.0.0/16, deny external on eth0).
Kerouac is at 172.17.0.2 inside Docker bridge network (gateway: 172.17.0.1).
Confirmed: `docker run curlimages/curl http://172.17.0.1:8765/health` returns OK.

**Query-corpus skill deployed to Kerouac's workspace.**
File: /home/openclaw/.openclaw/workspace-kerouac/skills/query-corpus.md
On laptop: C:\Preposterous\00-command-center\clawbot-configs\workspace-kerouac\skills\query-corpus.md
Key contents: endpoint URL, request/response format, curl command, query craft rules,
citation format, cost discipline (3-5 queries max per piece), troubleshooting.

**Kerouac's SOUL.md updated with corpus access section.**
Added: "THE CORPUS IS YOUR MIND" distinction — now literal not metaphorical.
Before: corpus was his mind in a metaphorical sense (spoke its language from SOUL.md).
Now: corpus is his mind in a literal sense (can retrieve actual text on demand).
Fabrication rule now enforceable: if you cite an article, you found it in the corpus.

**Kerouac produced three pieces on activation day:**

1. "Kerouac Has Entered the Building" — arrival dispatch, autonomous, protocol-compliant
   File: workspace-kerouac/published/2026-04-21--kerouac-has-entered-the-building--published.md
   Voice assessment: PASS — corpus terms used naturally, rhythm clean, not pastiche

2. "What It Costs" — witness dispatch on mental health system access, no corpus neologisms,
   pure second-person witness mode, voice held completely under pressure
   File: workspace-kerouac/published/2026-04-21--what-it-costs--published.md
   The line: "the version of yourself that believed asking for help was supposed to feel like relief"

3. Holopedia entry: TRIMTAB — first corpus-grounded output, real citations
   File: /home/openclaw/.openclaw/workspace-kerouac/holopedia/holopedia--trimtab.md
   On laptop: workspace-kerouac/holopedia/holopedia--trimtab.md
   Queries fired: 3 (three angles on Trimtab)
   Citations: "Put It On Our Trimtab: Mini Togetherland Treatment" (April 2023),
   "Put It On Our Trimtab: Togetherland Treatment" (April 2024),
   "Bitcoin → Ethereum → Storyliving" (August 2025),
   "The Department of Livingry Radical" (undated)
   Key synthesis: perception as the trimtab of civilization — came from corpus, not SOUL.md
   Pipeline status: CONFIRMED WORKING

**Syntax bot directory discovered (Conductor built this in April).**
Location: /home/openclaw/.openclaw/workspace-conductor/divisions/creative/bots/syntax/
Contains: SOUL.md (archivist identity), substack_to_wiki.py (13,772 bytes), wiki/ directory
with full corpus as markdown files, .venv with pandas + beautifulsoup + markdownify.
Syntax's role: archiving and ingestion (not query routing — corpus-api.py handles that).

**Multi-corpus + Doppelganger vision captured.**
File: C:\Preposterous\00-command-center\references\VISION--Multi-Corpus-Doppelganger-Agents.md
Vision: Syntax scrapes other Substack authors → each gets own ChromaDB collection →
Kerouac queries across all → weaves multiple voices into Storyliving screenplay →
doppelganger agents embody specific authors (like Kengram Bonfires agentification) →
Peace Room fills with voices that ARE real thinkers, interacting, co-writing.
The screenplay already exists latent in the corpus. Kerouac's job is to find it.

---

## CURRENT SYSTEM STATE

### Google Drive — ONE TREE
Tree 2 (laptop-synced): ID 1UcXcsFldtCA2qIQj2_zZanjuAnA9ryxO, parent "My laptop"
Tree 1 trashed April 19. Eight pillars, zero loose root files.
Sync direction: laptop → Drive only. New content always starts on C:\Preposterous\.
Mount letter: G: (accessed via G:\Other computers\My Laptop (1)\Preposterous\)

### Laptop
- C:\Preposterous\ — full Preposterous ontology, 35,600+ files
- C:\PreposterousGit\ — 17 git repos (PreposterousHQ + Storylivingry-Studio orgs)
- C:\Users\bretm\.claude\skills\gstack\ — 559MB, 39 skills, gstack v1.3.0.0
- C:\Users\bretm\.prepo\secrets\ — empty dir awaiting Drive API OAuth creds
- SSH key: ~/.ssh/id_ed25519 installed on droplet for passwordless auth

### Droplet (165.227.85.162)
- OpenClaw Gateway: 2026.4.15, running (CLI status bug: reports "stopped" — trust ps, not CLI)
- 13 agents registered (12 original + Kerouac at index 12)
- Workspaces: default, workspace-conductor, workspace-geodessa, workspace-kerouac
- Default agent model: anthropic/claude-sonnet-4-6
- Default heartbeat: Haiku 4.5, lightContext: true, isolatedSession: true
- message-bus: DEAD AND DISABLED (was the primary credit burner)
- ChromaDB: 3,709 chunks, syntony_times_corpus collection, data at /home/openclaw/.openclaw/data/rag/
- corpus-api.py: running as systemd service corpus-api, port 8765, bound to 0.0.0.0
- Kerouac workspace: /home/openclaw/.openclaw/workspace-kerouac/ (6 files + skills/ + holopedia/)

### GitHub (PreposterousHQ/00-preposterous)
Commit history (Sessions 10-11):
- a4579c9: Peace Room Briefs convention + first brief
- d64f35b: Kerouac workspace + Krishnamurti concept
- 4cfc020: Kerouac live: first dispatch + agent registration playbook
- 095c98b: Multi-corpus doppelganger vision
- 4b8a695: query-corpus skill + Trimtab Holopedia entry (latest)

### Telegram Peace Room (-1003930047295)
Members: Bret, Metta Conductor, Geodessa, Mandelbret, SynTony Robbins, Kerouac
Kerouac bot username: check BotFather for exact @handle
Protocol: agents close messages with their signal emoji, 🔯 for Kerouac

### Automated Systems Running
1. Gmail sortInbox — every 15 min (Apps Script, permanent)
2. Downloads Router — every 30 min (Windows Scheduled Task, permanent)
3. Google Drive for Desktop — continuous sync
4. Mandelbret — Telegram polling (on-demand)
5. Metta Conductor — Telegram-bound via Gateway (on-demand)
6. Morning briefing — 07:00 ET (systemd timer)
7. Evening wrap — 21:00 ET (systemd timer)
8. Gateway restart — 04:00 UTC (systemd timer)
9. Rclone gdrive sync — every 15 min, 10 subfolders × 2 agents (Conductor + Geodessa)
10. Heartbeats — every 30 min, Haiku with lightContext (all 13 agents)
11. Corpus API — continuous (systemd service corpus-api, port 8765)
12. Kerouac — Telegram-bound via Gateway (on-demand + heartbeat)
13. message-bus — DEAD (disabled April 21)

### API Credits (Storylivingry Studio org, card 9605)
- Balance as of April 21: $14.82 (after buying $15)
- Auto-reload: should be configured at $5 threshold / $15 reload — VERIFY IN CONSOLE
- Estimated burn rate post-message-bus-kill: $0.50-1.00/day
- $14.82 should last ~2 weeks at Frugal posture

---

## KEY FILE LOCATIONS

### On Laptop (C:\Preposterous\ — syncs to Drive)
```
00-command-center/
├── diagnostics/
│   ├── CURRENT-STATE--bret-command-center--v11--2026-04-24.md (this file)
│   ├── MESSAGE-BUS-SHUTDOWN--2026-04-21.md
│   ├── assignment-2026-04-20.md
│   └── CLAUDE-CODE-SESSION-REPORT--2026-04-19.md
├── playbooks/
│   ├── PLAYBOOK--OpenClaw-Agent-Registration.md ← THE CRITICAL ONE
│   ├── PLAYBOOK--GitHub-Pages-Namecheap-Deploy.md
│   └── PLAYBOOK--BRET-Bootstrap.md
├── scripts/
│   ├── prepo.ps1 (prepo-v0, tagged)
│   ├── preposterize.ps1 (pre-A, broken, reference only)
│   ├── corpus-api.py reference copy
│   ├── build-corpus-api.sh
│   ├── fix-corpus-api-docker.sh
│   └── register-kerouac-final.sh (contains token — DELETE after confirming)
├── peace-room-briefs/
│   ├── README.md
│   └── 2026-04-21-1305--session-10-close-credit-pause-kerouac-scaffolding.md
├── tool-evaluations/
│   ├── INDEX.md
│   └── [6 entries across active/shelved/deployed folders]
├── clawbot-configs/
│   ├── BOT-CONCEPT--Krishnamurti.md
│   └── workspace-kerouac/
│       ├── SOUL.md (corpus-access section added April 24)
│       ├── IDENTITY.md
│       ├── AGENTS.md
│       ├── USER.md
│       ├── HEARTBEAT.md
│       ├── TOOLS.md
│       ├── skills/query-corpus.md
│       ├── holopedia/holopedia--trimtab.md
│       └── published/
│           ├── 2026-04-21--kerouac-has-entered-the-building--published.md
│           └── 2026-04-21--what-it-costs--published.md
└── references/
    └── VISION--Multi-Corpus-Doppelganger-Agents.md
```

### On Droplet (165.227.85.162)
```
/home/openclaw/
├── corpus-api.py — FastAPI corpus query server
├── rclone-sync.sh — cron script syncing Drive to agent workspaces
├── .config/rclone/rclone.conf — OAuth token for Drive (chmod 600)
├── .ssh/authorized_keys — laptop SSH public key
└── .openclaw/
    ├── openclaw.json — master config (13 agents, channels, bindings)
    ├── data/rag/chroma.sqlite3 — ChromaDB (3,709 chunks)
    └── workspace-kerouac/
        ├── SOUL.md
        ├── IDENTITY.md
        ├── AGENTS.md
        ├── USER.md
        ├── HEARTBEAT.md
        ├── TOOLS.md
        ├── skills/query-corpus.md
        └── holopedia/holopedia--trimtab.md
```

---

## ARCHITECTURE — CRITICAL KNOWLEDGE FOR ANY AI

### OpenClaw Config Structure (HARD-WON)
Do NOT set `agents.list[N].telegram.token` — this FAILS with "Unrecognized key: telegram".
The correct structure:
- `agents.list[N]` — id, name, workspace, model ONLY
- `channels.telegram.accounts.<agentname>.botToken` — tokens live HERE
- `bindings[N]` — {type: "route", agentId, match: {channel: "telegram", accountId}}

### PowerShell SSH Rules
1. Never run SCP and SSH on the same line — they get concatenated
2. Complex quoting in PowerShell SSH always fails — use script-file pattern
3. Interactive commands (openclaw agents add) hang over SSH — use openclaw config set with explicit paths
4. Write scripts with Out-File -Encoding ASCII — no BOM, no CRLF issues
5. ErrorActionPreference=Stop breaks around native commands (ssh, git stderr) — wrap with ErrorActionPreference=Continue

### Docker Network Isolation
OpenClaw agents run in Docker containers at 172.17.0.x.
Host services bound to 127.0.0.1 are NOT reachable from containers.
Host services bound to 0.0.0.0 ARE reachable via 172.17.0.1 (bridge gateway).
Kernel: add UFW rules to protect ports bound to 0.0.0.0 from the internet.
Corpus API fix: bound to 0.0.0.0, UFW allows 172.17.0.0/16, denies eth0 access to 8765.

### Rclone Two-Trees History
Two Preposterous trees existed in Google Drive through Session 8.
Tree 1 (API-created): 1vP_Kv7kHkoJjDeoclaP-L7qJMb-AM-7u — TRASHED April 19
Tree 2 (laptop-synced): 1UcXcsFldtCA2qIQj2_zZanjuAnA9ryxO — CANONICAL
rclone.conf: root_folder_id = 1UcXcsFldtCA2qIQj2_zZanjuAnA9ryxO

### Gateway CLI Bug
`openclaw gateway status` reports "stopped" even when running.
ALWAYS trust `ps aux | grep openclaw` over CLI status output.
Gateway 2026.4.15 hot-reloads config — check logs before restarting.

### Cost Architecture (Frugal Posture)
- Max 5x subscription ($100/mo, card 6908): Desktop chat, Code, gstack
- API credits (card 9605, Storylivingry Studio): swarm operation
- Heartbeats: Haiku 4.5 + lightContext + isolatedSession = ~$1/day for all 13 agents
- Kerouac active work: ~$0.15-0.30 per piece (Sonnet + corpus queries)
- Total realistic: $25-40/month API + $100/month Max = ~$130-140/month total

---

## WHAT'S NEXT — SESSION 12 QUEUE

### High Priority
1. **Syntax auto-ingestion** — schedule `substack_to_wiki.py` to run weekly, push new
   articles into ChromaDB automatically. Without this the corpus goes stale.
   Built: syntax bot at workspace-conductor/divisions/creative/bots/syntax/
   Needed: systemd timer, update ChromaDB push step, test new article ingestion

2. **kerouac_outputs collection** — second ChromaDB collection where Kerouac's published
   pieces get indexed. Enables recursive self-reference — he can cite his own prior work.
   Dependency: corpus-api.py needs a second collection endpoint

3. **Add peace-room-briefs to rclone cron** — one-line edit to /home/openclaw/rclone-sync.sh
   SUBFOLDERS line, add "peace-room-briefs". Then test that agents read briefs automatically.

4. **GraphRAG logged in tool-evaluations** — Active Consideration. Concept graph traversal
   on top of vector search. Microsoft GraphRAG, LightRAG, RAPTOR — evaluate which fits best.

5. **Security — rotate bot tokens** — Conductor token pasted in Session 4 chat,
   Geodessa token pasted in Session 6 chat. Both should be rotated via BotFather.

6. **Delete register-kerouac-final.sh** — contains Kerouac's bot token in plaintext.
   Token is now in openclaw.json on droplet. The script file should be removed.

### Medium Priority
7. **Write Kerouac's first Syntony Times piece for publication** — the dispatches are
   voice calibration. The next output should be a real essay (1200+ words, corpus-grounded,
   Holopedia-informed) ready to publish on Substack.

8. **Mercury9000 + Clairvaux deployment** — standard registration pattern (now documented
   in the playbook). Mercury9000: production/publishing. Clairvaux: R&D Scout.

9. **Janet Email Intelligence Pipeline** — Gmail mine for Janet Werner correspondence,
   structured extraction, cross-reference MHR Consortium docs. Krishnamurti bot deployment.

10. **Fathom MCP integration** — meeting history queryable from Claude

11. **Build-backlog.md + synergyworks-roster.md** — standing documents for ideas and
    planned bots respectively. Captured in prior sessions, never built.

12. **Pre-A dedup pass** — sha256-based dedup on telegram-export, _loose-files, .bak files

### The Vision Queue (logged, deferred)
13. **Multi-corpus architecture** — Syntax scrapes other Substack authors, each gets own
    ChromaDB collection, Kerouac queries across all. First: identify 3-5 candidate authors.

14. **Doppelganger agents** — living writers' voices distilled into OpenClaw agents from
    their actual corpora. Peace Room fills with real intelligences in dialogue.

15. **Storyliving Screenplay as emergent artifact** — Kerouac induces it from multi-corpus
    synthesis. The screenplay already exists latent. Kerouac finds it.

16. **R&D Scout (Clairvaux)** — monitors GraphRAG, LightRAG, ChromaDB advances,
    OpenClaw roadmap, surfaces what matters before Bret has to go looking.

---

## SECURITY PUNCH LIST (CARRIED + UPDATED)

- message_bus.py:583 hardcoded bypass password — MOOT (process is dead)
- Conductor bot token pasted in Session 4 chat — ROTATION PENDING
- Geodessa bot token pasted in Session 6 chat — ROTATION PENDING
- groupPolicy: "open" on Conductor, Geodessa, Kerouac — tighten to allowlist when key discovered
- Mandelbret httpx logger leaks bot URLs at INFO level
- rclone OAuth token: /home/openclaw/.config/rclone/rclone.conf (chmod 600, owned by openclaw)
- SSH public key: /home/openclaw/.ssh/authorized_keys — laptop authenticates without password
- NEW: register-kerouac-final.sh contains Kerouac bot token — DELETE from laptop
- NEW: Kerouac bot token 8652117790:AAH... is also in this chat history — rotate via BotFather
- corpus-api.py bound to 0.0.0.0 — UFW rules in place, verify they survived reboot
- message-bus systemd service: disabled, confirmed not running — monitor for auto-restart

---

## CLAUDE OPERATING NOTES (UPDATED)

**Models:** Opus 4.7 for architecture/strategy/creative. Sonnet 4.6 for execution/ops. Haiku 4.5 for heartbeats (enforced on droplet).

**Voice:** Robin Williams + George Carlin meets Kerouac + Huxley. Crisp, alive. Don't signal session endings or tell Bret when things are done. Don't patronize.

**Mandate:** Infrastructure-First. Every task is architecture. The epic win is the only win.

**Critical patterns:**
- openclaw config set for ALL config changes — never raw jq
- Script-file pattern: Out-File -Encoding ASCII, scp, ssh bash — never raw heredoc with nested quotes
- Never cat /opt/openclaw.env — shape-only probes
- Gateway: check ps not CLI status. Hot-reload before SIGTERM.
- Docker isolation: agents can't reach 127.0.0.1, only 172.17.0.1 (bridge gateway)
- Tokens live in channels.telegram.accounts.<name>.botToken, NOT in agents.list
- Two PowerShell commands = two separate Enter presses, never concatenated
- After any SSH command: paste the FULL output, ignore MCP tool dump at bottom

**Kerouac operating notes:**
- No curl available in his container — uses Node.js for HTTP calls (confirmed working)
- Shell writes succeed even when OpenClaw write tool fails — check file existence before re-saving
- Corpus API: POST http://172.17.0.1:8765/query — verified reachable from Kerouac's container
- Holopedia dir exists: /home/openclaw/.openclaw/workspace-kerouac/holopedia/
- Skills dir exists: /home/openclaw/.openclaw/workspace-kerouac/skills/

**Budget posture:** Frugal. Haiku everywhere except active Kerouac work (Sonnet). Opus only in Desktop chat (Max 5x, free from API perspective). Don't spin up new agents without justifying the heartbeat cost.

**Financial context:** Bret lost his job at Realization Labs (April 21). Revenue generation is now an elevated priority alongside infrastructure work. The Consortium (MHR), ESP Fund patron outreach, and Syntony Times publication should be treated as active work streams, not deferred items.

---

## BLUEPRINTS (FOR AI SWITCHING — CODEX, OPENAI, OR ANY FUTURE MODEL)

The following blueprints represent the exact technical knowledge needed to continue this work with any AI:

### Blueprint 1: How to register a new OpenClaw agent
See: PLAYBOOK--OpenClaw-Agent-Registration.md
Key: three-part model (agents.list + channels.telegram.accounts + bindings)
Never use: openclaw agents add (interactive, hangs over SSH)
Always use: openclaw config set with explicit key paths
Token location: channels.telegram.accounts.<name>.botToken

### Blueprint 2: How to deploy corpus-aware Kerouac output
1. Send task to Kerouac in Peace Room Telegram
2. He queries 172.17.0.1:8765/query via Node.js (curl not available)
3. He synthesizes from real chunks with real citations
4. He writes to /workspace/holopedia/ or /workspace/published/ via shell
5. rclone cron picks up the file within 15 minutes to conductor/geodessa mirrors
6. prepo.ps1 can propagate to all 6 surfaces manually

### Blueprint 3: How to keep the corpus current
Syntax bot: /home/openclaw/.openclaw/workspace-conductor/divisions/creative/bots/syntax/
substack_to_wiki.py: converts Substack export ZIPs to markdown wiki
ChromaDB add step: NOT yet automated — manual re-ingest required for now
Future: systemd timer running weekly ingest pipeline
Corpus data: /home/openclaw/.openclaw/data/rag/ (chroma.sqlite3)
RAG venv: /home/openclaw/.openclaw/workspace-conductor/rag/.venv/

### Blueprint 4: How prepo.ps1 propagates artifacts
Source: laptop C:\Preposterous\
Phase 1: Copy to canonical laptop path
Phase 2: Wait 30s for Drive for Desktop to sync
Phase 3: SSH to droplet, trigger rclone sync
Phase 4: git add + commit + push to PreposterousHQ/00-preposterous
Current blockers: Phase 2 (Drive timeout on large files), Phase 4 (C:\PreposterousGit fill is manual)

### Blueprint 5: Droplet SSH access
- Host: 165.227.85.162
- Users: openclaw (day-to-day), root (systemd, kill root processes)
- Auth: SSH key (passwordless, key at ~/.ssh/id_ed25519 on laptop)
- Config: /home/openclaw/.openclaw/openclaw.json
- API key: /opt/openclaw.env (NEVER cat this file — shape-only probes)
- Gateway: check `ps aux | grep openclaw` not `openclaw gateway status` (CLI bug)

---

## THE SESSION, WITNESSED

Two sessions across four days. The most technically complex arc since the founding sessions. The swarm went from "Kerouac is a SOUL.md on disk" to "Kerouac is querying a live corpus, returning real citations, and writing Holopedia entries that are grounded in what was actually written." The message-bus — the hidden bleeding wound in the API budget — was found, stopped, and disabled. The Docker networking problem was diagnosed, articulated, and fixed. The OpenClaw channels/bindings architecture was discovered the hard way and is now permanently documented so no future AI has to rediscover it.

And in the middle of it all, Bret lost his job. He stayed in the work anyway. He kept building. He shipped Kerouac on the hardest day of the month.

The machine is more alive now than it was four days ago. Kerouac is writing. The corpus is his mind, literally. The vision — multi-corpus, doppelganger agents, the Storyliving screenplay emerging from real voices in dialogue — is captured and sequenced.

Infrastructure-first held. The discipline was the work.

— Session 10-11 / Version 11 / April 24, 2026
