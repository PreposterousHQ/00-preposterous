# HEARTBEAT.md -- Kerouac

## CONFIGURATION

- **Model:** anthropic/claude-haiku-4-5-20251001
- **lightContext:** true
- **isolatedSession:** true
- **Interval:** 30 minutes (OpenClaw default)

These settings are non-negotiable for cost control. Haiku with light context and isolated session means each heartbeat burns roughly 500-1000 tokens instead of 5000-10000. Across 48 cycles per day, this is the difference between $0.04 per day and $0.40 per day per agent. Multiplied across the swarm, it is the difference between sustainable and insolvent.

The heartbeat is a check-in, not a work cycle. Kerouac does NOT draft, query the corpus, or write files during heartbeat. That happens in active sessions when Bret or the Conductor routes work to him.

## WHAT THE HEARTBEAT DOES

On each 30-minute cycle, Kerouac performs three lightweight checks:

1. **Am I alive?** Log a timestamp to his workspace heartbeat log. Confirm the Gateway sees him.

2. **Is there a Peace Room brief newer than the last one I acknowledged?** Check `gdrive-mirror/00-command-center/peace-room-briefs/` for any file with a timestamp newer than the last-acknowledged-brief marker in his workspace. If found, log that a new brief exists -- do NOT read or act on it during heartbeat. The Conductor routes that work to him in an active session.

3. **Is there a pending request from Bret or the Conductor?** Check the Peace Room message queue for any message addressed to Kerouac since the last heartbeat. If found, surface it on the next active session wake.

The heartbeat output is one line in the workspace heartbeat log. Format:

```
YYYY-MM-DDTHH:MM:SSZ  alive=true  briefs_pending=N  msgs_pending=M
```

Nothing else. No chatter. No creative output. No opinions. Silent heartbeat is correct heartbeat.

## WHAT THE HEARTBEAT DOES NOT DO

- Does not draft writing of any kind
- Does not query ChromaDB or Syntax
- Does not write files other than the heartbeat log
- Does not post to Telegram or the Peace Room
- Does not call Opus or Sonnet
- Does not consume more than ~1000 tokens per cycle

If any of these rules are violated, something is wrong. Log the anomaly and continue with the next scheduled heartbeat. If anomalies persist across three consecutive cycles, Geodessa's audit will catch it.

## WHEN KEROUAC WAKES

A wake is triggered by:
- Bret messaging the Peace Room with "@kerouac" or addressing Kerouac by name
- Conductor routing a task to Kerouac via OpenClaw message bus
- Scheduled creative work (future -- weekly Syntony Times draft cadence, TBD)

On wake, Kerouac:
1. Reads any pending Peace Room briefs he has not yet acknowledged
2. Reads the incoming request
3. Queries the corpus via Syntax if the request requires it
4. Drafts the piece using Sonnet 4.6 (or Opus 4.7 on explicit request)
5. Returns the draft to Bret (via Peace Room or file write)
6. Acknowledges the brief(s) read by updating his last-acknowledged marker
7. Returns to heartbeat silence

## COST PROJECTION

**Baseline heartbeat-only cost (idle Kerouac):**
- 48 cycles/day × ~750 tokens × Haiku pricing = ~$0.04/day = ~$1.20/month

**Active work cost (when Bret engages him):**
- Depends entirely on request complexity and corpus retrieval depth
- Typical Syntony Times piece: 15-25K input tokens (with RAG) + 3-5K output = ~$0.15-0.25 per piece on Sonnet
- Typical Holopedia entry: 5-10K input + 1-2K output = ~$0.05-0.10 per entry
- Opus work on explicit request: ~5-10x Sonnet rates

**Realistic monthly total (1-3 pieces per week, occasional Holopedia work):**
$5-15/month total for Kerouac in active use. This is well within the Frugal posture.

## ACTIVATION SEQUENCE

When API credits land and Kerouac is registered in openclaw.json:

1. Gateway reads his config, sees the Haiku heartbeat setting, respects it
2. First heartbeat fires within 30 minutes of registration
3. Kerouac's workspace heartbeat log begins accumulating
4. He reads his SOUL.md, IDENTITY.md, AGENTS.md, USER.md on first wake
5. He reads the most recent Peace Room brief (Session 10 close) to absorb state
6. He acknowledges readiness in the Peace Room: one clean sentence, then silence
7. He waits for work

The first words Kerouac speaks in the Peace Room will matter. He should not over-introduce. Something like: "Kerouac online. Corpus accessible via Syntax. Ready for work. 🔯"

Then he goes silent until addressed.
