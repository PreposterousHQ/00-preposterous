# VET — OpenSwarm

Date evaluated: 2026-04-18
Status: Shelved
Category: Multi-Agent Orchestration / Dev-Team Automation
Source: LinkedIn post (Sean stamp of approval)
Verdict: Impressive but wrong problem — steal memory scoring + escalation patterns, do not deploy.

## WHAT IT IS
Claude Code CLI orchestrator that turns Linear tickets into GitHub PRs via Worker/Reviewer/Tester/Documenter pipeline. Controlled from Discord. LanceDB vector memory for long-term learning. 14 GitHub stars, solo project by Heewon Oh.

## WHAT IS ACTUALLY TRUE
- Architecture checks out: AutonomousRunner, DecisionEngine, PairPipeline all real
- Memory scoring formula is real and elegant
- Worker escalation after N iterations is real and configurable
- 14 stars — not a community tool, solo-dev hot take with LinkedIn boost
- Requires Claude Code CLI + API key — new cost line if deployed

## THE BRET LENS
Not a coding shop. Ticket velocity near zero. PR count near zero. Wrong domain entirely — Synergyworks handles life ops, OpenSwarm handles code tickets. Different genre.

## STEALABLE PATTERNS
- [ ] Hybrid weighted retrieval: 0.55*similarity + 0.20*importance + 0.15*recency + 0.10*frequency → ChromaDB upgrade
- [ ] Memory types: belief/strategy/user_model/system_pattern/constraint → ChromaDB schema
- [ ] Background cognition: decay, consolidation, contradiction detection → ChromaDB maintenance jobs
- [ ] Auto-escalation after N failed iterations → Dual-mode architecture spec

## RECOMMENDATION
Shelve. Mine patterns. Clone to C:\PreposterousGit\reference-projects\openswarm\ for study.

## RE-EVALUATION TRIGGER
1. Storylivingry ships real code product with ticket flow
2. Developer joins BRET team
3. Tool hits 1k+ stars or ships 1.0

## COSTS IF DEPLOYED
- Money: Claude Code CLI ~$20-100/month depending on volume
- Time to set up: 4-8 hours
- Infrastructure added: Node 22+, LanceDB, Discord bot, Linear webhook

## LINKS
- Repo: https://github.com/Intrect-io/OpenSwarm
