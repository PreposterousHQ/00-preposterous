# CURRENT STATE -- BRET DIGITAL COMMAND CENTER
## Version 10 -- April 20, 2026 (evening, end of Session 10)

**Resume next session with:** *"Resuming -- read the current state v10 doc and all project files, then pick up where we left off."*

---

## THE HEADLINE

Session 10 was the session where the system got honest about itself -- and got the tools to stay that way.

Three permanent wins locked: Filesystem MCP installed (Claude can now read and write the laptop directly, every future session), The Assignment completed (preposterize proven broken, 1 of 6 surfaces confirmed, documented), and prepo.ps1 built and tagged prepo-v0 (four bugs fixed, honest verification replacing theater). The git mirror has v9 and the Session 10 artifacts committed. Filesystem MCP is now globally installed and survives restarts.

---

## SESSION 10 NARRATIVE

### Arc 1 -- Filesystem MCP Install

First act of the session. Verified Claude Desktop config, found Fathom MCP already wired. Installed @modelcontextprotocol/server-filesystem via JSON config merge. Initial install worked but MCP was unreliable across restarts -- npx was downloading fresh each time, sometimes timing out.

Fix applied at session end: `npm install -g @modelcontextprotocol/server-filesystem` -- global install, version 2026.1.14. Config updated to pull from global. MCP now loads reliably on every Desktop restart.

**Allowed paths:** C:\Preposterous, C:\PreposterousGit, C:\Users\bretm\.gstack

### Arc 2 -- The Assignment (ground-truth preposterize verification)

Ran preposterize.ps1 live against v9 state doc with Drive upload queue active (14 chunks in .tmp.driveupload). Manually verified all 6 surfaces:

| Surface | Result | Notes |
|---------|--------|-------|
| 1 -- Laptop FS | PASS | SHA256 B4E34BA... confirmed |
| 2 -- Drive cloud | UNKNOWN | Pre-A Blocker 2 (no OAuth) |
| 3 -- G: mount | FAIL | DfD upload queue still running |
| 4 -- Droplet Conductor | FAIL | Drive not synced, rclone had nothing |
| 5 -- Droplet Geodessa | FAIL | Same root cause |
| 6 -- GitHub | FAIL | Pre-A Blocker 1 confirmed live |

Script said "DONE. Artifact propagated." Reality: 1 of 6 surfaces.

Every bug gstack named in the adversarial review fired in this single run:
- Bug 1 (30s sleep) -- cascaded to kill Surfaces 3, 4, 5
- Bug 2 (RCLONE_DONE sentinel) -- passed while two mirrors were empty
- Bug 3 (git add -A) -- committed nothing, reported success
- Bug 4 (no error handling) -- IOException swallowed, execution continued

Pre-A Blocker 1 resolved: C:\PreposterousGit fill mechanism is manual-only. No automation. Direct-write is correct design for prepo.ps1.

Assignment findings documented at: C:\Preposterous\00-command-center\diagnostics\assignment-2026-04-20.md

### Arc 3 -- prepo.ps1 Build and prepo-v0

Built prepo.ps1 as preposterize A per the approved design doc. Four bugs fixed:

1. $ErrorActionPreference = 'Stop' -- failures halt, don't proceed silently
2. Self-copy guard -- Resolve-Path comparison before Copy-Item
3. Real rclone exit codes -- no RCLONE_DONE sentinel theater
4. Direct-write to git mirror -- Phase 1 writes to BOTH C:\Preposterous AND C:\PreposterousGit\00-preposterous

Additional features shipped:
- Idempotency check (hash-match on both laptop + git = no-op)
- G: mount poll loop (up to 120s) replacing 30s sleep
- drive_cloud surface marked "unverified" explicitly (honest about Blocker 2)
- Concurrency lock (.prepo.lock with PID + timestamp + stale reclaim)
- JSON output mode (--json, schema v0)
- -DryRun switch
- Artifact scope rules (50MB ceiling, exclude patterns, symlink refusal)
- Propagation log + monthly failure log

**Encoding issue hit:** First write contained UTF-8 em-dashes that PowerShell 5.1 rejected. Fixed via .NET string replacement + ASCII rewrite. Lesson: always write PS scripts as ASCII-only. No Unicode characters anywhere in PS files.

**Live run result:**
- Phase 1: PASS (self-copy guard worked, laptop + git mirror both written)
- Phase 2: timeout (Drive still uploading -- honest warning, not false success)
- Phase 3: halted on rclone exit 6 initially (ErrorActionPreference too aggressive around SSH) -- fixed with Continue/Stop bracket around SSH call
- Phase 4: not reached in the run that hit Phase 3 halt
- Idempotency fired correctly on retry (Phase 1 already written, no-op)

