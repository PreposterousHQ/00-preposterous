# BRET LAPTOP DIAGNOSTIC REPORT
**Generated:** 2026-04-11 by ClawBot Zero  
**Machine:** Windows 11 Home (10.0.26200)

---

## 1. DRIVES

| Drive | Filesystem | Total     | Used      | Free      | Label         |
|-------|-----------|-----------|-----------|-----------|---------------|
| C:    | NTFS      | 475.4 GB  | 264.1 GB  | 211.3 GB  | OS            |
| D:    | exFAT     | 116.4 GB  | 39.7 GB   | 76.7 GB   | (none)        |
| G:    | FAT32     | virtual   | virtual   | virtual   | Google Drive  |

> **Note:** G: is a virtual drive mounted by Google Drive for Desktop. It mirrors the C: drive size in reporting but is not a physical partition.

---

## 2. ONEDRIVE

| Property       | Value                                        |
|---------------|----------------------------------------------|
| Installed      | Yes (v26.040.0301.0001)                      |
| Running        | Yes (launches on boot)                       |
| User Email     | bretminster555@fullofitindustries.com         |
| Local Path     | `C:\Users\bretm\OneDrive`                    |
| Total Size     | **36.06 GB**                                 |

**Synced Folders:**
| Folder     | Size     |
|-----------|----------|
| Desktop   | ~0 GB    |
| Documents | 36.06 GB |
| Pictures  | ~0 GB    |
| .wdc      | minimal  |

**Folder Redirection Active:** Desktop, Documents, and Pictures are all redirected to OneDrive (see Section 4).

---

## 3. GOOGLE DRIVE

