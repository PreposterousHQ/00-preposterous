# PLAYBOOK — OpenClaw Agent Registration
## The definitive guide to adding a new agent to the OpenClaw swarm

**Created:** 2026-04-21 during Kerouac activation (Session 10/11)
**Why this exists:** Took 6 script iterations and multiple failed SSH commands to discover
that OpenClaw's Telegram token lives under `channels` + `bindings`, NOT under
`agents.list[N].telegram`. This playbook ensures that never has to be rediscovered.

---

## CRITICAL ARCHITECTURE — READ FIRST

OpenClaw's config (`/home/openclaw/.openclaw/openclaw.json`) has this top-level structure:

```
agents:    { defaults: {...}, list: [...] }   -- agent definitions (id, name, workspace, model)
channels:  { telegram: {...} }                 -- channel accounts (bot tokens live HERE)
bindings:  [...]                               -- maps channels/accounts to agents
gateway:   { mode, bind, auth, ... }
plugins:   { entries: [...] }
auth:      { profiles: [...] }
meta:      { lastTouchedVersion, lastTouchedAt }
```

**The three-part model:**
1. `agents.list[N]` — defines WHO the agent is (workspace, model, name)
2. `channels.telegram` — defines the Telegram BOT TOKENS (one entry per bot)
3. `bindings` — wires a specific channel + token + peer to a specific agent

**COMMON MISTAKE:** trying to set `agents.list[N].telegram.token` — this FAILS.
OpenClaw will return: `Error: Config validation failed: agents.list.N: Unrecognized key: "telegram"`
The token does NOT live on the agent. It lives on the channel. They are separate.

---

## STEP-BY-STEP: ADDING A NEW AGENT

### Prerequisites
- Passwordless SSH to `openclaw@165.227.85.162` confirmed working
- New bot created in Telegram @BotFather (has token + username)
- Workspace directory created on droplet with SOUL.md + other files
- API credits in Storylivingry Studio org (console.anthropic.com)

---

### Phase 1: Create the workspace directory and upload files

```bash
# On droplet
mkdir -p /home/openclaw/.openclaw/workspace-<agentname>
```

```powershell
# From laptop — upload all workspace files
scp "C:\Preposterous\00-command-center\clawbot-configs\workspace-<agentname>\*.md" `
    openclaw@165.227.85.162:/home/openclaw/.openclaw/workspace-<agentname>/
```

Verify:
```powershell
ssh openclaw@165.227.85.162 "ls -la /home/openclaw/.openclaw/workspace-<agentname>/"
```

---

### Phase 2: Find the next agents.list index

```powershell
ssh openclaw@165.227.85.162 "openclaw config get agents.list 2>&1 | grep '\"id\"'"
```

NOTE: If grep fails on PowerShell due to backslash escaping, use a script file:

```bash
#!/bin/bash
# count-agents.sh
openclaw config get agents.list 2>&1 | python3 -c "
import sys, json
data = json.load(sys.stdin)
print(f'Agent count: {len(data)}')
print(f'Next index: {len(data)}')
for i, a in enumerate(data):
    print(f'  [{i}] {a.get(\"id\", \"unknown\")}')
"
```

---

### Phase 3: Register agent in agents.list

Use `openclaw config set` with numeric index. NEVER use `openclaw agents add` — it
launches an interactive prompt that hangs over SSH.

```bash
#!/bin/bash
# register-agent-phase1.sh
IDX=<next_index>  # from Phase 2
AGENT=<agentname>
WORKSPACE=/home/openclaw/.openclaw/workspace-<agentname>
MODEL=anthropic/claude-sonnet-4-6

openclaw config set "agents.list[$IDX].id" $AGENT
openclaw config set "agents.list[$IDX].name" $AGENT
openclaw config set "agents.list[$IDX].workspace" $WORKSPACE
openclaw config set "agents.list[$IDX].model" $MODEL

echo "Phase 1 complete"
openclaw config get agents.list 2>&1 | python3 -c "
import sys, json
data = json.load(sys.stdin)
print(json.dumps(data[-1], indent=2))
"
```

---

### Phase 4: Register the Telegram bot token in channels

First, probe existing channel structure to understand the format:

```bash
#!/bin/bash
# probe-channels.sh
python3 -c "
import json
with open('/home/openclaw/.openclaw/openclaw.json') as f:
    data = json.load(f)
