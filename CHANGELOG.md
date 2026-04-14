# Changelog

All notable changes to ContextOS Team are documented here.

---

## [2.0.0] — 2026-04-14

Major restructure. Template is now domain-neutral; all InfoSec content moved to `examples/infosec/`. Team-lead onboarding is deterministically triggered via a SessionStart hook.

### Breaking
- **All InfoSec content moved to `examples/infosec/`.** Core root files are now domain-neutral templates with `{{PLACEHOLDER}}` strings. If you were using this repo as an InfoSec team, see `examples/infosec/` for the prior content.
- **Onboarding mechanism changed.** Previously relied on Claude reading prose instructions in `CLAUDE.md` (no trigger). Now a SessionStart hook at `.claude/hooks/check-team-setup.sh` detects placeholders in core files and injects a trigger; Claude loads `skills/team-setup.md` to run the flow.
- **`CLAUDE.md` restructured.** Previous version was the setup flow itself. New version is the one-screen team-lead maintenance router; setup flow moved to `skills/team-setup.md`.
- **`security-guardrails.md` → `guardrails.md`** at the root (domain-neutral). The InfoSec-specific version lives at `examples/infosec/security-guardrails.md`.

### Added
- **SessionStart hook** (`.claude/hooks/check-team-setup.sh`) — detects uncustomized state via placeholder scan
- **`skills/team-setup.md`** — the 8-step team customization flow as a reusable skill
- **Domain-neutral templates** at root: `team-overview.md`, `tools-and-integrations.md`, `guardrails.md`
- **Routing table** in `CLAUDE.md` for team-lead maintenance tasks
- **`examples/README.md`** — overview of reference examples
- **"Last Updated" headers** on templates and skill

### Moved to `examples/infosec/`
- `approved-prompts.md` (20+ InfoSec prompts)
- `compliance-frameworks.md` (FedRAMP, CMMC, NIST 800-53, SOC 2)
- `security-guardrails.md` (InfoSec-specific AI rules)
- `team-overview.md` (filled InfoSec team example)
- `tools-and-integrations.md` (SIEM, EDR, scanners, cloud security)
- `prompts/` (5 role-specific prompt libraries)
- `workflows/` (5 InfoSec workflows)
- `integrations/` (7 InfoSec tool integrations)

### Changed
- **`README.md`** — domain-neutral; explains the domain-neutral-core + domain-examples pattern
- **`CONTRIBUTING.md`** — unchanged content (already generic)

### Known Issues / To-Do
- **`CONTRIBUTING.md`** may have leftover InfoSec-specific review matrix entries. Audit pending.

---

## [1.0.0] — 2026-04-06

### Added
- Initial release (then named `infosec-shared-context`)
- CLAUDE.md with team-lead onboarding flow (prose-based, no trigger)
- Core files: team-overview, tools-and-integrations, approved-prompts, security-guardrails, compliance-frameworks
- `prompts/`, `workflows/`, `integrations/` — role-specific and domain-specific content
- CONTRIBUTING.md with PR process
