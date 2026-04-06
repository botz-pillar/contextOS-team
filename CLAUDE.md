# CLAUDE.md — InfoSec Shared Context (Team Repo)

> This file is loaded when working directly in the shared context repo (for contributions).

---

## What This Repo Is

This is the **team-wide shared knowledge base** for InfoSec. It is NOT a personal workspace.

Everything in this repo is shared across every team member via git submodule. Write accordingly.

---

## Rules for This Repo

### Content Must Be Team-Relevant
- Every file here is read by every team member's Claude instance
- Only add content that benefits the team, not just one individual
- Ask: "Would at least two other people use this?"

### No Personal Content
- No individual names, roles, or preferences (except in team-overview.md structure)
- No personal projects, goals, or learning plans
- No individual tool configurations or access details
- No "I" statements — write for "the team" or "analysts" or role titles

### No Sensitive Data
- No credentials, API keys, tokens, or secrets
- No internal IP addresses, hostnames, or URLs
- No customer names, PII, or classified information
- No specific incident details that could identify targets

### Accuracy Required
- Compliance framework references must match official documentation
- Tool information must be current and verified
- Prompts must be tested before inclusion
- Cite framework versions (e.g., "NIST 800-53 Rev 5", not just "NIST")

### Format Consistency
- Follow the structure of existing files
- Use markdown tables for structured data
- Use clear headers (##, ###) for navigation
- Include "when to use" context for prompts and workflows

---

## File Map

| File | Purpose | Update Frequency |
|------|---------|-----------------|
| `team-overview.md` | Team structure, SLAs, escalation | Quarterly |
| `compliance-frameworks.md` | Framework references | Quarterly + on updates |
| `tools-and-integrations.md` | Tool inventory, MCP setup | Monthly |
| `approved-prompts.md` | Vetted prompt templates | Ongoing |
| `security-guardrails.md` | AI usage rules and constraints | Quarterly + post-incident |
| `workflows/*.md` | Step-by-step procedures | Quarterly |
| `CONTRIBUTING.md` | How to submit changes | As needed |

---

## When Contributing

1. Read `CONTRIBUTING.md` before making changes
2. Create a branch — never commit directly to main
3. Test prompts and workflows before submitting
4. Open a PR with clear description of what changed and why
5. Wait for review before merging

---

## Do Not

- Add personal context or preferences to any file
- Modify files without reading the existing content first
- Create files that duplicate existing content
- Add speculative or unverified information
- Remove content without team discussion
