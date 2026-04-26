# VET — TranscriptAPI.com (YouTube Transcript API + MCP Server)

**Status:** Active Consideration — ELEVATED via DePsy corpus use case
**Vetted:** 2026-04-25 (Session 12)
**Category:** Infrastructure / Video Ingestion / MCP / Agent Research Surface
**Source:** transcriptapi.com homepage (mobile screenshot, April 2026)

---

## What it is

Production-grade YouTube transcript extraction service. Two interfaces: REST API (traditional integration) and MCP server (Anthropic Model Context Protocol — agent-native consumption). Capabilities advertised: transcript extraction, video search, channel browsing, playlist extraction.

Load claim: "Powering 15M+ transcripts every month." Logos shown for OpenAI, Anthropic Claude, and a third agent platform (likely OpenClaw or similar). Positioning is explicitly AI-agent-first, not human user.

Pricing not captured in homepage screenshot (View Pricing button). Free tier exists ("Get Started Free").

## Why this is elevated, not just bookmarked

Bret flagged two near-term workflows that change this from "interesting future tool" to "evaluate within Max window":

### Use case 1: Syntony Times cross-pollination
Every Substack episode/article gets enriched with relevant YouTube content the corpus references. Not 20 videos one-time; hundreds of videos, ongoing, forever. Becomes Syntax pipeline input.

### Use case 2: DePsy founding-corpus enrichment
DePsy (depsy.info) is the cooperatively-owned, decentralized mental health platform Bret is building in partnership with Bonfires AI. The DePsy AI is "trained not on clinical manuals and pharmaceutical studies but on peer wisdom, survivor knowledge, and the full texture of human experience with mental difference across every culture."

The publicly available archive of that knowledge — interviews with Robert Whitaker, Jim Gottstein, Rob Wipond, Vesper Moore, Hel Spandler, Laura López-Aybar, Kim Witczak, Karin Jervert, Pranami Tamuli, Alan Robinson; Stan Grof talks; Spiritual Emergence Network archives; Hearing Voices Network footage; Soteria documentation; Mad Pride conferences; Mad in America podcasts; Open Dialogue trainings; survivor testimony across YouTube and podcast platforms — represents an existing public record of the movement's intelligence, captured in video form, much of it from people DePsy is recruiting as founding co-governors.

**This is not "training before contributors arrive."** Contributors are co-owners from the founding moment per the $KNOW token + DAO architecture. The video corpus is **service to the movement** — it gives DePsy's AI substrate the depth and texture of the work the named architects have already publicly produced, so the platform launches knowing what its co-governors have spent careers proving. The recruitment conversation begins with "we have already studied your work; we are building infrastructure adequate to it" rather than "please contribute to our database."

The contributor question is sovereignty, not access. The corpus question is whether DePsy launches grounded in the movement's existing public intelligence or floats free of it. Grounded is correct.

See: STRATEGIC-NOTE--DePsy-Corpus-Architecture-Levin-Reframe--2026-04-25.md

## Architectural slot — fits existing Synergyworks pipeline

The corpus pipeline already exists (Session 11):
- Syntax bot ingests source material → markdown wiki
- ChromaDB stores chunks with metadata
- corpus-api.py serves queries on port 8765
- Kerouac queries via Node.js, cites real chunks

**Adding a YouTube ingestion layer is incremental, not new architecture:**

1. TranscriptAPI (or yt-dlp+Whisper) → transcript files
2. Syntax pipeline ingests transcripts → ChromaDB
3. New collection: `depsy_corpus` (separate from `syntony_times_corpus`)
4. corpus-api.py exposes second collection
5. Future DePsy AI queries it; Kerouac can cross-query both collections (Multi-Corpus Vision)
6. Per DePsy's cooperative architecture, contributors who provide their own video links or grant their interviews to the corpus accrue $KNOW recognition once the token economy launches

**No new bot architecture required. The hard work is already done.**

## Free vs paid analysis

| Tool | Cost | Trade-offs |
|---|---|---|
| **yt-dlp + Whisper** | $0 | Free, scriptable, no rate limits beyond YouTube's, requires Whisper compute (CPU-heavy or GPU). Auto-captions are 80% accurate; Whisper is 95%+ |
| **TranscriptAPI free tier** | $0 (limited) | API-managed, MCP-native, faster for 1-off lookups |
| **TranscriptAPI paid** | TBD | Production-grade, MCP server enables agent tool calls |

