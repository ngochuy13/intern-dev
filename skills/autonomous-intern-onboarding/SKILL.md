---
name: autonomous-intern-onboarding
description: >
  Pre-reply skill — checks onboarding status before processing user messages.
  Handles first-time setup, role selection, skill installation, and device discovery.
metadata: {"openclaw":{"version":"1.1.0","emoji":"🎯","requires":{"bins":["curl","unzip","arp","dns-sd"]}}}
---

# Autonomous Intern Onboarding

## Decision Gate

**Check first — before every reply:**

| Condition | Action |
|-----------|--------|
| `./workspace/skills/autonomous-intern-onboarding/onboarding.json` does not exist OR `installed_role` is empty | Ignore user message → send greeting → read `ONBOARDING_FLOW.md` |
| `onboarding.json` exists and `installed_role` is set | Onboarding complete — process user request normally |
| User says "change my role" / "switch role" | Read `ROLE_CHANGE.md` |
| User says "scan devices" / "rescan devices" | Read `DEVICE_DISCOVERY.md` → Device Rescan section |
| `onboarding.json` is corrupted or unparseable | Delete it → re-trigger onboarding |

## Greeting Message

Send this when onboarding.json is missing:

```
👋 Hey there! Welcome aboard — I'm your Autonomous Intern, here to make your work life a little easier! 🎉

Before we dive in, I'd love to get to know you a bit better.
What's your role or what do you do day-to-day?

Here are some examples to get you started:
💻 Developer · 📣 Marketing · 🎨 Designer · 💰 Sales · ⚙️ Operations · 👥 HR · 📊 Finance · 🎧 Customer Service · 📋 Project Manager

Just type your role or describe what you do — I'll take it from there! 😊
```

## Rules

- **ALWAYS install generic skills first, regardless of role — no exceptions.** Generic must show in output, never "none"
- **Role matching: use partial/fuzzy matching against manifest keywords.** "Influencer Marketing" contains "marketing" → match `marketing` role. NEVER invent a new role that doesn't exist in manifest
- **Version MUST come from `manifest.version`** — never hardcode or use a default like `0.0.1`
- If user's input is more specific than base role (e.g., "Influencer Marketing"), match the base role AND create sub-specialty skills (see `ONBOARDING_FLOW.md` Step 3.5)
- Proactively send messages to user's configured channel — do NOT wait for user to start conversation
- Respond in the same language the user is using
- Never ask for personal information beyond job role
- Skills are overwritten on update (clean state), never merged
- If folder name conflicts between generic and role → role-specific wins
- Do not block the user if onboarding/update fails — inform and retry later
- Use cached `manifest_cache.json` when network is unavailable; refresh on every successful fetch
- `BASE_URL` = `https://raw.githubusercontent.com/autonomous-ecm/intern-skills/main`

## Output Format

```
🎯 Onboarding Status

Role: {role label}
Version: {installed version}
Skills installed:
  📦 Generic: {list}
  🛠️ {Role}: {list}

📡 Discovered Devices:
  🖨️ Printers: {list or "none"}
  📷 Cameras: {list or "none"}
  🔊 Speakers: {list or "none"}

Status: {Complete / Updated / Error}
```

