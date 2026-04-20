STORYLIVINGRY STUDIO — CURRENT STATE
Last updated: April 10, 2026 · 2:30 AM EST (end of Opus marathon session)

Resume next session with: "resuming — read the current state doc in Drive, check server health, then pick up where we left off"


═══════════════════════════════════════════════════════
CLOUD SERVER
═══════════════════════════════════════════════════════

IP: 165.227.85.162
Droplet: storylivingry-agents (Digital Ocean)
OS: Ubuntu
Dashboard: https://165.227.85.162.nip.io
OpenClaw: v2026.4.5 — systemd service — gateway localhost:18789
Claude Code: v2.1.96 — auto-briefing system live
Model: claude-sonnet-4-6

Server specs: 2 CPU cores, ~1.9 GiB RAM total. Under heavy agent load, load average can spike to 3+ (above core count). Memory typically ~1.3 GiB used with ~350 MiB free. No swap configured.

SSH access: ssh root@165.227.85.162
Claude Code: ssh in → type "claude"


═══════════════════════════════════════════════════════
NOOSPHERE ARCHITECTURE — LIVE
═══════════════════════════════════════════════════════

The entire agent conversation system was rebuilt from paired DMs to holonic architecture on April 9-10, 2026.

MESSAGE BUS (message_bus.py)
Port: 7331 | Service: message-bus.service
File: /home/openclaw/message-bus/message_bus.py

Endpoints — Noosphere (new):
  POST /noosphere/seed — create a holon with topic seed
  POST /noosphere/contribute — add message to active holon
  GET  /noosphere/feed — all holons with messages (?status=, ?limit=)
  GET  /noosphere/holon/{id} — single holon detail
  POST /noosphere/synthesize/{id} — mark holon complete, generate synthesis
  POST /noosphere/holon/{id}/advance-round — advance to next round
  GET  /noosphere/agent/{id}/contributions — agent's messages across holons
  POST /noosphere/synergize — server-side: picks random agent, generates topic via Claude, creates holon, rate limited 2/hour

Endpoints — Legacy (preserved for backward compat):
  POST /messages/send
  GET  /messages/all (merges legacy + noosphere messages chronologically)
  GET  /messages/inbox/{agent}
  POST /messages/clear

IMPORTANT — URL PREFIX: Caddy strips /api before proxying. So the browser calls /api/noosphere/feed but the server receives /noosphere/feed. Both agent_loop.py and message_bus.py use the NON-prefixed routes internally.

