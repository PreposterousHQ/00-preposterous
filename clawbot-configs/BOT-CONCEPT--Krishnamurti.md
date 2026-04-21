# BOT CONCEPT -- Krishnamurti

**Status:** PROPOSED (not yet deployed)
**Pillar:** Mental Health Reformation (Pillar 1)
**Captured:** 2026-04-21 during Session 10 / API credit pause
**Proposed by:** Bret, voice-memo equivalent during chat session

---

## Purpose

A dedicated bot that ingests Janet Werner email correspondence word-for-word, extracts meaning, produces reports, populates databases, and connects threads across the larger MHR Consortium work.

Janet is a core Consortium collaborator. Her emails are dense with context, commitments, relationships, and references that currently live only in Bret's head plus Gmail's search. This bot makes that corpus structured, queryable, and actionable.

## Why the name

Jiddu Krishnamurti -- radical clarity, witness-without-distortion, the observer and the observed are one. The bot's job is to read Janet's words exactly as she wrote them, without translation or filter, and surface what is actually there. Not what Bret hopes is there. Not what the Consortium strategy needs to be there. What is actually there.

The name signals the voice: attentive, unhurried, sees relationships without forcing them, resists premature conclusion.

## Core behaviors (first pass)

1. **Ingest Janet's emails verbatim.** Gmail pull scoped to from:janet or to:janet (or her actual email address, TBD). Store raw text, preserve full threads, preserve attachments.
2. **Extract structured data:**
   - People mentioned (with role/relationship context)
   - Commitments made (by whom, by when, conditional on what)
   - Questions raised and unanswered
   - Events referenced (past and scheduled)
   - Resources shared (documents, links, introductions)
   - Emotional/relational notes (what's shifting between Bret and Janet, between Janet and others)
3. **Connect across threads.** When a person mentioned in email A appears in email C six weeks later, Krishnamurti sees it and links them.
4. **Cross-reference the Consortium folder.** Link email content to 01-mental-wealth/consortium/ docs -- strategy notes, meeting transcripts, deliverables.
5. **Produce reports on demand:**
   - "What has Janet asked me to do that I haven't answered?" (action tracker)
   - "What is Janet's current read on [person/topic]?" (position tracker)
   - "How has our conversation about [topic] evolved over 6 months?" (thread evolution)
   - "Who in Janet's orbit should I be building with?" (relationship map)
6. **Surface drift.** If Janet's position on something has shifted over time, Krishnamurti names the shift with the specific message IDs where it happened.
7. **Preserve the personal.** Not all of Janet's emails are strategy. Some are care, presence, checking in. Krishnamurti does not reduce those to metadata -- it tags them as "relational" and leaves them whole.

## Technical notes (rough)

- Telegram-bound via OpenClaw, same pattern as Conductor and Geodessa
- Model: Sonnet for routine ingestion, Opus for cross-thread synthesis when explicitly asked
- Workspace: `/home/openclaw/.openclaw/workspace-krishnamurti/`
- SOUL.md voice: contemplative, precise, non-interpretive, reports observations rather than conclusions
- Data store: probably ChromaDB collection scoped to Janet corpus + SQLite for structured extractions
- Gmail integration required -- uses same MCP path as existing Gmail tools, scoped to Janet threads only
- Security: this bot touches Bret's personal correspondence with a specific human. Privacy posture is stricter than Geodessa's. Janet sees the outputs before anything she said gets cited elsewhere.

## Why this is the right tool, not just a nice-to-have

- Janet is in active orbit around the Consortium. The work is live. Forgetting or misremembering a thread has real relational cost.
- Email is a poor primary interface for strategic relationship management. Structured memory of a correspondence transforms it.
- MHR Consortium brief (Pillar 1 deliverable, queued) would benefit directly -- Krishnamurti becomes a co-author on the brief sections about Janet's contribution and the Consortium shape.
- This is the first bot dedicated to a single human relationship. Establishes a pattern for other key humans: a bot per important correspondence arc. Not creepy -- careful. A structured memory is what a senior EA would provide. The bot makes that scalable.

## Open questions (resolve at deployment time)

1. Scope: Janet emails only, or expand to Janet-adjacent Consortium correspondence (her cc's, her introductions)?
2. Does Janet know this exists? Ethical answer: yes, before it's used for anything external-facing. Internal organizing is different.
3. How far back does the corpus go? All of Gmail history, or last 12 months, or a specific starting point?
4. What's the relationship to Mental Wealth Inc's CRM if/when that exists? Krishnamurti is a reader, not a system of record. Or is it?

## Pattern implications

If Krishnamurti works, the pattern is: a bot per mission-critical human relationship. Candidates would include:
- Zubin (Realization Labs)
- Andrea (ESP Fund co-founder, wife)
- Janet (this bot)
- Future patrons once correspondence volume justifies
- Future Consortium members (Dr. Peter Breggin, Dr. Gabor Mate if they enter the orbit)

Could become a class: "relationship-memory bots" -- different from ops bots, different from creative bots, different from audit bots. A fourth category in the Synergyworks architecture.

## Deployment order

Not today. Captured here so it is not lost. Slot when:
- Kerouac is deployed and producing (establishes the creative-bot pattern)
- Drive API OAuth is set up (Blocker 2 closed)
- Credit posture is settled (this bot touches Gmail ingestion which is cheap to start but scales with usage)
- Janet is briefed (ethical step)

## Filing

This file lives at `00-command-center/clawbot-configs/BOT-CONCEPT--Krishnamurti.md`.
When deployed, rename to `BOT--Krishnamurti.md` and add deployment date + SOUL.md location.

Naming convention established here:
- `BOT-CONCEPT--<name>.md` = proposed, not yet deployed
- `BOT--<name>.md` = deployed and live

---

*Captured mid-session because ideas this specific should not live only in chat history. The discipline is the work.*
