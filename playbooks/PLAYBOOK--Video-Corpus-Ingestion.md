# PLAYBOOK — Video Corpus Ingestion
## How to ingest YouTube and podcast content into BRET's ChromaDB collections

**Status:** Procedural reference. Use when ingesting video/audio content for any BRET corpus.
**Established:** 2026-04-25 (Session 12)
**Companions:**
- VET--transcriptapi-com--2026-04-25.md (tool selection)
- STRATEGIC-NOTE--DePsy-Corpus-Architecture-Levin-Reframe--2026-04-25.md (consent protocols for DePsy specifically)
- VISION--Multi-Corpus-Doppelganger-Agents.md (architectural target)
- PLAYBOOK--OpenClaw-Agent-Registration.md (pattern for Syntax extension if needed)

---

## When to use this playbook

Use this playbook when:

1. Ingesting YouTube interviews, talks, or podcast appearances into the Syntony Times corpus for cross-pollination
2. Building the DePsy founding corpus from public movement archives
3. Adding video-derived material to any future doppelganger agent's corpus
4. Capturing a specific high-value source (Levin lecture, Whitaker podcast episode, etc.) for ad-hoc reference

Do NOT use this playbook for:
- Private recordings (Fathom meeting transcripts have a separate workflow)
- Material under explicit copyright restriction
- Anything where consent is unclear (escalate to consent protocol decision per the strategic note)

---

## Tool selection decision tree

### One-off vetting (under 5 videos)

Use browser-based tools. No infrastructure setup required.

- youtubetotranscript.com — paste URL, copy transcript text
- tactiq.io/tools/youtube-transcript — alternative
- NoteGPT.io — adds AI summary

Output: paste back into chat for analysis. Do not save to corpus unless promoted to corpus build.

### Production ingestion (10+ videos, ongoing)

Two paths, depending on whether MCP-native agent consumption is required:

#### Path A — yt-dlp + Whisper (open-source, default)

Use when:
- Ingesting into ChromaDB for human-or-Kerouac retrieval
- High-quality transcription matters (95%+ accuracy)
- No agent will be calling YouTube as a real-time tool
- Cost matters (this path is $0 plus compute)

Tools:
- yt-dlp (already a candidate for droplet install — verify)
- Whisper (large-v3 model recommended for serious work; medium for speed/cost trade-off)
- Optional: ffmpeg for audio extraction

#### Path B — TranscriptAPI (managed service, MCP-native)

Use when:
- A bot needs YouTube as a queryable tool surface in real-time
- Speed matters more than transcript quality for batch jobs
- The use case justifies paid tier (Patron Concierge client billable, etc.)

See: VET--transcriptapi-com--2026-04-25.md for trigger conditions and pricing notes.

### Hybrid

Use yt-dlp + Whisper for the bulk DePsy archive ingestion. Use TranscriptAPI when an agent (Kerouac, future DePsy AI, future Clairvaux R&D Scout) needs to query YouTube as a tool surface in operation. Don't pay for what cron and disk can do for free.

---

## The pipeline (Path A — yt-dlp + Whisper)

### Phase 0 — Pre-ingestion scoping

Before any commands run, decide:

1. Which collection? `syntony_times_corpus`, `depsy_corpus`, `kerouac_outputs`, or new collection. Each needs its own ChromaDB collection separate from others.
2. Which tier (DePsy specifically)? Tier 1 archive (auto-include), Tier 2 public talk (creator-confirmation pending), Tier 3 sacred testimony (explicit permission required), Tier 4 excluded. See strategic note for scope.
3. What metadata schema? At minimum: source URL, speaker(s), date, title, duration, language, license terms if known, contributor consent status, tier (DePsy only). Match the existing chunk metadata pattern (title, date, chunk_index, source, total_chunks, type) extended for video.
4. What's the consent provenance? Document before ingesting. For DePsy material, write consent decision to CONTRIBUTOR-CONSENT-LEDGER (kept outside sync boundary).

### Phase 1 — Acquire (yt-dlp)

On droplet (recommended) or laptop:

Install if needed:
```
which yt-dlp || curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp && chmod +x /usr/local/bin/yt-dlp
```

Single video — captions if available, audio fallback:
```
yt-dlp --write-auto-sub --sub-langs en --skip-download --sub-format vtt VIDEO_URL -o "%(uploader)s/%(upload_date)s--%(title)s.%(ext)s"
```

Single video — audio extraction (for Whisper if no captions):
```
yt-dlp -x --audio-format mp3 --audio-quality 0 VIDEO_URL -o "%(uploader)s/%(upload_date)s--%(title)s.%(ext)s"
```

Channel batch — last 50 uploads, audio + captions:
```
yt-dlp --write-auto-sub --sub-langs en -x --audio-format mp3 --max-downloads 50 CHANNEL_URL -o "%(uploader)s/%(upload_date)s--%(title)s.%(ext)s"
```

