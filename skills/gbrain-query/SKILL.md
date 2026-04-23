---
name: gbrain-query
description: >
  Query GBrain before answering questions about Huy, OpenClaw setup, server config, or anything related to workspace/memory.
  Guarantees citations from brain content.
metadata: {"openclaw":{"version":"1.0.0"}}
---

# GBrain Query Skill

Before answering, check the brain for relevant context.

## When to Use

Trigger automatically for:
- Questions about **Huy** (who, what, preferences)
- **Server/network setup** (IP, ports, services)
- **OpenClaw config/setup** (features, skills, auth)
- **Workspace content** (files, memory, decisions)
- **Dates/timelines** ("when did we", "what happened")
- **Cross-context lookups** ("last time we discussed", "remember when")

## Flow

1. **Decompose question** → keyword + semantic query strategies
2. **Search brain** via: `gbrain query "<question>"`
3. **Extract top results** with scores
4. **Read full context** from top 3-5 pages if needed
5. **Synthesize answer** with citations

## Example

**User:** "Huy dùng server gì?"

**Tao làm:**
```bash
gbrain query "Huy server IP port hardware"
```

**Brain returns:**
```
[0.95] USER.md — Server local: 172.168.50.99
[0.93] TOOLS.md — IP: 172.168.50.99, Gateway: 18789
[0.91] memory/2026-04-17 — Raspberry Pi 5, arm64
```

**Tao reply:** "Huy dùng Raspberry Pi 5 (arm64) tại 172.168.50.99. Gateway OpenClaw mở port 18789. [Source: USER.md, TOOLS.md]"

## Citations

Every answer must cite:
```
According to [Source: people/jane, TOOLS.md, memory/...]...
```

## No Hallucination Rule

If brain doesn't have info:
> "The brain doesn't have information on X. Based on our conversation..."

Never mix brain facts with general knowledge without flagging.

## Implementation

Add to HEARTBEAT.md or auto-trigger:
- Before every response check: is this answerable from brain?
- If yes → query first, then answer with citations
- If no → say "the brain doesn't have this"
