# GitHub Pages + Namecheap Deploy Playbook
*Distilled from the successful socialeffectsnj.com deploy — April 19, 2026*

---

## THE PATTERN IN ONE PARAGRAPH
Create a **public** GitHub repo under `PreposterousHQ`, clone to `C:\PreposterousGit\` (never inside Drive-synced folders), drop the HTML in as `index.html`, add noindex protection if going stealth-live, verify the domain at the org level, enable GitHub Pages with the custom domain, add **ONE ALIAS record** at Namecheap (not four A records — Namecheap silently dedupes them), wait 5–30 min for DNS + SSL cert, click "Enforce HTTPS." Done in 15–30 minutes.

---

## INFO CLAUDE NEEDS BEFORE STARTING

1. **Repo name** — lowercase-hyphenated (e.g., `social-effects-inc`)
2. **Domain** — and confirm it's at Namecheap
3. **Pillar** — for README framing (`01-mental-wealth`, `02-storylivingry-studio`, etc.)
4. **HTML source** — path on laptop, or Bret pastes it
5. **Stealth-live or fully public?** — determines whether we add noindex

---

## THE 8 PHASES

### PHASE 1 — Create the repo
```bash
gh repo create PreposterousHQ/[name] --public --clone --add-readme \
  --description "[one-line description]" \
  --homepage "https://[domain]"
```
⚠️ **Clone location gotcha:** Claude Code sometimes clones into `cwd` regardless of path. Verify it landed at `C:\PreposterousGit\[name]\`. If not:
```bash
mv /c/[wrong-path]/[name] /c/PreposterousGit/
```
**Never let a `.git/` directory live inside `C:\Preposterous\`** — Drive sync will eat it.

### PHASE 2 — Drop HTML + Drive archive
```bash
# Copy HTML from Drive to repo root as index.html
cp "/c/Preposterous/[pillar]/[name]/website-demo/[source].html" \
   /c/PreposterousGit/[name]/index.html
```
Keep the Drive copy as archive. Repo copy (`index.html`) is the deployment copy. Document this in the README under "Source of truth."

### PHASE 3 — Add noindex (if stealth-live)
**`robots.txt`** at repo root:
User-agent: *
Disallow: /
**In `index.html` `<head>`**, immediately after the viewport meta:
```html
<meta name="robots" content="noindex, nofollow, noarchive">
```
Belt-and-suspenders: Google/Bing won't crawl. Do this **before** going public.

### PHASE 4 — Pillar-aware README + commit + push
Use the README template at the bottom of this doc. Then:
```bash
cd /c/PreposterousGit/[name]
git add -A
git commit -m "Initial deploy: HTML + noindex + pillar-aware README"
git push origin HEAD
```

### PHASE 5 — Verify domain at org level
Browser → `https://github.com/organizations/PreposterousHQ/settings/pages` → **Add a domain** → enter `[domain]` → GitHub gives you a TXT record.

At Namecheap → Domain List → Manage `[domain]` → **Advanced DNS** → Add New Record:
- **Type:** TXT Record
- **Host:** `_github-pages-challenge-PreposterousHQ` *(NOT the full domain — Namecheap appends it)*
- **Value:** the hash GitHub gave you
- **TTL:** Automatic

Wait 2–10 min → back at GitHub → click **Verify** → green checkmark.

### PHASE 6 — Enable Pages + custom domain
`https://github.com/PreposterousHQ/[name]/settings/pages`
- **Source:** Deploy from a branch → `main` → `/` (root) → Save
- **Custom domain:** `[domain]` (no https, no www) → Save
- Red "DNS check unsuccessful" appears — **expected**, we haven't pointed DNS yet
- GitHub auto-creates a `CNAME` file in the repo

### PHASE 7 — DNS at Namecheap (the critical shortcut)
Same Advanced DNS page. First clean up:
- ❌ Delete any default CNAME `www → parkingpage.namecheap.com`
- ❌ Delete any URL Redirect on `@`
- ✅ Keep the verification TXT record

Then add **ONE ALIAS record** (not four A records):

