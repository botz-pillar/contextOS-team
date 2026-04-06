# CLAUDE.md — ContextOS — Team

> This file is loaded when working directly in the team context repo.

---

## First-Run Detection

**Check if `team-overview.md` contains `[NAME]` placeholders.**

- If `team-overview.md` contains `[NAME]` → This team context hasn't been customized yet. Run the **Team Setup** flow below.
- If `team-overview.md` has real names → Skip setup. This repo is configured. Use the **Contribution Rules** section below.

---

## Team Setup (First Run — Team Lead Only)

If `team-overview.md` still has `[NAME]` placeholders, this is a fresh clone that needs to be customized for the team. Greet the user and run this onboarding flow.

### Step 0: Welcome

Say something like:

> Welcome to ContextOS — Team Setup! I'll help you customize the shared team knowledge base for your team.
>
> This is a one-time setup that the team lead does before rolling out ContextOS to the rest of the team. I'll ask about your team structure, tools, and processes, then update the shared files.
>
> After this, your team members will clone contextOS-personal and get all of this context automatically via the submodule.
>
> Ready? Let's start with your team.

### Step 1: Team Structure

Ask:
1. What's your team name? (e.g., "InfoSec", "Security Operations", "Cybersecurity")
2. Who's on the team? For each person, I need:
   - Name
   - Role/title
   - Primary focus area
3. What's the team's reporting structure? (Who reports to whom?)
4. Who are your key contacts outside the security team? (IT ops, DevOps, Legal, HR, executive sponsor)

**After answers:** Update `team-overview.md` — replace all `[NAME]` placeholders with real names, adjust roles and structure to match.

### Step 2: Tools & Systems

Ask:
> What security tools does your team use? Let's go category by category:
>
> 1. **SIEM** — What do you use for log management and alerting? (Splunk, Elastic, Sentinel, etc.)
> 2. **Vulnerability scanning** — What do you scan with? (Tenable, Qualys, Rapid7, etc.)
> 3. **EDR** — What's on your endpoints? (CrowdStrike, SentinelOne, Carbon Black, etc.)
> 4. **Cloud security** — What cloud tools do you use? (Prowler, ScoutSuite, Security Hub, etc.)
> 5. **GRC/Compliance** — What do you track compliance in? (Drata, Vanta, RegScale, spreadsheets, etc.)
> 6. **Ticketing** — Where do tickets and incidents live? (Jira, ServiceNow, etc.)
> 7. **Anything else** the team uses regularly?

**After answers:** Update `tools-and-integrations.md` — replace generic tool listings with the team's actual tools. Remove tools they don't use. Add any they mentioned that aren't listed.

### Step 3: Compliance Frameworks

Ask:
> Which compliance frameworks does your team work against? (Select all that apply)
> - FedRAMP (which impact level?)
> - CMMC (which level?)
> - SOC 2 (which trust criteria?)
> - NIST 800-53
> - CIS Controls
> - HIPAA
> - PCI DSS
> - ISO 27001
> - Other?

Follow up:
- Are you currently authorized/certified under any of these, or working toward it?
- What's your next audit or assessment date?
- Who's the compliance point person on the team?

**After answers:** Update `compliance-frameworks.md` — prioritize the frameworks they actually use. Add any that are missing. Note their current status and upcoming assessments at the top.

### Step 4: SLAs & Processes

Ask:
> Let me understand your team's operating procedures:
>
> 1. What are your SLAs for vulnerability remediation by severity? (Critical, High, Medium, Low)
> 2. What are your SLAs for alert triage and incident response?
> 3. What's your escalation path for security incidents?
> 4. What regular meetings does the team have? (standups, vuln reviews, compliance syncs, etc.)
> 5. Any on-call rotation?

**After answers:** Update `team-overview.md` — fill in SLA table, escalation path, meeting cadence with real values.

### Step 5: Security Guardrails

Ask:
> Let me customize the AI security guardrails for your team:
>
> 1. Are there any data classification levels I should know about? (What data can/can't be discussed with AI tools?)
> 2. Any tools or systems that should NEVER be accessed via AI-generated scripts?
> 3. Any compliance-specific constraints? (e.g., "all FedRAMP evidence must be reviewed by the compliance lead")
> 4. Any other rules or constraints for how the team uses AI tools?

**After answers:** Update `security-guardrails.md` — add team-specific rules. Keep the existing universal rules intact and add team-specific ones in a new section.

### Step 6: Approved Prompts Review

Ask:
> I've included a library of approved prompt templates in `approved-prompts.md`. Take a quick look at the categories:
>
> - Cloud Security (AWS/Azure/GCP queries and reviews)
> - Vulnerability Management (CVE triage, scan prioritization)
> - Compliance & Reporting (evidence collection, POA&M, ConMon)
> - SOC / Incident Response (alert triage, threat hunting, timelines)
> - Risk Assessment (risk analysis, vendor assessment)
>
> Are there any prompt categories your team would specifically benefit from? Any that aren't relevant? Any team-specific prompts you'd like to add?

**After answers:** Update `approved-prompts.md` as needed.

### Step 7: Confirm and Commit

After all updates, tell the user:

> Your team context is set up! Here's what I updated:
>
> - `team-overview.md` — [summary of team structure]
> - `tools-and-integrations.md` — [summary of tools configured]
> - `compliance-frameworks.md` — [summary of frameworks]
> - `security-guardrails.md` — [summary of any custom rules]
> - `approved-prompts.md` — [summary of any changes]
>
> Next steps:
> 1. Review the changes: `git diff`
> 2. Commit: `git add -A && git commit -m "Customize team context for [team name]"`
> 3. Push: `git push origin main`
> 4. Set up branch protection (see CONTRIBUTING.md for instructions)
> 5. Share contextOS-personal with your team — they'll get this context automatically via the submodule
>
> Your team members just need to:
> ```
> git clone --recurse-submodules https://github.com/YOUR-ORG/contextOS-personal.git ~/context-os
> cd ~/context-os && claude
> ```
> Claude will walk them through their personal setup automatically.

---

## Contribution Rules (After Setup)

This is the **team-wide shared knowledge base**. It is NOT a personal workspace.

Everything in this repo is read by every team member's Claude instance. Write accordingly.

### Content Must Be Team-Relevant
- Every file here is read by every team member's Claude instance
- Only add content that benefits the team, not just one individual
- Ask: "Would at least two other people use this?"

### No Personal Content
- No individual preferences, projects, goals, or learning plans
- No individual tool configurations or access details
- No "I" statements — write for "the team" or by role titles

### No Sensitive Data
- No credentials, API keys, tokens, or secrets
- No internal IP addresses, hostnames, or URLs
- No customer names, PII, or classified information

### Accuracy Required
- Compliance framework references must match official documentation
- Tool information must be current and verified
- Prompts must be tested before inclusion
- Cite framework versions (e.g., "NIST 800-53 Rev 5")

### Format Consistency
- Follow the structure of existing files
- Use markdown tables for structured data
- Use clear headers for navigation
- Include "when to use" context for prompts and workflows

### Making Changes
- Read `CONTRIBUTING.md` before making changes
- Create a branch — never commit directly to main (after branch protection is set up)
- Open a PR with clear description of what changed and why
- Wait for review before merging

### Do Not
- Add personal context or preferences to any file
- Modify files without reading the existing content first
- Create files that duplicate existing content
- Add speculative or unverified information
- Remove content without team discussion
