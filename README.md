# InfoSec Shared Context

> Shared team knowledge base for InfoSec teams using [InfoSec Personal OS](https://github.com/botz-pillar/infosec-personal-os).

## Why This Exists

Every InfoSec team has hard-won knowledge scattered across wikis, Slack threads, shared drives, and people's heads. When someone needs to write a SIEM query, triage a CVE, or prep for an audit, they either reinvent the wheel or hunt down the person who's done it before.

This repo is your team's **single source of truth for AI-assisted security work.** It gives every team member access to the same compliance framework references, tool documentation, vetted prompt templates, security guardrails, and step-by-step workflows — loaded directly into Claude Code as context.

When a senior analyst builds a great threat hunting prompt, it goes here. When compliance frameworks update, it gets updated once — and the whole team has it. When a new analyst joins, they get the team's collective expertise on day one.

---

This repo is included as a git submodule in each team member's [InfoSec Personal OS](https://github.com/botz-pillar/infosec-personal-os) setup.

---

## What's In Here

| File | What It Contains |
|------|-----------------|
| `team-overview.md` | Team structure, responsibilities, escalation paths, SLAs |
| `compliance-frameworks.md` | FedRAMP, CMMC, NIST 800-53, CIS Controls, SOC 2 reference |
| `tools-and-integrations.md` | Tool inventory, MCP server setup, integration docs |
| `approved-prompts.md` | 20+ vetted prompt templates for common security tasks |
| `security-guardrails.md` | Rules and constraints for safe AI usage in InfoSec |

### Workflows

| Workflow | Purpose |
|----------|---------|
| `workflows/cloud-security-scan.md` | Cloud security scanning with Prowler/ScoutSuite |
| `workflows/vulnerability-analysis.md` | CVE triage, prioritization, remediation planning |
| `workflows/compliance-reporting.md` | ConMon, POA&M, audit prep, evidence collection |
| `workflows/soc-ticket-triage.md` | Alert triage, investigation playbooks, shift handoff |
| `workflows/risk-assessment.md` | Full risk assessment from scoping through reporting |

---

## How It Gets Used

Team members don't clone this repo directly. It's included as a **git submodule** inside each person's [InfoSec Personal OS](https://github.com/botz-pillar/infosec-personal-os):

```
~/infosec-os/
├── CLAUDE.md              ← Personal context (auto-loaded by Claude Code)
├── my-context.md          ← Personal details
└── shared-context/        ← THIS REPO (git submodule)
    ├── team-overview.md
    ├── compliance-frameworks.md
    └── workflows/
        └── ...
```

Claude Code reads `shared-context/` files like any local file. No special config needed.

---

## Updating Shared Context

### As a team member (pull updates)

```bash
cd ~/infosec-os
git submodule update --remote
```

### As a contributor (add or change content)

1. Clone this repo directly:
   ```bash
   git clone https://github.com/botz-pillar/infosec-shared-context.git
   ```

2. Create a branch and make changes:
   ```bash
   git checkout -b add-kubernetes-workflow
   ```

3. Open a PR for team review

4. After merge, team members pull with `git submodule update --remote`

---

## Contributing

### What belongs here
- Team-wide knowledge (architecture, tools, procedures)
- Compliance framework references
- Vetted prompt templates
- Security workflows anyone on the team would use
- Security guardrails and constraints

### What does NOT belong here
- Personal context or preferences
- Credentials, API keys, or sensitive data
- Company-specific details that shouldn't be public
- Unverified or speculative content

### PR Guidelines
- Verify information against authoritative sources
- Follow existing file format and structure
- Include enough context for someone unfamiliar with the topic
- Tag at least one team member for review

---

## License

MIT
