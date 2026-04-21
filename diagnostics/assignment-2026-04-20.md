# Assignment Findings — preposterize Surface Verification
**Date:** 2026-04-20
**Artifact tested:** CURRENT-STATE--bret-command-center--v9--2026-04-20.md
**Invoked by:** Bret + Claude, Session 10
**Design doc ref:** C:\Users\bretm\.gstack\projects\bretm\bretm-preposterize-design-20260419-230802.md

---

## Hashes (source of truth)

| Algorithm | Hash |
|-----------|------|
| SHA256 | B4E34BA264AD5651757512949888B31BF91E7466C4CA73AA2099CF98EDE700E5 |
| MD5 | 6A13BFDE27A25F755D088416DE2E89BF |

---

## Surface-by-Surface Results

| # | Surface | Path | Status | Hash match | Notes |
|---|---------|------|--------|-----------|-------|
| 1 | Laptop FS | C:\Preposterous\00-command-center\diagnostics\v9.md | ✅ PASS | YES | File intact, 29,723 bytes |
| 2 | Drive cloud | Drive root /Preposterous/00-command-center/diagnostics/ | ⚠️ UNKNOWN | NOT VERIFIED | Pre-A Blocker 2 — Drive API OAuth not set up. Cannot verify cloud state without download or API. |
| 3 | G: stream mount | G:\Other computers\My Laptop (1)\Preposterous\... | ❌ FAIL | NO OUTPUT | Get-FileHash returned empty — DfD stream mount had not yet propagated v9 at verification time. Active upload queue (14 chunks in .tmp.driveupload) was still running. |
| 4 | Droplet Conductor | /home/openclaw/.openclaw/workspace-conductor/gdrive-mirror/...v9.md | ❌ FAIL | NO SUCH FILE | rclone fired (Phase 3 sentinel passed) but v9 was not yet in Drive cloud, so rclone synced nothing new. |
| 5 | Droplet Geodessa | /home/openclaw/.openclaw/workspace-geodessa/gdrive-mirror/...v9.md | ❌ FAIL | NO SUCH FILE | Same as Conductor — same root cause. |
| 6 | GitHub | PreposterousHQ/00-preposterous:diagnostics/v9.md | ❌ FAIL | NOT PRESENT | File confirmed absent from C:\PreposterousGit\00-preposterous\diagnostics\ — Pre-A Blocker 1 confirmed live. |

**Score: 1 of 6 surfaces confirmed. 3 confirmed failed. 2 unknown/unverified.**

---

## Script Output vs Reality

preposterize.ps1 printed: **"DONE. Artifact propagated."**

Actual state at completion: 1 confirmed surface, 3 confirmed failures, 2 unknowns.

The script's terminal output is a lie — not malicious, but structurally incapable of telling the truth.

---

## Root Cause Analysis

### Cascade failure — the Phase 2 → 3 → 4 → 5 chain

The upload queue (`.tmp.driveupload`, 14 active chunks) was running at invocation time. Phase 2 slept 30 seconds. 30 seconds is not long enough when DfD has an active upload queue. v9 was not yet in Drive cloud when Phase 3 fired.

Phase 3 rclone syncs FROM `gdrive:Preposterous/00-command-center` TO the droplet workspace mirrors. Because v9 was not yet in Drive cloud, rclone correctly synced nothing new. Surfaces 4 and 5 failed *because* Surface 2 failed. The cascade:

```
Phase 2 sleep insufficient
  → Drive cloud missing v9
    → rclone finds nothing to sync
      → Conductor mirror missing v9 [Surface 4 FAIL]
      → Geodessa mirror missing v9 [Surface 5 FAIL]
```

Surface 3 (G: mount) failed for the same root cause — DfD hadn't yet streamed v9 to the G: stream cache.

### Pre-A Blocker 1 — confirmed live (Surface 6)

