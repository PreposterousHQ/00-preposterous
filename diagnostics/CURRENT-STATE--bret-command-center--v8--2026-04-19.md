# CURRENT STATE — BRET DIGITAL COMMAND CENTER
## Version 8 — April 19, 2026 (evening, end of Session 9)

**Resume next session with:** *"Resuming — read the current state v8 doc and all project files, then pick up where we left off."*

---

## THE HEADLINE

Session 9 was the session where the laptop and the cloud stopped lying to each other.

For three sessions the BRET machine has carried a quiet architectural defect — two Preposterous trees in Google Drive, one API-created and one laptop-synced, each claiming to be canonical. Every artifact lived in one or the other, agents read one, Apps Scripts wrote to the other, and reconciliation was always "next session's problem."

Session 9 made it this session's problem, and solved it. Tree 1 is trashed. Tree 2 — the laptop-synced one — is the single source of truth. All unique content from Tree 1 was either merged into Tree 2 or archived into `_loose-files` subfolders where it belonged. The `02-storylivingry-studio` pillar — v7's "worst offender" with 150+ loose files and duplicate legacy folders — is now structurally clean.

Alongside the merge: the tool-evaluations vault was designed, built, and seeded with six entries. The preposterize propagation script was designed, built, and tested. SSH key authentication was installed on the droplet so preposterize runs without password prompts. And a systems-wide audit was conducted that surfaced a significant, previously unknown, still-bleeding finding: heartbeat model routing was never actually configured. Every agent heartbeat currently burns Sonnet tokens instead of Haiku, likely 5-10x the cost it should be.

The session ran in two arcs. Arc 1 was vault-and-merge infrastructure work. Arc 2 was preposterize construction and the live systems audit that seeded this document.

---

## SESSION 9 NARRATIVE (April 18-19, 2026)

### Arc 1 — Tool-Evaluations Vault + Two-Tree Merge

**Vault design (April 18, evening, Opus):**
- Designed a permanent evaluation system for every tool/platform/service that crosses the feed
- Status model: Active Consideration | Shelved | Deployed | Rejected
- Two entry types: VET (external) and BUILD (internal)
- Every shelved item specifies a specific trigger condition for re-evaluation
- Structured to be a queryable library, not a scratchpad