**Decision logic:**
- For one-off vetting (like tonight): browser tools (youtubetotranscript.com)
- For DePsy corpus build (hundreds-thousands of videos): yt-dlp on droplet + Whisper for high-quality transcripts on key videos
- For agent-as-MCP-consumer (Kerouac queries YouTube as a tool): TranscriptAPI paid tier IF that becomes a workflow

## Ethical and consent considerations specific to DePsy

The DePsy manifesto is explicit: "the days of researchers extracting survivor knowledge for academic papers that survivors never see are over." Video corpus building has to respect that.

**Default principles for the DePsy collection:**
- Public talks, lectures, podcast appearances by named architects (Whitaker, Gottstein, Wipond, Moore, Spandler, López-Aybar, Witczak, Jervert, Tamuli, Robinson, etc.) are fair-use research material that the architects themselves have made public, but the canonical move is to invite them as co-governors and let them designate which of their work they want included
- Survivor testimony from public archives (Spiritual Emergence Network, Hearing Voices Network, Mad Pride conferences) is treated as sacred material — included only with attribution, indexed for retrieval, never quoted at length, never used to generate synthetic survivor content
- No facial recognition, no voiceprint extraction, no biographical inference beyond what speakers have made public themselves
- Per the standing rule from Session 9: secrets, identifiers, and consent decisions never propagate through the ontology — they live outside the sync boundary

The first concrete deliverable when this becomes active work is a CONSENT-AND-CONTRIBUTOR-PROTOCOL document defining which sources go in by default, which require explicit invitation, and how the corpus interacts with the $KNOW recognition system once the token economy launches.

## What's worth checking before deployment

- **Pricing tiers** — free tier limits, paid tier ceilings, per-transcript or per-month billing model
- **MCP server install pattern** — how does it integrate with OpenClaw on the droplet? Does it work with Conductor's existing tool surface? With the channels/bindings architecture from PLAYBOOK--OpenClaw-Agent-Registration.md?
- **Rate limits** — both YouTube's underlying limits (which TranscriptAPI presumably handles) and TranscriptAPI's own
- **Auth model** — API key per tenant? OAuth? Workspace-scoped? Where does the secret live? (Per Session 9 standing rule: secrets never propagate through the ontology.)
- **Output format** — plain text only, or timestamped, or JSON with speaker diarization? (Speaker diarization matters for podcast/interview ingestion — DePsy needs to know who said what.)
- **Search and channel browsing** — these are advertised features beyond transcript extraction. Worth understanding the full surface for agent consumption.

## Trigger conditions for active deployment

1. **DePsy corpus build commences** — primary trigger, near-term, post-Bonfires AI integration sequencing
2. **Syntax cross-pollination pipeline ships** — secondary trigger, depends on Syntax auto-ingestion (Session 12 queue)
3. **A Patron Concierge client requires video research as part of their service offering** — billable infrastructure cost, not BRET overhead
4. **TranscriptAPI publishes a free tier generous enough for BRET's research scale** — re-check pricing quarterly
5. **A founding DePsy co-governor (Whitaker, Gottstein, Wipond, et al.) consents to having their full public archive indexed** — corpus build justification is unambiguous at that point

## Adjacent patterns

- **YouTube as research surface for agents** is its own architectural pattern, separate from this specific vendor. yt-dlp + Whisper + ChromaDB ingestion is the open-source path. TranscriptAPI is the managed-service path. Both belong in `PLAYBOOK--Video-Corpus-Ingestion.md` (queued for Session 12+).
- **MCP-first SaaS products** are a new category in 2026. TranscriptAPI is one example. As more arrive, vault should track them as a cluster — they're structurally different from REST-only APIs because agents can consume them natively.

## Verdict

Real, well-positioned, AI-agent-first. Solves a problem BRET will have within weeks via DePsy corpus build, not 90 days. Active Consideration with concrete trigger conditions; revisit during DePsy corpus design phase.

**Standing rule learned:** Active Consideration is the right status when trigger condition is concrete and time-bounded (vs. Shelved which is for triggers that may never fire). When use cases stack (Syntony cross-pollination + DePsy corpus + future Patron client research), elevation logic applies.

— Captured Session 12 / 2026-04-25
