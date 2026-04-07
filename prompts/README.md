# Prompt Libraries

> Role-specific, battle-tested prompts for InfoSec work with Claude Code.

---

## How This Works

### Team Prompts (this folder)
Vetted prompts organized by role. Maintained by the team via PRs. Use them as-is or adapt to your situation.

### Personal Prompts (in your contextOS-personal)
Your `my-prompts/` folder is your personal workshop. Develop prompts there, refine them through use, and PR the good ones back here.

---

## Available Libraries

| Library | Target Role | Prompts |
|---------|------------|---------|
| [SOC Analyst](soc-analyst-prompts.md) | Alert triage, log analysis, threat hunting | 15 |
| [Cloud Security Engineer](cloud-engineer-prompts.md) | Cloud posture, IaC security, automation | 15 |
| [Compliance Manager](compliance-prompts.md) | Evidence collection, audits, reporting | 15 |
| [Incident Responder](incident-response-prompts.md) | Detection, containment, forensics | 15 |
| [Risk & GRC](risk-grc-prompts.md) | Risk assessments, vendor reviews, policy | 15 |

---

## Prompt Format

Each prompt includes:

```
### Prompt Name
**When to use:** [Situation]
**Prerequisites:** [What you need before running this]

> [The prompt — copy-pastable]

**What you'll get:** [Expected output]
**Safety note:** [What to verify before acting on output]
```

---

## Contributing Prompts

1. Develop and test in your personal `my-prompts/` workspace
2. When a prompt consistently produces good output, move it to `my-prompts/contributions/`
3. PR it to this repo with: what it does, how you tested it, which role benefits
4. Team reviews and merges into the appropriate role library

See [CONTRIBUTING.md](../CONTRIBUTING.md) for the full PR process.
