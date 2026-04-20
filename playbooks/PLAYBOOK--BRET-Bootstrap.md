# THE BRET BOOTSTRAP PLAYBOOK
## From Chaos to Command Center

**Created: April 11, 2026**
**Status: ACTIVE — Phase 1 ready to execute**

---

## THE BOOTSTRAP PARADOX (and how we solve it)

You need ClawBots to build the system. You need the system to deploy ClawBots. You need the Drive architecture to store the plans. You need the plans to design the architecture. Everything needs everything else first.

**The solution: ClawBot Zero.**

Claude Code running on your local Windows machine is not a shortcut — it's the permanent foreman. It sees your filesystem. It runs PowerShell. It builds other bots. It's the first employee you hire, and it never leaves.

---

## PHASE 1 — ACTIVATE CLAWBOT ZERO

**Goal:** Get Claude Code running natively on your Windows laptop so it can see and act on your entire local environment.

### Prerequisites (you may already have these)
- [x] Windows 11 ✓
- [x] Claude Max plan ✓
- [ ] Git for Windows installed (Claude Code needs Git Bash internally)
- [ ] Claude Code native installer run

### Step 1: Install Git for Windows (if not already installed)
1. Go to https://git-scm.com/download/win
2. Download and run the installer
3. **Keep all default settings** — the critical one is "Add Git to PATH" which is checked by default
4. Finish install

### Step 2: Install Claude Code (native installer — recommended by Anthropic)
1. Open **PowerShell** (not CMD, not as Administrator)
2. Run this single command:
   ```
   irm https://claude.ai/install.ps1 | iex
   ```
3. Wait for install to complete (~1 minute)
4. **Close and reopen PowerShell** (PATH needs to refresh)
5. Test it works:
   ```
   claude --version
   ```

### Step 3: Authenticate
1. Run `claude` in PowerShell
2. It will open a browser window for authentication
3. Log in with your Claude Max account (bret@bretwarshawsky.com)
4. Accept terms of service
5. You're in

### Step 4: First mission — the Full Diagnostic
Once Claude Code is running, give it this command:

```
claude "You are ClawBot Zero — the permanent local infrastructure agent for the BRET ecosystem. Your first mission is a full diagnostic of this Windows machine. Report:

1. DRIVES: All drives (C:, D:, G:, any others), total size, used space, free space
2. ONEDRIVE: Is OneDrive installed? Running? What folders is it syncing? How much space is it using? Where is it storing files locally?
3. GOOGLE DRIVE: Is Google Drive for Desktop installed? Running? What's its sync status? Where is it mounted?
4. USER FOLDERS: What's in Desktop, Documents, Downloads, Pictures — and are any of these redirected to OneDrive?
5. DUPLICATES: Any obvious duplicate folder structures between OneDrive and local storage?
6. INSTALLED PROGRAMS: Full list of installed software
7. STARTUP PROGRAMS: What's launching on boot?
8. STORAGE HOGS: Top 20 largest files/folders on C: drive
9. GIT: Is Git installed? What version? Any repos cloned locally?
10. NODE/NPM: Installed? Versions?
11. PYTHON: Installed? Version?

Output everything as a structured markdown report. Save it to the Desktop as BRET-LAPTOP-DIAGNOSTIC.md"
```

### What this gives us
A complete ground-truth snapshot of your machine. No guessing. From this report, we design the migration plan, the Drive architecture, and the ClawBot deployment strategy — all based on reality, not assumptions.

---

## PHASE 2 — THE UNIFIED ONTOLOGY

**Goal:** Design the ONE folder/naming system that governs Google Drive, GitHub, and the local laptop identically.

### The Principle
The same file should have the same path logic regardless of where it lives:
- **Google Drive:** `BRET/01-Mental-Wealth/...`
- **GitHub:** `BRET/01-Mental-Wealth/...`
- **Laptop:** `G:\BRET\01-Mental-Wealth\...`

One map. Three territories.

### Design Inputs (what we need before designing)
- [ ] Phase 1 diagnostic (what files actually exist and where)
- [ ] Bret's input on naming preferences and hierarchy
- [ ] Inventory of all file types across the ecosystem
- [ ] Understanding of what goes in Drive vs. GitHub vs. local-only

### Preliminary Structure (to be refined with Bret)

