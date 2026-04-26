# TOOL EVALUATIONS — MASTER INDEX

Last updated: 2026-04-25 (Session 12)
Total entries: 8 (7 vets + 1 build)
By status: Active 3 · Shelved 5 · Deployed 1 · Rejected 0

Note: Deployed count corrected from prior INDEX (had said 0; OpenClaw 4.11 Memory Palace was always in deployed/).

## ALL ENTRIES (MOST RECENT FIRST)

| Type | Name | Category | Status | Verdict |
|---|---|---|---|---|
| VET | TranscriptAPI.com | Video Ingestion / MCP | Active | YouTube transcript REST + MCP server. Bookmarked → ELEVATED via DePsy corpus use case. Triggers: DePsy corpus build commences (near-term), Syntax cross-pollination ships, Patron Concierge billable use, free tier expansion. See PLAYBOOK--Video-Corpus-Ingestion.md and STRATEGIC-NOTE--DePsy-Corpus-Architecture-Levin-Reframe--2026-04-25.md. |
| VET | Hermes Agent (Nous Research) | Agent Runtime Framework | Shelved | OpenClaw with different vendor — same architectural pattern, no specific capability gain. gstack already supports .hermes/skills/ host environment. Triggers: OpenClaw maintenance becomes painful, patron requests non-OpenClaw stack, Nous-specific feature OpenClaw lacks. |
| VET | Founder OS (Matt Gray) | Founder Coaching / Content Methodology | Shelved | Coaching offering shelved — BRET is not the customer profile. Content Waterfall methodology captured for future PLAYBOOK--Content-Waterfall.md (Mercury9000-dependent). 30:1 leverage ratio is the discipline that makes solo creators with Synergyworks-style infrastructure competitive with content teams. |
| VET | gstack | Claude Code Skill Pack | Active | Most relevant tool in vault — runs on Claude Code, OpenClaw-aware, sprint pipeline pattern belongs in Synergyworks — evaluate next session |
| BUILD | preposterize | Internal Infrastructure | Active | Script to propagate any artifact across laptop → Drive → droplet → GitHub. Replaced by prepo.ps1 (prepo-v0 tagged Session 10). preposterize.ps1 retained as pre-A reference only. |
| VET | OpenClaw 4.11 Memory Palace | OpenClaw Feature | Deployed | Live on droplet — ChatGPT import + Active Memory plugin — run ChatGPT import next session |
| VET | OpenAI Codex Apr16 | AI Coding Agent | Shelved | Real update, macOS-only computer use, wrong platform/stack for us now |
| VET | OpenSwarm | Multi-Agent Orchestration | Shelved | Steal memory scoring + escalation patterns, do not deploy |
| VET | RustDesk | Remote Desktop | Shelved | Legit self-hosted TeamViewer alternative, no current use case |

## STANDING RULES (apply to all future vetting work)

1. **Social-media tool pitches require direct GitHub verification before vet file creation.** Star counts, fork counts, contributor counts, "just launched" claims must be read directly from the repo. Three pitches in April 2026 inflated numbers 100-700x. Saves vetting time on entries that fail factual basis.

2. **Clean inputs before building audit tools.** Dedup, remove legacy cruft, resolve known drift before building reconcilers or auditors that would surface them as divergences. Inverse order trains operators to ignore audit output ("verification theater from a different angle"). Established Session 9.

3. **Secrets never live in any path that propagates through the ontology.** OAuth tokens, API keys, bot tokens, SSH keys, consent ledgers — all go to .env files or directories outside the Drive sync boundary. Verify every new design against this rule. Established Session 9 after a near-miss in preposterize design rev1 caught by gstack subagent review.

## STEALABLE PATTERNS LOG

| Pattern | Source | Target | Status |
|---|---|---|---|
| Hybrid weighted retrieval (0.55 sim + 0.20 imp + 0.15 recency + 0.10 freq) | OpenSwarm | ChromaDB upgrade | Queued Session 9+ |
| Memory type taxonomy (belief/strategy/user_model/system_pattern/constraint) | OpenSwarm | ChromaDB schema | Queued Session 9+ |
| Background memory cognition (decay, consolidation, contradiction detection) | OpenSwarm | ChromaDB maintenance | Queued Session 9+ |
| Auto-escalation after N failed iterations | OpenSwarm | Dual-mode architecture spec | Queued Session 9+ |
| Chained handoff pipeline (each stage output = next stage input) | gstack | Conductor routing protocol | Queued Session 9+ |
| Cognitive role switching per task type | gstack | SOUL.md design pattern | Queued Session 9+ |
| SPAWNED_SESSION flag for orchestrator detection | gstack | Future agent skill design | Queued Session 9+ |
| Content Waterfall (1 pillar → 30 derivative posts over 4 months) | Founder OS / Matt Gray | Future PLAYBOOK--Content-Waterfall.md, Mercury9000 workflow | Queued Session 12+ |
| "Fastest path" decision matrix at top of onboarding docs | Hermes Agent quickstart | Future Patron Concierge service docs | Queued Session 12+ |
| "Rule of thumb: get one clean conversation working first" | Hermes Agent | Synergyworks onboarding pattern | Queued Session 12+ |
| 64K minimum context floor as architectural minimum | Hermes Agent | Future BRET tooling design specs | Reference only |

## ACTIVE BUILDS QUEUE

1. preposterize → prepo-v0 shipped Session 10. Reconciler (B-stage) targeted for May 17 backstop or sooner per gstack design doc.
2. build-backlog.md — create when accumulated business ideas justify a standing document
3. synergyworks-roster.md — created Session 11. Updated Session 12 with Marginalia entry.
4. PLAYBOOK--Video-Corpus-Ingestion.md — created Session 12.
5. PLAYBOOK--Content-Waterfall.md — backlog (Mercury9000-dependent)

## RE-EVALUATION TRIGGERS (SHELVED)

- **RustDesk:** first outside collaborator, OR phone-to-laptop remote needed
- **OpenSwarm:** Storylivingry ships real code product, OR dev joins team
- **OpenAI Codex:** computer use ships on Windows, OR Storylivingry has engineering backlog
- **Hermes Agent:** OpenClaw maintenance painful, patron requests non-OpenClaw stack, Nous-specific feature OpenClaw lacks
- **Founder OS:** BRET wants founder-community accountability (consider EO/YPO/Tiger 21 first), pillar needs creator-economy GTM expertise

## CATEGORIES NOT YET COVERED

Notion, CRM tools, Cal.com, Superhuman, Descript, Runway, DocSend, Cline, Aider, Hypefury (or equivalent scheduling layer for Content Waterfall), GraphRAG/LightRAG/RAPTOR (deferred to Clairvaux R&D Scout once deployed)

## CROSS-REFERENCES

- **Marginalia (vault librarian / gap-junction agent):** specified in REFERENCE--Levin-MCA-Architecture.md, formalized in SYNERGYWORKS-ROSTER.md. Will become the operator of this INDEX once deployed (post-Mercury9000 + Clairvaux).
- **DePsy corpus build:** governed by STRATEGIC-NOTE--DePsy-Corpus-Architecture-Levin-Reframe--2026-04-25.md and operationalized via PLAYBOOK--Video-Corpus-Ingestion.md.
- **Multi-Scale Competency Architecture (Levin):** REFERENCE--Levin-MCA-Architecture.md is the citeable spec; SYNTHESIS--Levin-MCA-as-Synergyworks-Blueprint--2026-04-25.md is the reasoning trail.