Phase 1 copies to `C:\Preposterous\<dest>`. Phase 4 runs `git add -A` on `C:\PreposterousGit\00-preposterous`. These two paths are never connected inside preposterize.ps1. No code writes to `C:\PreposterousGit\` anywhere in the script.

Git output: `nothing to commit, working tree clean` + `Everything up-to-date`.
Script output: `Pushed to PreposterousHQ/00-preposterous`.

Nothing was pushed. The working tree was clean because v9 was never written there.

### Pre-A Blocker 1 — fill mechanism documented

The `C:\PreposterousGit\00-preposterous` repo is filled by **manual copy + commit**, not by any automatic mechanism. The Session 9 big commit (88e1cd6, 46,191 insertions) was a hand-run `Copy-Item` from `C:\Preposterous\00-command-center\` into `C:\PreposterousGit\00-preposterous\`, followed by `git add -A && git commit && git push`. This was a one-time human action, not an automated pipeline. The repo has since been updated only with explicit human-directed commits (e.g., the playbook commit 97a8390).

**There is no automatic fill mechanism.** The git mirror is a manually maintained snapshot. It is not a mirror in any automated sense — it is a periodic manual backup that happens to be current when someone remembers to update it.

**Implication for Blocker 1(b) design decision:** Default to direct-write per the design doc. preposterize A should write to both `C:\Preposterous\<dest>` AND `C:\PreposterousGit\00-preposterous\<dest>` in Phase 1, then stage only that specific path via `git add -- "<dest>"`. No broader `git add -A`.

### Bug 4 — no $ErrorActionPreference='Stop' confirmed live

Phase 1 threw a real IOException (self-copy). Execution continued. Script printed "File copied: ..." after the error. Without `$ErrorActionPreference='Stop'`, all failures proceed silently. This is not a theoretical concern — it fired in this run.

### Bug 2 — RCLONE_DONE sentinel confirmed theater

Phase 3 printed "Droplet sync complete." The SSH heredoc unconditionally prints `RCLONE_DONE` as its last line regardless of rclone success or failure. The grep check passed. Surfaces 4 and 5 were empty. The check was theater — it confirmed SSH was alive, not that rclone succeeded.

---

## What Was NOT Tested (gaps to close in A)

- **Drive API md5 comparison** — Pre-A Blocker 2 (OAuth not set up). Surface 2 entirely unverified.
- **Deliberate rclone failure test** — need to verify RCLONE_DONE sentinel correctly fails to detect a real rclone error. Current test only ran clean path (rclone ran fine, just had nothing to sync).
- **Large file behavior** — v9 is 29 KB. 30s sleep behavior under a 200 MB artifact + active upload queue is unknown.
- **Concurrent invocation** — no lock mechanism tested.

---

## Pre-A Blockers — Status

### Blocker 1 — C:\PreposterousGit fill mechanism
- **(a) Investigate:** ✅ RESOLVED. Fill mechanism is manual-only. No automation exists. Documented above.
- **(b) Decide:** ✅ RESOLVED. Direct-write to both paths in Phase 1. Narrow git add to specific path.

### Blocker 2 — Drive API OAuth
- ⚠️ STILL OPEN. Surface 2 unverifiable without it. One-time setup: create OAuth client, store at C:\Users\bretm\.prepo\secrets\drive-api.json (outside sync boundary).

---

## Punch List for A (confirmed from live run)

1. Add `$ErrorActionPreference='Stop'` at top of script
2. Add `try/catch` around all phases
3. Fix Phase 2: replace `Start-Sleep -Seconds 30` with Drive API poll loop (compare md5Checksum against local MD5 until match or timeout 120s) — requires Blocker 2 resolved
4. Fix Phase 3: replace RCLONE_DONE grep with actual rclone exit code check (`$LASTEXITCODE`)
5. Fix Phase 1: write to both `C:\Preposterous\<dest>` AND `C:\PreposterousGit\00-preposterous\<dest>`
6. Fix Phase 4: replace `git add -A` with `git add -- "<dest>/<filename>"`
7. Add `-DryRun` switch
8. Add JSON output mode (`--json`, schema v0 per design doc)
9. Add concurrency lock (`.prepo.lock` with PID + timestamp + stale reclaim)
10. Add artifact scope rules (50 MB ceiling, exclude patterns, symlink refusal)

---

## Sequencing Recommendation

1. Resolve Blocker 2 (Drive API OAuth) — one-time setup, unblocks real Drive verification
2. Build preposterize A incorporating all 10 punch-list items
3. Re-run Assignment with A — expect all 6 surfaces to pass or surface new failure classes
4. Tag `prepo-v0` on first clean 6/6 run

---

## What the Assignment Proved

The design doc's adversarial premise was correct in every dimension:

- "30s sleep = hope" — confirmed. 3 surfaces downstream failed because of it.
- "RCLONE_DONE sentinel = theater" — confirmed. Passed while 2 surfaces were empty.
- "git add -A stages unknown drift" — confirmed. Staged nothing because nothing was ever written to PreposterousGit.
- "No exit-code checks" — confirmed. IOException thrown and swallowed.
- "Script says DONE; system is not done" — confirmed. 1 of 6 surfaces actual.

The script is not a propagator. It is a 30-second sleep with decorative output.

The design doc is a promise. This document is the first interest payment.

---

*Assignment complete. Session 10, April 20, 2026.*