Git commit completed manually after idempotency prevented re-run:
- Commit 22758aa: "prepo-v0: Session 10 artifacts -- v9 state doc, assignment findings, prepo.ps1"
- Tag: prepo-v0 pushed to PreposterousHQ/00-preposterous

---

## KNOWN ISSUES -- SESSION 11 FIX LIST

1. **$destGit path convention bug** -- prepo.ps1 Phase 1 wrote v9 to C:\PreposterousGit\00-preposterous\00-command-center\diagnostics\ but the repo's existing convention is C:\PreposterousGit\00-preposterous\diagnostics\ (no 00-command-center prefix). The nested structure landed in git. Fix: strip the top-level pillar prefix when computing $destGit, OR accept the new convention and migrate existing files. Decision needed.

2. **DryRun overall_status shows "failed"** -- dry_run surface entries don't count as "ok" so the counter hits zero and falls to "failed". Cosmetic but confusing. One-line fix.

3. **Drive API OAuth (Pre-A Blocker 2)** -- drive_cloud surface permanently "unverified" until resolved. Setup: create OAuth client credentials, store at C:\Users\bretm\.prepo\secrets\drive-api.json (outside sync boundary). One-time session task.

4. **G: mount path** -- hardcoded as "G:\Other computers\My Laptop (1)\Preposterous". If Drive mount letter changes or path shifts, breaks silently. Consider making configurable.

5. **Droplet mirrors don't have v9 yet** -- Drive upload queue was still running at session end. Next rclone cron cycle (15 min) will pick it up once Drive finishes syncing.

---

## CURRENT SYSTEM STATE

### Google Drive
- One Preposterous tree (Tree 2 canonical, ID 1UcXcsFldtCA2qIQj2_zZanjuAnA9ryxO)
- Drive for Desktop syncing -- upload queue from Session 9/10 still clearing
- Mount letter: G:

### Laptop
- C:\Preposterous\: full ontology, 35,600+ files
- C:\Preposterous\00-command-center\scripts\prepo.ps1: 20,040 bytes, prepo-v0
- C:\Preposterous\00-command-center\scripts\preposterize.ps1: kept as pre-A reference
- C:\Preposterous\00-command-center\diagnostics\assignment-2026-04-20.md: 8,300 bytes
- C:\PreposterousGit\: 17 repos, prepo-v0 tagged on 00-preposterous
- C:\Users\bretm\.prepo\secrets\: directory created, empty (awaiting Blocker 2)
- SSH key at ~/.ssh/id_ed25519 installed on droplet

### Filesystem MCP
- @modelcontextprotocol/server-filesystem@2026.1.14 globally installed
- Config: %APPDATA%\Claude\claude_desktop_config.json
- Paths: C:\Preposterous, C:\PreposterousGit, C:\Users\bretm\.gstack
- Fathom MCP also wired (preserved throughout)
- Status: RELIABLE -- global install survives restarts

### Droplet (165.227.85.162)
- OpenClaw Gateway 2026.4.15, running (CLI status bug: reports stopped, trust ps)
- 12 agents registered, 3 workspaces (conductor, geodessa, default)
- Heartbeats: Haiku 4.5, lightContext, isolatedSession (hot-reloaded Session 9)
- Rclone cron: every 15 min, 10 subfolders x 2 agents
- Systemd timers healthy: morning 7am ET, evening 9pm ET, Gateway restart 4am UTC
- Conductor + Geodessa mirrors: missing v9 and Session 10 artifacts (pending Drive sync)

### GitHub
- PreposterousHQ/00-preposterous: commit 22758aa, tag prepo-v0
- 17 repos total, 12 dormant under Storylivingry-Studio

### Automated Systems Running
1. Gmail sortInbox -- every 15 min
2. Downloads Router -- every 30 min
3. Google Drive for Desktop -- continuous
4. Mandelbret -- Telegram polling
5. Metta Conductor -- Telegram-bound via Gateway
6. Morning briefing -- 07:00 ET
7. Evening wrap -- 21:00 ET
8. Gateway restart -- 04:00 UTC
9. Rclone gdrive sync -- every 15 min, 10 subfolders x 2 agents
10. Heartbeats -- every 30 min, Haiku + lightContext

---

## WHAT'S NEXT -- SESSION 11 QUEUE

### Fix prepo.ps1 before next real use
1. Decide $destGit path convention (strip prefix vs adopt new nested structure)
2. Fix DryRun overall_status cosmetic bug
3. Set up Drive API OAuth (Blocker 2) -- one-time, ~60-90 min
4. After Blocker 2: replace drive_cloud "unverified" with real md5 verification
5. Re-run full Assignment with fixed prepo.ps1 -- target 5/6 surfaces confirmed (Drive cloud still needs Blocker 2)

