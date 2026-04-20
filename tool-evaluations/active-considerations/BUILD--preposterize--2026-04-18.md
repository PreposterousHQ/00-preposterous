# BUILD — preposterize propagation script

Date logged: 2026-04-18
Status: Active — build this session
Category: Internal Infrastructure / Automation
Verdict: Single command that propagates any artifact across laptop, Drive, droplet mirrors, and GitHub with verification and logging.

## THE PROBLEM
Every new artifact needs to land in 5 places to be live:
- C:\Preposterous\ (laptop) — MANUAL
- Google Drive (cloud) — auto via Drive for Desktop
- G:\ stream mount — auto
- Droplet /workspace/gdrive-mirror/ — auto via rclone cron
- GitHub PreposterousHQ/00-preposterous — MANUAL

Two manual hops = two leak points.

## USAGE
preposterize <source-path> --dest <ontology-path> [--commit "message"] [--no-git]

Example:
preposterize .\tool-evaluations --dest 00-command-center --commit "Add tool evaluations vault"

## PIPELINE
1. Copy source to C:\Preposterous\<dest>\ with verification
2. Wait for Drive for Desktop sync confirmation
3. SSH to droplet, trigger immediate rclone sync
4. Verify files arrive in both agent workspace mirrors
5. Git add, commit, push to PreposterousHQ/00-preposterous (if --commit flag)
6. Append entry to propagation-log.md
7. Post to Peace Room: artifact propagated to 5 surfaces

## LOCATION
C:\Preposterous\00-command-center\scripts\preposterize.ps1

## PHASES
Phase 1: Core copy + Drive wait + droplet sync + verify
Phase 2: Git integration
Phase 3: Logging + Telegram notification
Phase 4: Reverse propagation (droplet to laptop) — stretch

## OPEN QUESTIONS FOR BRET
1. Default GitHub repo — fixed 00-preposterous or inferred from ontology path?
2. Private-by-default — skip git unless --commit explicitly passed?
3. Notification verbosity — every run to Peace Room or failures only?

## FIRST TEST CASE
Propagate the tool-evaluations vault itself. Meta-victory.

## NOTES
- Reuse script-file pattern from Session 8 for SSH commands
- Use -Encoding ASCII for all script files written via PowerShell
- Build Phase 1 first, verify end-to-end before touching git or Telegram