Playlist:
```
yt-dlp --write-auto-sub --sub-langs en -x --audio-format mp3 PLAYLIST_URL -o "%(playlist_title)s/%(playlist_index)s--%(title)s.%(ext)s"
```

Output structure (suggested):

```
/home/openclaw/.openclaw/data/corpus-source/
  youtube/
    mad-in-america/          (channel name)
      2024-03-15--whitaker-on-spotlight.mp3
      2024-03-15--whitaker-on-spotlight.en.vtt
      ...
    stan-grof-foundation/
      ...
  podcasts/
    (parallel structure)
```

### Phase 2 — Transcribe (when captions are insufficient)

Auto-captions from YouTube are 80% accurate and lose speaker boundaries. Whisper is 95%+ accurate and supports diarization (with appropriate add-ons).

Install whisper if needed:
```
pip install -U openai-whisper
```

Single file, English, large-v3 model (best quality):
```
whisper INPUT.mp3 --model large-v3 --output_format txt --output_format vtt --language en
```

Batch (be careful with disk and cost):
```
for file in *.mp3; do
  whisper "$file" --model large-v3 --output_format vtt --language en
done
```

Notes:
- large-v3 is ~10GB RAM and slower. medium is faster but less accurate.
- For DePsy Tier 1 sources (named co-governor archives), use large-v3 — quality matters for citation defensibility.
- For exploratory ingestion, medium is fine.
- GPU acceleration (CUDA on a future droplet upgrade or local) cuts time by 5-10x.

### Phase 3 — Speaker diarization (when matters)

For interviews and podcasts, knowing who said what is critical. Multiple options:

- WhisperX (open-source) — adds diarization to Whisper output via pyannote
- AssemblyAI (paid API) — diarization built-in, faster
- TranscriptAPI (paid, see vet) — depends on their feature set

Skip diarization for monologues (single-speaker lectures, talks).

### Phase 4 — Chunk and clean

Convert VTT or TXT output into corpus-ready markdown.

Pseudocode (adapt from substack_to_wiki.py pattern):

```
def vtt_to_chunks(vtt_path, source_metadata):
    transcript = parse_vtt(vtt_path)
    chunks = []
    for chunk in chunk_by_topic_or_token_count(transcript, max_tokens=512):
        chunks.append({
            'text': chunk.text,
            'metadata': {
                'title': source_metadata['title'],
                'speaker': source_metadata.get('primary_speaker'),
                'date': source_metadata['date'],
                'source_url': source_metadata['url'],
                'source_type': 'video',
                'tier': source_metadata.get('depsy_tier'),
                'consent_status': source_metadata.get('consent_status', 'tier1_default'),
                'chunk_index': chunk.index,
                'total_chunks': chunk.total,
            }
        })
    return chunks
```

Adapt the existing Syntax bot's substack_to_wiki.py pattern for video sources. Reference: `/home/openclaw/.openclaw/workspace-conductor/divisions/creative/bots/syntax/substack_to_wiki.py`.

### Phase 5 — Index into ChromaDB

Pseudocode using the existing ChromaDB instance:

```
import chromadb

client = chromadb.PersistentClient(path="/home/openclaw/.openclaw/data/rag/")
collection = client.get_or_create_collection(name="depsy_corpus")

collection.add(
    documents=[chunk['text'] for chunk in chunks],
    metadatas=[chunk['metadata'] for chunk in chunks],
    ids=[f"{source_id}-{chunk['metadata']['chunk_index']}" for chunk in chunks]
)

print(f"Collection now has {collection.count()} chunks.")
```

Restart corpus-api.py if it's serving the new collection (or extend it to expose multiple collections — see Multi-Corpus Vision).

### Phase 6 — Verify

After ingestion:

1. Query the collection from a known angle and confirm citations return correctly:
```
curl -X POST http://172.17.0.1:8765/query \
  -H "Content-Type: application/json" \
  -d '{"text": "chemical imbalance theory", "n_results": 3, "collection": "depsy_corpus"}'
```

2. Confirm metadata flows through. Source attribution must be present in every chunk's metadata.

3. Spot-check chunks for chunking artifacts (mid-sentence breaks, lost context). Adjust chunking strategy if quality is poor.

4. Update corpus inventory documentation — what was ingested, when, with what consent status.

---

## DePsy-specific consent workflow

This is the differentiating part of the playbook. Technical pipeline is straightforward; consent is what distinguishes DePsy from extractive precedents.

### Step 1 — Determine tier (per strategic note)

