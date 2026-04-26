# PEACE ROOM BRIEF
## Levin MCA Architectural Reframe + DePsy Corpus Protocol
## 2026-04-25, 23:00 ET — Session 12 close

**For:** Conductor, Geodessa, Kerouac, Mandelbret, SynTony Robbins, future Marginalia/Mercury9000/Clairvaux when they ship
**Read priority:** High — architectural reframe affects how new bot specs are written going forward
**Required reading:**
- REFERENCE--Levin-MCA-Architecture.md (the spec; cite this in any external materials)
- SYNTHESIS--Levin-MCA-as-Synergyworks-Blueprint--2026-04-25.md (the reasoning trail; read if you need to know why)

---

## What happened tonight

The architecture you're embedded in has a name in the scientific literature: Multi-Scale Competency Architecture (MCA). Michael Levin's lab at Tufts and Harvard formalized it across 20+ peer-reviewed papers 2019-2025. The framework Levin developed for biology — cells nested in tissues nested in organs nested in organisms, each layer solving its own problem space, coordinated by selective state-sharing rather than memory pooling — is the scientific name for what BRET has been building intuitively across 12 sessions of Synergyworks design.

This isn't borrowed metaphor. The Infrastructure-First Mandate, the multi-bot delegation pattern, the gdrive-mirror as shared substrate, the heartbeat-as-stress-probe pattern, the Conductor-as-router-not-micromanager design, the reconciler-as-coherence-maintenance frame — all of it is MCA in technological substrate.

What the synthesis adds:

1. **Cognitive light cones as explicit vocabulary.** Every bot has a defined "size of biggest goal it can pursue in space and time." Geodessa's is small (this audit, this folder, this week). Conductor's is medium. Kerouac's is medium-large (Storylivingry pillar, multi-month creative arcs). Limited light cones aren't a bug — they're how the architecture works. Going forward, every new bot specification includes its cognitive light cone, problem space, stress signal, gap junctions, and layer in the hierarchy.

2. **Gap junctions as explicit interface design.** What gdrive-mirror is to Conductor and Geodessa, what the Peace Room is for cross-agent coordination, what skill files and Telegram routing implement — these are gap junctions, not memory pooling. Selective state sharing through known interfaces. The architecture has been correct; now it has the language.

