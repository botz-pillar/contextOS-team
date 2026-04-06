# Contributing to ContextOS — Team

> Guidelines for proposing changes to the team's shared knowledge base.

---

## The Golden Rule

**Shared context is for the team, not for you individually.**

Before submitting anything, ask: *"Would at least two other people on the team use this?"* If the answer is no, it belongs in your personal OS (`my-workflows/`, `my-context.md`), not here.

---

## What Belongs Here

| Category | Examples | Why It's Shared |
|----------|----------|----------------|
| **Team knowledge** | Team structure, escalation paths, SLAs | Everyone needs to know how the team operates |
| **Compliance references** | Framework summaries, control mappings | The team works against the same standards |
| **Tool documentation** | Tool inventory, integration guides, MCP setup | Everyone uses the same (or overlapping) tools |
| **Vetted prompts** | Prompt templates that produce consistent results | Saves everyone from writing prompts from scratch |
| **Security guardrails** | Rules for safe AI usage | Protects the whole team equally |
| **Workflows** | Step-by-step procedures for common tasks | Ensures consistent quality across the team |

## What Does NOT Belong Here

| Don't Add | Why | Where It Goes Instead |
|-----------|-----|----------------------|
| Your personal preferences | Not relevant to others | `CLAUDE.md` in your personal OS |
| Your current projects | Only relevant to you | `my-context.md` in your personal OS |
| Your custom prompts (untested) | Not yet proven for the team | `my-workflows/` in your personal OS |
| Credentials or API keys | Security risk | Secrets manager, env vars |
| Company-specific internal details | Repo may be public | Internal wiki or private docs |
| Speculative or unverified info | Could mislead the team | Verify first, then contribute |
| Meeting notes or status updates | Ephemeral, not reference material | Slack, wiki, or project tracker |

---

## How to Submit a Change

### Step 1: Clone the repo (if you haven't already)

```bash
git clone https://github.com/YOUR-ORG/contextOS-team.git
cd contextOS-team
```

### Step 2: Create a branch

```bash
git checkout -b your-name/short-description
# Examples:
# git checkout -b sarah/add-kql-hunting-queries
# git checkout -b marcus/update-aws-tool-list
# git checkout -b priya/fix-fedramp-control-counts
```

### Step 3: Make your changes

Follow these guidelines:
- **Match existing format.** Look at how current files are structured and follow the same pattern.
- **Be specific and actionable.** "Use least privilege" is too vague. "Restrict IAM policies to specific resources using ARNs" is useful.
- **Cite your sources.** If referencing a framework, include the version and section. If recommending a tool, link to its documentation.
- **Include the "why."** Don't just add a prompt — explain when to use it and what output to expect.
- **Test before submitting.** If it's a prompt, run it in Claude Code and verify it produces good output. If it's a workflow, walk through it yourself first.

### Step 4: Commit with a clear message

```bash
git add .
git commit -m "Add KQL threat hunting queries for lateral movement detection

Tested against Sentinel with 30 days of production logs.
Covers T1021 (Remote Services) and T1076 (RDP).
False positive rate: ~5% in our environment."
```

### Step 5: Push and open a PR

```bash
git push -u origin your-name/short-description
```

Then open a pull request with:

```markdown
## What Changed
[What you added or modified]

## Why
[Why this is useful for the team — not just you]

## How I Verified
[How you tested/validated accuracy]

## Who Benefits
[Which roles or workflows this helps]
```

---

## Review Process

### Who Reviews

| Change Type | Reviewers Required | Approvals |
|-------------|-------------------|-----------|
| New prompt or minor update | Any 1 team member | 1 |
| New workflow | 2 team members (ideally someone who does this work) | 2 |
| Compliance framework update | Compliance lead + 1 other | 2 |
| Security guardrail change | Security lead (required) + 1 other | 2 |
| Team overview / structure change | Security lead (required) | 1 |
| Tool inventory update | Any 1 team member | 1 |

### Review Checklist (for reviewers)

- [ ] **Accuracy:** Is the information correct? Did you verify against official sources?
- [ ] **Team relevance:** Would multiple team members benefit from this?
- [ ] **No personal content:** Is this free of individual preferences, projects, or context?
- [ ] **No sensitive data:** No credentials, internal IPs, customer names, or PII?
- [ ] **Consistent format:** Does it follow the structure of existing files?
- [ ] **Tested:** Has the contributor verified this works (prompts produce good output, workflows are complete)?
- [ ] **Clear and actionable:** Could someone unfamiliar with this topic use it successfully?

### Review SLA

- **Simple updates** (typos, tool version bumps): Review within 2 business days
- **New content** (prompts, workflows): Review within 5 business days
- **Guardrail changes**: Review within 5 business days, discuss in next team sync

### After Merge

The contributor should notify the team (Slack, standup, etc.) so everyone knows to pull:

```bash
cd ~/infosec-os
git submodule update --remote
```

---

## Branch Protection Rules

The following protections should be enabled on `main`:

- **Require pull request reviews** — No direct pushes to main
- **Require at least 1 approval** (2 for guardrails/compliance changes)
- **Require status checks** — (optional: linting, link validation)
- **No force pushes** — History must be preserved
- **Include administrators** — Even repo admins go through PRs

### Setting This Up (for repo owner)

```
GitHub → Repo Settings → Branches → Branch protection rules → Add rule

Branch name pattern: main

Enable:
  ✅ Require a pull request before merging
  ✅ Require approvals (1)
  ✅ Dismiss stale pull request approvals when new commits are pushed
  ✅ Require review from Code Owners (optional)
  ✅ Do not allow bypassing the above settings
```

---

## CODEOWNERS (Optional)

Create a `CODEOWNERS` file to automatically assign reviewers:

```
# Default: security lead reviews everything
* @security-lead

# Compliance files: compliance lead must review
compliance-frameworks.md @compliance-lead
workflows/compliance-reporting.md @compliance-lead

# Guardrails: security lead must review
security-guardrails.md @security-lead

# Prompts: anyone can review
approved-prompts.md
```

---

## Content Lifecycle

### Adding New Content
1. Start in your personal OS (`my-workflows/`) to test and refine
2. Once proven useful, submit a PR to shared context
3. Include evidence that it works (tested prompts, completed workflows)

### Updating Existing Content
1. When frameworks release new versions, update promptly
2. When tools change, update the inventory
3. When processes change, update workflows
4. Always note what changed and why in the PR description

### Removing Content
1. Don't delete without discussion — open a PR explaining why
2. If replacing, include the replacement in the same PR
3. Deprecated content can be moved to an `archive/` folder if someone objects to deletion

---

## Questions?

- Open an issue on this repo
- Discuss in your team's Slack channel
- Tag the repo owner for process questions
