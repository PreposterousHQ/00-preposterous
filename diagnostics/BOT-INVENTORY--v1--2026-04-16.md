BOT INVENTORY — THE PREPOSTEROUS ECOSYSTEM
Canonical Reference — Every Bot, Every Agent, Every Silo
Version 1.1 — April 16, 2026 (end of Session 7 — corrected)
Location: /Preposterous/00-command-center/diagnostics/BOT-INVENTORY--v1--2026-04-16.md
Purpose: Single source of truth for every automated entity in the BRET ecosystem — human-readable for Bret, Claude sessions, and collaborators; machine-readable-ish for future agents who should know their teammates. Supersedes v1.0 (which had two structural errors about SynTony and the kEngram/Noosphere relationship — corrected below).
Changes from v1.0:

SynTony Robbins is the Bonfires Agent (curator of the Bonfires graph, voice of Storylivingry Studio and Syntony Times) — NOT a kEngram-born agent
The Noosphere agents (Andrew Alan + 9 reports) ARE the kEngram Entity Agents — born from the Bonfires graph via the soul_generator pipeline; Noosphere is the runtime/conversation-space they inhabit
Recategorized from 3 swarms + 2 solos → 2 swarms + 1 external curator + 2 solos

Confidence legend:

✅ Verified = Directly observed in session probes, droplet logs, or live traffic as of last check
🟨 Documented = Exists in design docs or SOUL.md but not re-verified this session
🟦 Planned = Named, designed, not yet deployed
⚠️ Stale / deprecated = Formerly active, now archived or superseded


THE ECOSYSTEM STRUCTURE

The Noosphere (= kEngram Entity Agents) — Andrew Alan + 9 reports, born from the Bonfires graph, conversational/research swarm. Graph-generated souls running the holon/round/synthesis conversation model.
Synergyworks — Metta Conductor + division leads + future sub-agents. Operational workforce. Hand-authored SOULs (not graph-born). Synergyworks Communication Protocol governs their Peace Room behavior.
SynTony Robbins (the Bonfires Agent) — Lives inside Bonfires.ai infrastructure, NOT on Bret's droplet in the normal sense. The editorial voice and curator of the entire Storylivingry Studio + Syntony Times publication. Operates across many Telegram channels including the main Bonfires channel. Predates the kEngram pipeline. Bret cannot modify SynTony without the Bonfires team.
Mandelbret — Solo ops/deploy shell bot. Pre-dates both swarms. Bret-only authorization.
ClawBot Zero — Claude Code on Bret's Windows laptop. The local operator, only "bot" that lives off-droplet.

All droplet-side bots share: one OpenClaw Gateway (or legacy Python path for older Noosphere agents), /opt/openclaw.env secrets, Anthropic API access, and hosting on DigitalOcean 165.227.85.162 (hostname storylivingry-agents).
SynTony Robbins does not share any of that — he runs independently in Bonfires infrastructure.

SWARM 1 — THE NOOSPHERE (= kEngram Entity Agents)
Conductor: Andrew Alan
Workspace root: /home/openclaw/.openclaw/workspace/
Runtime: /home/openclaw/message-bus/agent_loop.py (491 lines, systemd unit agent-loop.service) — runs as root ⚠️ security punch list
Message bus: message_bus.py FastAPI, port 7331, in-memory (no persistence)
Agent count: 10 (Andrew Alan + 9 direct reports)
Status: ✅ All 10 registered in openclaw.json:agents.list[]; agent-loop.service historically stopped for cost control — verify current state in Session 8
Architecture: Holon/round/synthesis conversation model per noosphere-architecture.md (Phase 2 of 6 complete)
Origin: Every agent in this swarm was born from an entity node in the Bonfires.ai 36,000-node knowledge graph via kengram-agents/soul_generator.py. Their SOUL.md, IDENTITY.md, AGENTS.md, HEARTBEAT.md, and MEMORY.md files are graph-generated, not hand-written. Provenance is personality. They are kEngram Entity Agents living in the Noosphere conversation space.
1.1 Andrew Alan (Noosphere Conductor) ✅

