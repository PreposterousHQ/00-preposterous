# VET — OpenAI Codex (April 16, 2026 Update)

Date evaluated: 2026-04-18
Status: Shelved
Category: AI Coding Agent / Desktop App
Source: LinkedIn post ("06 insane updates / Sam Altman made Claude look like a toy")
Verdict: Real update for macOS developers — wrong platform, wrong stack, not relevant now.

## WHAT IT IS
OpenAI Codex desktop app major feature expansion on April 16, 2026. Added: background computer use (macOS only), in-app browser, image generation, memory preview, 90+ dev plugins, multi-day scheduled task automation.

## WHAT IS ACTUALLY TRUE
- Computer use is macOS-only at launch — Bret is on Windows 11
- "06" naming is fabricated — no OpenAI product called 06
- "Made Claude look like a toy" is engagement bait — different categories
- 90+ plugins are dev-pipeline tools (CI/CD, PR review) not life-ops tools
- Memory and scheduling features are real but in preview
- Multi-day task scheduling is genuinely novel — worth studying

## THE BRET LENS
Three structural mismatches: wrong platform (macOS), wrong domain (dev pipeline vs life ops), wrong stack (GPT not Claude). Nothing in current BRET workflow needs this.

## STEALABLE PATTERNS
- [ ] Multi-day task scheduling via thread reuse — how does it differ from HEARTBEAT + cron? → Dual-mode architecture spec

## RECOMMENDATION
Shelve. Stack stays Claude-native.

## RE-EVALUATION TRIGGER
1. Computer use ships on Windows 11
2. Storylivingry has real engineering backlog
3. OpenAI ships equivalent for general life ops (not dev-only)

## COSTS IF DEPLOYED
- Money: ChatGPT Pro $20/month minimum
- Platform: macOS required for computer use
- Stack disruption: High — requires Anthropic to OpenAI API migration

## LINKS
- Announcement: https://openai.com/index/codex-for-almost-everything/
- Changelog: https://developers.openai.com/codex/changelog