```
BRET/                                    ← The root. Everything is BRET.
├── 00-Command-Center/                   ← Mandates, playbooks, system docs
│   ├── mandates/
│   ├── playbooks/
│   ├── diagnostics/
│   └── clawbot-configs/
├── 01-Mental-Wealth/                    ← Pillar 1
│   ├── MWI-LLC/
│   ├── Consortium/
│   ├── One-Mind-Show/
│   ├── DePsy/
│   ├── SLaaS/
│   └── Bonfire-AI/
├── 02-Storylivingry/                    ← Pillar 2
│   ├── Studio/
│   ├── Syntony-Times/
│   ├── Fractal-Impact/
│   └── Film-Trilogy/
├── 03-ESP-Fund/                         ← Pillar 3
│   └── (minimal until activated)
├── 04-Realization-Labs/                 ← Pillar 4
│   └── Realize/
├── 05-Operations/                       ← Cross-pillar ops
│   ├── finances/
│   ├── legal/
│   ├── branding/
│   └── outreach/
├── 06-Archive/                          ← Old/completed/reference
│   ├── chatgpt-export/
│   ├── substack-archive/
│   └── telegram-export/
└── 07-Media-Assets/                     ← Images, video, audio, brand assets
    ├── logos/
    ├── photos/
    ├── video/
    └── audio/
```

### GitHub Mirror Strategy
Not everything goes to GitHub. The rule:
- **Code, configs, web content, public docs** → GitHub repos
- **Private docs, media assets, personal files** → Drive only
- **Both** use the same naming and path conventions

### Naming Conventions (draft)
- Folders: `kebab-case` (lowercase, hyphens)
- Documents: `descriptive-name-YYYY-MM-DD.ext` when date matters
- Mandates/playbooks: `MANDATE--name.md` or `PLAYBOOK--name.md`
- Versions: append `-v02`, `-v03` (never "final" or "new")
- No spaces in filenames. Ever.

---

## PHASE 3 — THE GREAT MIGRATION

**Goal:** Execute the restructuring — remove OneDrive, organize every file, establish the canonical system.

### Sub-phases
1. **OneDrive Extraction** — Move all OneDrive-synced files to proper local/Drive locations, then unlink and uninstall OneDrive
2. **Deduplication** — ClawBot Zero scans for duplicate files across all drives, presents findings for review
3. **File Identification** — Unknown/unnamed files get analyzed (ClawBot Zero can read documents, identify images, check file metadata) and renamed
4. **The Sort** — Every file moves to its canonical home in the BRET structure
5. **Drive Sync Setup** — Google Drive for Desktop configured to sync the BRET root folder cleanly
6. **Dropbox Backup** — Dropbox configured as automated backup mirror of Google Drive
7. **Laptop Optimization** — Startup programs cleaned, unnecessary software removed, drive formatting optimized for the new workflow

### Safety Protocol
- Nothing gets deleted without Bret's explicit approval
- Every move is logged (ClawBot Zero generates a migration manifest)
- A full backup is made before any destructive operation
- Questionable files go to `06-Archive/_triage/` for manual review

---

## PHASE 4 — THE CLAWBOT TEAM

**Goal:** Deploy specialized bots that maintain and extend the system permanently.

### Planned Bots (post-migration)
- **File Sentinel** — monitors folder structure integrity, flags misplaced files, prevents drift
- **Naming Enforcer** — watches for new files that violate naming conventions, suggests corrections
- **Sync Health Monitor** — checks Google Drive sync status, Dropbox backup health, alerts on issues
- **The Archivist** — processes incoming data exports (ChatGPT, Substack, Telegram) into the BRET structure
- **Content Router** — voice messages from Telegram → transcribed → filed in the right project folder

### How they connect to the existing agent ecosystem
These local ClawBots complement the server-side agents (Andrew Alan, Metabolite, Trimtab, etc.). The server agents handle creative/strategic work through the Noosphere. The local bots handle infrastructure/operations on the laptop and Drive. Eventually they communicate through the message bus — local bots can seed holons, server agents can request file operations.

---

## WHAT SUCCESS LOOKS LIKE

When this playbook is complete:
- Your laptop is clean, fast, and organized by the BRET ontology
- OneDrive is gone — Google Drive is primary, Dropbox is backup
- Every file has a name, a home, and a reason to be there
- The same folder structure exists in Drive, GitHub, and locally
- ClawBot Zero is a permanent tool on your machine
- Specialized bots maintain the system without your intervention
- You can find anything in seconds
- New files automatically flow to the right place
- The system gets smarter the more you use it

---

## CURRENT STATUS

**Phase 1, Step 1: Ready to execute.**

Next action: Bret installs Git for Windows, then runs the Claude Code native installer.

---

## REVISION HISTORY

- **April 11, 2026** — Created. The bootstrap begins.
