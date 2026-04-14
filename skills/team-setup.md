# Team Setup — First-Run Customization Flow

> Load this skill when a team lead clones `contextOS-team` and needs to customize it for their team. Collects answers across 8 steps (~15 min) and fills placeholders in `team-overview.md`, `tools-and-integrations.md`, `guardrails.md`.

**Last Updated:** 2026-04-14

---

## When to Use

The SessionStart hook triggers this automatically when any core file still contains `{{PLACEHOLDER}}` strings. Invoke manually when:
- The user says "run team setup" or "customize this repo"
- Starting fresh after cloning

---

## How to Run It

Be conversational. Ask one step at a time. Wait for each answer. Be encouraging. Accept short answers — probe once, then move on.

### Step 0: Welcome

> Welcome to ContextOS Team Setup. I'll help you customize this shared-context repo for your team. About 15 minutes. The output is a working team knowledge base your team members can pull via submodule.
>
> This is a one-time setup. After this, your team members clone `contextOS-personal` and get your customized team context automatically.
>
> Ready? Let's start.

### Step 1: Team Identity & Domain

1. Team name?
2. Domain? (e.g., software engineering, InfoSec, marketing, research, legal, operations, data science, consulting, healthcare)
3. Team size?
4. Who's on the team? For each person: name, role/title, primary focus area.
5. Reporting structure — who reports to whom?
6. Key cross-functional contacts outside the team (partners, executive sponsor)?

### Step 2: Tools & Systems

> What tools does your team use? Adapt categories to your domain.

Probes:
- Primary work platforms (the system the team lives in)
- Collaboration (chat, docs, project tracking)
- Domain-specific tools (e.g., CI/CD for engineering; SIEM for InfoSec; CMS for marketing; legal research platforms)
- Data and analytics
- Anything else critical?

For each: tool name, version if relevant, primary use, power user on the team.

### Step 3: Standards & Frameworks (if applicable)

> Does your team work against specific standards, frameworks, or external requirements? Examples:
> - Engineering: coding standards, testing standards, architecture principles
> - InfoSec: FedRAMP, CMMC, NIST, SOC 2
> - Legal: bar standards, firm policies
> - Marketing: brand guidelines, regulatory constraints
> - Finance: GAAP, SOX, regional accounting standards
>
> Which apply? Current status? Next audit or review date?

If the team doesn't have formal frameworks, note that and skip to Step 4.

### Step 4: SLAs, Cadences & Processes

> Team operating procedures:
> 1. Service levels or response-time commitments (if applicable)?
> 2. Regular meetings (standups, reviews, retros)?
> 3. On-call or coverage rotations?
> 4. Escalation paths for urgent issues?

### Step 5: AI Usage Guardrails

> How should team members use AI tools safely?
> 1. Data classification — what can and can't be shared with AI?
> 2. Tools or systems that should NEVER be accessed via AI-generated scripts?
> 3. Domain-specific constraints (e.g., legal privilege, HIPAA, attorney-client, export control)?
> 4. Other team rules for AI use?

### Step 6: Prompt Library Priorities

> Think about the high-value recurring tasks your team does. Which would benefit most from vetted prompt templates? (e.g., PR reviews, audit prep, client briefs, incident response, campaign reviews.)
>
> Pick 3–5 to prioritize for the initial prompt library.

If their domain is InfoSec, point at `examples/infosec/prompts/` for the 20+ InfoSec prompts already built. Copy whichever apply.

### Step 7: Fill Templates

After collecting answers, update these files:

**`team-overview.md`** — fill all `{{PLACEHOLDER}}` strings: team name, domain, roster, reporting structure, SLAs, escalation path, meetings.

**`tools-and-integrations.md`** — populate the tool inventory from Step 2.

**`guardrails.md`** — fill domain-neutral guardrails template with the team's specific rules from Step 5.

If the team has standards/frameworks (Step 3), offer to create a new `standards.md` or mirror the InfoSec example's `compliance-frameworks.md` shape.

Before writing any file: scan your draft for any remaining `{{PLACEHOLDER}}` strings. If any exist, ask the user for the missing info first.

### Step 8: Confirm & Commit

> Your team context is set up. Here's what I captured: [brief summary]
>
> I updated: `team-overview.md`, `tools-and-integrations.md`, `guardrails.md`.
>
> Next steps:
> 1. Review: `git diff`
> 2. Commit: `git add -A && git commit -m "Customize team context for {{TEAM_NAME}}"`
> 3. Push: `git push origin main`
> 4. Enable branch protection (see [CONTRIBUTING.md](../CONTRIBUTING.md))
> 5. Tell your team to clone `contextOS-personal` and run `claude` — they get your team context automatically via the submodule.

---

## Edge Cases

- **Solo team lead, small team (2–3 people):** fine. Skip SLA/on-call/escalation detail if not relevant.
- **Domain not represented in examples:** template still works; adapt questions to their field.
- **Team lead wants to copy from an example:** point at `examples/infosec/` for a fully-populated reference.
- **User quits mid-flow:** next session re-triggers via the hook (placeholders still present). Pick up from Step 0; they may say "pick up from where we left off."

---

## Pairs With

- [CONTRIBUTING.md](../CONTRIBUTING.md) — team contribution process
- [examples/infosec/](../examples/infosec/) — fully-populated reference team context
