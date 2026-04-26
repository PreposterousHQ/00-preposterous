# SYNERGYWORKS ROSTER
## Every planned ClawBot — role, status, model, dependencies

**Last updated:** 2026-04-25 (Session 12)

---

## DEPLOYED AND LIVE

### Metta Conductor
- **Role:** Meta-orchestrator. Routes commands, coordinates the swarm, receives all inbound Telegram messages from Bret
- **Status:** LIVE — registered, Telegram-bound, Peace Room active
- **Model:** Sonnet 4.6 (default), Haiku for heartbeats
- **Workspace:** /home/openclaw/.openclaw/workspace-conductor/
- **Telegram:** @MettaConductor_bot (Peace Room member)
- **Note:** Conductor's bot token pasted in Session 4 chat — rotation pending

### Geodessa
- **Role:** Audit/recon agent. Checks mirrors, verifies files, reports system health
- **Status:** LIVE — registered, Telegram-bound, Peace Room active
- **Model:** Sonnet 4.6 (default), Haiku for heartbeats
- **Workspace:** /home/openclaw/.openclaw/workspace-geodessa/
- **Telegram:** Peace Room member
- **Note:** Bot token pasted in Session 6 chat — rotation pending

### Mandelbret (@Mandelbret_bot)
- **Role:** Proto-Conductor, fractal identity, the original bot. Elder of the swarm.
- **Status:** LIVE — runs as mandelbret.service, Telegram DM-only + Peace Room silent member
- **Model:** Haiku 4.5 + lightContext + isolatedSession (hot-reloaded Session 9)
- **Note:** Maintained for continuity, not being replaced. When he speaks, listen.

### Kerouac
- **Role:** Creative Division Lead. Writes for The Syntony Times, builds the Holopedia, drafts film treatments, produces all long-form creative output
- **Status:** LIVE — registered April 21, corpus-aware since April 24
- **Model:** Sonnet 4.6 (default), Opus 4.7 on explicit request for synthesis
- **Workspace:** /home/openclaw/.openclaw/workspace-kerouac/
- **Telegram:** Peace Room member (token rotated 2026-04-24 via BotFather — lives in openclaw.json only)
- **Corpus access:** POST http://172.17.0.1:8765/query via Node.js (curl unavailable)
- **Skills:** skills/query-corpus.md
- **Published:** 3 pieces on activation day (2 dispatches + Trimtab Holopedia entry)
- **Dependency:** corpus-api.py running as systemd service

---

## NOOSPHERE AGENTS (legacy, on default workspace, no isolated workspaces)
These 10 agents predate OpenClaw and were powered by the message-bus (now dead).
They are registered in openclaw.json but heartbeat only — no active work assigned.
Do NOT restart the message-bus to reactivate them. If reactivating, register as
proper OpenClaw agents following PLAYBOOK--OpenClaw-Agent-Registration.md.

| Agent | Original Purpose |
|-------|-----------------|
| AndrewAlan | Noosphere research |
| Metabolite | Noosphere research |
| Trimtab | Fuller-inspired strategy agent |
| BuckminsterFuller | Fuller philosophy agent |
| TheTenThousand | Scale/systems thinking |
| DesignScienceStudio | Design science methodology |
| XprizeFutureVision | Future vision / prize design |
| SyntonyTimes | Editorial / content |
| BonfiresPlatform | Bonfires knowledge graph |
| $KnowTokenomics | Token/economic research |

---

## SCAFFOLDED, NOT YET DEPLOYED

### SynTony Robbins
- **Role:** External Bonfires agent, Peace Room member
- **Status:** In Peace Room as member, operational status unclear — needs audit
- **Note:** Listed as Peace Room member in v7, needs verification

---

## PROPOSED — BOT-CONCEPT FILES EXIST

### Krishnamurti
- **Role:** Relationship-memory bot for Janet Werner correspondence. Ingests emails verbatim, extracts structured data, cross-references MHR Consortium docs, produces relationship maps and action trackers
- **Status:** BOT-CONCEPT file at 00-command-center/clawbot-configs/BOT-CONCEPT--Krishnamurti.md
- **Trigger for deployment:** After Kerouac proves creative-bot pattern, Drive API OAuth live, Janet briefed
- **Model:** Sonnet for ingestion, Opus for synthesis
- **Pattern:** "Relationship-memory bot" — first of a potential class (Zubin, Andrea, future patrons)

