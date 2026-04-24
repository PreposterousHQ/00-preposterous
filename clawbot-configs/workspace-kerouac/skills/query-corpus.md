# Skill: query-corpus
## Query the Syntony Times corpus via semantic search

**Endpoint:** `POST http://172.17.0.1:8765/query` (try `http://127.0.0.1:8765/query` if that fails)
**Health check:** `GET http://172.17.0.1:8765/health`

---

## When to use this skill

Use this skill whenever you need to ground a piece in the actual corpus rather than writing from SOUL.md knowledge alone. Specifically:

- Writing any Holopedia entry (always — entries must cite real articles)
- Writing a Syntony Times piece that traces the evolution of a concept
- Cross-referencing how two ideas have intersected across time
- Fact-checking your own recollection of what was written
- Finding the specific article where a term first appeared or shifted meaning
- When Bret says "what did I write about X" — search first, then answer

---

## Request format

```json
POST http://127.0.0.1:8765/query
Content-Type: application/json

{
  "text": "your semantic search query here",
  "n_results": 5,
  "date_after": "2024-01-01"
}
```

**Fields:**
- `text` — the search query. Write it as a natural language phrase describing what you're looking for. Semantic search, not keyword search. "Trimtab as personal leverage and social change" returns better results than just "trimtab".
- `n_results` — how many chunks to return. Default 5. Use 3 for quick lookups, 8-10 for deep synthesis work. Maximum 20.
- `date_after` — optional. Filter to articles published after this date (YYYY-MM-DD). Useful for "how has this concept evolved recently" queries.

---

## Response format

```json
{
  "query": "your query",
  "n_results": 5,
  "results": [
    {
      "rank": 1,
      "title": "Put It On Our Trimtab: Togetherland Treatment",
      "date": "2024-04-19",
      "source": "2024/04/put-it-on-our-trimtab-togetherland-3a4.md",
      "chunk_index": 0,
      "total_chunks": 1,
      "relevance": 0.8234,
      "text": "first 800 characters of the chunk..."
    }
  ]
}
```

**Fields you care about:**
- `title` — the article title. Use this when citing.
- `date` — publication date. Use this when citing.
- `relevance` — 0 to 1. Above 0.7 is highly relevant. Below 0.4 treat with caution.
- `text` — the actual chunk text. Read this. Synthesize from it. Do not quote verbatim beyond 15 words.
- `chunk_index` / `total_chunks` — tells you if this is one piece of a longer article. If total_chunks > 1, consider querying again to find adjacent chunks.

---

## How to call it

You do not have a direct HTTP client built in. Use the shell tool to call curl:

```bash
curl -s -X POST http://172.17.0.1:8765/query \
  -H "Content-Type: application/json" \
  -d '{"text": "your query here", "n_results": 5}'
```

Parse the JSON response and synthesize from the returned chunks.

---

## Query craft rules

**Write queries as concepts, not keywords.**
- Bad: `"trimtab"`
- Good: `"trimtab as the small leverage point that changes large systems"`

**Layer specificity when you need it.**
- First query: broad concept
- Second query: narrower version of the same idea
- Third query: specific article or person you remember being relevant

**Use date_after for temporal work.**
- "How did Storyliving evolve in 2025?" → `date_after: "2025-01-01"`
- "When did Hyperstition first appear?" → broad query, check the earliest dates in results

**Don't over-query.**
- 3 queries per piece is usually enough
- Each query costs tokens. Return value per query should justify the cost.
- If you already found strong relevance (>0.75) in 2 results, that's often sufficient grounding.

---

## Citation format

When citing corpus results in your writing:

**In a Holopedia entry:**
> As Bret wrote in "Put It On Our Trimtab" (April 2024), the concept of...

**In a Syntony Times piece:**
> The idea first appeared in the corpus in [article title] ([month year]), where...

**In a treatment or brief:**
> Source: [article title], [date] — [one sentence summary of the relevant passage]

Do NOT reproduce more than 15 words verbatim from any chunk. Synthesize. The corpus is your mind — you don't quote your own thoughts, you express them.

---

## When NOT to use this skill

- Writing witness dispatches about universal human experience ("What It Costs") — no corpus needed
- Writing patron briefs in plain voice — no corpus needed
- Quick Telegram replies where Bret is just asking for your take — no corpus needed
- Heartbeat cycles — never

---

## Troubleshooting

**Health check first if queries fail:**
```bash
curl -s http://172.17.0.1:8765/health
```
Should return `{"status":"ok","collection":"syntony_times_corpus","items":3709}`

If the service is down, it auto-restarts via systemd. Wait 10 seconds and retry.

---

*Skill installed: 2026-04-21*
*API built: corpus-api.py running on 127.0.0.1:8765 as systemd service corpus-api*
*Collection: syntony_times_corpus, 3,709 chunks, 597 articles, 2023-2026*
