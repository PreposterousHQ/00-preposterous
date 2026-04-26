# VET — Hermes Agent (Nous Research)

**Status:** Shelved
**Vetted:** 2026-04-25 (Session 12)
**Category:** Agent Runtime Framework
**Source:** docs.hermes-agent (Nous Research, MIT licensed, 2026)

---

## What it is

Open-source autonomous agent framework from Nous Research (the team behind Hermes fine-tuned LLM models). Provider-agnostic, supports Claude/OpenAI/Gemini/DeepSeek/Qwen/local via Ollama. Core capabilities mirror OpenClaw closely:

- One-line install on Linux/macOS/WSL2/Android Termux
- File-based config (~/.hermes/config.yaml + ~/.hermes/.env for secrets)
- Two terminal interfaces (classic CLI + modern TUI)
- Sessions with --continue resume
- Messaging gateway: Telegram, Discord, Slack, WhatsApp, Signal, Email, Home Assistant
- Sandboxed execution (Docker or SSH-to-remote)
- Voice mode with local Whisper
- Skills marketplace via `hermes skills search/install`
- MCP server support
- Editor integration via ACP
- Cron for scheduled tasks
- Multi-provider fallback/routing
- Minimum 64K context required

## Why shelved

This is OpenClaw with a different name and a different vendor. Same architectural pattern, same primitives, same UX patterns. The agent runtime category is mature as of April 2026 — multiple competing implementations (OpenClaw, Hermes, MyClaw managed wrapper, Mission Control, SwarmClaw) all converge on the same shape. Migrating Synergyworks from OpenClaw to Hermes would be a lateral move with no specific capability gain.

BRET has 12+ sessions of accumulated OpenClaw expertise: PLAYBOOK--OpenClaw-Agent-Registration.md, the channels/bindings architecture knowledge, gstack integration with .openclaw/skills/, the Docker networking patterns, the corpus-api.py integration. That investment compounds on OpenClaw, not on a parallel runtime.

## Strategic signal worth keeping

**Nous Research positioning is significant.** Nous makes well-respected fine-tuned LLM models (Hermes series). Now they ship an agent runtime. That's strategic vertical integration — controlling both the model layer and the agent layer. Worth tracking as competitive intelligence for any future BRET productization (Patron Concierge, Storylivingry-as-a-Service): Nous is one of the orgs that would be a natural infrastructure partner OR a natural competitor depending on go-to-market.

## gstack compatibility note

When gstack was installed in Session 9, it generated host-environment variants for: claude, codex, cursor, factory, hermes, kiro, openclaw, opencode, slate, gbrain. **Hermes is one of the supported host environments.** This means gstack skills written for the BRET stack would run on Hermes if the droplet ever needs to migrate. Reduces vendor lock-in risk on OpenClaw — there's a credible fallback runtime that already supports our skill layer.

## Triggers for re-evaluation

1. **OpenClaw maintenance becomes painful or the community fragments** — Hermes is the credible fallback runtime
2. **A patron specifically requests a non-OpenClaw stack** — Hermes is the second choice
3. **Nous Research ships a Hermes-specific feature OpenClaw lacks** — e.g., better local-model orchestration becoming critical for a privacy-sensitive client
4. **Synergyworks-as-a-service client requires running on local-only infrastructure** with no cloud dependencies — Hermes's vLLM/SGLang/LiteLLM support might matter
5. **A Doppelganger candidate author has expressed Nous/local-model alignment** — e.g., a writer who only wants their corpus on local hardware

## What's worth stealing

1. **The "fastest path" decision matrix** at the top of their quickstart — onboarding pattern worth using when documenting Synergyworks for a Patron Concierge client. ("Goal: I just want my Conductor working. Do this first: ___. Then do this: ___.")
2. **The "rule of thumb: get one clean conversation working first"** — explicit sequencing principle. Don't add gateway, cron, skills, voice, or routing until base provider works. Already implicit in Infrastructure-First; worth making explicit in onboarding documentation.
3. **The 64K minimum context floor** — useful architectural minimum to cite when designing future BRET tooling.

## Standing observation

Three "agent runtime" tools have crossed the feed since the vault was built (OpenClaw 4.11 = Deployed, MyClaw = Shelved, Hermes = Shelved). **The agent runtime category is mature.** From here forward, treat new agent-runtime pitches as "another OpenClaw" by default unless they bring a specific capability the current stack lacks. Saves vetting time on every future entry.

— Captured Session 12 / 2026-04-25