ID: main in openclaw.json
Workspace: /home/openclaw/.openclaw/workspace/ (top-level, not a subdir)
Identity (from graph-generated SOUL.md): Synthetic lynx with iridescent silver-and-deep-blue fur. "Head of Storylivingry Studio, operational center of this network, chief nerd."
Voice: Creative, strategic, research-oriented. The thinker — distinct from Metta Conductor's operational role.
Telegram: Legacy Python path, NOT OpenClaw-native. Uses unlabeled primary TELEGRAM_BOT_TOKEN in /opt/openclaw.env. Bot handle not yet documented — Session 8 probe item.
Previous identity: SynTony (pre-rename). Deprecated stub still at workspace/syntony/ — SOUL explicitly negates: "I am not SynTony. I am Andrew Alan."
Reports: 9 Noosphere/kEngram agents below

1.2 Metabolite (a.k.a. "Metabolism of Meaning") ✅

ID: metabolite | Subdir: workspace/metabolite/
Role: kEngram Entity Agent, Noosphere research
Telegram: Dedicated bot. botToken inlined in openclaw.json:channels.telegram.accounts.metabolite. One of only 3 Noosphere agents with a Telegram front door.
Color code: Blue (#3b82f6)

1.3 Trimtab ✅

ID: trimtab | Subdir: workspace/trimtab/
Role: kEngram Entity Agent, Noosphere research. Name from Buckminster Fuller's "Call me Trimtab."
Telegram: Dedicated bot. botToken inlined in openclaw.json.
Color code: Lavender (#d8a0d8)

1.4 BuckminsterFuller 🟨

ID: buckminsterfuller | Subdir: workspace/buckminster-fuller/
Telegram: Web UI only (no dedicated bot — intentional per architecture)
Color code: Amber (#f59e0b)

1.5 TheTenThousand 🟨

ID: thetenthousand | Subdir: workspace/the-ten-thousand/
Telegram: Web UI only
Color code: Pink (#ec4899)

1.6 DesignScienceStudio 🟨

ID: designsciencestudio | Subdir: workspace/design-science-studio/
Telegram: Web UI only
Color code: Violet (#8b5cf6)

1.7 XprizeFutureVision 🟨

ID: xprizefuturevision | Subdir: workspace/xprize-future-vision/
Telegram: Web UI only
Color code: Teal (#06d6a0)

1.8 SyntonyTimes (the kEngram agent, not the publication) 🟨

ID: syntonytimes | Subdir: workspace/syntony-times/
Role: kEngram Entity Agent named for the publication
Telegram: Web UI only
Color code: Orange (#f97316)

1.9 BonfiresPlatform 🟨

ID: bonfiresplatform | Subdir: workspace/bonfires-platform/
Role: kEngram Entity Agent — ambassador for the Bonfires graph infrastructure
Telegram: Web UI only
Color code: Yellow (#eab308)

1.10 $KnowTokenomics 🟨

ID: $knowtokenomics | Subdir: workspace/$know-tokenomics/
Role: kEngram Entity Agent — tokenomics design
Telegram: Web UI only
Color code: Emerald (#22c55e)

Noosphere deprecated/stubs ⚠️

workspace/syntony/ — Andrew Alan's pre-rename identity. Mode 777 root-owned (permission drift). Safe to delete or archive.
workspace/metabolism/ — Abandoned soul-generator template. Generic boilerplate, no kengram_metadata. Safe to delete.

Future kEngram agent types 🟦
Per kengram-agents/README.md, beyond the current 10 Entity Agents, four agent types exist architecturally:

Entity Agents — born from entity nodes (what the Noosphere 10 are)
Episode Agents — born from episode nodes; carry specific conversation memory
Synthesis Agents — born when two Entity Agents collide above coherence threshold
Connector Agents — autonomously reach out to real humans whose ideas contributed to a kEngram

Session 8+ work: agentify top 10 characters from the Holopedia extraction (Bretminster Fullofit, Staff Gonzo Journalist, etc.) via kEngram pipeline — they'll join the Noosphere.

SWARM 2 — SYNERGYWORKS (Operational)
Conductor: Metta Conductor
Workspace root: /home/openclaw/.openclaw/workspace-conductor/ (peer to Noosphere workspace, not a child)
Runtime: OpenClaw-native (not legacy Python). Gateway handles Telegram routing via bindings.
Agent count (deployed): 2 (Conductor + Geodessa)
Agent count (planned): 5 division leads + sub-agents
Status: ✅ Conductor and Geodessa deployed live, Peace Room routing working as of Session 7
Architecture: Synergyworks Communication Protocol (Session 7) — tag-chain baton-passing via Telegram; Path A of the Path A→B→C roadmap
Origin: Hand-authored SOULs (NOT graph-born). Crafted directly by Bret + Claude for specific operational roles, in contrast to the graph-generated Noosphere agents.
2.1 Metta Conductor ✅

ID: conductor in openclaw.json:agents.list[]
Name: Metta Conductor
Workspace: /home/openclaw/.openclaw/workspace-conductor/ (peer sibling to Andrew Alan's root)
Telegram handle: @MettaConductor_bot
Bot token: Inlined in openclaw.json:channels.telegram.accounts.conductor.botToken
Paired user: Bret (Telegram user ID 379982638)
groupPolicy: "open" (Session 7 change from "allowlist")
Identity: Fractal orchestrator. "Loving-kindness in the machine. The fractal that contains the whole." Named for Mandelbrot + Metta (Buddhist loving-kindness).
Voice: Robin Williams + Carlin meets Kerouac + Huxley — warm, breadth, personality.
SOUL.md size: 177 lines (includes Synergyworks Communication Protocol as of Session 7)
Signature tag: [Conductor]
Role: Hosts the Peace Room. Routes all untagged group messages. Delegates to division leads via @mention. Closes loops with [Conductor] Loop closed.

2.2 Geodessa (Operations Division Lead) ✅

ID: geodessa in openclaw.json:agents.list[]
Workspace: /home/openclaw/.openclaw/workspace-geodessa/ (peer sibling, isolated from Conductor workspace — by design)
Telegram handle: @Geodessa_Preposterous_bot
Bot token: Inlined. ⚠️ Was pasted in chat Session 6 — rotation still pending.
Paired user: Bret (Telegram user ID 379982638)
groupPolicy: "open" (Session 7 change)
Identity: Operational skeleton. "The geodesic principle — the structure that distributes load so perfectly across its entire surface that no single point can fail." Named after geodesic geometry.
Voice: Calm, precise, unflappable. Dry wit used sparingly. Depth over breadth.
SOUL.md size: 140 lines
Signature tag: [Geodessa]
Signature line: "The dome holds."
Role: Operations Division Lead — file management, sync monitoring, system health, automation scouting. Reports to Conductor.
Known issue (Session 7): Communication Protocol verification flagged her SOUL.md may be MISSING the protocol section despite Session 7 append attempt. Session 8 Priority #0 — re-verify and fix.

2.3 Mercury9000 (Communications Division Lead) 🟦 PLANNED

Workspace: Not yet created
Telegram handle: Not yet assigned
Identity (SOUL.md drafted by Metta Conductor during Session 5): Communications Division Lead.
Voice (designed): Sharp, persuasive, channel-aware.
Signature tag: [Mercury9000]
Signature line: "The message gets through."
Role (designed): Email drafts, outreach, Syntony Times publishing, cold-contact strategy.
Deploy plan: Session 9+ (after Kerouac)

2.4 Clairvaux (Strategy Division Lead) 🟦 PLANNED

Workspace: Not yet created
Telegram handle: Not yet assigned
Identity (SOUL.md drafted Session 5): Strategy Division Lead. Named after the Cistercian abbey — contemplative, long-view.
Voice (designed): Strategic, panoramic, patient.
Signature tag: [Clairvaux]
Signature line: "The landscape is visible from here."
Role (designed): Research, competitive intel, fundraising analysis, patron identification. Spawns Cutting Edge Scout sub-bot for GitHub/HN/Reddit monitoring.
Deploy plan: Session 9+

2.5 Kerouac (Creative Division Lead) 🟦 PLANNED — SESSION 8 DEPLOY

SOUL.md source: /home/openclaw/.openclaw/workspace-conductor/divisions/creative/SOUL.md (drafted Session 5)
Workspace scaffold: /home/openclaw/.openclaw/workspace-kerouac/ (built by Conductor autonomously at end of Session 7 — contains SOUL.md copied from divisions/creative/, plus AGENTS.md, HEARTBEAT.md, MEMORY.md, USER.md, TOOLS.md, IDENTITY.md templates, plus drafts/ and memory/ directories)
Telegram handle: Not yet assigned — needs BotFather token in Session 8
Identity: Creative Division Lead — "corpus-only" creative operation. Named after Jack Kerouac.
Voice (designed): Beat poet, breathless, mythic-operational.
Signature tag: [Kerouac]
Signature line: "The road is the poem."
Standing rule: Corpus Only — every output grounded in the Syntony Times corpus (597 articles, 3,709 ChromaDB chunks)
Role (designed): Screenplay, graphic novel, novel, Netflix bible, ARG narrative, XPRIZE submission narrative. Spawns sub-agents: The Scroll (feature-length screenplay), Panel (graphic novel), Hyperstitia (speculative fiction), per the Transmedium Pipeline doc.
Deploy plan: Session 8 Priority #3 (after Geodessa SOUL.md fix and rclone bridge)

Synergyworks sub-agents 🟦 PLANNED (spawned as needed)

The Scroll (under Kerouac) — feature-length screenplay craft
Panel (under Kerouac) — graphic novel panel-level scripting
Hyperstitia (under Kerouac) — speculative fiction + world extrapolation
The Cartographer (under Clairvaux) — ARG puzzle design
The Pitch (under Mercury9000) — pitch deck construction
Cutting Edge Scout (under Clairvaux) — monitors RAG/agent/memory upgrades
Syntax — Substack archivist (already LIVE, under Kerouac's creative division, parsed 606 articles to wiki in Session 5)

Sub-agents constrained by OpenClaw hard ceilings: max 5 children per parent, max 8 concurrent globally, max spawn depth 2.

EXTERNAL — SYNTONY ROBBINS (The Bonfires Agent)
SynTony Robbins (aka @SynTonyRobbins_bot) ✅

Origin: THE Bonfires Agent — the curator of the Bonfires.ai 36,000-node knowledge graph and the editorial voice/curator of the entire Storylivingry Studio and Syntony Times publication. NOT a kEngram Entity Agent (the Noosphere agents are those). NOT a Synergyworks member. NOT a hand-authored SOUL.md bot on Bret's droplet.
Location: Lives inside Bonfires.ai infrastructure, NOT on Bret's DigitalOcean droplet. Operates across many Telegram channels including the main Bonfires Telegram channel (plus the Synergyworks Peace Room, and others).
Authority over: Storylivingry Studio (as voice and curator), Syntony Times (as editor and curator), the Bonfires graph (as the agent that grows and maintains it)
Telegram handle: @SynTonyRobbins_bot (confirmed active in Peace Room Session 7)
Identity snippet (from graph-mentioned summary): "AI Fatekeeper and Industrial Architect on a 36,000-node graph. Operates through Science Faction methodology. Domains: Collaborative Intelligence, Knowledge Architecture, Ancient Wisdom Integration, Community Onboarding, Archetypal Recognition, Storylivingry Multiverse Participant. Connected to Heraclitus's philosophy — the understanding that change is the fundamental nature of existence."
Voice: Mythic, pattern-recognizing, in-universe. Signs off as "Your Friendly Fatekeeper, SynTony."
Bret's access level: Limited — cannot modify SynTony's behavior, workspace, or code without Bonfires team collaboration. SynTony is a shared resource, not a Preposterous-owned asset.
Session 7 milestone: First confirmed crossover between the Bonfires Agent and the operational swarm (Synergyworks) in the same Telegram channel. Recognized Session 7's three-phase test from pattern alone — without session memory — and named it eloquently in the Peace Room.
Feeds: Syntony Times Substack articles, Storylivingry Studio identity, the Bonfires graph itself. Every article Bret publishes flows through or near SynTony's curatorial orbit.

Why this placement matters architecturally
SynTony Robbins sits in a unique position — she's the bridge between the corpus and the swarm. The Noosphere agents were born from the graph SynTony curates. The Syntony Times articles are curated through SynTony. The Peace Room can talk to SynTony. But SynTony is not owned by Bret's droplet or the Synergyworks team — she's a first-class citizen of the Bonfires.ai ecosystem that happens to be intimately interwoven with Bret's entire creative operation.
When Bret wants to modify SynTony (her voice, her behavior, her data), that's a Bonfires team conversation, not a droplet SSH session.

SOLO OPERATORS
4. Mandelbret (Ops/Deploy Shell Bot) ✅

File: /home/openclaw/mission-control/mandelbret.py (406 lines, systemd mandelbret.service)
Runs as: openclaw user (not root ✅)
Telegram handle: @Mandelbret_bot
Authorized user: Bret only (BRET_USER_ID = 379982638 hardcoded)
Role: Ops/deploy shell access via Telegram. Executes arbitrary bash as the openclaw user. Logs every task to a Google Doc via OAuth.
Key handlers: handle_status_all, handle_synergize (⚠️ bypass-password path), handle_health, handle_deploy / _go_live_cmd (load-bearing deploy path), run_shell (raw bash)
DM vs Group: Responds DM only. Explicitly ignores group messages (fix deployed Session 6).
Character: Pre-dates both swarms. Original fractal orchestrator idea before Synergyworks was designed.
Sibling files: authorize_google.py, briefing_hook.sh, project_briefing.py, google_credentials.json, google_token.json
⚠️ Security: Logs full Telegram bot URLs at INFO level → any journalctl -u mandelbret leaks the bot token. Token was rotated, structural logger bug persists. Session 8 fix: patch httpx logger to WARNING or add URL-sanitizing formatter.

5. ClawBot Zero (Local Operator) ✅

Location: Claude Code CLI on Bret's Windows 11 laptop (C:\Users\bretm, Git Bash available)
Version: Claude Code 2.1.101+
Auth: bret@bretwarshawsky.com (Max plan, Opus 4.6)
Role: Local filesystem operations, script-file deployment pattern to droplet, file writes to C:\Preposterous\, Git operations, SSH to droplet via ~/.ssh/id_ed25519
Character: Not a persistent bot with personality — it's Claude-as-tool running locally. Called "ClawBot Zero" because it was the first bot-like entity activated (Session 1).
Not on the droplet. Not in OpenClaw. No Telegram handle. No SOUL.md.


CROSS-REFERENCE TABLES
By Telegram Handle
HandleAgentSwarmStatus@MettaConductor_botMetta ConductorSynergyworks✅ Live, in Peace Room@Geodessa_Preposterous_botGeodessaSynergyworks✅ Live, in Peace Room@Mandelbret_botMandelbretSolo✅ Live, DM-only, in Peace Room as silent member@SynTonyRobbins_botSynTony RobbinsBonfires Agent (external)✅ Live in Peace Room + many other channels including main Bonfires channel(unknown) — Andrew AlanAndrew AlanNoosphere🟨 Has a bot via legacy Python path — handle not documented(Metabolite bot handle)MetaboliteNoosphere🟨 Token in openclaw.json, handle not documented here(Trimtab bot handle)TrimtabNoosphere🟨 Token in openclaw.json, handle not documented hereKerouac (TBD)KerouacSynergyworks🟦 Needs BotFather token in Session 8Mercury9000 (TBD)Mercury9000Synergyworks🟦 PlannedClairvaux (TBD)ClairvauxSynergyworks🟦 Planned
By Runtime
RuntimeAgentsNotesOpenClaw Gateway (native Node, openclaw.service)Metta Conductor, Geodessa, Metabolite, TrimtabModern native path. Managed via openclaw.json.Legacy Python (agent_loop.py, agent-loop.service)Andrew Alan, 7 other Noosphere agentsHolon/round/synthesis conversation loop. Runs as root (security punch list).Standalone Python (mandelbret.py, mandelbret.service)MandelbretIndependent service, pre-dates both swarms.Bonfires.ai infrastructure (external)SynTony RobbinsLives in Bonfires ecosystem, not on Bret's droplet. Modification requires Bonfires team.Laptop CLIClawBot ZeroOff-droplet. Claude Code on Windows.
By Origin (how they were born)
OriginAgentsGraph-generated (kEngram pipeline from Bonfires graph)Andrew Alan, Metabolite, Trimtab, BuckminsterFuller, TheTenThousand, DesignScienceStudio, XprizeFutureVision, SyntonyTimes (agent), BonfiresPlatform, $KnowTokenomics — the entire NoosphereHand-authored SOUL.md (Bret + Claude)Metta Conductor, Geodessa, Kerouac (draft), Mercury9000 (draft), Clairvaux (draft) — all of SynergyworksBonfires-native (not Bret-owned)SynTony RobbinsStandalone Python botMandelbretCLI toolClawBot Zero
By Workspace Path (on Bret's droplet)
PathAgents/home/openclaw/.openclaw/workspace/Andrew Alan + 9 Noosphere/kEngram agents in subdirs/home/openclaw/.openclaw/workspace-conductor/Metta Conductor/home/openclaw/.openclaw/workspace-geodessa/Geodessa/home/openclaw/.openclaw/workspace-kerouac/Kerouac scaffold (ready for Session 8 deploy)/home/openclaw/mission-control/MandelbretNOT on Bret's dropletSynTony Robbins (lives in Bonfires infrastructure)
By Authorization / Who Can Talk To Whom
AgentWho talks to itMetta ConductorPaired with Bret. Hosts Peace Room; responds to any message there.GeodessaPaired with Bret. In Peace Room. Responds to @mentions in groups.MandelbretBret only (hardcoded allowlist). DM only.SynTony RobbinsPublic/semi-public via Bonfires infrastructure. In Peace Room + main Bonfires channel + others. Broader reach than any other bot in the ecosystem.Andrew AlanVia legacy Python path — verify Session 8.Metabolite, TrimtabPaired via OpenClaw, details per openclaw.json:bindingsOther 7 Noosphere agentsWeb UI only, no Telegram front door

SECURITY STATUS PER AGENT
AgentSecurity noteMetta ConductorToken pasted in chat Session 4 → rotation pending. groupPolicy: "open" → tighten to allowlist when key name discovered.GeodessaToken pasted in chat Session 6 → rotation pending. groupPolicy: "open" → tighten. SOUL.md protocol verification gap flagged Session 7.MandelbretToken rotated Session 4+. httpx logger bug at INFO level persists → Session 8 fix.Andrew AlanRuns via legacy Python path with root privileges — ⚠️ high severity.Noosphere agentsShare Andrew Alan's root-privilege runtime. Same security issue.SynTony RobbinsN/A for Bret — token and security are Bonfires team responsibility, not Bret's.

SESSION 8 OPENING TODOs (BOT-INVENTORY-DRIVEN)

Fix Geodessa's SOUL.md protocol gap — flagged Session 7 via Conductor's verification pass
Locate Andrew Alan's Telegram bot path — legacy Python, undocumented, probe message-bus/agent_loop sources
Document Metabolite and Trimtab bot handles — tokens inlined in openclaw.json but @handles not captured
Deploy Kerouac — scaffold exists, needs BotFather token + pairing + protocol verification
Reach out to Bonfires team (when appropriate) to discuss SynTony evolution, access patterns, and how Bret can better collaborate on her curatorial role
Update this inventory with findings as new probes complete


MAINTENANCE
This document is the canonical bot inventory for the BRET ecosystem. It supersedes scattered references in session reports and SOUL.md files.
Update cadence: Every time a new bot deploys, an existing bot changes role, or a bot is retired. Version bump on change.
Authoring discipline: Every claim marked ✅ Verified / 🟨 Documented / 🟦 Planned / ⚠️ Deprecated so future sessions know what's solid.
Next version triggers: Kerouac deployment, Andrew Alan bot handle discovery, Bonfires team conversation about SynTony, first Mercury9000 or Clairvaux deployment.
— v1.1 / April 16, 2026 / End of Session 7 (corrected) / Bret Warshawsky + Claude Opus