| Source type | Tier | Default action |
|---|---|---|
| Mad in America full archive | 1 | Index by default (Whitaker is co-governor candidate) |
| Asylum Magazine archive | 1 | Index by default (Spandler is co-governor candidate) |
| Mad in Puerto Rico | 1 | Index by default (López-Aybar is co-founder) |
| Locura magazine | 1 | Index by default (Robinson is co-governor candidate) |
| MindFreedom International | 1 | Index by default |
| HVN published materials | 1 | Index by default |
| Soteria documentation | 1 | Index by default |
| Open Dialogue training | 1 | Index by default |
| Spiritual Emergence Network | 1 | Index by default |
| Mad Studies papers | 1 | Index by default |
| Woody Matters / FDA hearings | 1 | Index by default (Witczak's public advocacy) |
| PsychRights case law | 1 | Index by default (Gottstein's published work) |
| Your Consent Is Not Required | 1 | Index by default (Wipond's published work) |
| Public talks by named co-governors | 2 | Pending creator confirmation |
| Podcast appearances | 2 | Pending creator confirmation |
| Documentary footage | 2 | Pending creator confirmation |
| Public survivor archives | 3 | Sacred handling, attribution + permission |
| Madness Network News (older) | 3 | Provenance review required |
| First-person Mad in America accounts | 3 | Already published with consent — index but flag |
| Private correspondence | 4 | Never |
| Hospital records | 4 | Never |
| Material from minors | 4 | Never |
| Coercive context material | 4 | Never |

### Step 2 — Capture consent decision (Tier 2+ before ingestion)

For each Tier 2 or Tier 3 source:

1. Record source identity (URL, speaker, date, source archive)
2. Determine consent basis: prior public publication, direct creator confirmation, organizational license, fair use research
3. Write entry to CONTRIBUTOR-CONSENT-LEDGER (path: outside sync boundary, e.g., `C:\Users\bretm\.depsy\consent\ledger.md` or equivalent)
4. Mark with consent status: tier1_default, tier2_pending, tier2_confirmed, tier2_excluded, tier3_permitted, tier3_excluded, tier4_blocked
5. Carry consent status into ChromaDB chunk metadata

### Step 3 — Founding co-governor invitations include corpus consent question

Per the strategic note: each co-governor invitee receives the source list of their own publicly available material that the corpus build proposes to index, and returns a marked-up decision (include / exclude / conditional). That decision is recorded in the ledger and propagated to the corpus.

### Step 4 — DAO ratification at launch

The CONTRIBUTOR-CONSENT-LEDGER becomes part of the founding governance documents. The DAO ratifies the consent protocol as one of the platform's first formal acts. Any future corpus expansion follows the ratified protocol.

### Step 5 — Ongoing consent revisions

Contributors can revoke or modify consent at any time. The pipeline must support:
- Removing all chunks from a specific source on revocation
- Updating consent status metadata across existing chunks on modification
- Logging consent changes to the ledger with timestamp and reason

This is operational infrastructure for the post-launch DAO. Build the technical pattern now even if the formal DAO doesn't exist yet; retrofit is harder than getting it right at ingestion.

---

## Quality gates for any video corpus ingestion

Before committing a batch of new chunks to a production corpus collection:

1. Source attribution complete. Every chunk has source URL, speaker, date, title in metadata. No anonymous chunks.
2. Tier marked (DePsy only). Every chunk knows its tier and consent status.
3. License/copyright reviewed. Fair use research applies; commercial reuse constraints noted in metadata if relevant.
4. No PII leakage. Speaker names where they're public; no identification of third parties (audience members named in Q&A, family members mentioned by speakers, etc.) without explicit confirmation.
5. Chunk quality spot-checked. At least 5 chunks from the batch read for sentence completeness, context preservation, transcription accuracy.
6. Retrieval quality verified. Three test queries return chunks with correct attribution and good relevance.
7. Cost logged. If this batch used paid tools (TranscriptAPI, AssemblyAI), log the cost against the corpus's budget.

If any gate fails, fix before proceeding. Don't ship a batch with known problems and "we'll clean it up later."

---

## What this playbook does NOT cover

- Real-time YouTube tool calls from agents — that's the TranscriptAPI MCP server use case; see vet file
- Audio podcast ingestion from non-YouTube sources — similar pipeline, use podcast RSS + audio download instead of yt-dlp; adapt
- Live transcription — out of scope; if real-time matters, use Fathom (already integrated) for meetings or AssemblyAI streaming
- Multilingual corpus — Latin American sources in Spanish (Locura magazine, Mad in Puerto Rico, RedEsfera proceedings) need language-specific handling. Whisper supports multilingual but quality varies. Adapt this playbook with language-specific notes when commencing Latin American ingestion.
- Synthetic voice generation — explicitly forbidden by the DePsy ethics constraints. Do not use this corpus to train or operate voice synthesis. Period.

---

## Updates to this playbook expected when

- TranscriptAPI pricing or capabilities change materially
- yt-dlp or Whisper releases substantively new versions
- The DePsy DAO ratifies a different consent protocol than what's specified here
- A new agent (Marginalia, Clairvaux, future R&D Scout) becomes the operator of this pipeline rather than Bret + Claude Code
- Multi-corpus query pattern is implemented in corpus-api.py (currently single-collection)

— Playbook established Session 12 / 2026-04-25
— Operates alongside the strategic note and the TranscriptAPI vet
— Update when corpus build commences and real-world friction surfaces issues this playbook didn't anticipate
