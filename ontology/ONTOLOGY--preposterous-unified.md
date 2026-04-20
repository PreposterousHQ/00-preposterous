# THE PREPOSTEROUS ONTOLOGY
## Unified Information Architecture for the BRET Ecosystem

**Created:** April 11, 2026
**Status:** CANONICAL — This is the governing document for all file organization across every platform.
**Applies to:** Google Drive, GitHub, laptop local storage, Notion (future), Dropbox backup (future)

---

## THE RULE

**One ontology. Every platform. No exceptions.**

The folder structure defined here is the single source of truth. Google Drive mirrors it. GitHub mirrors it (for code/public content). The laptop mirrors it. Notion will mirror it. Dropbox will mirror it as backup. If a file doesn't have a home in this structure, the structure is wrong — not the file.

---

## THE ROOT

```
Preposterous/
```

This is the root folder. Everything lives under it. On Google Drive it's a top-level folder. On the laptop it lives at `C:\Preposterous\` (outside of any user profile folder — clean, short, accessible). On GitHub it's the org-level namespace. In Notion it will be the top-level workspace.

---

## TOP-LEVEL STRUCTURE

```
Preposterous/
├── 00-command-center/
├── 01-mental-wealth/
├── 02-storylivingry-studio/
├── 03-esp/
├── 04-realization-labs/
├── 05-operations/
├── 06-archive/
└── 07-media-assets/
```

### Why numbers?
Numbers enforce sort order across every platform. `00` always appears first. The pillars (01-04) stay together. Operations, archive, and media always appear at the bottom. This works in Drive, Finder, Explorer, terminal `ls`, and Notion sidebar — everywhere.

---

## DETAILED STRUCTURE

### 00-command-center/
The brain of the system. Mandates, playbooks, diagnostics, configs, and system documentation.

```
00-command-center/
├── mandates/                    ← Operating principles (Infrastructure-First, etc.)
├── playbooks/                   ← Sequenced execution plans (Bootstrap, Migration, etc.)
├── diagnostics/                 ← Machine/system reports from ClawBot Zero
├── clawbot-configs/             ← Bot definitions, soul files, deployment configs
├── ontology/                    ← THIS document and any ontology updates
└── templates/                   ← Reusable templates for docs, decks, emails
```

### 01-mental-wealth/
Pillar 1: Mental Health Reformation. Everything related to MWI LLC, the Consortium, One Mind Show, DePsy, SLaaS, and Bonfire AI.

```
01-mental-wealth/
├── mwi-llc/                     ← Corporate docs, formation, agreements
├── consortium/                  ← Mental Health Reformation Consortium materials
├── one-mind-show/               ← Theatrical production — scripts, decks, venue research
├── depsy/                       ← Decentralized mental health network
├── slaas/                       ← StoryLiving-as-a-Service platform
├── bonfire-ai/                  ← Knowledge graph engine
├── research/                    ← Academic papers, references, clinical frameworks
├── personal-story/              ← Bret's lived experience writing, memoir material
└── fundraising/                 ← Seed deck, investor materials, $350K raise docs
```

### 02-storylivingry-studio/
Pillar 2: The transmedium production company. Storylivingry Studios, Syntony Times, Fractal Impact Entertainment.

```
02-storylivingry-studio/
├── studio/                      ← Studio operations, partnerships, general studio docs
├── syntony-times/               ← Media arm, Substack, articles, dispatches
├── fractal-impact/              ← Fractal Impact Entertainment entity
├── film-trilogy/                ← Mistaken for Madness, Calling God, Unbreakable Spirit
│   ├── mistaken-for-madness/
│   ├── calling-god/
│   └── unbreakable-spirit/
├── brand-architecture/          ← Brand manual, visual identity, synergypunk aesthetic
├── noosphere/                   ← Agent architecture docs, message bus specs
├── synapps/                     ← SynApp designs, frontend code, UI specs
└── mvparty/                     ← MVParty events — footage, planning, recaps
```

### 03-esp/
Pillar 3: Evolutionary & Spiritual Philanthropy. Broader than just the fund — encompasses the full philosophy.

```
03-esp/
├── esp-fund/                    ← Fund structure, legal, espfund.io
├── cohearts/                    ← 155 Cohearts model, participant materials
├── roi-framework/               ← R*OI methodology, documentation
├── evolutionary-philanthropy/   ← Philosophy, writing, framework docs
└── patron-relations/            ← UHNW outreach, aligned investor materials
```

### 04-realization-labs/
Pillar 4: Current role building the spiritual social media platform.