| Property    | Value                                                           |
|------------|----------------------------------------------------------------|
| Installed   | Yes (v123.0.1.0)                                               |
| Running     | Yes (2 processes active)                                       |
| Mount Point | **G:\**                                                        |
| Contents    | My Drive, Shared drives, Other computers                       |
| Install Path| `C:\Program Files\Google\Drive File Stream\123.0.1.0\`         |

Google Drive is running and mounted as drive G:. It launches on boot.

---

## 4. USER FOLDERS

**All three key folders are redirected to OneDrive:**

| Folder    | Resolves To                           | Redirected? |
|-----------|---------------------------------------|-------------|
| Desktop   | `C:\Users\bretm\OneDrive\Desktop`     | YES         |
| Documents | `C:\Users\bretm\OneDrive\Documents`   | YES         |
| Pictures  | `C:\Users\bretm\OneDrive\Pictures`    | YES         |
| Downloads | `C:\Users\bretm\Downloads`            | NO (local)  |

### Desktop Contents
- Screenshots/ folder
- Shortcuts: Fathom, Manus, Microsoft Edge, Termius
- setup.py

### Documents Contents (44 folders, 100+ files)
Notable folders: FULLOFIT INDUSTRIES, Biz Plans, CV, Decks, psychepath-project, Maia Lotus Foundation, MENTAL WEALTH, METTA BONFIRE, Realization Labs Cowork Claude, THE SHASTA CHRONICLES, Together UFO, and many more.

### Downloads (18.94 GB)
Contains various downloads including SXMVP.zip (1.76 GB), JanetMaryFulpPt1.mp4 (1.29 GB), and a copy of psychepath-project.

---

## 5. DUPLICATES DETECTED

### psychepath-project (CONFIRMED DUPLICATE)
Identical folder structure exists in **two locations**:

| Location | Path |
|----------|------|
| 1. OneDrive/Documents | `C:\Users\bretm\OneDrive\Documents\psychepath-project\` |
| 2. Downloads/Telegram | `C:\Users\bretm\Downloads\Telegram Desktop\psychepath-project\` |

Both contain the same files: content/, output/, raw/, saas-app/ (git repo), document_pdf.pdf, SAAS_brief.md, SKILL.md, SLAAS_brief.md.

### OneDrive Folder Overlap
Desktop, Documents, and Pictures exist under both `C:\Users\bretm\` and `C:\Users\bretm\OneDrive\`. However, the local paths are **redirected** to OneDrive, so these are the same data (not true duplicates). The system is working as intended here.

---

## 6. INSTALLED SOFTWARE

| Software | Version | Publisher |
|----------|---------|-----------|
| Amazon Kindle | 2.6.1.70964 | Amazon |
| Bitdefender Agent | 27.1.1.28 | Bitdefender |
| Bitdefender Total Security | 27.0.41.208 | Bitdefender |
| Bitdefender VPN | 27.2.3.8 | Bitdefender |
| Brave | 147.1.89.132 | Brave Software |
| Claude (Desktop) | — | Anthropic |
| Copilot | 146.0.3856.109 | Microsoft |
| Element | 1.12.12 | Element |
| ExpressVPN | 12.90.0.13 | ExpressVPN |
| Fathom | 1.42.6 | Fathom Developers |
| Git | 2.53.0.2 | Git Development Community |
| GlideX Service Installer | 3.8.7.0 | ASUSTeK |
| Google Chrome | 147.0.7727.55 | Google |
| Google Drive | 123.0.1.0 | Google |
| Icecream Screen Recorder 6 | 6.26 | Icecream Apps |
| Icecream Screen Recorder 7 | 7.44 | Icecream Apps |
| Microsoft 365 (en-gb) | 16.0.19822.20142 | Microsoft |
| Microsoft Edge | 146.0.3856.109 | Microsoft |
| Microsoft OneDrive | 26.040.0301.0001 | Microsoft |
| Microsoft OneNote | 16.0.19822.20142 | Microsoft |
| Miro | 0.11.134 | Miro |
| Node.js | 24.13.0 | Node.js Foundation |
| Notion | 4.16.0 | Notion Labs |
| Python | 3.14.3 | PSF |
| RealVNC Server | 7.12.1 | RealVNC |
| RealVNC Viewer | 7.12.1 | RealVNC |
| Signal | 8.4.1 | Signal Messenger |
| Slack | 4.49.81 | Slack Technologies |
| Spotify | 1.2.85.519 | Spotify |
| Telegram Desktop | 6.7.5 | Telegram |
| Termius | 9.37.6 | Termius Corporation |
| TreeSize Free | 4.8.1 | JAM Software |
| Trezor Suite | 24.11.3 | SatoshiLabs |
| VLC media player | 3.0.21 | VideoLAN |
| WSL | 2.6.3.0 | Microsoft |
| Zoom Workplace | 6.7.8 | Zoom |
| Microsoft Clipchamp | 1.0 | via Chrome |
| .NET Runtime 6.0.5 | — | Microsoft |
| VC++ 2015-2022 Redist (x64/x86) | 14.44.35211 | Microsoft |

---

## 7. STARTUP PROGRAMS

Programs launching on boot:

| Program | Source |
|---------|--------|
| OneDrive | HKCU\Run |
| Google Drive FS | HKCU\Run |
| Gather | HKCU\Run |
| Icecream Screen Recorder | HKCU\Run |
| Signal Desktop | HKCU\Run (tray) |
| Spotify | HKCU\Run (minimized) |
| uTorrent Web | HKCU\Run (minimized) |
| Claude Desktop | HKCU\Run |
| Notion | HKCU\Run |
| Fathom | HKCU\Run |
| Microsoft Edge | HKCU\Run (auto-launch) |
| Slack | HKCU\Run |
| Windows Security | HKLM\Run |
| Bitdefender Agent | HKLM\Run |
| Bitdefender VPN | HKLM\Run |

> **15 programs launching on boot** — this is heavy. Consider disabling Gather, Icecream Screen Recorder, uTorrent Web, Spotify, and Fathom from startup if not needed immediately on login.

---

## 8. STORAGE HOGS

### Top User Folders by Size
| Folder | Size |
|--------|------|
| AppData | 82.11 GB |
| OneDrive | 36.27 GB |
| Downloads | 18.94 GB |
| Music | 1.75 GB |
| .local | 0.45 GB |

### Top 20 Largest Files
| Size | File |
|------|------|
| 9.46 GB | AppData\Roaming\Claude\vm_bundles\claudevm.bundle\rootfs.vhdx |
| 5.36 GB | AppData\Local\wsl\...\ext4.vhdx (WSL disk) |
| 4.46 GB | OneDrive\Documents\FULLOFIT INDUSTRIES\...\WIN_20250202_16_24_10_Pro.mp4 |
| 4.36 GB | Clipchamp cache file (00000003) |
| 2.59 GB | Clipchamp cache file (00000004) |
| 2.57 GB | Clipchamp cache file (00000006) |
| 2.51 GB | OneDrive\Documents\Screenshots\ice_video_20241130-193802.mp4 |
| 2.43 GB | OneDrive\Documents\FULLOFIT INDUSTRIES\...\Autumn Sky Part 1.mp4 |
| 1.71 GB | Downloads\SXMVP.zip |
| 1.68 GB | Google DriveFS cache file |
| 1.27 GB | OneDrive\Documents\FULLOFIT INDUSTRIES\...\Storyliving zoom recording |
| 1.27 GB | OneDrive\Documents\FULLOFIT INDUSTRIES\...\Storyliving zoom recording 2 |
| 1.26 GB | Chrome IndexedDB\Clipchamp blob |
| 1.26 GB | Downloads\JanetMaryFulpPt1.mp4 |
| 1.16 GB | AppData\Roaming\Beeper\IndexedDB blob |
| 0.92 GB | Google DriveFS cache file |
| 0.90 GB | OneDrive\Documents\FULLOFIT INDUSTRIES\...\Intro to ROI ESP.mp4 |
| 0.83 GB | Chrome IndexedDB\Clipchamp blob |
| 0.83 GB | Chrome IndexedDB\Clipchamp blob |
| 0.77 GB | OneDrive\Documents\FULLOFIT INDUSTRIES\...\$UPRA$EX MAGICK video |

### Key Storage Insights
- **Clipchamp caches: ~12 GB** across AppData and Chrome IndexedDB — can likely be cleared
- **Claude VM rootfs: 9.46 GB** — normal for Claude Code's sandbox
- **WSL virtual disk: 5.36 GB** — normal
- **Video files in OneDrive: ~14 GB** — large .mp4 and .zoom files syncing to cloud
- **Downloads: 18.94 GB** — cleanup candidate

---

## 9. GIT

| Property | Value |
|----------|-------|
| Installed | Yes |
| Version | 2.53.0 (windows.2) |

### Local Repositories
| Path | Notes |
|------|-------|
| `C:\Users\bretm\OneDrive\Documents\psychepath-project\saas-app` | In OneDrive (syncing) |
| `C:\Users\bretm\Downloads\Telegram Desktop\psychepath-project\saas-app` | Duplicate in Downloads |

> **Warning:** Running git repos inside OneDrive can cause sync conflicts with .git internals. Consider moving active repos to a local path like `C:\Users\bretm\repos\`.

---

## 10. NODE / NPM

| Tool | Version |
|------|---------|
| Node.js | v24.13.0 |
| npm | 11.6.2 |

---

## 11. PYTHON

| Tool | Version |
|------|---------|
| Python | 3.14.3 |
| python3 | 3.14.3 (same) |

---

## 12. DROPBOX

| Property | Value |
|----------|-------|
| Installed | **No** |
| Running | N/A |
| Local folder | Not found |

---

## SUMMARY & RECOMMENDATIONS

1. **Duplicate psychepath-project** — exists in both OneDrive/Documents and Downloads/Telegram. Clean up one copy.
2. **15 startup programs** — heavy boot load. Disable non-essential ones (Gather, Icecream, uTorrent Web, Spotify, Fathom).
3. **Clipchamp cache ~12 GB** — scattered across AppData and Chrome IndexedDB. Safe to clear if not actively editing.
4. **Downloads folder 18.94 GB** — audit and clean old downloads.
5. **Git repo in OneDrive** — risky for .git corruption. Move active repos to local storage.
6. **AppData is 82 GB** — largest user folder. Claude VM (9.5 GB), WSL (5.4 GB), Clipchamp caches, and Beeper account for bulk.
7. **C: drive health** — 211 GB free of 475 GB. Healthy but could reclaim 30+ GB easily with the above cleanups.

---

## 13. WINDOWS USER ACCOUNTS

### User Profiles

| Profile | Path | Size | SID |
|---------|------|------|-----|
| **bretm** | `C:\Users\bretm` | 139.77 GB | S-1-5-21-3036835316-3452604657-1624611392-1001 |

Only **one user profile** exists on this machine. No other accounts (admin, guest, or secondary).

### Account Type

This is a **Microsoft Account** login (not local-only).

### Linked Microsoft / Email Accounts

| Account | Type |
|---------|------|
| bretminster555@fullofitindustries.com | Microsoft Account (primary login + OneDrive) |

No additional Microsoft accounts linked. No work/school (Azure AD) accounts detected.

---

## 14. FULL DOCUMENTS TREE

**Location:** `C:\Users\bretm\OneDrive\Documents` (redirected from Documents via OneDrive)

### Top-Level Folder Stats

| Folder | Size | Files |
|--------|------|-------|
| FULLOFIT INDUSTRIES | 22,735.7 MB (22.2 GB) | 5,656 |
| Screenshots | 2,575.6 MB (2.5 GB) | 17 |
| Janet | 2,031.2 MB (2.0 GB) | 12 |
| Janet - Copy | 2,028.9 MB (2.0 GB) | 9 |
| CRYSTAL TG | 1,823.9 MB (1.8 GB) | 1,760 |
| THE SHASTA CHRONICLES | 1,256.1 MB (1.2 GB) | 1,135 |
| Bret and Andrea Telegram Chat | 894.9 MB | 1,819 |
| psychepath-project | 390.5 MB | 23,998 |
| Bret Sessions | 313.3 MB | 13 |
| $UPRA$EX MAGICK | 254.2 MB | 17 |
| Audio From Serge | 202.3 MB | 6 |
| Substack PDFS for AI | 183.1 MB | 407 |
| MENTAL WEALTH | 87.5 MB | 7 |
| SSX | 58.2 MB | 32 |
| Satyen | 44.8 MB | 8 |
| NAO Related Bretminster | 40.2 MB | 5 |
| SX ENDORSEMENTS | 37.9 MB | 12 |
| METTA BONFIRE | 18.8 MB | 5 |
| CV | 12.6 MB | 12 |
| Sensual Reflexology | 11.5 MB | 9 |
| ARCHETYPES | 10.8 MB | 4 |
| Together UFO | 9.8 MB | 5 |
| POST | 8.7 MB | 7 |
| Realization Labs Cowork Claude | 8.3 MB | 25 |
| One Mind Show | 8.2 MB | 2 |
| QSS | 7.7 MB | 30 |
| Miss Andie Images | 6.8 MB | 37 |
| esp-fund-website | 5.9 MB | 93 |
| Biz Plans | 4.0 MB | 1 |
| storyliving_slides_enhanced_package | 3.3 MB | 16 |
| divorce | 2.9 MB | 7 |
| Amused To Death Audio Files | 2.5 MB | 8 |
| GENE KEY PROFILES | 1.2 MB | 2 |
| Maia Lotus Foundation | 0.6 MB | 2 |
| CLIP CHAMP | 0.1 MB | 11 |
| Shortcuts | 0.1 MB | 28 |
| My Kindle Content | 0.1 MB | 1 |
| PDF-Products | 0.1 MB | 3 |
| LICENSE | 0.1 MB | 2 |
| Decks | 0 MB | 0 |
| Flowplay | 0 MB | 0 |
| New folder | 0 MB | 0 |
| Visual Studio 2022 | 0 MB | 0 |
| Zoom | 0 MB | 0 |

> **FULLOFIT INDUSTRIES alone is 22.2 GB** — over 61% of the entire Documents folder.

### Complete Folder Tree (3 Levels Deep)

```
Documents/
├── $UPRA$EX MAGICK/
│   └── MVParty #1 - RAW DATA/
├── Amused To Death Audio Files/
│   ├── SYNTONIA_ 2012 Revisited/
│   └── SYNTONIA_ A Collection of Great Beginnings/
├── ARCHETYPES/
├── Audio From Serge/
├── Biz Plans/
├── Bret and Andrea Telegram Chat/
│   ├── contacts/
│   ├── css/
│   ├── images/
│   ├── js/
│   ├── stickers/
│   ├── video_files/
│   └── voice_messages/
├── Bret Sessions/
│   ├── Bret Session Audio Files/
│   ├── Bret Session Audio Files - Copy/
│   └── Session PDF Transcripts/
├── CLIP CHAMP/
│   ├── Bret Warshawsky OSV Internship_.../
│   │   └── Assets/
│   ├── Intro to R_OI, Evolutionary & Spiritual Philanthropy_.../
│   │   └── Assets/
│   ├── Synarchy 555_.../
│   │   └── Assets/
│   ├── The Making of the neXt re-generation_.../
│   │   └── Assets/
│   ├── The Shasta Chronicles_ Nervous v1_.../
│   │   └── Assets/
│   ├── The Untold Tesla Story Audio Bale_.../
│   │   └── Assets/
│   ├── Trailer_ Put It On Our Trimtab_.../
│   │   └── Assets/
│   ├── Untitled video_2713d1e8_.../
│   │   └── Assets/
│   ├── Untitled video_fb4d2d1d_.../
│   │   └── Assets/
│   ├── Verse I_ Storyliving In the Key of B_.../
│   │   └── Assets/
│   └── Version 0.1 Draft Size - Full Trailer_.../
│       └── Assets/
├── CRYSTAL TG/
│   ├── ChatExport_2026-01-25/
│   │   ├── css/  images/  js/  photos/
│   │   ├── round_video_messages/  stickers/
│   │   ├── video_files/  voice_messages/
│   ├── ChatExport_2026-01-25 (1)/
│   │   ├── css/  images/  js/  photos/
│   │   ├── video_files/  voice_messages/
│   ├── ChatExport_2026-01-25 (2)/
│   │   ├── css/  images/  js/  photos/
│   │   └── voice_messages/
│   ├── css/  files/  images/  js/  photos/
│   ├── round_video_messages/  stickers/
│   ├── video_files/  voice_messages/
├── CV/
├── Decks/ (empty)
├── divorce/
├── esp-fund-website/
│   ├── client/
│   │   ├── public/
│   │   └── src/
│   ├── patches/
│   ├── server/
│   └── shared/
├── Flowplay/ (empty)
├── FULLOFIT INDUSTRIES/
│   ├── 100 Co-createur Images/
│   ├── Ark/
│   ├── Beating a dead Hegel/
│   ├── BRET WARSHAWSKY LLC/
│   │   └── NDAs/
│   ├── CASTING HEADSHOTS/
│   ├── ChatExport_2024-02-02/
│   │   ├── css/  files/  images/  js/
│   │   ├── photos/  video_files/  voice_messages/
│   ├── Consumer eXperiences/
│   ├── Decoder Ring/
│   ├── DOCS/
│   ├── DOCUMENTS/
│   │   ├── Andrea Taxes 2021-2022/
│   │   └── Gene Keys Resources/
│   ├── Epimemetics/
│   ├── eXistential prize/
│   ├── Fatekeeper/
│   ├── FIE/
│   ├── Fullofit Industries/
│   ├── GPT FULLOFIT/
│   ├── HLP/
│   ├── Images & Videos/
│   │   ├── 2023-08-11 Symphonics Meeting/
│   │   ├── 555 Fortune Readings/
│   │   ├── ALPHABET IMAGES/
│   │   ├── Andrea Harding Branding etc Examples/
│   │   ├── Banners/
│   │   ├── Bret Childhood Photos/
│   │   ├── EPISODE LOCATIONS/
│   │   ├── Fullofit Sigils/
│   │   ├── Fullofits 3rd law/
│   │   ├── GIFs/
│   │   ├── GPT IMAGES/
│   │   ├── Heartspace Images/
│   │   ├── IBIZA COGERE PLUS IMAGES/
│   │   ├── ICE CREAM SCREENSHOTS/
│   │   ├── IDG COHERE PLUS IMAGES/
│   │   ├── IMAGES & PICTURES ETC/
│   │   ├── Making Livingry Banners/
│   │   ├── New folder/  New folder (2)/
│   │   ├── Phone SD Transfer Synergywork Orange/
│   │   ├── Quotes/
│   │   ├── Screenshots/
│   │   ├── Stockholm COHERE PLUS IMAGES/
│   │   ├── Storyliving Studios/
│   │   ├── Substack Images/
│   │   ├── Substack Shareable Images/
│   │   ├── Suprasex/
│   │   ├── Synergyworks Gather BG Images/
│   │   ├── Tantra of Co-creation/
│   │   ├── Trimtab Dollar Images/
│   │   ├── UPSHIFT/
│   │   ├── Videos/
│   │   ├── Wedding/
│   │   └── XTHEGAMECARDS/
│   ├── LATE NIGHT FULLOFIT/
│   ├── Left Brain Right Brain/
│   ├── MEME ROOM/
│   ├── Memes/
│   ├── MENTAL HEALTH PDFs/
│   ├── Merry Tricksters Bus - On the Road to Omega/
│   ├── Music/
│   │   ├── Amused to Death/
│   │   ├── Audio Record/
│   │   ├── iTunes/
│   │   ├── Playlists/
│   │   ├── SYNTONIA_ 2012 Revisited/
│   │   └── SYNTONIA_ A Collection of Great Beginnings/
│   ├── My rocket is bigger than yours/
│   ├── NFTogetherland/
│   │   ├── Silent Bret/
│   │   └── Suprasex, Drugs and Software/
│   ├── Octopus Movement/
│   ├── Play Attention/
│   ├── Screenshots/
│   ├── Simulations r us/
│   ├── SUBSTACK EXPORT/
│   │   ├── 777/
│   │   ├── EXPORT APRIL 4th 2024/
│   │   └── Shareable Images/
│   ├── Substack PDFs for GPT/
│   │   └── Raph/
│   ├── Synergy Punk.../
│   ├── Telovision/
│   ├── The Stoned Age/
│   ├── The Syntony Lounge/
│   ├── The Syntony Time_ Substack PDFs/
│   ├── There's a genius born every minute/
│   ├── TOGETHERLAND IMAGES/
│   │   ├── Ark/  Beating a dead Hegel/  CASTING HEADSHOTS/
│   │   ├── Consumer eXperiences/  Decoder Ring/  Epimemetics/
│   │   ├── eXistential prize/  FIE/  Fullofit Industries/
│   │   ├── HLP/  Left Brain Right Brain/  Memes/
│   │   ├── Merry Tricksters Bus.../  My rocket.../
│   │   ├── Octopus Movement/  Play Attention/  Simulations r us/
│   │   ├── Synergy Punk.../  Telovision/  The Stoned Age/
│   │   ├── The Syntony Lounge/  There's a genius.../
│   │   ├── Togetherland Poster.../  Triple Dogma Dare You/
│   │   ├── Underdogma/  USC/  Video Clips/
│   │   └── You can't trick a trickster/
│   ├── Togetherland Poster, Fractal Impact Entertainment/
│   ├── Triple Dogma Dare You/
│   ├── Underdogma/
│   ├── USC/
│   ├── USER JOURNEY/
│   ├── Video Clips/
│   │   └── Eric Weinstein/
│   ├── Xthegame Original Cards/
│   └── You can't trick a trickster/
├── GENE KEY PROFILES/
├── Janet/
│   └── Audio Clips for Docudrama or Sizzle/
├── Janet - Copy/
│   └── Audio Clips for Docudrama or Sizzle/
├── LICENSE/
├── Maia Lotus Foundation/
├── MENTAL WEALTH/
│   ├── eCPR/
│   └── Phone Calls with Janet/
├── METTA BONFIRE/
│   ├── Bonfires_Socrat0x/
│   └── SynTony Bonfire/
├── Miss Andie Images/
├── My Kindle Content/
├── NAO Related Bretminster/
├── New folder/ (empty)
├── One Mind Show/
├── PDF-Products/
│   ├── drafts/
│   └── finished/
├── POST/
├── psychepath-project/
│   ├── content/
│   │   ├── .claude/
│   │   ├── frameworks/
│   │   ├── modes/
│   │   └── sessions/
│   ├── output/
│   │   ├── essays/
│   │   └── newsletter/
│   ├── raw/
│   │   ├── conversations/
│   │   ├── novel/
│   │   ├── personal/
│   │   ├── sessions/
│   │   ├── substack/
│   │   └── voice-notes/
│   └── saas-app/
│       ├── .git/
│       ├── assets/
│       └── node_modules/
├── QSS/
├── Realization Labs Cowork Claude/
│   ├── .claude/
│   ├── Core/
│   │   ├── Brand & Messaging/
│   │   ├── Key Contacts/
│   │   └── Vision & Strategy/
│   ├── Marketing_SEO/
│   │   ├── Content Briefs/
│   │   ├── Published Content/
│   │   └── SEO Research/
│   ├── Onboarding/
│   │   ├── Email Sequences/
│   │   ├── Feedback & Interviews/
│   │   ├── MixPanel/
│   │   └── User Journey Maps/
│   ├── RnD/
│   │   ├── Fututre Ideas/
│   │   ├── Product Thinking/
│   │   └── Research Notes/
│   ├── Transcripts/
│   │   ├── Fathom/
│   │   └── Other/
│   └── Video/
│       ├── Raw Transcripts/
│       ├── Scripts/
│       └── Shot Lists/
├── Satyen/
├── Screenshots/
├── Sensual Reflexology/
├── Shortcuts/
├── SSX/
│   └── Wades Docs/
├── storyliving_slides_enhanced_package/
├── Substack PDFS for AI/
│   ├── ESP/
│   │   └── The Great Liberation_ Part I_files/
│   ├── For Prophet/
│   ├── HALO/
│   ├── Mental Health Reformation/
│   ├── Noo Lexicon/
│   │   └── Noo Lexicon_Obliquis-Sequitur_files/
│   ├── SX/
│   ├── SynApp/
│   ├── Togetherland/
│   └── UFO/
├── SX ENDORSEMENTS/
├── THE SHASTA CHRONICLES/
│   ├── css/  files/  images/  js/  photos/
│   ├── round_video_messages/  stickers/
│   ├── video_files/  voice_messages/
├── Together UFO/
├── Visual Studio 2022/
│   └── Templates/
│       ├── ItemTemplates/
│       └── ProjectTemplates/
└── Zoom/ (empty)
```

### Observations
- **"Janet" and "Janet - Copy"** are near-identical (2.0 GB each) — likely a duplicate worth cleaning up
- **"Bret Session Audio Files" and "Bret Session Audio Files - Copy"** — another duplicate pair
- **CRYSTAL TG** has 3 separate ChatExport_2026-01-25 folders — possible export duplicates
- **FULLOFIT INDUSTRIES/TOGETHERLAND IMAGES/** mirrors many sibling folders (Ark, Decoder Ring, Memes, etc.) — potential internal duplication
- **5 empty folders**: Decks, Flowplay, New folder, Visual Studio 2022 (effectively), Zoom

---

## 15. D: DRIVE CONTENTS

**Drive D:** is a **116.4 GB exFAT** drive — this is a **Samsung phone SD card / USB transfer drive**.

### Top-Level Overview

| Type | Name | Size | Files |
|------|------|------|-------|
| DIR | DCIM | **33.21 GB** | 173 |
| DIR | Transfer December 8th | **5.79 GB** | 2 |
| DIR | Android | 0.53 GB | 1,108 |
| DIR | Recordings | 0.01 GB | 1 |
| DIR | Music | ~0 | 2 |
| DIR | Pictures | ~0 | 2 |
| DIR | Movies | ~0 | 2 |
| DIR | .android_secure | 0 | 0 |
| DIR | Alarms | 0 | 0 |
| DIR | Audiobooks | 0 | 0 |
| DIR | Documents | 0 | 0 |
| DIR | Download | 0 | 0 |
| DIR | Notifications | 0 | 0 |
| DIR | Podcasts | 0 | 0 |
| DIR | Ringtones | 0 | 0 |
| DIR | SmartSwitchBackup | 0 | 0 |
| DIR | TEST | 0 | 0 |
| DIR | autorun.inf | ~0 | 4 (Bitdefender sanitize) |
| DIR | System Volume Information | ~0 | 2 |

**Total used: ~39.5 GB of 116.4 GB**

### Full Tree (3 Levels Deep)

```
D:\
├── .android_secure/ (empty)
├── Alarms/ (empty)
├── Android/
│   ├── data/ (543 MB)
│   │   ├── com.spotify.music/ (543 MB) ← bulk of Android data
│   │   ├── com.anthropic.claude/ (0 MB)
│   │   ├── com.openai.chatgpt/ (0 MB)
│   │   ├── com.instagram.android/ (0 MB)
│   │   ├── com.facebook.katana/ (0 MB)
│   │   ├── com.whatsapp/ (0 MB)
│   │   ├── org.telegram.messenger/ (0 MB)
│   │   ├── com.google.android.apps.photos/ (0 MB)
│   │   ├── io.metamask/ (0 MB)
│   │   ├── io.opensea/ (0 MB)
│   │   ├── com.coinbase.android/ (0 MB)
│   │   ├── com.trezor.suite/ (not present)
│   │   └── ... (140+ app data folders, mostly empty)
│   ├── media/ (0 MB)
│   │   ├── com.facebook.katana/
│   │   ├── com.facebook.orca/
│   │   ├── com.instagram.android/
│   │   ├── com.whatsapp/
│   │   ├── com.whatsapp.w4b/
│   │   └── org.telegram.messenger/
│   └── obb/ (0 MB)
│       ├── com.blackout.backgammon/
│       ├── com.funcraft.dicewords/
│       └── ... (7 app folders)
├── Audiobooks/ (empty)
├── autorun.inf/ (Bitdefender sanitization files)
├── DCIM/ (33.2 GB)
│   └── Camera/
│       └── MVParty #1 - RAW FOOTAGE AND IMAGES BRET/ (33.2 GB, 173 files)
├── Documents/ (empty)
├── Download/ (empty)
├── Movies/ (~0, thumbnails only)
├── Music/ (~0, thumbnails only)
├── Notifications/ (empty)
├── Pictures/ (~0, thumbnails only)
├── Podcasts/ (empty)
├── Recordings/
│   └── Voice Recorder/
│       └── Andrea Audio January 13th 2025 Gateway Emotions.m4a (10.3 MB)
├── Ringtones/ (empty)
├── SmartSwitchBackup/ (empty)
├── System Volume Information/
├── TEST/ (empty)
└── Transfer December 8th/ (5.8 GB)
    ├── 20241128_213638.mp4 (672 MB)
    └── 20241128_214401.mp4 (5.26 GB)