print('=== CHANNELS ===')
print(json.dumps(data.get('channels', {}), indent=2))
print('=== BINDINGS ===')
print(json.dumps(data.get('bindings', []), indent=2))
"
```

**CONFIRMED channels.telegram structure** (verified from live config 2026-04-21):
```json
{
  "telegram": {
    "enabled": true,
    "accounts": {
      "conductor": {
        "enabled": true,
        "botToken": "XXXXXXXXX:YYYYYYY",
        "groupPolicy": "open"
      },
      "geodessa": {
        "enabled": true,
        "botToken": "XXXXXXXXX:YYYYYYY",
        "groupPolicy": "open"
      }
    }
  }
}
```

KEY: accounts are KEYED BY NAME (not a numeric array). The key is the account name
(same as agent name). The token field is `botToken` NOT `token`.

**CONFIRMED bindings structure** (verified from live config 2026-04-21):
```json
[
  {
    "type": "route",
    "agentId": "conductor",
    "match": {
      "channel": "telegram",
      "accountId": "conductor"
    }
  }
]
```

**Adding a new channel account (CONFIRMED SYNTAX):**
```bash
openclaw config set channels.telegram.accounts.<agentname>.enabled true
openclaw config set channels.telegram.accounts.<agentname>.botToken <BOT_TOKEN>
openclaw config set channels.telegram.accounts.<agentname>.groupPolicy open
```

---

### Phase 5: Add a binding

```bash
# Find next binding index
# Then:
openclaw config set "bindings[N].channel" telegram
openclaw config set "bindings[N].account" kerouac-bot
openclaw config set "bindings[N].agent" kerouac
```

---

### Phase 6: Check if Gateway hot-reloads or needs restart

Gateway 2026.4.15 hot-reloads config changes automatically. Check logs first:

```bash
tail -20 /tmp/openclaw/openclaw-$(date +%Y-%m-%d).log | grep "hot reload"
```

If hot-reload entries appear: config is live, no restart needed.
If no hot-reload: restart with script-file pattern:

```bash
#!/bin/bash
# restart-gateway.sh
PARENT=$(ps aux | grep 'openclaw gateway' | grep -v grep | awk '{print $2}' | head -1)
if [ -n "$PARENT" ]; then
    kill -TERM $PARENT
    sleep 3
fi
cd /home/openclaw
nohup openclaw gateway start > /tmp/openclaw-gateway.log 2>&1 &
sleep 2
ps aux | grep 'openclaw gateway' | grep -v grep
echo "GATEWAY_RESTARTED"
```

---

### Phase 7: Add bot to Telegram Peace Room

1. Open Telegram on phone
2. In the Peace Room group: tap group name → Edit → Members → Add Member
3. Search for the new bot by its @username
4. Add it
5. (Optional) Give it admin privileges if it needs to post

---

### Phase 8: Test

Send a message in Peace Room addressing the new agent by name.
Watch for response. Check cost in console.anthropic.com → Usage.

---

## POWERSHELL SSH RULES (hard-won lessons)

**Rule 1: Never run two commands on the same line.**
SCP and SSH are separate operations. Run SCP, wait for prompt, then run SSH.
Pasting them together concatenates them and the second command never runs.

**Rule 2: Complex quoting in PowerShell SSH always fails.**
`ssh host "grep '\"id\"' file"` — the backslash-quote pattern gets mangled.
Solution: write a .sh script file locally, scp it, then `ssh host "bash /tmp/script.sh"`.

**Rule 3: Interactive commands hang over SSH.**
`openclaw agents add` launches an interactive TUI prompt — it will hang forever.
Always use `openclaw config set` with explicit key paths instead.

**Rule 4: Script files need ASCII encoding.**
Write with `Out-File -Encoding ASCII` or use filesystem MCP (which writes UTF-8 without BOM).
Windows CRLF line endings break bash scripts — filesystem MCP writes LF correctly.

**Rule 5: Verify before proceeding.**
After each `openclaw config set`, verify the sha256 hash changed in the output.
Each successful write shows: `Config overwrite: ... (sha256 OLD -> NEW, backup=...)`
If no hash change: the write failed silently.

---

## SECURITY RULES

- Bot tokens go into openclaw config via `openclaw config set` — never in files that sync
- Register scripts containing tokens live at `C:\Preposterous\00-command-center\scripts\`
  and should be DELETED after successful registration (token is now in openclaw.json)
- openclaw.json on droplet is the source of truth for tokens — nowhere else
- Never paste a bot token in a GitHub commit, a Drive file, or a chat message

---

## PENDING — Phase 4 exact syntax

**The channels + bindings exact syntax for adding a new Telegram bot is NOT YET
CONFIRMED from live config.** The probe script `probe-channels-bindings.sh` was
written and SCP'd to droplet but not yet run when this playbook was created.

WHEN KEROUAC IS FULLY ACTIVATED: come back and fill in Phase 4 and Phase 5 with
the exact `openclaw config set` syntax that worked. This is the most important
gap in this playbook. Without it, the next agent registration will hit the same
wall we hit with Kerouac.

Update path: `C:\Preposterous\00-command-center\playbooks\PLAYBOOK--OpenClaw-Agent-Registration.md`

---

## QUICK REFERENCE — Script files used for Kerouac activation

All live at `C:\Preposterous\00-command-center\scripts\`:

| Script | Purpose | Status |
|--------|---------|--------|
| register-kerouac.sh | v1 — used wrong agents.list[key] syntax | DEPRECATED |
| register-kerouac-v2.sh | v2 — used openclaw agents add (interactive, hung) | DEPRECATED |
| register-kerouac-v3.sh | v3 — correct numeric index, failed on telegram key | PARTIAL |
| probe-conductor.sh | Showed conductor config has no telegram in agents.list | DONE |
| probe-conductor-v2.sh | Raw JSON dump (failed — file not arriving issue) | DEPRECATED |
| probe-config-structure.sh | Found top-level keys including channels + bindings | DONE |
| probe-full-config.sh | Confirmed channels.telegram + bindings[4] structure | DONE |
| probe-channels-bindings.sh | Dumps channels + bindings detail — PENDING RUN | PENDING |
| restart-gateway.sh | Gateway SIGTERM + nohup restart | READY |

---

*Document this. Save it. Never rediscover it.*
*Updated as Kerouac activation completes — Phase 4 syntax still pending.*