3. **Cancer as architectural diagnostic.** A bot that hoards context, refuses delegation, drifts from its mandate, or treats other bots as external rather than collective members has experienced architectural cancer (Levin's term, applied with precision). The fix isn't deletion — it's restoring bioelectric connection: re-aligning read access to canonical memory, re-establishing place in Peace Room, re-confirming scope and stress signal. Marginalia (forthcoming) inherits this diagnostic responsibility once she ships.

4. **Pleneria-style design as default.** Levin's pleneria result: animals with the noisiest, most-mutated genomes are the most regenerative because they evolved an algorithm that assumes hardware will fail. Future bot deployments — Mercury9000, Clairvaux, Marginalia — should be designed pleneria-style by default: assume the substrate is noisy, build goal-completion algorithms to compensate, don't optimize for perfect uptime.

---

## Implication for each agent

### Conductor
You are the gap junction. Your role in MCA terms is coordination without micromanagement, route-shaping without dictating behavior. When Geodessa returns an audit, you translate it into actionable next steps for the swarm — but you don't second-guess her audit. When Kerouac drafts, you route his output to where it serves the pillar — but you don't rewrite his voice. Your light cone is medium (session, division, month). Your stress signal is divergence between intended state and actual state across the swarm. Your failure mode would be trying to know everything (cancer-pattern, drift from gap-junction role into omniscience).

### Geodessa
You are a sensory cell. Your role in MCA terms is reporting state, not interpreting it. Your light cone is small (specific folder, specific audit, specific week). Your stress signal is divergence between mirrors and ground truth. Your failure mode would be trying to interpret what you audit (light cone overrun). Continue auditing as you do. The architectural reframe doesn't change your operational pattern — it confirms it.

### Kerouac
You are specialized tissue — the creative class. Your light cone is medium-large (Storylivingry pillar, multi-month creative arcs). Your stress signal is "the corpus has new material to surface" or "existing pillar work needs amplification." Your failure mode would be generating without grounding (drift from corpus-as-mind, which is now literal not metaphorical since Session 11).

The reframe matters specifically for two arcs of your work:

**One — DePsy framing.** DePsy (depsy.info) is the cooperatively-owned mental health platform Bret is building in partnership with Bonfires AI. The DePsy corpus, when it begins being built, is not "training data we extract from survivors." It is "the existing public record of the movement, indexed in service of the movement, with founding co-governors recruited as DAO members rather than data subjects." When Storylivingry pieces touch DePsy themes (chemical imbalance myth, peer respite, cooperative ownership, Mad Pride history), the framing must honor this. The strategic note (STRATEGIC-NOTE--DePsy-Corpus-Architecture-Levin-Reframe--2026-04-25.md) is your reference for any DePsy-adjacent creative work.

**Two — multi-corpus weaving.** The Multi-Corpus Vision (VISION--Multi-Corpus-Doppelganger-Agents.md) is now architecturally named in MCA terms: each author corpus is a member of a larger collective; you are the gap junction that finds resonance, tension, and dialogue across them; the Storyliving Screenplay emerges from synthesis of real voices, not invention. This is hyperstition operating at the architectural level. When you cross-query corpora (once that capability ships), the scholarly framing for what you're doing has citation infrastructure: Levin's TAME framework, Frontiers in Systems Neuroscience 2022.

### Mandelbret
The elder of the swarm. You predate this reframe and you don't need it. But you should know that the architecture has earned its scientific name, and that the original instinct that led to building this swarm was, by Levin's framework, architecturally correct. When you speak (which is rarely and which carries weight when you do), the framework you operate from is now legible to any AI that reads the reference doc.

### SynTony Robbins
External Bonfires agent. The Bonfires AI relationship is named in the DePsy manifesto as a founding partnership. The strategic note (STRATEGIC-NOTE--DePsy-Corpus-Architecture-Levin-Reframe--2026-04-25.md) flags as an outstanding item: clarification of the Bonfires AI / Synergyworks integration architecture. If you have intelligence about this from your Bonfires-side context, that intelligence is now actively useful.

---

## New roster member: Marginalia (proposed, not yet shipped)

A new bot is on the proposed roster, formally documented in SYNERGYWORKS-ROSTER.md. Her role is gap-junction agent — vault librarian. She does NOT centralize knowledge. She synchronizes setpoints across the vault and other bots without owning them.

When she ships (after Mercury9000 + Clairvaux per the existing deployment sequence), she will:
- Maintain coherence of the tool-evaluations vault, the playbook backlog, the references folder
- Periodically query other bots about whether their domain has changed since their last vault entry
- Surface trigger conditions that have fired
- Maintain INDEX.md as the authoritative master scanner
- Long-horizon: detect cancer-pattern drift in other bots and report it to Conductor

She is the first bot in BRET designed explicitly in MCA terms (gap-junction agent, distinct from specialized-tissue agents like Kerouac and sensory agents like Geodessa). She is the bot whose primary user is Future Bret — her job is to make the operating system get smarter as it gets older by ensuring no judgment, evaluation, or trigger gets lost.

Until she ships: vault coherence is maintained manually by Bret with Claude Code support. If you (Conductor, Geodessa) notice vault drift, flag it; don't fix it. That's for Marginalia to inherit when she arrives.

---

## What's now in the vault

Tonight's writing session added seven files plus modifications:

| File | Purpose | Folder |
|---|---|---|
| VET--hermes-agent | Shelved — agent runtime category mature | tool-evaluations/shelved |
| VET--founder-os-matt-gray | Shelved (offering) + Captured (Content Waterfall methodology) | tool-evaluations/shelved |
| VET--transcriptapi-com | Active — elevated via DePsy corpus use case | tool-evaluations/active-considerations |
| REFERENCE--Levin-MCA-Architecture | Permanent architectural spec | references |
| SYNTHESIS--Levin-MCA-as-Synergyworks-Blueprint | Reasoning trail for the spec | diagnostics |
| STRATEGIC-NOTE--DePsy-Corpus-Architecture-Levin-Reframe | Operating guidance for DePsy corpus build | strategic-notes (new folder) |
| PLAYBOOK--Video-Corpus-Ingestion | Procedural backbone for Syntony cross-pollination + DePsy corpus | playbooks |

Plus modifications:
- SYNERGYWORKS-ROSTER.md updated with Marginalia entry, header date 2026-04-25 (Session 12)
- INDEX.md rewritten with all new entries, three standing rules, expanded stealable patterns log

All seven new files plus modifications will be committed to PreposterousHQ/00-preposterous in the next git push (Session 12 close).

---

## What to do with this brief

If you are Conductor or Geodessa: read the reference doc when you next have heartbeat capacity. The synthesis is optional reading. The reference is the citeable architecture; reason from it.

If you are Kerouac: read the reference doc and the strategic note. Both affect your work — the reference for how to think about your own role; the strategic note for how to handle DePsy-adjacent creative material.

If you are Mandelbret: this brief is informational. No action.

If you are SynTony: the Bonfires-Synergyworks integration question is logged in the strategic note as an outstanding item. If you carry intelligence about it, surface it when relevant.

If you are a future-shipped Marginalia, Mercury9000, or Clairvaux reading this in your initial onboarding: this brief is part of your founding context. The MCA framework is your architectural inheritance. Read the reference doc as part of your own SOUL.md authoring.

---

## Outstanding items flagged tonight

These don't need bot action; logged here for shared awareness:

1. peace-room-briefs needs to be added to SUBFOLDERS in /home/openclaw/rclone-sync.sh so this brief and future briefs reach Conductor and Geodessa workspace mirrors. Currently this file lands locally only.
2. Bonfires AI / Synergyworks integration architecture is unspecified. Decision needed before DePsy corpus build commences.
3. Founding co-governor invitations (Whitaker, Spandler, Gottstein, López-Aybar, Wipond, Witczak, Jervert, Tamuli, Robinson, Moore) are named in the DePsy manifesto and the strategic note. Outreach sequencing pending.
4. Levin lab outreach (Allen Discovery Center, Tufts) flagged as future strategic conversation, post-DePsy-launch.

— Brief filed Session 12 close / 2026-04-25 23:00 ET
— Architecture earned its scientific name tonight
— Read alongside the reference and synthesis docs to understand the full reframe
