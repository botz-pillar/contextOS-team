# Examples

Fully-populated reference team contexts. Use these to see what a finished customization looks like, and to copy files that apply to your team.

---

## Available Examples

### `infosec/` — Information Security Team

A complete InfoSec team context covering:

- **Prompts** (`infosec/prompts/`) — role-specific libraries for SOC analysts, cloud security engineers, compliance managers, incident responders, risk/GRC analysts
- **Workflows** (`infosec/workflows/`) — cloud security scan, vulnerability analysis, compliance reporting, SOC ticket triage, risk assessment
- **Integrations** (`infosec/integrations/`) — AWS CLI, SIEM patterns, EDR patterns, vulnerability scanners, GitHub MCP, Terraform
- **Standards** (`infosec/compliance-frameworks.md`) — FedRAMP, CMMC, NIST 800-53, SOC 2
- **Guardrails** (`infosec/security-guardrails.md`) — InfoSec-specific AI safety rules
- **Team structure** (`infosec/team-overview.md`) — reference SOC team structure, SLAs, escalation
- **Tools** (`infosec/tools-and-integrations.md`) — typical InfoSec tool inventory
- **20+ approved prompts** (`infosec/approved-prompts.md`) — vetted security-specific prompts

---

## How to Use Examples

1. **Reference for structure.** Browse the example closest to your domain. Note how workflows are organized, how prompts are structured, how guardrails are framed.
2. **Copy what fits.** If a prompt or workflow applies to your team, copy it directly to your team's core files. Adapt as needed.
3. **Don't replace your core with an example.** The core files at the root are domain-neutral by design. Fill them with your team's answers, don't copy an example's content into them.

---

## Contribute a New Domain Example

Adding `examples/engineering/`, `examples/marketing/`, `examples/legal/`, or another domain? Welcome.

Guidelines:
1. Structure should mirror `infosec/` where it makes sense (prompts/, workflows/, integrations/).
2. Content should be specific enough to be useful, anonymized enough to be shareable publicly.
3. Include a `{domain}/README.md` describing what's covered and who it's for.
4. Open a PR against `contextOS-team`.

A good domain example is complete: a team lead in that domain can clone, look at the example, and understand how to populate their own core files.
