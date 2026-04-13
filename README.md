# 00-preposterous

The Preposterous Ontology — system docs, mandates, playbooks, current state.

This is the canonical, version-controlled source of truth for the Preposterous digital command center: how it's organized, why it's organized that way, what's running, what's broken, and what's next.

## What's in here

```
00-preposterous/
├── README.md                                          (this file)
├── diagnostics/
│   └── CURRENT-STATE--bret-command-center.md          ✅ resume-anywhere session log
├── ontology/                                          ⏳ TODO
├── mandates/                                          ⏳ TODO
└── playbooks/                                         ⏳ TODO
```

## Pending docs

Three canonical documents currently live only in the Claude Project files (claude.ai) and Google Drive at `Preposterous/00-command-center/`. They have not yet been retrieved into this repo:

- **`ontology/ONTOLOGY--preposterous-unified.md`** — The 8-pillar Preposterous folder ontology, naming conventions, and routing logic. Source of truth for how every file in the BRET ecosystem is organized.
- **`mandates/MANDATE--Infrastructure-First-Always.md`** — The architectural mandate. Every task is an opportunity to build permanent infrastructure.
- **`playbooks/PLAYBOOK--BRET-Bootstrap.md`** — The 4-phase bootstrap plan for standing up the command center.

These need to be pasted in or fetched from the Claude Project on the next session.

## Resume convention

Start each new session with: **"Resuming — read the current state doc, then pick up where we left off."**

Then the assistant reads `diagnostics/CURRENT-STATE--bret-command-center.md` and continues from the punch list.

## Sibling repos

- **`PreposterousHQ/00-synergyworks`** — The ClawBot workforce. Multi-agent system that operates *on* the ontology this repo describes.
