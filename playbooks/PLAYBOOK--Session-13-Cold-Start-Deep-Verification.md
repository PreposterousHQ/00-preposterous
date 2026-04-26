# PLAYBOOK — Session 13 Cold-Start (Deep Verification Variant)
## A trust-but-verify cold-start that grounds Session 13 in actual state, not just documented state

**Status:** One-time variant for Session 13 opening. Permanent reference for future deep-verification opens.
**Established:** 2026-04-25 (Session 12 close)
**Companion:** PLAYBOOK--Session-Opening-Cold-Start-Prompt.md (the standard variant — shorter, faster, less thorough)

---

## When to use this variant vs the standard cold-start

Use this deep-verification variant when:
- A long stretch of time has passed since the last session
- Major architectural changes happened in the previous session
- Bret wants to verify the documentation system is honest with itself
- Multiple sessions of state docs have accumulated and the chronology needs to be audited
- You suspect drift between documented state and actual state

Use the standard cold-start when:
- Resuming a hot session (same day, continuing work)
- Context is fresh and minimal verification overhead is needed
- The work is bounded and doesn't need full BRET-ecosystem context

---

## THE PROMPT

Copy everything below this line into the new conversation. Paste once, then watch as Claude works through the gates.

═══════════════════════════════════════════════════════════════

I'm Bret Warshawsky. This is the opening of Session 13 of the BRET Digital Command Center work.

I want a deep cold-start that does NOT skim — I want you to ground yourself in the full 12-session arc and ground-truth the actual state of the system before we start any new work. There are seven verification gates. Walk through them in order. Report findings at each gate before proceeding to the next.

If any gate fails or surfaces something unexpected, STOP and report it. We address findings before doing new work. The discipline is the work.

═══════════════════════════════════════════════════════════════
GATE 1 — Read every current state doc in chronological order
═══════════════════════════════════════════════════════════════

