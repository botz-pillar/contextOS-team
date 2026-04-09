# ContextOS — Team

> Shared team knowledge base template for [ContextOS](https://github.com/botz-pillar/contextOS-personal). This version is pre-built for InfoSec teams — fork it and customize the content for your own team and domain.

## Why This Exists

Every team has hard-won knowledge scattered across wikis, Slack threads, shared drives, and people's heads. When someone needs to do a common task, they either reinvent the wheel or hunt down the person who's done it before.

This repo is your team's **single source of truth for AI-assisted work.** It gives every team member access to the same reference docs, tool documentation, vetted prompt templates, guardrails, and step-by-step workflows — loaded directly into Claude Code as context.

When a senior team member builds a great prompt, it goes here. When processes change, it gets updated once — and the whole team has it. When a new hire joins, they get the team's collective expertise on day one.

---

> **This is an InfoSec example.** The content in this repo (compliance frameworks, security tools, SOC workflows, etc.) is pre-built for an Information Security team. It serves as a working example of what a fully fleshed-out team context looks like. **Fork it, gut the InfoSec content, and replace it with your own domain knowledge** — the structure works for any team: engineering, marketing, legal, operations, finance, or anything else. See [Customizing for Your Team](#customizing-for-your-team) below.

---

This repo is included as a git submodule in each team member's [ContextOS](https://github.com/botz-pillar/contextOS-personal) setup.

---

## What's In Here

The structure below works for any team. The content is pre-filled for InfoSec as an example — replace it with your domain.

### Core Files (every team needs these)

| File | Purpose | InfoSec Example Content |
|------|---------|------------------------|
| `team-overview.md` | Team structure, responsibilities, escalation paths, SLAs | Security team roles, SOC escalation tiers |
| `tools-and-integrations.md` | Tool inventory, integration guides | SIEM, EDR, scanners, cloud security tools |
| `approved-prompts.md` | Vetted prompt templates for common tasks | 20+ security-specific prompts |
| `security-guardrails.md` | Rules and constraints for safe AI usage | InfoSec-specific AI safety rules |
| `CONTRIBUTING.md` | How team members propose changes | PR process, review requirements |

### Domain-Specific Files (customize or replace)

| File | InfoSec Example | Your Team Equivalent |
|------|----------------|---------------------|
| `compliance-frameworks.md` | FedRAMP, CMMC, NIST 800-53, SOC 2 | Your industry standards, regulations, or quality frameworks |
| `integrations/` | AWS CLI, SIEM, EDR, Terraform, vuln scanners | Your team's tools and how Claude can help with them |
| `prompts/` | SOC analyst, cloud engineer, compliance, IR, GRC prompts | Role-specific prompts for your team's functions |
| `workflows/` | Cloud scanning, vuln triage, compliance reporting, SOC triage, risk assessment | Step-by-step procedures for your team's recurring tasks |

---

## How It Gets Used

Team members don't clone this repo directly. It's included as a **git submodule** inside each person's [ContextOS](https://github.com/botz-pillar/contextOS-personal):

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
   git clone https://github.com/botz-pillar/contextOS-team.git
   ```

2. Create a branch and make changes:
   ```bash
   git checkout -b add-kubernetes-workflow
   ```

3. Open a PR for team review

4. After merge, team members pull with `git submodule update --remote`

---

## Customizing for Your Team

If your team isn't InfoSec, here's how to make this yours:

### Step 1: Fork this repo

```bash
# Fork on GitHub, then clone your fork
git clone https://github.com/YOUR-ORG/contextOS-team.git
cd contextOS-team
```

### Step 2: Keep the structure, replace the content

The file structure is domain-neutral — it works for any team. Replace the InfoSec content with your own:

| What to Do | How |
|-----------|-----|
| **team-overview.md** | Replace InfoSec roles with your team's roles and structure |
| **tools-and-integrations.md** | Replace security tools with your team's tools |
| **approved-prompts.md** | Replace security prompts with prompts for your domain |
| **security-guardrails.md** | Rename to `guardrails.md` and write AI usage rules for your domain |
| **compliance-frameworks.md** | Replace with your industry standards, or delete if not applicable |
| **workflows/** | Delete InfoSec workflows, add your own recurring procedures |
| **prompts/** | Delete InfoSec prompts, add role-specific prompts for your team |
| **integrations/** | Delete InfoSec integrations, add guides for your team's tools |

### Step 3: Run the team setup

```bash
claude
```

The CLAUDE.md in this repo has a team lead onboarding flow — Claude will ask about your team structure, tools, and processes, then update the files for you.

### Step 4: Point contextOS-personal to your fork

In your team's copy of contextOS-personal, update `.gitmodules`:

```
[submodule "shared-context"]
    path = shared-context
    url = https://github.com/YOUR-ORG/contextOS-team.git
```

Your team members get your customized content automatically.

### Examples of teams that could use this:
- **Engineering** — architecture docs, coding standards, deployment workflows, on-call runbooks
- **Marketing** — brand guidelines, campaign workflows, content review prompts, analytics references
- **Legal** — contract review workflows, compliance checklists, clause libraries, regulatory references
- **Finance** — reporting workflows, audit procedures, forecasting templates, regulatory frameworks
- **Operations** — process documentation, vendor management, SOP library, incident procedures

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

### PR Guidelines
- Verify information against authoritative sources
- Follow existing file format and structure
- Include enough context for someone unfamiliar with the topic
- Tag at least one team member for review
- See `CONTRIBUTING.md` for the full process

---

## License

MIT