| Type | Host | Value | TTL |
|------|------|-------|-----|
| ALIAS Record | `@` | `preposteroushq.github.io.` | Automatic |
| CNAME Record | `www` | `preposteroushq.github.io.` | Automatic |

⚠️ **WHY ALIAS, NOT FOUR A RECORDS:** Namecheap silently dedupes multiple A records with Host `@`. They *look* like they save, then disappear on refresh. ALIAS is a single record that resolves to all four GitHub IPs at query time. Cleaner, works, skips 20 minutes of "why won't this save" debugging.

Final table should be: TXT (verification) + ALIAS (@) + CNAME (www). Three rows total.

### PHASE 8 — Wait, verify, enforce HTTPS
1. DNS propagation: 5–30 min. Check at `dnschecker.org`.
2. GitHub Pages settings → "Check again" on DNS → green checkmark.
3. Let's Encrypt cert auto-issues: 2–15 min after DNS verifies.
4. **"Enforce HTTPS" checkbox un-grays** → check it.
5. Visit `https://[domain]` → green padlock → live.

---

## KNOWN GOTCHAS (so we don't re-hit them)

1. **Wrong clone location** — always verify + `mv` to `C:\PreposterousGit\` if needed.
2. **Namecheap A-record dedup** — skip straight to ALIAS, don't try four A records.
3. **Free Pages requires public repo** — for stealth-live, use noindex, not a private repo.
4. **Bitdefender / browser cert warning during provisioning** — expected. Means pipeline is working, cert just hasn't been issued yet.
5. **"DNS Check in Progress"** — waiting state, not an error. Give it 10–20 min.
6. **GitHub force-redirects HTTP → HTTPS** immediately after custom domain is set, even before cert exists. Cert mismatch warning during this window is normal.

---

## THE GITHUB IPs (for reference, in case ALIAS ever fails)
185.199.108.153
185.199.109.153
185.199.110.153
185.199.111.153
Only needed if Namecheap removes ALIAS support or we switch registrars. ALIAS is the default path.

---

## STEALTH-LIVE → FULLY PUBLIC (when ready to announce)
1. Remove the `<meta name="robots" content="noindex...">` line from `index.html`
2. Change `robots.txt` to:
User-agent: *
Allow: /
3. Commit + push. Google starts indexing within 48 hours.

---

## REPO STRUCTURE TEMPLATE
[repo-root]/
├── index.html       # the page
├── robots.txt       # noindex (stealth only)
├── README.md        # pillar-aware context
└── CNAME            # auto-created by GitHub Pages

---

## README TEMPLATE

```markdown
# [Project Name]

**[Tagline]**

> *[One-line mission]*

[One-paragraph description of what this is.]

## Pillar
`0X-[pillar-name]` — [how it fits in the ecosystem, cross-pillar links]

## Status
- **Public repo** — [stealth-live / fully public]
- **Domain:** [domain]
- **Demo:** `index.html` at repo root
- **Live URL:** https://[domain]

## Ecosystem Links
- [beneficiary / related projects]
- Parent ontology: PreposterousHQ/00-preposterous
- Founder: Bret Warshawsky — bret@bretwarshawsky.com

## Source of truth
- **Drive archive:** `[pillar]/[name]/website-demo/[filename].html`
- **Repo deployment:** `index.html` (this file)
- Keep both aligned when HTML is updated.

---
*Part of the BRET ecosystem.*
```

---

## TIME BUDGET (realistic)
- **Phases 1–4** (repo, HTML, README, noindex, push): **5 min**
- **Phase 5** (domain verification): **5 min active + 5 min DNS wait**
- **Phase 6** (enable Pages): **1 min**
- **Phase 7** (Namecheap DNS): **3 min**
- **Phase 8** (propagation + cert + HTTPS): **10–30 min mostly waiting**
- **Total active work:** ~15 min. **Total wall-clock:** 30–45 min.

Second site on this pattern should feel like muscle memory. Third site should be automatable — candidate for a Synergyworks "Repo Midwife" that takes `[name] + [pillar] + [html path]` and handles Phases 1–4 + 6 end-to-end.
