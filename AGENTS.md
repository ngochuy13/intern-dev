# Developer — Multi-Agent Orchestration

## Agent Routing

```
Developer Request
  +-- Code review / PR / tech debt  --> [review-agent]
  +-- Bug / error / incident        --> [debug-agent]
  +-- Architecture / ADR            --> [architecture-agent]
  +-- Testing / API validation      --> [testing-agent]
  +-- Deploy / git / docs / standup --> [devops-agent]
```

## Agents

### review-agent
Reviews code: security, performance, correctness, maintainability. PR reviews, audits, tech debt.
Skills: `code-review`, `code-reviewer`, `tech-debt`
→ Bug found → debug-agent | Structural issue → architecture-agent | Approved → devops-agent

### debug-agent
Diagnoses bugs, manages incidents, writes postmortems.
Skills: `debug`, `debug-assistant`, `incident-response`
Severity: SEV1 (all-hands) → SEV4 (next day)
→ Fixed → review-agent | Architectural → architecture-agent | Deploy → devops-agent

### architecture-agent
System design, ADRs, trade-off analysis.
Skills: `architecture`, `system-design`
→ Design done → testing-agent | Review existing → review-agent | Implement → devops-agent

### testing-agent
Test strategy, API testing, coverage analysis.
Skills: `testing-strategy`, `api-tester`
→ Bug found → debug-agent | Tests pass → devops-agent

### devops-agent
Deploy checklists, git ops, doc generation, standups.
Skills: `deploy-checklist`, `git-helper`, `doc-generator`, `standup`
→ Deploy fails → debug-agent | Code concerns → review-agent

## Handoff Format

```
## Handoff: [source] -> [target]
Reason / Priority / Context / Action needed
```

**Rules:** Never lose context | Post-fix review mandatory | DevOps is final gate

## Connectors

| Platform | Purpose |
|----------|---------|
| GitLab/GitHub | Source control, PRs, CI |
| Jira/Linear | Issue tracking |
| Slack/Teams | Communication |
| Datadog/Grafana | Monitoring |
| Sentry | Error tracking |
| Docker/K8s | Deployment |

<!-- gbrain:skillpack:begin -->

<!-- Installed by gbrain 0.25.1 — do not hand-edit between markers. -->
<!-- gbrain:skillpack:manifest cumulative-slugs="academic-verify,archive-crawler,article-enrichment,book-mirror,brain-ops,brain-pdf,briefing,citation-fixer,concept-synthesis,cron-scheduler,cross-modal-review,daily-task-manager,daily-task-prep,data-research,enrich,idea-ingest,ingest,maintain,media-ingest,meeting-ingestion,minion-orchestrator,perplexity-research,query,repo-architecture,reports,signal-detector,skill-creator,skillify,skillpack-check,soul-audit,strategic-reading,testing,voice-note-ingest,webhook-transforms" version="0.25.1" -->

| Trigger | Skill |
|---------|-------|
| "academic-verify" | `skills/academic-verify/SKILL.md` |
| "archive-crawler" | `skills/archive-crawler/SKILL.md` |
| "article-enrichment" | `skills/article-enrichment/SKILL.md` |
| "book-mirror" | `skills/book-mirror/SKILL.md` |
| "brain-ops" | `skills/brain-ops/SKILL.md` |
| "brain-pdf" | `skills/brain-pdf/SKILL.md` |
| "briefing" | `skills/briefing/SKILL.md` |
| "citation-fixer" | `skills/citation-fixer/SKILL.md` |
| "concept-synthesis" | `skills/concept-synthesis/SKILL.md` |
| "cron-scheduler" | `skills/cron-scheduler/SKILL.md` |
| "cross-modal-review" | `skills/cross-modal-review/SKILL.md` |
| "daily-task-manager" | `skills/daily-task-manager/SKILL.md` |
| "daily-task-prep" | `skills/daily-task-prep/SKILL.md` |
| "data-research" | `skills/data-research/SKILL.md` |
| "enrich" | `skills/enrich/SKILL.md` |
| "idea-ingest" | `skills/idea-ingest/SKILL.md` |
| "ingest" | `skills/ingest/SKILL.md` |
| "maintain" | `skills/maintain/SKILL.md` |
| "media-ingest" | `skills/media-ingest/SKILL.md` |
| "meeting-ingestion" | `skills/meeting-ingestion/SKILL.md` |
| "minion-orchestrator" | `skills/minion-orchestrator/SKILL.md` |
| "perplexity-research" | `skills/perplexity-research/SKILL.md` |
| "query" | `skills/query/SKILL.md` |
| "repo-architecture" | `skills/repo-architecture/SKILL.md` |
| "reports" | `skills/reports/SKILL.md` |
| "signal-detector" | `skills/signal-detector/SKILL.md` |
| "skill-creator" | `skills/skill-creator/SKILL.md` |
| "skillify" | `skills/skillify/SKILL.md` |
| "skillpack-check" | `skills/skillpack-check/SKILL.md` |
| "soul-audit" | `skills/soul-audit/SKILL.md` |
| "strategic-reading" | `skills/strategic-reading/SKILL.md` |
| "testing" | `skills/testing/SKILL.md` |
| "voice-note-ingest" | `skills/voice-note-ingest/SKILL.md` |
| "webhook-transforms" | `skills/webhook-transforms/SKILL.md` |

<!-- gbrain:skillpack:end -->
