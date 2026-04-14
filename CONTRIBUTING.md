# Contributing to ContextOS Team

> Guidelines for proposing changes to the team's shared knowledge base.

**Last Updated:** 2026-04-14

---

## The Golden Rule

**Shared context is for the team, not for you individually.**

Before submitting anything, ask: *"Would at least two other people on the team use this?"* If the answer is no, it belongs in your personal OS (`my-workflows/`, `my-context.md`), not here.

---

## What Belongs Here

| Category | Examples | Why It's Shared |
|----------|----------|----------------|
| Team knowledge | Team structure, escalation paths, SLAs | Everyone needs to know how the team operates |
| Standards / frameworks | Industry or org standards, control mappings, regulatory references | The team works against the same requirements |
| Tool documentation | Tool inventory, integration guides, MCP setup | Everyone uses the same (or overlapping) tools |
| Vetted prompts | Prompt templates that produce consistent results | Saves everyone from writing prompts from scratch |
| AI usage guardrails | Rules for safe AI usage | Protects the whole team equally |
| Workflows | Step-by-step procedures for common tasks | Ensures consistent quality across the team |

## What Does NOT Belong Here

| Don't Add | Why | Where It Goes Instead |
|-----------|-----|----------------------|
| Personal preferences | Not relevant to others | `CLAUDE.md` in your personal OS |
| Your current projects | Only relevant to you | `my-context.md` in your personal OS |
| Custom prompts (untested) | Not yet proven for the team | `my-workflows/` in your personal OS |
| Credentials or API keys | Security risk | Secrets manager, env vars |
| Company-specific internal details | Repo may be public or widely shared | Internal wiki or private docs |
| Speculative or unverified info | Could mislead the team | Verify first, then contribute |
| Meeting notes / status updates | Ephemeral, not reference material | Chat, wiki, or project tracker |

---

## How to Submit a Change

### Step 1: Clone the repo

```bash
git clone https://github.com/YOUR-ORG/contextOS-team.git
cd contextOS-team
```

### Step 2: Create a branch

```bash
git checkout -b your-name/short-description
# Examples:
# git checkout -b alex/add-pr-review-workflow
# git checkout -b morgan/update-tool-inventory
# git checkout -b sam/fix-escalation-path
```

### Step 3: Make your changes

- **Match existing format.** Look at current files and follow the same pattern.
- **Be specific and actionable.** "Use least privilege" is too vague. "Restrict IAM policies to specific resources using ARNs" is useful. Adapt to your domain.
- **Cite your sources.** If referencing a standard or framework, include the version and section. If recommending a tool, link to its documentation.
- **Include the "why."** Don't just add a prompt — explain when to use it and what output to expect.
- **Test before submitting.** Run the prompt, walk the workflow, verify the facts.

### Step 4: Commit with a clear message

```bash
git add .
git commit -m "Add PR-review workflow for backend services

Tested against three team projects; catches 80% of style issues
we currently handle manually. Includes a one-prompt flow for
checking test coverage."
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
[How you tested or validated accuracy]

## Who Benefits
[Which roles or workflows this helps]
```

---

## Review Process

### Who Reviews

Adapt this matrix to your team's structure. The domain-neutral defaults:

| Change Type | Reviewers Required | Approvals |
|-------------|-------------------|-----------|
| New prompt or minor update | Any 1 team member | 1 |
| New workflow | 2 team members (ideally someone who does this work) | 2 |
| Standards / framework reference update | Domain owner + 1 other | 2 |
| Guardrail change | Team lead (required) + 1 other | 2 |
| Team overview / structure change | Team lead (required) | 1 |
| Tool inventory update | Any 1 team member | 1 |

### Review Checklist (for reviewers)

- [ ] **Accuracy:** Information is correct; verified against official sources where applicable.
- [ ] **Team relevance:** Multiple team members would benefit.
- [ ] **No personal content:** Free of individual preferences, projects, context.
- [ ] **No sensitive data:** No credentials, internal IPs, customer names, PII.
- [ ] **Consistent format:** Follows existing file structure.
- [ ] **Tested:** Contributor has verified prompts produce good output / workflows are complete.
- [ ] **Clear and actionable:** Someone unfamiliar with the topic could use it successfully.

### Review SLA (suggested)

- **Simple updates** (typos, tool version bumps): review within 2 business days
- **New content** (prompts, workflows): within 5 business days
- **Guardrail changes**: within 5 business days; discuss in next team sync

### After Merge

The contributor should notify the team (chat, standup) so everyone knows to pull:

```bash
cd ~/context-os
git submodule update --remote
```

---

## Branch Protection Rules

Recommended protections on `main`:

- **Require pull request reviews** — no direct pushes to main
- **Require at least 1 approval** (2 for guardrail or structural changes)
- **Require status checks** (optional: linting, link validation)
- **No force pushes** — history must be preserved
- **Include administrators** — even repo admins go through PRs

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

Create a `CODEOWNERS` file to automatically assign reviewers. Adapt to your team. Example template:

```
# Default: team lead reviews everything
* @team-lead

# Standards/framework files: domain owner must review
# (Replace with whatever applies to your domain — e.g., compliance-frameworks.md for InfoSec,
#  coding-standards.md for engineering, brand-guidelines.md for marketing.)
standards.md @domain-owner

# Guardrails: team lead must review
guardrails.md @team-lead

# Prompts: anyone can review
prompts/ @*
```

---

## Content Lifecycle

### Adding New Content
1. Start in your personal OS (`my-workflows/`) to test and refine
2. Once proven useful, submit a PR to shared context
3. Include evidence that it works (tested prompts, completed workflows)

### Updating Existing Content
1. When standards release new versions, update promptly
2. When tools change, update the inventory
3. When processes change, update workflows
4. Note what changed and why in the PR description

### Removing Content
1. Don't delete without discussion — open a PR explaining why
2. If replacing, include the replacement in the same PR
3. Deprecated content can move to an `archive/` folder if someone objects to outright deletion

---

## Questions?

- Open an issue on this repo
- Discuss in your team's chat
- Tag the repo owner for process questions
