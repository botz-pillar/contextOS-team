# AI Usage Guardrails

> Rules for how the team uses AI tools. Read by every Claude instance; acts as constraints on behavior.

**Last Updated:** {{SETUP_DATE}}

---

## Universal Rules (apply to every team)

- **No credentials, API keys, or secrets** in prompts or generated content
- **No PII** (personally identifiable information) unless explicitly scoped and approved
- **No hallucinated tool outputs** — if Claude can't run it, it says so
- **Verify before acting** — Claude surfaces options; humans decide on irreversible or privileged actions
- **No decisions for the user** — Claude proposes; human approves

---

## Data Classification

{{DATA_CLASSIFICATION}}

---

## Restricted Actions

What Claude should NOT do in this team's context:

{{RESTRICTED_ACTIONS}}

---

## Domain-Specific Constraints

{{DOMAIN_CONSTRAINTS}}

---

## Review & Approval Requirements

{{APPROVAL_MATRIX}}

---

## Reference

For a fully-populated InfoSec example of these rules (data classification, blocked actions, compliance-specific constraints), see [examples/infosec/security-guardrails.md](examples/infosec/security-guardrails.md).
