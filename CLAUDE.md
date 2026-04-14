# CLAUDE.md — ContextOS Team

> Auto-loaded when working inside this team shared-context repo. This file is for **team leads maintaining** the team repo. End users don't clone this directly — they clone `contextOS-personal` and get this repo via submodule.

**Last Updated:** 2026-04-14

---

## First-Run Behavior

A SessionStart hook at `.claude/hooks/check-team-setup.sh` runs every session. It checks whether the core team files still contain `{{PLACEHOLDER}}` strings:

- **Placeholders found →** team hasn't been customized yet. Hook injects a trigger; Claude loads [skills/team-setup.md](skills/team-setup.md) and walks the team lead through customization (~15 min).
- **No placeholders →** customized; normal maintenance mode. Use the routing table below.

**Manual reset:** edit core files to re-introduce placeholders, or invoke manually by saying "run team setup."

---

## Routing Table (Maintenance)

| Task | Go To | Read | Notes |
|------|-------|------|-------|
| Add a new team workflow | `workflows/` (create if missing) | similar existing workflow | PR required |
| Update team structure (new member, role change) | `team-overview.md` | current file | PR required |
| Add or update tools | `tools-and-integrations.md` | current file | — |
| Update AI usage guardrails | `guardrails.md` | current file | tag team lead for review |
| Add a domain example | `examples/{domain}/` | `examples/README.md` | — |
| Review a pending PR | (in place) | PR description | see [CONTRIBUTING.md](CONTRIBUTING.md) |
| Add prompts to the library | `prompts/` (create if missing) | similar existing prompt file | PR required |

---

## Team Maintenance Principles

- **Every file here is read by every team member's Claude.** Write accordingly.
- **No personal content** — no "I" statements, no individual preferences, no learning plans.
- **No sensitive data** — no credentials, hostnames, customer names, PII.
- **Accuracy required** — verify framework references, cite sources, version-stamp.
- **Format consistency** — follow existing file shape; markdown tables for structured data.
- **PR required** — no direct pushes to main once branch protection is enabled.

---

## Naming Conventions

- Team files: `lowercase-with-hyphens.md`
- Workflow/prompt files: `domain-topic.md` (e.g., `vulnerability-analysis.md`)
- Domain examples: under `examples/{domain}/`
- Dated artifacts: `YYYY-MM-DD-topic.md`

---

## Session Start

If a team lead is mid-customization, resume where they left off (re-load `skills/team-setup.md`). Otherwise, ask: "Adding content, updating existing, or reviewing a PR?"

Full contribution flow: [CONTRIBUTING.md](CONTRIBUTING.md). Reference for a fully-populated team context: [examples/infosec/](examples/infosec/).
