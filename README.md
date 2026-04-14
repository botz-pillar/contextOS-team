# ContextOS Team

> Shared team knowledge base template. Designed to be forked and customized for your team's domain. Consumed by team members via git submodule inside their personal [ContextOS Personal](https://github.com/botz-pillar/contextOS-personal).

**Last Updated:** 2026-04-14

---

## Why This Exists

Every team has hard-won knowledge scattered across wikis, Slack threads, shared drives, and people's heads. When someone needs to do a common task, they either reinvent the wheel or hunt down the person who's done it before.

This repo is your team's **single source of truth for AI-assisted work.** It gives every team member access to the same reference docs, tool documentation, vetted prompt templates, guardrails, and step-by-step workflows — loaded directly into Claude Code as context.

When a senior team member builds a great prompt, it goes here. When processes change, it gets updated once — and the whole team has it. New hires get the team's collective expertise on day one.

---

## Design: Domain-Neutral Core, Domain Examples

- **Core files at the root** (`team-overview.md`, `tools-and-integrations.md`, `guardrails.md`, `CLAUDE.md`, `CONTRIBUTING.md`) are **domain-neutral template shells**. They ship with `{{PLACEHOLDER}}` strings that the team lead fills during setup.
- **Full reference examples** live in `examples/` (currently `examples/infosec/` — a complete InfoSec team context: prompts, workflows, integrations, compliance frameworks, security guardrails).
- **Your team's customized content** replaces placeholders in the core files and can expand into `workflows/`, `prompts/`, `integrations/` as needed.

This way you get a blank slate that respects the pattern, with a fully-filled example to learn from.

---

## How Your Team Uses It

Team members don't clone this repo directly. It's included as a **git submodule** inside each person's [ContextOS Personal](https://github.com/botz-pillar/contextOS-personal):

```
~/context-os/
├── CLAUDE.md              ← Personal router (auto-loaded by Claude Code)
├── my-context.md          ← Personal details
└── shared-context/        ← THIS REPO (git submodule)
    ├── team-overview.md
    ├── tools-and-integrations.md
    ├── guardrails.md
    └── workflows/...
```

Claude Code reads `shared-context/` like any local file. No special config needed.

---

## Setup (Team Lead)

1. **Fork this repo** to your organization.
2. **Clone your fork:**
   ```bash
   git clone https://github.com/YOUR-ORG/contextOS-team.git
   cd contextOS-team
   ```
3. **Run Claude Code:**
   ```bash
   claude
   ```
   A SessionStart hook detects the uncustomized state (placeholders in core files) and triggers [skills/team-setup.md](skills/team-setup.md). Claude walks you through an 8-step flow covering team structure, tools, standards, SLAs, guardrails, and prompt priorities (~15 min).
4. **Review, commit, push:**
   ```bash
   git diff
   git add -A && git commit -m "Customize team context for [Your Team]"
   git push origin main
   ```
5. **Enable branch protection** — see [CONTRIBUTING.md](CONTRIBUTING.md).
6. **Point `contextOS-personal` at your fork.** In your team's version of `contextOS-personal`, update `.gitmodules`:
   ```
   [submodule "shared-context"]
       path = shared-context
       url = https://github.com/YOUR-ORG/contextOS-team.git
   ```

Your team members get your customized content automatically.

---

## What's In Here

### Core Files (every team needs these)

| File | Purpose |
|------|---------|
| `CLAUDE.md` | Auto-loaded by Claude when working in this repo; routes maintenance tasks |
| `team-overview.md` | Team structure, roster, escalation, SLAs, cadence |
| `tools-and-integrations.md` | Tool inventory and integration docs |
| `guardrails.md` | AI usage rules (data classification, restricted actions, approvals) |
| `CONTRIBUTING.md` | How team members propose changes (PR process, review matrix) |
| `skills/team-setup.md` | Onboarding flow for team leads |

### Your Team Will Add

As the team grows the knowledge base, expect to create:

- `workflows/` — step-by-step procedures for recurring tasks
- `prompts/` — vetted prompt templates, typically role-specific
- `integrations/` — how Claude connects to specific tools your team uses
- `standards.md` — industry frameworks, coding standards, brand guidelines, etc.

### Reference: `examples/infosec/`

A complete InfoSec team context: 20+ approved prompts, 5 workflows, 7 integration guides, compliance frameworks (FedRAMP, CMMC, NIST, SOC 2), role-specific prompts for SOC analysts, cloud engineers, compliance managers, incident responders, risk/GRC analysts.

Use it as a reference when building your team's own. Copy files directly if they fit your domain.

---

## Team Member Updates

```bash
# Pull latest team knowledge (one command)
cd ~/context-os
git submodule update --remote
```

When someone PRs an update, every team member gets it with that one command.

---

## Suggested Domains

This structure fits any team. Possible forks:

- **Engineering** — architecture docs, coding standards, deployment workflows, on-call runbooks
- **InfoSec** — security frameworks, SIEM/EDR tooling, compliance, SOC runbooks (fully built in `examples/infosec/`)
- **Marketing** — brand guidelines, campaign workflows, content review prompts
- **Legal** — contract review workflows, compliance checklists, clause libraries
- **Finance** — reporting workflows, audit procedures, forecasting templates
- **Operations** — process documentation, vendor management, SOP library
- **Data science** — model review checklists, evaluation patterns, reproducibility guides
- **Healthcare** — clinical workflow references, regulatory constraints, HIPAA-safe AI usage

---

## Contributing

### What belongs here
- Team-wide knowledge (architecture, tools, procedures)
- Industry framework references relevant to your domain
- Vetted prompt templates that produce consistent results
- Workflows anyone on the team would use
- AI usage guardrails and constraints

### What does NOT belong here
- Personal context or preferences
- Credentials, API keys, or sensitive data
- Company-specific details that shouldn't be public
- Unverified or speculative content

See [CONTRIBUTING.md](CONTRIBUTING.md) for the full PR process.

---

## License

MIT
