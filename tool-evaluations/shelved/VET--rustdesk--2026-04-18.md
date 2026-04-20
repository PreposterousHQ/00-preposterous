# VET — RustDesk

Date evaluated: 2026-04-18
Status: Shelved
Category: Remote Desktop / Remote Access
Source: LinkedIn post (Tauhid IQ)
Verdict: Legitimate tool, real sovereignty play, no current use case — file for the collaborator threshold.

## WHAT IT IS
Free open-source remote desktop platform. Install on any machine, share an ID, connect with P2P + E2E encryption. Self-host relay on existing DO droplet or use public relays free. Core AGPL-3.0, Pro server is commercial.

## WHAT IS ACTUALLY TRUE
- v1.4.6, 110k+ stars, maintained by Purslane Ltd (Singapore)
- Cross-platform: Windows, Mac, Linux, iOS, Android
- Fully-featured server is NOT open source — minimal relay only
- Enterprise features (SSO, auditing) gated behind paid Pro tier
- TeamViewer 2024 breach is real — valid sovereignty argument
- Has been weaponized by tech support scammers

## THE BRET LENS
No current remote desktop problem. SSH covers droplet. Telegram covers bots. Drive covers files. Zero surface area against current needs.

## RECOMMENDATION
Shelve. No deploy.

## RE-EVALUATION TRIGGER
1. First outside collaborator needs screen-level access
2. Phone-to-laptop remote access becomes needed
3. TeamViewer/AnyDesk quote appears in any business conversation

## COSTS IF DEPLOYED
- Money: $0 (existing DO droplet)
- Time to set up: 2-4 hours
- Infrastructure added: hbbs + hbbr relay service, ports 21115-21119

## LINKS
- Official: https://rustdesk.com
- Repo: https://github.com/rustdesk/rustdesk