```

### D: Drive Key Findings
- **33.2 GB** is a single folder: `DCIM/Camera/MVParty #1 - RAW FOOTAGE AND IMAGES BRET/` — raw video/photo footage
- **5.8 GB** in `Transfer December 8th/` — two large video files from Nov 28, 2024
- **543 MB** of Spotify offline cache in Android data
- This drive is clearly a **Samsung phone storage dump** — standard Android folder structure with app data residue
- **~77 GB free** — most of the drive is empty
- **12 empty standard Android folders** (Alarms, Audiobooks, Documents, etc.) — normal for phone storage
- The `autorun.inf/` folder contains Bitdefender sanitization files — antivirus protection on the removable drive

---

## UPDATED SUMMARY & RECOMMENDATIONS

### From Original Scan (Sections 1-12)
1. Duplicate psychepath-project — clean up one copy
2. 15 startup programs — disable non-essential
3. Clipchamp cache ~12 GB — safe to clear
4. Downloads 18.94 GB — audit and clean
5. Git repo in OneDrive — move to local storage
6. AppData 82 GB — Claude VM + WSL + caches

### New Findings (Sections 13-15)
7. **Single user account** — only `bretm` exists, Microsoft Account login
8. **"Janet" and "Janet - Copy"** — 4 GB of duplicated content in Documents
9. **"Bret Session Audio Files" and its Copy** — another duplicate pair
10. **CRYSTAL TG has 3 ChatExport copies** — 1.8 GB of likely-redundant Telegram exports
11. **FULLOFIT INDUSTRIES = 22.2 GB** — dominates Documents; internal TOGETHERLAND IMAGES folder mirrors many sibling folders
12. **D: drive is a Samsung phone dump** — 33.2 GB of raw footage in DCIM, 5.8 GB of transfer videos, rest is mostly empty Android scaffolding
13. **5 empty folders** in Documents (Decks, Flowplay, New folder, VS 2022, Zoom) — can be removed
14. **D: drive Transfer December 8th** — 5.8 GB of videos that may already be backed up elsewhere

### Potential Space Recovery

| Action | Savings |
|--------|---------|
| Clear Clipchamp caches | ~12 GB |
| Remove "Janet - Copy" duplicate | ~2 GB |
| Remove duplicate psychepath-project | ~0.4 GB |
| Clean Downloads folder | ~5-15 GB |
| Consolidate CRYSTAL TG exports | ~1.2 GB |
| Remove empty folders | negligible |
| **Total potential recovery** | **~20-30 GB** |

---
*Report generated by ClawBot Zero — BRET Ecosystem Infrastructure Agent*