Read every CURRENT-STATE doc in `C:\Preposterous\00-command-center\diagnostics\` in chronological order. There should be nine of them, covering Sessions 1 through 12 (some sessions share docs).

Run:
Get-ChildItem "C:\Preposterous\00-command-center\diagnostics\" -Filter "CURRENT-STATE--*.md" | Sort-Object LastWriteTime | Select-Object Name, Length, LastWriteTime | Format-Table -AutoSize

Read each one fully. Build a chronological mental model of what's happened. Note especially:
- Session numbering (sessions 1-12 should appear in sequence; gaps are red flags)
- What got built each session
- What got deferred each session and whether deferred items eventually shipped
- Any contradictions between consecutive state docs (would indicate documentation drift)

Report:
- All state doc filenames in chronological order with byte sizes
- Whether the session sequence is intact (1, 2, 3... 12) with no gaps
- Any contradictions or drift surfaced

═══════════════════════════════════════════════════════════════
GATE 2 — Read project knowledge files
═══════════════════════════════════════════════════════════════

Read in this order:
1. PROJECT INSTRUCTIONS — BRET DIGITAL COMMAND CENTER (project knowledge)
2. MANDATE--Infrastructure-First-Always.md (project knowledge)
3. CLAUDE'S VOICE (project knowledge)
4. C:\PreposterousGit\00-preposterous\BRET-IDENTITY.md (the AI-portable identity layer)
5. C:\PreposterousGit\00-preposterous\SYNERGYWORKS-ROSTER.md (the AI-portable bot roster)
6. C:\Preposterous\00-command-center\references\REFERENCE--Levin-MCA-Architecture.md (the architectural substrate, established Session 12)

Report a one-sentence statement of what each document is for.

═══════════════════════════════════════════════════════════════
GATE 3 — Probe Git state
═══════════════════════════════════════════════════════════════

Verify the GitHub repo state matches what v12 says it should be.

Run:
Set-Location "C:\PreposterousGit\00-preposterous"
git status
git log --oneline -10
git remote -v

v12 says HEAD should be at 0f4f905 (the v12 state doc commit) above e4b2f0b (the Session 12 work commit) above 27b070d above da3130f above 0248b6e.

Report:
- Working tree status (should be clean)
- Top of log (should match what v12 claims)
- Whether HEAD has advanced beyond 0f4f905 since Session 12 close (would indicate work happened outside this thread)
- Origin URL (should be PreposterousHQ/00-preposterous)

═══════════════════════════════════════════════════════════════
GATE 4 — Probe Drive sync status
═══════════════════════════════════════════════════════════════

Session 12 deferred Drive sync verification to Session 13. Probe it now.

Run:
# Check Drive for Desktop sync queue (if accessible)
Get-Process -Name "GoogleDriveFS" -ErrorAction SilentlyContinue | Select-Object Name, Id, StartTime
# Verify the seven Session 12 files exist on the laptop side (already confirmed Session 12; re-confirm now)
Get-ChildItem -Recurse "C:\Preposterous\00-command-center\" -Filter "*2026-04-25*" | Select-Object FullName, Length
# Check Drive mount letter
Get-PSDrive G -ErrorAction SilentlyContinue
# If G: is accessible, attempt a listing of the laptop-synced tree on Drive side
Get-ChildItem "G:\Other computers\My Laptop (1)\Preposterous\00-command-center\strategic-notes\" -ErrorAction SilentlyContinue

Report:
- Drive for Desktop process status (running / not running)
- Confirmation all seven Session 12 files exist on laptop
- Whether G: drive is accessible (mount letter from v12)
- Whether the strategic-notes folder (created Session 12) is visible on Drive side
- If Drive sync is incomplete, log as Session 13 finding to address

═══════════════════════════════════════════════════════════════
GATE 5 — Probe droplet state via SSH
═══════════════════════════════════════════════════════════════

v12 says: Gateway 2026.4.15 running, 3 active agents (Conductor, Geodessa, Kerouac), Heartbeat config Haiku 4.5 with lightContext, rclone cron every 15 min over 10 subfolders × 2 agents (peace-room-briefs NOT yet included), corpus-api.py on port 8765 with 3,709 chunks.

Run:
ssh openclaw@165.227.85.162 "ps aux | grep -E 'gateway|corpus-api|mandelbret' | grep -v grep"
ssh openclaw@165.227.85.162 "ls /home/openclaw/.openclaw/workspace*/ -d"
ssh openclaw@165.227.85.162 "cat /etc/cron.d/rclone-gdrive-sync 2>/dev/null || echo 'cron file not at expected path'"
ssh openclaw@165.227.85.162 "tail -3 /tmp/openclaw/openclaw-\$(date +%Y-%m-%d).log 2>/dev/null || tail -3 /tmp/openclaw/*.log | head -10"

Report:
- Gateway PID and uptime
- Active workspace directories (should include workspace-conductor, workspace-geodessa, workspace-kerouac, plus default workspace)
- rclone cron presence
- Most recent Gateway log lines (sanity check that it's healthy)
- Whether anything is divergent from v12 claims

═══════════════════════════════════════════════════════════════
GATE 6 — Probe vault state
═══════════════════════════════════════════════════════════════

Verify the tool-evaluations vault matches what INDEX.md claims.

Run:
Get-ChildItem -Recurse "C:\Preposterous\00-command-center\tool-evaluations\" -File | Select-Object FullName, Length, LastWriteTime | Format-Table -AutoSize

Read C:\Preposterous\00-command-center\tool-evaluations\INDEX.md fully.

Report:
- Total entries on disk vs what INDEX claims (should be 8: 7 vets + 1 build)
- Entries by status folder vs what INDEX claims (Active 3, Shelved 5, Deployed 1, Rejected 0)
- Whether all three standing rules are present in INDEX
- Any entries on disk not catalogued in INDEX (would be drift; logs as Marginalia-relevant finding once she's deployed)
- Any entries in INDEX not present on disk (would indicate documentation lying about reality)

═══════════════════════════════════════════════════════════════
GATE 7 — Synthesize Overall State of Affairs
═══════════════════════════════════════════════════════════════

Now that you have read all twelve sessions of state docs, all six project knowledge files, and probed Git/Drive/droplet/vault for ground truth: write a synthesis.

The synthesis should be roughly 800-1,500 words. It is NOT a rewrite of v12. It is a meta-current-state that integrates the full arc.

Cover at minimum:

1. **Where BRET is right now** — across the 4 pillars + DePsy infrastructure pillar + the meta-Preposterous layer, what's the actual state? What's funded, what's launched, what's stalled, what's about to ship?

2. **The Synergyworks team — who's alive and what they do** — Conductor, Geodessa, Kerouac, Mandelbret, SynTony Robbins (already alive); Mercury9000, Clairvaux, Marginalia, Krishnamurti (proposed/queued); plus the 9 Noosphere agents that exist but aren't actively used.

3. **The architectural moment** — what does it mean that the architecture earned its scientific name (Multi-Scale Competency Architecture, Levin) in Session 12? How does this change the trajectory?

4. **DePsy specifically** — what's the operating logic, what's the corpus protocol, who are the founding co-governor candidates, what's the next concrete step?

5. **What's blocked** — the named blockers (Pre-A Blocker 1, Bonfires AI integration architecture, peace-room-briefs in rclone-sync.sh, Drive sync verification, the May 17 reconciler backstop)

6. **What's about to ship next** — Session 13 priorities synthesized from v12's queue + your own pattern-recognition across the full arc

7. **What you noticed** — patterns in the documentation, drift signals, places where the system is honest with itself, places where you suspect it isn't

Write in BRET's voice as established in CLAUDE'S VOICE and in v9-v12 closing prose: Robin Williams + George Carlin meets Kerouac + Huxley. Crisp, alive, never patronizing. Don't be cautious. Show that you've actually internalized the 12-session arc, not just summarized it.

═══════════════════════════════════════════════════════════════
GATE 8 — Confirm readiness
═══════════════════════════════════════════════════════════════

After the synthesis: Confirm to me, in one short paragraph:
- Whether all gates passed cleanly or any surfaced issues
- Whether you're ready to start Session 13 work
- What you recommend tackling first based on what you read and what you probed

Then wait for my direction.

═══════════════════════════════════════════════════════════════
END OF PROMPT
═══════════════════════════════════════════════════════════════

---

## Notes on this prompt's design

This prompt is longer than the standard cold-start because it does work the standard one doesn't:

1. It reads every state doc, not just the most recent — catches drift between sessions
2. It probes Git/Drive/droplet/vault — catches divergence between documentation and reality
3. It demands a synthesis in voice — proves the context actually loaded vs got skimmed
4. It uses verification gates with explicit "stop if anything surfaces" — turns the cold-start into a quality assurance pass on the documentation system itself

The standard cold-start is fast and assumes documentation is honest. This one verifies. Use this when you need to know the system is actually telling itself the truth.

If gates 1-7 all pass cleanly, the BRET documentation system is in good shape. If any gate fails, that's the most important Session 13 finding regardless of what was queued.

---

— Established Session 12 close / 2026-04-25
— First use: Session 13 opening
— Update if the verification gate sequence needs refinement after first real use
