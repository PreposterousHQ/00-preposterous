# VET — gstack (Garry Tan / Y Combinator)

Date evaluated: 2026-04-18
Status: Active Consideration — evaluate this session
Category: Claude Code Skill Pack / Solo Founder Dev Workflow
Source: LinkedIn post (Tauhid IQ)
Verdict: Most relevant tool in vault — runs on Claude Code already installed, explicitly OpenClaw-aware, sprint pipeline pattern belongs in Synergyworks architecture.

## WHAT IT IS
Garry Tan YC CEO open-source Claude Code skill pack. 23 specialist skills + 8 power tools as slash commands. Structured sprint: Think, Plan, Build, Review, Test, Ship, Reflect. Each step output feeds next step. MIT license. One install command. 72k+ stars, 10k+ forks.

## THE KEY FACT THE POST MISSED
gstack SKILL.md source contains explicit OpenClaw integration: "If SPAWNED_SESSION is true, you are running inside a session spawned by an AI orchestrator (e.g., OpenClaw)." These two ecosystems are already interoperable by design. Conductor could dispatch gstack sprints as sub-agent tasks.

## WHAT IS ACTUALLY TRUE
- Runs on Claude Code 2.1.101 already installed on laptop
- Installs into ~/.claude/skills/gstack/ — same SKILL.md standard
- Multi-host: Claude Code, Codex CLI, Cursor, OpenCode
- Tan ships 810x his 2013 logical-code pace (his own normalized metric)
- Designed for solo founder running multiple products simultaneously

## THE BRET LENS
Direct fit. Solo founder model. Multiple products. Skills that map now:
- /office-hours: CEO pushback before touching code
- /cso: OWASP + STRIDE on Storylivingry sites
- /qa: real browser regression tests on sites with zero coverage
- /ship: one command from done to PR
- /retro: structured session retrospective

## STEALABLE PATTERNS
- [ ] Chained handoff pipeline — each stage output is next stage input → Conductor routing protocol
- [ ] Cognitive role switching per task type → SOUL.md design pattern
- [ ] SPAWNED_SESSION flag for orchestrator detection → future agent skill design
- [ ] /office-hours forcing questions → pre-build checklist for all Storylivingry decisions

## RECOMMENDATION
Install Version 1 this session. Run /office-hours on preposterize spec. Evaluate honestly. Graduate to Deployed or move to Shelved based on result.

## INSTALL COMMAND
git clone --single-branch --depth 1 https://github.com/garrytan/gstack.git ~/.claude/skills/gstack
cd ~/.claude/skills/gstack && ./setup

## RE-EVALUATION TRIGGER (if shelved after evaluation)
1. Any Storylivingry Studio build project starts
2. Synergyworks ready to dispatch sub-agent coding tasks
3. gstack ships significant update

## COSTS
- Money: $0 MIT license
- Time to install: 15 minutes
- Infrastructure added: SKILL.md files in ~/.claude/skills/gstack/ only

## LINKS
- Repo: https://github.com/garrytan/gstack
- README: https://github.com/garrytan/gstack/blob/main/README.md