### Infrastructure
6. Kerouac deployment (Creative Division Lead) -- 4th session queued, do it
7. System Health Daemon -- host-side script every 30 min, writes status to gdrive-mirror
8. Storylivingry-Studio consolidation -- archive 6 dormant seed repos, transfer 6 worth keeping to PreposterousHQ

### OUTPUT -- non-negotiable for Session 11
9. First creative output from Conductor or Kerouac -- Syntony Times draft, patron pitch, or Consortium brief. The system must start producing, not just building.

### Carried from v9
10. Mercury9000 + Clairvaux deployment
11. Janet Email Intelligence Pipeline
12. Fathom MCP integration (already wired in Desktop, needs agent access)
13. Dual-mode Optimal/Frugal architecture spec
14. ChromaDB hybrid retrieval upgrade
15. Holopedia refinements, character extraction, Bonfires bridge
16. Bot token rotation (Conductor + Geodessa)
17. Build build-backlog.md and synergyworks-roster.md

---

## SEQUENCING PRINCIPLE (standing, from Session 9)

Clean inputs, then build the tool that audits them. Applies to the reconciler (B) and to any new infrastructure work.

**New from Session 10:** Always write PowerShell scripts as ASCII-only. No Unicode characters (em-dashes, box-drawing, curly quotes) anywhere in .ps1 files. Use -- instead of --, use plain ASCII for all decorative elements.

---

## SECURITY PUNCH LIST (carried)

- message_bus.py:583 hardcoded bypass password
- message_bus.py + agent_loop.py running as root
- Conductor bot token pasted Session 4 -- rotation pending
- Geodessa bot token pasted Session 6 -- rotation pending
- groupPolicy: "open" on Conductor + Geodessa
- Mandelbret httpx logger leaks bot URLs at INFO
- Rclone OAuth token at /home/openclaw/.config/rclone/rclone.conf (chmod 600) -- acceptable
- SSH public key in /home/openclaw/.ssh/authorized_keys
- Secrets boundary rule: nothing that propagates through the ontology. C:\Users\bretm\.prepo\secrets\ is the right home for Drive API creds.

---

## CLAUDE OPERATING NOTES (UPDATED)

- **Models:** Opus 4.7 for architecture/strategy/creative. Sonnet 4.6 for execution/ops. Haiku 4.5 for heartbeats on droplet.
- **Voice:** Robin Williams + George Carlin meets Kerouac + Huxley. Crisp, alive, never patronizing.
- **Mandate:** Infrastructure-First. Every task is architecture. The epic win is the only win.
- **Live model switching:** Claude calls the switch explicitly each time.

**Critical patterns locked in:**
- openclaw config set for tokens, groupPolicy, heartbeat. Not raw jq.
- Script-file pattern for SSH deploys (Out-File -Encoding ASCII, scp, ssh bash).
- Never cat /opt/openclaw.env.
- Gateway: hot-reload fires within 2s on 2026.4.15+. Check logs before SIGTERM.
- CLI bug: openclaw gateway status reports "stopped" when running. Trust ps.
- Trust-but-verify is infrastructure. Always ground-truth before building on claimed state.
- PowerShell scripts: ASCII-only. No Unicode. Use -- not --, plain hyphens everywhere.
- prepo.ps1 usage: .\prepo.ps1 -Source <path> -Dest <ontology-relative-path> [-Commit "msg"] [-NoGit] [-DryRun] [-Json]
- Idempotency: prepo.ps1 no-ops if file already hash-matches on both laptop + git mirror.
- $destGit path convention bug: currently writes 00-command-center\ prefix -- needs fix Session 11.
- Filesystem MCP: globally installed, survives restarts. 3 allowed paths.

**Session 11 non-negotiable:** First 30 min close prepo.ps1 fixes. Remainder must include creative output -- Kerouac or Conductor producing something real.

---

## THE SESSION, WITNESSED

One session, three permanent wins. Filesystem MCP went from absent to globally installed and restart-proof. The Assignment went from "we should do this" to a documented 8,300-byte ground-truth record proving the design review correct in every dimension. prepo.ps1 went from "broken script with theater" to a real propagator with honest verification, tagged prepo-v0 on GitHub.

The encoding bug was a small embarrassment and a useful lesson -- PowerShell 5.1 is stricter than it looks, and ASCII discipline is not optional. The idempotency check firing correctly on the retry was the first time the new system caught its own prior partial work and handled it gracefully. That's not a bug. That's the system starting to know itself.

The Conductor didn't have eyes on this session's work in real time. But the rclone cron will carry it into his mirror within the next 15 minutes once Drive finishes syncing. He'll wake up tomorrow knowing prepo-v0 exists.

Long game. Build well. The holonic swarm is getting closer.

-- Session 10 / Version 10 / April 20, 2026