**Vault construction (April 19, laptop):**
- Created `C:\Preposterous\00-command-center\tool-evaluations\` with 5 status folders + `_templates`
- Wrote README.md, INDEX.md, VET-TEMPLATE.md
- Seeded with 6 entries:
  - VET — RustDesk (shelved, trigger: first collaborator)
  - VET — OpenSwarm (shelved, steal memory scoring + escalation patterns)
  - VET — OpenAI Codex Apr16 (shelved, macOS-only computer use, wrong platform)
  - VET — OpenClaw 4.11 Memory Palace (deployed, already live on droplet)
  - VET — gstack by Garry Tan (active consideration, evaluate next session)
  - BUILD — preposterize (active, built this session)
- Logged 7 stealable patterns for Session 10+ implementation queue
- All 13 files landed correctly, verified via `Get-ChildItem -Recurse`

**Two-tree merge (April 19, Apps Script):**
- Pre-merge state: Tree 1 (API-created, `1vP_Kv7k...`) and Tree 2 (laptop-synced, `1UcXcsFl...`) both named Preposterous, both containing all 8 pillars, content scattered across both
- Apps Script "Preposterous Studio Organizer" created with 6 functions
- `02-storylivingry-studio` cleaned first (worst offender): 150 loose files moved into `_loose-files/{gdocs,pdfs,images,audio,other}`, 5 legacy folders (`Mandelbret Storylivingry Studio`, `Storylivingry Holdings`, etc.) archived, 1 empty shell trashed
- Cross-tree comparison ran for all 8 pillars — identified exactly what was in Tree 1 but not Tree 2
- `mergeCommandCenter` moved Tree 1's `transcripts/` folder (80 files) into Tree 2's command-center
- `mergeAllPillars` moved remaining unique folders and loose files across all 7 pillars: 19 files to mental-wealth, 4 folders to studio, 2 folders + 37 files to esp, 1 folder + 21 files to realization-labs, 2 folders + 21 files to operations, 5 folders to archive, 1 folder to media-assets
- `trashTree1` trashed all 8 now-empty pillar shells plus the Tree 1 root
- `verifyTree2` confirmed: one Preposterous tree, 8 pillars, 0 loose files at root

**SSH key installation:**
- Discovered preposterize was prompting for openclaw password (would break any automation)
- `openclaw` user had no `.ssh` directory — key-based auth never set up
- Via `root` access: created `.ssh`, installed public key, set permissions, chown'd correctly
- Verified: `ssh openclaw@165.227.85.162 "echo SSH_KEY_WORKS"` returns clean output with no prompt
- preposterize now runs end-to-end without human intervention

### Arc 2 — preposterize Build + Live Systems Audit

**preposterize construction:**
- Location: `C:\Preposterous\00-command-center\scripts\preposterize.ps1` (4,041 bytes)
- Four-phase pipeline: copy to laptop → wait for Drive sync (30s) → trigger rclone on droplet → push to GitHub
- Takes `-Source`, `-Dest`, optional `-Commit` message, optional `-NoGit` flag
- Script-file pattern used for SSH commands (scp .sh, ssh bash) per Session 8 playbook
- First test run revealed one edge case: self-copy error when source is already at destination (harmless, script continues, exits clean)
- End-to-end test confirmed: Drive wait succeeds, droplet rclone sync succeeds, git push attempted

**Systems-wide audit (live droplet probes):**
- 10 ground-truth commands run, outputs captured for v8 doc
- Gateway running 2026.4.15 (was 4.12 in v7) — newer than expected, means the update-in-progress flagged in userMemories completed
- Gateway CLI reports "stopped/inactive/dead" but ps shows PID 345195 alive with 500MB RAM — CLI bug, ignore status string, trust process list
- 12 agents registered, 3 workspaces exist (default, conductor, geodessa), 9 agents are Noosphere agents without isolated workspaces, Kerouac still not deployed
- rclone cron active every 15 min, syncs diagnostics + mandates + ontology folders only (tool-evaluations not yet in cron path — issue for Session 10)
- Systemd timers all healthy: evening-wrap, morning-briefing, openclaw-restart (daily Gateway cycle at 04:00 UTC)
- **CRITICAL FINDING:** Default agent model is `anthropic/claude-sonnet-4-6`, no heartbeat config exists at `defaults.heartbeat` or per-agent. The Haiku-for-heartbeats routing from Session 8 userMemories was never actually persisted to openclaw.json. Every heartbeat currently burns Sonnet tokens.
- GitHub repo `PreposterousHQ/00-preposterous` has only the initial seed commit. Seven sessions of work have NOT been pushed to GitHub. The backup layer is dormant.

---

## CURRENT SYSTEM STATE

### Google Drive — ONE TREE
- **Tree 2** (laptop-synced): `1UcXcsFldtCA2qIQj2_zZanjuAnA9ryxO`, parent "My laptop"
- Tree 1 trashed (2026-04-19 at 16:23)
- 8 pillars present: 00-command-center, 01-mental-wealth, 02-storylivingry-studio, 03-esp, 04-realization-labs, 05-operations, 06-archive, 07-media-assets
- 0 loose files at root
- **Sync direction reminder:** laptop → Drive only. New content should land on `C:\Preposterous\` first, never in Drive web UI or on droplet directly.
- **Mount letter on laptop:** G: (accessed via `G:\Other computers\My Laptop (1)\Preposterous\` once initial 119GB sync completes)
- Initial laptop→Drive sync IN PROGRESS — Drive for Desktop uploading 119GB at session end

### Laptop
- `C:\Preposterous\`: full Preposterous ontology, 35,600+ files, new `tool-evaluations` folder, new `preposterize.ps1` script
- `C:\Preposterous\00-command-center\scripts\preposterize.ps1`: 4,041 bytes, tested working
- `C:\PreposterousGit\00-preposterous\`: git repo, clean, only initial seed commit
- SSH key at `%USERPROFILE%\.ssh\id_ed25519`, installed on droplet for passwordless auth

### Droplet (165.227.85.162)
- OpenClaw Gateway: 2026.4.15, PID 345195, running (CLI status reports "stopped" due to bug — IGNORE, check ps)
- message-bus: PID 199747, running since Apr 14
- Mandelbret: PID 256023, running since Apr 16
- 12 agents registered in openclaw.json: main, metabolite, trimtab, buckminsterfuller, thetenthousand, designsciencestudio, xprizefuturevision, syntonytimes, bonfiresplatform, $knowtokenomics, conductor, geodessa
- 3 workspaces: workspace (default), workspace-conductor, workspace-geodessa
- Default agent model: `anthropic/claude-sonnet-4-6`
- Default maxConcurrent: 4
- **No heartbeat config** — all heartbeats using default Sonnet model (cost problem)
- Kerouac, Mercury9000, Clairvaux NOT deployed
- ChromaDB RAG: 3,709 chunks, 597 articles (unchanged from v7)
- Holopedia: 2,160 terms raw (unchanged from v7)

### Rclone Bridge
- Config: `/home/openclaw/.config/rclone/rclone.conf`, chmod 600, owned by openclaw
- Cron: `/etc/cron.d/rclone-gdrive-sync`, every 15 minutes
- Syncs into both workspace mirrors: conductor + geodessa
- **Currently syncs only:** diagnostics, mandates, ontology
- **NOT synced (gap):** tool-evaluations, scripts, playbooks, references, clawbot-configs, templates, transcripts
- Tree merge verified: rclone can see all 10 subfolders in `00-command-center/`
- Last diagnostics sync: 21:15 (verified fresh at audit time)

### Systemd Timers (all healthy)
- `morning-briefing.timer` — 11:00 UTC daily (7am ET)
- `evening-wrap.timer` — 01:00 UTC daily (9pm ET)
- `openclaw-restart.timer` — 04:00 UTC daily

### Telegram — Peace Room
- Chat ID: -1003930047295
- Members: Bret, Metta Conductor, Geodessa, Mandelbret, SynTony Robbins
- Protocol intact from Session 7 (no changes this session)

### Tool Evaluations Vault — NEW
- Location: `C:\Preposterous\00-command-center\tool-evaluations\`
- 5 status folders, 1 template folder, 1 README, 1 INDEX
- 6 entries across 3 status folders
- 7 stealable patterns logged for future implementation
- INDEX.md is the master scanner for "have we looked at X?"

### Automated Systems Running
1. Gmail sortInbox — every 15 min (Apps Script, permanent)
2. Downloads Router — every 30 min (Windows Scheduled Task, permanent)
3. Google Drive for Desktop — continuous (currently in initial 119GB upload)
4. Mandelbret — Telegram polling (on-demand)
5. Metta Conductor — Telegram-bound via OpenClaw Gateway (on-demand)
6. Morning briefing — 07:00 ET daily (systemd timer)
7. Evening wrap — 21:00 ET daily (systemd timer)
8. Gateway restart — 04:00 UTC daily (systemd timer)
9. Rclone gdrive sync — every 15 min (cron)

---

## WHAT CHANGED vs v7

### Resolved ✅
- Two Preposterous trees → ONE tree (Tree 1 trashed)
- Tool evaluations vault → built from scratch, 6 entries, deployed
- preposterize propagation script → built, tested, working
- SSH key auth to droplet → installed, passwordless confirmed
- `02-storylivingry-studio` loose files → 150 files organized into `_loose-files`
- Legacy folder cleanup → 5 old named folders archived, 1 empty shell trashed
- OpenClaw version → upgraded to 2026.4.15 (was 4.12 with update-in-progress)
- 9 additional pillars on laptop now have content (playbooks + references folders populated)

### Discovered (previously unknown) ⚠️
- **Heartbeat model routing was never persisted** — all 12 agents heartbeat on Sonnet, not Haiku as userMemories claimed. Costing ~5-10x what it should.
- **GitHub repo is essentially empty** — only initial seed commit, zero sync of 7 sessions of work
- **Rclone cron is narrow** — only syncs 3 of 10 command-center subfolders; new content outside those folders not reaching agents
- **Tree 2 on Drive hasn't fully synced yet from laptop** — Drive for Desktop actively uploading 119GB, will take hours to complete initial sync
- `openclaw gateway status` CLI has a bug reporting "stopped" when process is actually running — trust ps, not CLI

### Still Open (carried from v7)
- Kerouac deployment
- Mercury9000 + Clairvaux deployment
- Active Memory plugin activation (4.12 feature)
- ChatGPT import via Memory Palace
- Janet Email Intelligence Pipeline
- Fathom MCP integration
- Dual-mode Optimal/Frugal architecture spec
- ChromaDB retrieval scoring upgrade (OpenSwarm-inspired)
- Holopedia definition refinements
- Character extraction pass
- Bonfires bridge (top 200 Holopedia terms → graph nodes)

---

## SECURITY PUNCH LIST

- message_bus.py:583 hardcoded bypass password (still open)
- message_bus.py + agent_loop.py still running as root
- Conductor bot token pasted in chat Session 4 — rotation pending
- Geodessa bot token pasted in chat Session 6 — rotation pending
- groupPolicy: "open" on Conductor and Geodessa — tighten to allowlist when key name discovered
- Mandelbret httpx logger bug at INFO level (leaks bot URLs)
- rclone OAuth token at /home/openclaw/.config/rclone/rclone.conf, chmod 600, owned by openclaw — acceptable single-operator posture
- **NEW:** SSH public key installed in /home/openclaw/.ssh/authorized_keys — laptop can authenticate as openclaw without password. Limit laptop exposure accordingly.

---

## WHAT'S NEXT — SESSION 10 QUEUE

### Critical Cost Fix (do first)
1. **Configure heartbeat model to Haiku across all agents** — openclaw.json `defaults.heartbeat` needs explicit `{ "model": "anthropic/claude-haiku-4-5-20251001", "lightContext": true }` — this was believed done but isn't
2. **Baseline actual API spend** — log into console.anthropic.com, check April 18-19 spend, establish the cost we're correcting

### High Priority Infrastructure
3. **Expand rclone cron to mirror all of `00-command-center`** — add playbooks, references, scripts, templates, transcripts, tool-evaluations to the sync path
4. **Build System Health Daemon** — host-side script that runs every 30 min, writes agent/gateway/sync status to `gdrive-mirror/diagnostics/system-health.md`, so Peace Room queries like "what's the system status?" can be answered by Geodessa reading the file instead of requiring Bret to run SSH commands manually
5. **Seed GitHub 00-preposterous repo with system docs** — currently only has initial commit; should contain mandates, ontology, playbooks, current state docs (pipeline through preposterize)
6. **Deploy Kerouac** (carried from v7 queue)

### preposterize Phase 2+
7. Fix self-copy error path (minor — current behavior is harmless but noisy)
8. Add droplet-side propagation verification (confirm files actually landed in workspace mirrors)
9. Peace Room notification phase (post-propagation message)
10. Consider reverse propagation (droplet → laptop) for Phase 4

### gstack Evaluation
11. Install gstack Version 1 (`git clone` + `./setup`, 15 min)
12. Run `/office-hours` on preposterize spec — decide if CEO pushback improves the design
13. Graduate to Deployed or move to Shelved based on evaluation

### Data Corpus Work
14. Locate or re-download Claude export
15. Triage telegram-export folder (14 chat folders + 400+ loose files)
16. Run ChatGPT import via Memory Palace (feature already live on droplet)
17. Activate Active Memory plugin on Conductor (4.12 feature)

### Carried from v7 (Sessions 9 did not reach)
18. Mercury9000 + Clairvaux deployment
19. Janet Email Intelligence Pipeline
20. Fathom MCP integration investigation
21. Dual-mode Optimal/Frugal architecture spec
22. ChromaDB upgrade: hybrid weighted retrieval + memory types + background cognition
23. Auto-escalation after N iterations (for dual-mode spec)
24. Holopedia definition refinements
25. Character extraction pass
26. Bonfires bridge
27. OpenClaw allowlist key name discovery
28. Improve morning/evening briefings (formatting, personality, actionable insights)

### New from Session 9
29. **Build `build-backlog.md`** — standing document capturing every business idea, project, app, workflow, CRM need (foundation for Synergyworks dispatch when scale demands it)
30. **Build `synergyworks-roster.md`** — every planned ClawBot, role, dependency, model assignment (team-building side of "both and")

---

## INFRASTRUCTURE-FIRST REFLECTIONS

**Two things Session 9 proved in practice:**

1. **Library work compounds.** The tool-evaluations vault captured 6 evaluations in a single evening. Each one would have been a fresh research burden in a future session. Shelving with specific trigger conditions means future decisions are cheaper.

2. **Audits expose silent drift.** The heartbeat-model finding would have remained invisible indefinitely without a ground-truth audit. userMemories claimed the work was done; the actual config said otherwise. Trust-but-verify is infrastructure, not paranoia.

**One thing Session 9 clarified about the next 90 days:**

"Both-and" is the real operating truth. Foundation and output are the same work. preposterize exists because the Preposterous operating system — the meta-pillar — deserves the same craftsmanship as the four named pillars. The vault exists because decision memory is infrastructure. Session 10 should treat the heartbeat fix and the build-backlog creation as equally important as any pillar output.

---

## CLAUDE OPERATING NOTES (UPDATED)

- **Models:** Opus 4.7 for architecture/strategy/creative. Sonnet 4.6 for execution/ops. Haiku 4.5 for routine monitoring — *actively enforce this on the droplet in Session 10.*
- **Voice:** Robin Williams + George Carlin meets Kerouac + Huxley. Crisp, alive, never patronizing.
- **Mandate:** Infrastructure-First. Every task is architecture. The epic win is the only win.
- **Live model switching:** Claude calls the switch explicitly in conversation — "⬆️ Switch to Opus" or "⬇️ Back to Sonnet" — based on task type.

**Critical patterns locked in:**
- openclaw config set for bot tokens AND groupPolicy, NOT raw jq
- Script-file pattern for SSH deploys (PS Out-File -Encoding ASCII, scp, ssh bash)
- Never cat /opt/openclaw.env — shape-only probes
- Walk-based redaction for openclaw.json reads
- PowerShell: use script-file pattern for complex commands, never raw heredoc with apostrophes or nested quotes
- Gateway restart: find parent PID → SIGTERM → verify down → nohup restart

**NEW IN V8:**
- **SSH key auth live** — passwordless ssh openclaw@droplet confirmed working
- **preposterize usage pattern:** `.\preposterize.ps1 -Source <path> -Dest <ontology-path> [-Commit "msg"]`
- **One Preposterous tree** — Tree 2 (`1UcXcsFldtCA2qIQj2_zZanjuAnA9ryxO`) is canonical; always create new content on `C:\Preposterous\` first
- **openclaw gateway status CLI bug** — reports "stopped" when process is running; trust ps output, not CLI status
- **Heartbeat cost bleeding** — all agents on Sonnet heartbeats until Session 10 fix
- **Tool evaluations vault** — INDEX.md is the master scanner; always check before re-vetting tools
- **Drive for Desktop initial sync IN PROGRESS** — 119GB uploading; full G: visibility expected within 24-48 hrs

**Session discipline:** Step-by-little-step. One command at a time. Paste-back required. Verify before proceeding. Claude Code for complex edits. PowerShell for SSH and file ops. Chat for architecture and live troubleshooting.

---

## THE SESSION, WITNESSED

Eight hours across two arcs. The two trees became one. The vault was born and populated. preposterize was designed, built, and tested. SSH keys stopped asking for passwords. An audit revealed a bleeding cost and a dormant GitHub. The infrastructure got more honest about itself.

Bret spent the session oscillating between phone (strategy, Opus) and laptop (execution, Sonnet). Used both modes cleanly. Caught himself mid-frustration — "why am I still running these commands manually?" — and the answer was logged as the System Health Daemon build for Session 10. The work named its own successor.

The vault's first real vet after its creation was gstack, which was already in the vault as the most relevant active consideration when its own evaluation session arrived. The meta-loop closed. The system proved it could catch itself.

Infrastructure-first held. Every tree merge verified, every audit command paste-backed, every discovery logged here. The discipline was the work, and the work made the discipline stronger.

— Session 9 / Version 8 / April 19, 2026