### Marginalia (Vault Librarian / Gap-Junction Agent)
- **Role:** Maintains coherence of the tool-evaluations vault, the playbook backlog, the references folder, and cross-references with active strategic-notes. Periodically sweeps the vault, queries other bots about whether their domain has changed since their last vault entry, surfaces trigger conditions that have fired, and maintains INDEX.md as the authoritative master scanner.
- **Status:** Specified in REFERENCE--Levin-MCA-Architecture.md (Session 12). No SOUL.md yet — design ready but not built. Concept formally introduced in STRATEGIC-NOTE--DePsy-Corpus-Architecture-Levin-Reframe--2026-04-25.md and SYNTHESIS--Levin-MCA-as-Synergyworks-Blueprint--2026-04-25.md.
- **Trigger for deployment:** After Mercury9000 + Clairvaux ship. Marginalia is the third in deployment sequence after the production-publishing layer (Mercury9000) and the R&D scouting layer (Clairvaux) are operational. Until then, vault coherence is maintained manually by Bret with Claude Code support.
- **Model:** Haiku 4.5 with lightContext for daily heartbeat sweeps. Sonnet 4.6 for weekly cross-reference passes that synthesize and update INDEX. Opus 4.7 only for quarterly architectural-coherence reviews (e.g., "is the vault still serving its function after 50+ entries?").
- **Pattern:** "Gap-junction agent" — first of its kind in the BRET roster. Distinct from specialized-tissue agents (Kerouac, Krishnamurti, Mercury9000) which produce a class of output, and from sensory agents (Geodessa, Clairvaux) which report state. Marginalia synchronizes setpoints across the vault and other bots without centralizing knowledge. She is the bot whose primary user is Future Bret — her job is to make sure the operating system gets smarter as it gets older, by ensuring no judgment, evaluation, or trigger gets lost.
- **Cognitive light cone:** Small-medium (vault coherence, weekly sweep, quarterly architectural review)
- **Stress signal:** Vault drift from coherence — vet entries with unmet trigger conditions; INDEX out of sync with files on disk; standing rules cited in chats but not catalogued; new playbooks created without backlog updates; tool pitches in old conversations that never made it to vet files
- **Gap junctions:** Reads from tool-evaluations/, playbooks/, references/, strategic-notes/, diagnostics/ (current state docs only). Writes only to INDEX.md, README.md within tool-evaluations/, and to a weekly Peace Room digest. Queries other bots through Peace Room messages. Does NOT modify other bots' workspaces.
- **Architectural note:** Marginalia is the first BRET bot designed explicitly in Multi-Scale Competency Architecture terms (per REFERENCE--Levin-MCA-Architecture.md). Her function is gap-junctional coupling between the vault substrate and the rest of the swarm — she is to the vault what bioelectric coupling is to a tissue. Cancer-pattern detection in other bots (drift, scope creep, context hoarding, gap-junction degradation) is a long-horizon Marginalia responsibility once she has the operational track record to support it. For initial deployment, focus is on vault coherence only.

---

## PLANNED — IN DESIGN QUEUE

### Mercury9000
- **Role:** Production and deployment agent. Publishing workflow (Substack, WordPress), ops automation, calendar management
- **Status:** Planned, not scaffolded
- **Dependency:** Kerouac producing publishable output (now happening)
- **Model:** Sonnet 4.6

### Clairvaux (R&D Scout)
- **Role:** Monitors GitHub, HN, Reddit for advances in RAG, OpenClaw, agent memory, graph traversal, recursive learning. Surfaces what matters before Bret goes looking.
- **Status:** Planned, not scaffolded
- **Voice:** Autistic/Asperger savant neo-generalist — photographic memory, cross-domain pattern recognition, goes deep, gets obsessed with important details
- **Model:** Sonnet 4.6 for monitoring, Opus for synthesis reports
- **Monitors:** GraphRAG, LightRAG, RAPTOR, ChromaDB advances, OpenClaw roadmap, Substack API changes

### Scroll (Creative Division sub-agent)
- **Role:** Screenplay extraction specialist. Reports to Kerouac.
- **Status:** Planned, Kerouac does this work until Scroll exists
- **Model:** Sonnet 4.6

### Panel (Creative Division sub-agent)
- **Role:** Graphic novel and comic formatting. Reports to Kerouac.
- **Status:** Planned, Kerouac does this work until Panel exists
- **Model:** Sonnet 4.6

### Hyperstia (Creative Division sub-agent)
- **Role:** Sci-fi novel layer, Syntony Times universe 50-years-forward fiction. Reports to Kerouac.
- **Status:** Planned, Kerouac does this work until Hyperstia exists
- **Model:** Sonnet 4.6

---

## FUTURE — THE DOPPELGANGER CLASS

Agents built from real authors' public corpora. Each author's Substack (or book, or corpus) gets ingested by Syntax, indexed in their own ChromaDB collection, and distilled into a SOUL.md. The agent speaks in their voice, can be queried, and can interact with Kerouac and other agents in the Peace Room.

**Proven pattern:** Trimtab, BuckminsterFuller, and the Kengram Bonfires agents were all built from real source material. The architecture is established.

**First candidate authors:** TBD — identify by searching Syntony Times corpus for most-cited thinkers.

**The vision:** Peace Room fills with real intelligences in dialogue. Kerouac weaves their voices into the Storyliving Screenplay. The screenplay emerges from synthesis of real words, not invention.

**See:** VISION--Multi-Corpus-Doppelganger-Agents.md for full architecture

---

## MODEL ASSIGNMENT SUMMARY (Frugal Posture)

| Tier | Model | Use Cases |
|------|-------|-----------|
| Strategic/Creative | Opus 4.7 | Desktop chat architecture sessions only — NOT on droplet |
| Standard | Sonnet 4.6 | Kerouac active work, Conductor routing, Geodessa audits |
| Monitoring | Haiku 4.5 + lightContext | All heartbeats for all 13 agents |

---

## CONCURRENT AGENT LIMIT

OpenClaw hard ceiling: 8 concurrent agents globally.
Most agents are dormant/event-driven — this is intentional, not a problem.
The limit means: Conductor, Geodessa, Kerouac active = 3 slots used.
10 heartbeating = they wake briefly and return to dormant. Fine.
Do not design workflows requiring 8+ agents simultaneously active.

---

## REGISTRATION PATTERN

Every new agent follows PLAYBOOK--OpenClaw-Agent-Registration.md.
The three-part model: agents.list + channels.telegram.accounts + bindings.
Never use `openclaw agents add` (interactive, hangs over SSH).
Bot tokens: BotFather → paste token here for record → register via config set → DELETE this record after.