```
04-realization-labs/
├── realize/                     ← Platform docs, feature specs, meeting notes
├── synergy-strategy/            ← Self-organization, team dynamics
└── cowork/                      ← Cowork session docs, shared materials
```

### 05-operations/
Cross-pillar operational infrastructure. Business plans, legal, finances, outreach — the stuff that serves all pillars.

```
05-operations/
├── finances/                    ← Budgets, accounting, tax docs
├── legal/                       ← Contracts, agreements, entity formation
├── branding/                    ← Cross-pillar brand strategy, style guides
├── outreach/                    ← Email campaigns, patron outreach, speaking
├── contacts/                    ← Contact lists, CRM data, relationship maps
├── partnerships/                ← Partnership proposals, MOUs, joint ventures
├── cv-and-bio/                  ← Bret's CV, bios, headshots, speaker materials
├── decks/                       ← General pitch decks not specific to one pillar
└── biz-plans/                   ← Business plans, financial models
```

### 06-archive/
Completed, historical, or imported content. Not dead — accessible for reference. The rule: if you haven't touched it in 6 months and it's not part of an active project, it lives here.

```
06-archive/
├── chatgpt-export/              ← Exported ChatGPT conversation history
├── substack-archive/            ← Exported Substack posts and analytics
├── telegram-export/             ← Telegram conversation exports
├── legacy-docs/                 ← Old documents that don't fit current pillars
├── _triage/                     ← Files that need manual review before sorting
└── fullofit-industries-legacy/  ← Historical FULLOFIT INDUSTRIES content
```

### 07-media-assets/
All media files — images, video, audio, brand assets. Organized by type, not by project. Projects reference media from here; they don't store their own copies.

```
07-media-assets/
├── logos/                       ← All logo files (SX_Logo, mandala, etc.)
├── brand-assets/                ← Banners, hero images, design elements
├── photos/                      ← Photos organized by date or event
├── video/                       ← Video files organized by project/event
│   ├── mvparty/
│   ├── storyliving-recordings/
│   ├── personal/
│   └── raw-footage/
├── audio/                       ← Audio recordings, podcast files, voice notes
├── screenshots/                 ← Screen captures
└── design-files/                ← Source files (Figma exports, PSD, etc.)
```

---

## NAMING CONVENTIONS

### Folders
- **Always kebab-case** (lowercase, hyphens): `one-mind-show`, `brand-architecture`
- **Never spaces, never underscores, never camelCase**
- **Numbered prefixes** on top-level folders only (00-07)

### Files
- **Descriptive kebab-case**: `consortium-statement-of-intention.md`
- **Date suffix when relevant**: `laptop-diagnostic-2026-04-11.md`
- **Mandate/playbook prefix**: `MANDATE--infrastructure-first.md`, `PLAYBOOK--bootstrap.md`
- **Version suffix**: `-v02`, `-v03` (never "final", "new", "copy", "updated")
- **No spaces. Ever.** Spaces break command-line tools, scripts, URLs, and git.

### What to do with existing files that violate conventions
ClawBot Zero renames them during migration. A log is kept showing old name → new name so nothing gets lost.

---

## PLATFORM-SPECIFIC RULES

### Google Drive
- `Preposterous/` is a top-level folder in My Drive
- Google Docs/Sheets/Slides live here natively
- Large media files (video, audio) go in `07-media-assets/` — don't scatter .mp4 files across project folders
- The old Mandelbret Storylivingry Studio folder gets decomposed into the proper locations and then deleted

### GitHub
- GitHub org: `Storylivingry-Studio` (existing) — consider renaming to `Preposterous` or creating a parent org
- Only code, configs, web content, and public documents go to GitHub
- Private docs, media assets, and personal files stay in Drive only
- Same folder naming conventions apply to repos and directories within repos
- Repos map to logical units: `storylivingry-frontend`, `message-bus`, `clawbot-configs`

### Laptop (C: drive)
- `C:\Preposterous\` is the local root — NOT inside `C:\Users\bretm\`
- This folder is synced via Google Drive for Desktop (streamed, not mirrored, to save disk space)
- Git repos live at `C:\Preposterous\02-storylivingry-studio\` or wherever their project home is — NOT inside OneDrive
- Downloads stay at `C:\Users\bretm\Downloads\` as a temporary landing zone — files get sorted into Preposterous or deleted
- Desktop, Documents, Pictures get unlinked from OneDrive and returned to local defaults (they become lightweight — real files live in Preposterous)

### Notion (future)
- Top-level workspace: Preposterous
- Same 00-07 structure as sidebar sections
- Notion databases for: contacts/CRM, project 