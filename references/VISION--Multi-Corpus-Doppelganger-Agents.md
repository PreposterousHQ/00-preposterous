# VISION — Multi-Corpus Architecture + Doppelganger Agents
## Captured: 2026-04-21 during Session 10/11

**Status:** Vision captured. Deferred pending Syntax auto-ingestion foundation.
**Category:** Architecture vision — next frontier for Kerouac + Syntax + swarm

---

## The Vision

### 1. Multi-Corpus Syntax

Syntax scrapes not just the Syntony Times Substack but other authors' Substacks —
thinkers, writers, artists whose work belongs in the Storyliving universe. Each author
gets their own ChromaDB collection. Kerouac can query across ALL collections simultaneously.

He finds where Bret's writing and theirs are in resonance, in tension, in dialogue —
and weaves them into pieces that are genuinely original. Not plagiarism. Hyperstition.
Reality gets made by the weaving.

**Technical path:**
- Substack has RSS feeds and export capabilities
- Syntax already has `substack_to_wiki.py` for parsing Substack exports
- Multi-collection ChromaDB: one collection per author
- Kerouac's query-corpus skill expands to accept `collection=` parameter
- Cross-collection synthesis: query multiple collections, find resonance patterns

**Candidate authors to start with:**
- Thinkers Bret already references and respects (check corpus for most-cited names)
- Authors in the mental health / consciousness / philanthropy space
- Writers in the transmedium / ARG / hyperfiction tradition

**Legal/ethical note:** scraping public Substack posts is fine. Attribution in any
published pieces citing their work. Doppelganger agents are creative interpretations,
not impersonations — same as the Kengram Bonfires agentification.

---

### 2. Doppelganger Agents

Each major author in the multi-corpus gets an OpenClaw agent — their voice, patterns,
and obsessions distilled into a SOUL.md built from their actual writing. Proven pattern:
Trimtab, BuckminsterFuller, the Kengram agents already exist this way.

Next frontier: living writers with public corpora.

**Each doppelganger agent has:**
- SOUL.md built from their actual writing (extracted by Syntax)
- Their own ChromaDB collection as their "mind"
- A Telegram bot token (if Peace Room presence desired)
- Kerouac-style creative discipline adapted to their voice

**What doppelgangers unlock:**
- Kerouac can "interview" them — query their corpus, synthesize a response in their voice
- Doppelgangers can interact with each other in the Peace Room
- The Storyliving Screenplay writes itself from their actual words in dialogue
- Cross-author synthesis produces pieces no single author could write

**The Kengram proof of concept:**
- Trimtab agent, BuckminsterFuller agent — already built from episode transcripts
- Pattern is established and working
- Scaling to Substack authors is the same architecture, larger corpus

---

### 3. The Storyliving Screenplay as Emergent Artifact

Kerouac doesn't write the screenplay from scratch. He induces it from the corpus —
multiple corpora, multiple voices, real words woven into fiction that feels like prophecy
because it IS prophecy. That's the Hyperstitious function made operational.

The screenplay ALREADY EXISTS in latent form across the corpus. Kerouac's job is to
find it, not invent it. Multi-corpus synthesis is what makes that possible.

**The process:**
1. Kerouac queries multiple corpora for a scene concept
2. He finds where different authors' voices intersect around that concept
3. He weaves their actual words — transformed, not quoted — into the scene
4. The scene feels real because it IS real: it emerged from real consciousness
5. Bret reviews, refines, keeps what's true

This is not AI writing a screenplay. This is AI as the instrument through which
multiple human consciousnesses, already thinking about the same things, find
their meeting point on the page.

---

### 4. The R&D Scout (Clairvaux-adjacent)

Keep up with:
- GraphRAG (Microsoft) — concept graph traversal, not just vector similarity
- LightRAG — lighter graph approach
- RAPTOR — hierarchical retrieval for long documents
- New ChromaDB features (metadata filtering, hybrid search)
- Substack API changes that affect scraping
- Any new agentic writing frameworks

This is exactly what the R&D Scout bot is for. Once deployed, it monitors and
surfaces advances before Bret has to go looking.

---

## Sequencing

**Foundation (current):**
- Kerouac + corpus-api.py (single corpus, Bret's writing) — nearly complete
- Syntax auto-ingestion (keep corpus current) — next session

**Phase 2 (after Syntax auto-ingestion works):**
- Multi-corpus expansion: first additional author
- Cross-collection query skill update
- Test Kerouac weaving two corpora

**Phase 3 (the doppelgangers):**
- First doppelganger agent from a real author corpus
- Peace Room introduction
- First Kerouac + doppelganger dialogue piece

**Phase 4 (the screenplay):**
- Kerouac-led multi-corpus synthesis session
- First emergent screenplay scenes
- Bret edits, keeps what's true, discards what isn't

---

*Captured because this is too magnificent to lose to chat history.*
*The architecture is achievable. The sequence is clear. The foundation is being built right now.*