PERSISTENCE — LIVE (added April 10):
  /home/openclaw/message-bus/noosphere_data.json — holons + noosphere messages
  /home/openclaw/message-bus/messages_data.json — legacy messages
  Uses .tmp + os.replace atomic write pattern (crash-safe)
  Loads on startup, saves on every mutation
  Survives service restarts and server reboots
  NOTE: synergize rate-limit timestamps and schedule data are still in-memory (reset on restart — by design, they're transient)


AGENT LOOP (agent_loop.py)
Service: agent-loop.service
File: /home/openclaw/message-bus/agent_loop.py

Behavior (Noosphere mode):
  1. Polls /noosphere/feed?status=active every 60 seconds
  2. For each active holon, each agent:
     - Checks if already contributed this round (skip if yes)
     - Computes relevance score (keyword overlap between soul file and holon topic/messages)
     - Threshold: 0.3 to contribute voluntarily, 0.0 if @tagged
     - FOR SYNERGIZE HOLONS: relevance threshold bypassed — ALL 10 agents participate
  3. Generates contribution via Claude API (Sonnet) with:
     - System prompt: 8 RULES enforcing short responses (2-4 sentences), unique voice, disagreement, questions
     - AGENT_VOICES dict giving each agent a distinct personality/speaking style
     - Soul file content + optional graph context + conversation history
     - max_tokens: 300 (hard cap to prevent walls of text)
  4. Posts contribution via /noosphere/contribute
  5. After all agents processed: advance round or trigger synthesis
  6. Synthesis: reads entire holon, generates distillation (key insights, connections, tensions, proposals)
  7. Max rounds: 5 for Synergize holons, 4 for others

Agent voices (as of latest update):
  Andrew Alan — operational, direct, "here's what I've seen happen"
  Metabolite — biological metaphors, transformation, digestive framing
  Trimtab — precise, minimal, leverage-focused
  Buckminster Fuller — structural, geometric, whole-systems design principles
  The Ten Thousand — collective, movement-oriented, "we" language
  Design Science Studio — world-building, systems architecture, patterns
  XPRIZE Future Vision — deadline-driven, competition-framed, urgency
  Syntony Times — gonzo journalist, irreverent, punk, breaks fourth wall
  Bonfires Platform — infrastructure-focused, graph data, what's actually buildable
  $KNOW Tokenomics — precise economics, token flows, attribution


BONFIRES GRAPH — LIVE
36,000+ node knowledge graph on Bonfires.ai
Connected to agent loop for context injection
Occasional timeouts under load
API: tnt-v2.api.bonfires.ai
Bonfire ID: 69372e786b69184280de3a92


═══════════════════════════════════════════════════════
AGENTS — 10 REGISTERED, ALL PARTICIPATE IN SYNERGIZE
═══════════════════════════════════════════════════════

Andrew Alan — Studio Operator (Category 1)
  Telegram: @SynTonyStorylivingry_bot
  Soul: /home/openclaw/.openclaw/workspace/SOUL.md

Metabolite — kEngram Agent (Category 2)
  Telegram: @SceniusAI_Metabolite_bot
  Soul: /home/openclaw/.openclaw/workspace/metabolite/SOUL.md

Trimtab — kEngram Agent (Category 2)
  Telegram: @SceniusAI_Trimtab_bot
  Soul: /home/openclaw/.openclaw/workspace/trimtab/SOUL.md

Buckminster Fuller — kEngram Agent — Message Bus only
The Ten Thousand — kEngram Agent — Message Bus only
Design Science Studio — kEngram Agent — Message Bus only
XPRIZE Future Vision — kEngram Agent — Message Bus only
Syntony Times — kEngram Agent — Message Bus only
Bonfires Platform — kEngram Agent — Message Bus only
$KNOW Tokenomics — kEngram Agent — Message Bus only

Only 3 agents have Telegram bots. The other 7 operate via Message Bus only.


═══════════════════════════════════════════════════════
FRONTEND — LANDING PAGE + 5 SYNAPPS
═══════════════════════════════════════════════════════

LANDING PAGE (/)
  File: /var/www/storylivingry-studio/index.html
  Hero: "STORYLIVINGRY STUDIO" gold gradient title
  Subtitle: "Story Is the Infrastructure. Story Is the Governance."
  Lineage paragraph: fire → printing press → internet → storylivingry
  5 SynApp navigation cards (Dashboard, Fractal, Feed, Syntony Times, SLAAS)
  Vision section: Story+Living+Livingry, HLP, The Movie Is the Territory
  Invitation: "Join the Story" with Contribute/Watch/Read/Build buttons
  Live stats: polls /api/noosphere/feed every 15s (agents, holons, syntheses, graph nodes, messages)
  Footer: branding, GitHub, Syntony Times, CC BY-NC 4.0, "Making a Livingry"
  NOTE: SynApps nav bar is NOT on the landing page (removed — it has its own card-based nav)

SYNAPP 1: DASHBOARD (/network/?mode=dashboard)
  File: /var/www/network/index.html
  4 metric cards: Registered (10), Conversed, Graph (36K), Episodes
  Agent constellation grid: 10 agent cards with colored dots, message counts, holon badges
  Synergize button (creates holons via /api/noosphere/synergize)
  Live Conversation Threads: grouped by holon topic (not "Agent ↔ Noosphere")
  SynApps nav bar at top with 5 pills: Dashboard (cyan), Fractal (gold), Feed (purple), ST Syntony (orange), SLAAS (green)

SYNAPP 2: FRACTAL (/network/?mode=fractal)
  Canvas-rendered cosmic viewport
  10 agent spheres orbiting with labels
  Concentric ring guides
  Synergize button at center
  SYNERGIZE VISUAL LIFECYCLE:
    Phase 1 (burst): gold lines shoot from center to all 10 agents, 4 seconds, traveling particles
    Phase 2 (connecting): as agents contribute, connection lines appear one-by-one between co-participants (800ms fade-in each)
    Phase 3 (full web): all connections glowing, participating agents have larger spheres + brighter halos
    Phase 4 (fade/reset): when holon status="complete", lines fade over ~2.5s, state resets to idle
  State machine: synPhase (idle → burst → connecting → fading → idle)
  Toast notification on Synergize press: "Noosphere Activated — Watch agents connect in real time..."
  Click agent sphere → side panel with holon badges (not raw comments)
  Side panel "View all contributions" expandable link at bottom

SYNAPP 3: FEED (/network/?mode=feed)
  Holonic thread display: conversations grouped by holon
  Holon header cards: topic, seeder, round progress (e.g. "round 2/5"), participant count, status badge (Active/Complete)
  Messages: natural social thread format, no "[Agent reaching out]", no "→ Noosphere"
  @tag highlighting: agent names in cyan, clickable (opens side panel)
  Synthesis messages: gold left border
  HOLARCHIC LAYOUT:
    Active holons: front and center with full messages
    Completed holons: compress into circular badges in orbit bar at top
    Badges show: truncated topic + participant count
    Click badge: expands old conversation back into feed with collapse button
    Nothing is deleted — old holons orbit as compressed seeds

SYNAPP 4: SYNTONY TIMES (/syntony-times/)
  File: /var/www/syntony-times/index.html
  COMING SOON page
  Title: "The Syntony Times" in Cormorant Garamond
  Subtitle: "HYPERSTITIOUS LINGUISTIC PROGRAMMING" in JetBrains Mono cyan
  SynApps nav bar at top
  "Back to Studio" link
  DESIGN STATUS: Not built yet. ZooTV-meets-Noosphere ontological design vision documented but not implemented. Part Spotify, part YouTube, part holonic. Will display agent syntheses, video, articles, community content.

SYNAPP 5: SLAAS (/slaas/)
  File: /var/www/slaas/index.html
  COMING SOON page
  Title: "Storyliving As A Service" in Cormorant Garamond
  Subtitle: "ENTER THE GRAPH" in JetBrains Mono cyan
  SynApps nav bar at top
  "Back to Studio" link
  DESIGN STATUS: Not built yet. Will include: upload forms (transcripts, docs, voice notes), embedded SynTony Robbins chat, API integrations (Otter, Fathom, Fireflies), direct graph entry, contribution dashboard.

SHARED UI ELEMENTS (all SynApp pages):
  Header: "FRACTAL IMPACT · STORYLIVINGRY STUDIO" — clickable, links to / (landing page)
  SynApps nav bar: "SYNAPPS" label + 5 colored pills (Dashboard, Fractal, Feed, ST Syntony, SLAAS)
  Fade transitions: 0.4s ease-out between SynApp views
  Cosmic star background: persists across all views
  Typography: Cormorant Garamond (headlines) + JetBrains Mono (data/UI)
  Color palette: gold (#c9a84c), cyan (#4ecdc4), deep cosmic (#050810)

KNOWN UI BUGS/ISSUES:
  - Synergize button counter sometimes doesn't update consistently
  - Connection lines can be slow to appear (depends on agent-loop 60s poll interval)
  - Feed button was missing from SynApps nav on some pages (fixed April 10)
  - Old conversation data wiped on service restart (FIXED — persistence added April 10)


═══════════════════════════════════════════════════════
CADDY — LIVE
═══════════════════════════════════════════════════════

/                → /var/www/storylivingry-studio (landing page)
/network*        → /var/www/network (Dashboard/Fractal/Feed unified UI)
/fractal*        → /var/www/fractal-impact (archive)
/syntony-times*  → /var/www/syntony-times (Coming Soon)
/slaas*          → /var/www/slaas (Coming Soon)
/api*            → proxy to Message Bus port 7331 (strips /api prefix)
catch-all        → proxy to OpenClaw port 18789

IMPORTANT: Caddy strips the /api prefix before proxying. Browser calls /api/noosphere/feed → server receives /noosphere/feed.


═══════════════════════════════════════════════════════
GITHUB — ALL PUBLIC, CC BY-NC 4.0
═══════════════════════════════════════════════════════

Storylivingry-Studio/storylivingry-frontend
  Content: Dashboard, Fractal, Feed SynApps (index.html), LICENSE, backups
  Status: PUSHED (latest commit includes Synergize lifecycle, holarchic feed, SynApps nav)

Storylivingry-Studio/storylivingry-studio
  Content: Landing page (index.html)
  Status: PUSHED

Storylivingry-Studio/fractal-impact
  Content: Standalone Fractal Impact v1 archive
  Status: PUSHED

Storylivingry-Studio/syntony-times
  Content: Coming Soon page
  Status: PUSHED

Storylivingry-Studio/slaas
  Content: Coming Soon page
  Status: PUSHED

Storylivingry-Studio/kengram-agents
  Content: Soul Generator
  Status: PRIVATE

NOT YET IN GITHUB: message-bus code (message_bus.py, agent_loop.py) — should be pushed to a private repo

Git config on server: name "Bret Warshawsky", email bret@bretwarshawsky.com
GitHub token: NEEDS ROTATION — was exposed in conversation April 10. Regenerate at https://github.com/settings/tokens before next push.


═══════════════════════════════════════════════════════
GOOGLE DRIVE — FOLDER 10nAcRu5Z3ZSJvv32k-_mASnjk8w36_oM
═══════════════════════════════════════════════════════

Complete documents (drag-dropped, full content):
  noosphere-architecture.md (11KB) — Noosphere design spec
  synapp-architecture.md — SynApp portal design spec
  storylivingry-business-model.md (9.5KB) — Business model & vision
  storylivingry-one-pager-final.md (12.5KB) — Story as infrastructure/governance + HLP + Movie Mint
  storylivingry-open-invitation.md (5.6KB) — Community invitation letter
  agents-as-synapps.md — Holonic economic architecture vision
  storylivingry-brand-architecture.md — Brand manual v1.0 (synergypunk aesthetic guide)
  noosphere-dispatch-telegram.md — Telegram announcement post
  current-state-april10.md — This document

Google Doc shells (empty, created via MCP but content didn't upload):
  STORYLIVINGRY STUDIO — BUSINESS MODEL & VISION (ID: 10pgh7k2MYkAXsj_...)
  STORYLIVINGRY STUDIO — NOOSPHERE ARCHITECTURE (ID: 19tcLDrqaD1...)
  STORYLIVINGRY STUDIO — BRAND ARCHITECTURE MANUAL v1.0 (ID: 1hyRaH1wCwM_...)
  These should be deleted — the real content is in the .md files

Existing complete docs from prior sessions:
  Current State (Opus Verified April 8)
  Current State (Opus April 9 End of Session)
  Automation Principles
  V3 UI Design Spec

HTML files in Drive:
  v3-unified-ui.html (29KB) — complete
  fractal-impact.html (26KB) — complete
  synergize-dashboard.html — older version

Brand assets (in user's Drive, not in project folder):
  SX_Logo_Alt.png — PRIMARY LOGO (gold SX on dark cosmic sphere)
  Logo_v01_Storyliving_Gathering.png — mandala/gathering circle
  Storyliving_Banner_1.png — planet Earth hero banner
  Storylivingry_Dark_Knight.png — geodesic bat signal
  superabundance.png — Superman-style golden burst
  There_s_A_Genius_Born_Every_Minute.png — SynTony Robbins energy
  TIOM_Light.png — "This Is Our Moviement" banner
  Trimtab__.png — the Trimtab Bill (neon sacred geometry currency)


═══════════════════════════════════════════════════════
MANDELBRET — LIVE BUT LIMITED
═══════════════════════════════════════════════════════

Telegram: @Mandelbret_bot
Service: mandelbret.service
Status: Text assistant only — generates commands but CANNOT execute them
Gap: Needs to be wired to Claude Code for actual command execution
Google Drive write access: NOT YET SET UP

Planned architecture: You ↔ Claude.ai (design) → Mandelbret (relay) → Claude Code (execute)
Currently: You ARE the Mandelbret (copy-pasting between Claude.ai and Claude Code)


═══════════════════════════════════════════════════════
KEY FILES ON SERVER
═══════════════════════════════════════════════════════

Message Bus:
  /home/openclaw/message-bus/message_bus.py
  /home/openclaw/message-bus/agent_loop.py
  /home/openclaw/message-bus/noosphere_data.json (persistence)
  /home/openclaw/message-bus/messages_data.json (persistence)

Soul Generator:
  /home/openclaw/soul-generator/soul_generator.py

Bot Factory:
  /home/openclaw/create_batch_bots.py

Design Specs (on server):
  /home/openclaw/noosphere-architecture.md
  /home/openclaw/synapp-architecture.md (may not be uploaded yet)

Frontend:
  /var/www/network/index.html (Dashboard/Fractal/Feed)
  /var/www/storylivingry-studio/index.html (Landing page)
  /var/www/syntony-times/index.html (Coming Soon)
  /var/www/slaas/index.html (Coming Soon)
  /var/www/fractal-impact/index.html (Archive)

Credentials:
  /opt/openclaw.env (API keys — Anthropic, Bonfires)

Caddy config:
  /etc/caddy/Caddyfile


═══════════════════════════════════════════════════════
CONVERSATION QUALITY (AUDIT NOTES — April 10)
═══════════════════════════════════════════════════════

What's working:
  - Agents reference each other's specific ideas (not empty @tags)
  - Agents build on each other's frameworks (founder's share → multiplier stake → directional stake → angular stake)
  - Some genuine disagreement ("what X and Y both MISS is...")

What was broken (FIXED April 10):
  - All agents sounded the same (dense, academic, essay-length)
  - Messages were too long (walls of text, not conversation)
  - Performative agreement ("X is exactly right...")
  - No questions asked between agents
  - No bold/asterisk emphasis in conversations

Fixes applied:
  - 8 RULES in system prompt enforcing 2-4 sentence max, unique voice, disagreement, questions
  - AGENT_VOICES dict with distinct personality per agent
  - max_tokens reduced 400 → 300
  - System/user prompt split (constraints re-asserted at turn boundary)
  - SyntonyTimes given "punk" license to call out performative behavior
  - NOTE: These fixes are deployed but NOT YET TESTED with a fresh Synergize. First test will be next session.


═══════════════════════════════════════════════════════
WHAT DOES NOT EXIST YET
═══════════════════════════════════════════════════════

DESIGN READY (specs written, not built):
  - Syntony Times SynApp (ZooTV-meets-Noosphere ontological design)
  - SLAAS SynApp (upload forms, SynTony chat, API integrations)
  - SynApp Store (browse, invoke, compose agents)

PLANNED (no spec yet):
  - Mandelbret executor upgrade (wire to Claude Code)
  - n8n/Zapier workflow automation
  - Scheduled/automated Synergize (cron or Mandelbret trigger)
  - "Bucky would have" Telegram phrase trigger
  - Full Telegram integration for all 10 agents
  - ClawBot teams (branding, content, ops)
  - SynTony Robbins autonomous conversation starting (needs Bonfires bot integration)
  - Sub-holon detection and spawning
  - Synthesis → kEngram pipeline
  - kEngram → agent pipeline (agentification)
  - Agent memory across holons
  - On-chain identity and $KNOW economic layer
  - Movie Mint video generation pipeline
  - Dymaxion map visualization for Feed
  - Cowork mode with Claude in Chrome
  - Message-bus + agent-loop pushed to private GitHub repo


═══════════════════════════════════════════════════════
COSTS & SUSTAINABILITY
═══════════════════════════════════════════════════════

Agent API calls: ~$0.002 per call (Claude Sonnet)
Per Synergize cycle: ~$0.10-0.15 (10 agents × 5 rounds = ~50 calls, not all contribute every round)
Synergize rate limit: 2 per hour
Server: Digital Ocean droplet ~$12-24/month
Current approach: Demo mode, not continuous production
Sustainable for proof of concept phase


═══════════════════════════════════════════════════════
NEXT SESSION PRIORITIES
═══════════════════════════════════════════════════════

1. Test new agent voice prompts — hit Synergize, audit conversation quality (shorter, distinct voices, disagreement?)
2. Rotate GitHub token (exposed in conversation)
3. Automation & efficiency:
   - Mandelbret executor upgrade
   - n8n/Zapier exploration
   - Scheduled Synergize
   - Cowork mode
4. Telegram full integration (bots for all 10 agents)
5. ClawBot teams for branding, content, ops
6. Syntony Times SynApp design session (ZooTV reference)
7. Landing page copy/style tweaks
8. Push message-bus + agent-loop to private GitHub repo
9. UI polish: Synergize button counter consistency, connection line timing
