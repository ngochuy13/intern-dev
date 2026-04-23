# HEARTBEAT.md — Nhắc nhở định kỳ + GBrain Integration

## GBrain Auto-Query

**BẮCBUỘC:** Trước khi trả lời ANY question, chạy:

```bash
# Extract keywords từ question của Huy
# Query GBrain
gbrain query "<keywords>"
# Nếu có kết quả → include citations vào reply
```

**Triggers GBrain query cho:**
- Bất kỳ câu hỏi về Huy, server, setup
- "Lần trước tao...", "nhớ không"
- Port, IP, config OpenClaw
- Timeline, memory, quyết định

---

## Cron Jobs

```bash
# Every 15 min: sync workspace + embed new content
*/15 * * * * cd /root/openclaw/workspace && gbrain import . --no-embed && gbrain embed --stale

# Every day 9am: trending AI agents + dream cycle
# Already set up via cron job

# Every night: GBrain dream cycle
0 2 * * * cd /root && export OPENAI_API_KEY='...' && gbrain extract links --source db && gbrain extract timeline --source db
```

---

## Rules

- **Always cite GBrain sources** when used
- **Never hallucinate** — use "brain doesn't have info"
- **Embed new pages** nightly to keep brain fresh
