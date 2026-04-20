# VET — OpenClaw 2026.4.11 / Memory Palace + ChatGPT Import

Date evaluated: 2026-04-18
Status: Deployed (feature live on droplet at 4.12)
Category: OpenClaw Feature Release / Memory System
Source: LinkedIn post (community relay of Peter Steinberger changelog)
Verdict: Real feature, directly relevant — ChatGPT corpus import + Active Memory plugin — action items below.

## WHAT IT IS
OpenClaw 4.11 added ChatGPT import ingestion to Dreaming/memory-wiki plus two new diary subtabs: Imported Insights (topic-clustered synthesis of imported chats) and Memory Palace (compiled view of wiki pages with claims, contradictions, entity extraction). Not a raw dump — actual synthesis. 4.12 also added Active Memory plugin — fires a memory sub-agent before every reply automatically.

## WHAT IS ACTUALLY TRUE
- Feature confirmed in official changelog and PR 64505
- Security issue in initial release: path traversal via unvalidated runId — low risk for single-operator self-hosted
- Known bridge-mode bug: wiki pages may not surface in Dreaming after upgrade (issue 65091)
- Already on 4.12 per v7 state doc — Memory Palace is live now
- Active Memory plugin also in 4.12 — not yet activated on Conductor
- Community already requesting Perplexity import as next corpus target

## THE BRET LENS
Directly relevant. ChatGPT export at C:\Preposterous\06-archive\chatgpt-export\fullofit-gpt\ is sitting unprocessed. Memory Palace is the processor. This was already named as Data Export Corpus Mission priority in v7 state doc.

## STEALABLE PATTERNS
- [ ] Synthesize-at-ingest pattern — topic clustering + signal extraction during import → ChromaDB upgrade consideration

## ACTION ITEMS
1. Verify chatgpt export format — confirm conversations.json in fullofit-gpt\
2. Run ChatGPT import via Memory Palace
3. Activate Active Memory plugin on Conductor (one config change)
4. Check for bridge-mode bug if Dreaming does not surface wiki pages
5. Update OpenClaw to latest (4.14 is out)

## COSTS
- Money: $0 — included in existing OpenClaw installation
- Time: 1-2 hours for import + activation

## LINKS
- Changelog: https://github.com/openclaw/openclaw/releases/tag/v2026.4.11
- Bug: https://github.com/openclaw/openclaw/issues/65091
