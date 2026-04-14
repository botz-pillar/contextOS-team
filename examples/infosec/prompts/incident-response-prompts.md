# Incident Response Prompts

> Detection, containment, investigation, forensics, and post-incident prompts.

---

### 1. Incident Classification
**When to use:** A potential incident has been reported or detected and needs to be categorized.
**Prerequisites:** Alert data, initial observations, affected system(s), reporter details.

> Classify this potential security incident:
> - Source: [HOW IT WAS DETECTED — SIEM/EDR/USER REPORT/THREAT INTEL]
> - Description: [WHAT HAPPENED]
> - Affected systems: [HOSTS/SERVICES/ACCOUNTS]
> - Initial indicators: [OBSERVABLES]
> - Business context: [WHAT THE SYSTEM DOES, SENSITIVITY LEVEL]
>
> Provide: (1) Incident category (malware, unauthorized access, data exfiltration, DoS, insider threat, etc.), (2) Recommended severity (P1-P4) with justification, (3) Applicable compliance/regulatory triggers (PCI, HIPAA, GDPR, FedRAMP), (4) Which IR playbook to activate, (5) Initial response team roles needed.

**What you'll get:** Structured classification with severity rating and playbook recommendation.
**Safety note:** Classification drives the entire response. Verify with a second analyst before escalating to P1/P2. Claude recommends classification, you make the call.

---

### 2. Containment Options Analysis
**When to use:** Incident is confirmed, need to decide how to contain without unnecessary business disruption.
**Prerequisites:** Confirmed incident details, affected assets inventory, network topology awareness.

> Analyze containment options for this confirmed incident:
> - Incident type: [CATEGORY]
> - Compromised assets: [LIST WITH IPs/HOSTNAMES]
> - Current attacker activity: [ACTIVE/DORMANT/UNKNOWN]
> - Business criticality of affected systems: [LOW/MEDIUM/HIGH/CRITICAL]
> - Network segmentation in place: [YES/NO — DESCRIBE]
>
> For each containment option, provide: (1) Action description, (2) Effectiveness at stopping spread, (3) Business impact, (4) Risk of tipping off the attacker, (5) Reversibility. Rank options from least to most disruptive.

**What you'll get:** Prioritized containment options with trade-off analysis.
**Safety note:** Claude recommends containment, you execute. Never auto-isolate systems without human approval. Coordinate with system owners before taking action.

---

### 3. Incident Timeline Builder
**When to use:** Piecing together the sequence of events during or after an incident.
**Prerequisites:** Log exports, alert data, analyst notes, and any witness reports. Timestamps from multiple sources.

> Build an incident timeline from these sources:
> - Source 1 ([TOOL/LOG TYPE]): [PASTE OR SUMMARIZE DATA]
> - Source 2 ([TOOL/LOG TYPE]): [PASTE OR SUMMARIZE DATA]
> - Source 3 ([TOOL/LOG TYPE]): [PASTE OR SUMMARIZE DATA]
> - Known timezone offsets: [LIST ANY NON-UTC SOURCES]
>
> Produce: (1) Chronological timeline in UTC, (2) Mark each entry with its source, (3) Identify gaps where we have no visibility, (4) Flag conflicting timestamps, (5) Highlight the initial access point and any lateral movement.
> Use this format per entry: [TIMESTAMP UTC] | [SOURCE] | [EVENT] | [SIGNIFICANCE]

**What you'll get:** Normalized, multi-source incident timeline with gap analysis.
**Safety note:** Redact PII and sensitive identifiers before pasting log data. Verify timezone conversions manually for critical entries.

---

### 4. Kill Chain Mapping
**When to use:** Need to map observed attacker behavior to a framework for reporting or gap analysis.
**Prerequisites:** Incident timeline or at least a list of observed attacker actions.

> Map these observed attacker activities to the Cyber Kill Chain and MITRE ATT&CK:
> - Observed activities: [LIST WHAT THE ATTACKER DID]
> - Tools/malware identified: [IF ANY]
> - Affected systems: [LIST]
>
> Provide: (1) Kill Chain phase mapping (Recon through Actions on Objectives), (2) MITRE ATT&CK technique IDs and names for each observed action, (3) Kill Chain phases where we have NO observed activity (blind spots), (4) Predicted next steps the attacker might take, (5) Detection opportunities we missed.

**What you'll get:** Dual-framework mapping with blind spot analysis and predicted next moves.
**Safety note:** Predictions are probabilistic, not certain. Do not assume attacker has stopped just because you see no activity in later phases.

---

### 5. IOC Extraction
**When to use:** Need to pull actionable indicators from incident data for blocking, hunting, or sharing.
**Prerequisites:** Incident artifacts (logs, malware samples metadata, email headers, URLs). Do NOT paste raw malware binaries.

> Extract and categorize IOCs from this incident data:
> [PASTE SANITIZED LOG DATA, EMAIL HEADERS, OR ARTIFACT DESCRIPTIONS]
>
> For each IOC provide: (1) Type (IP, domain, hash, URL, email address, file path, registry key, etc.), (2) Value, (3) Context (where/how it was observed), (4) Confidence level (confirmed malicious / suspicious / informational), (5) Recommended action (block, monitor, investigate).
> Format as a table. Also provide defanged versions for safe sharing.

**What you'll get:** Structured IOC table with defanged values ready for sharing or ingestion into threat intel platforms.
**Safety note:** Do not paste raw forensic evidence or malware samples directly. Summarize or use hashes only. Verify IOCs against threat intel feeds before blocking to avoid disrupting legitimate services.

---

### 6. Scope Assessment
**When to use:** Need to determine how far an incident has spread beyond the initially identified systems.
**Prerequisites:** Initial compromised asset(s), network diagrams or CMDB data, available log sources.

> Assess the scope of this incident:
> - Initially compromised: [SYSTEM(S)/ACCOUNT(S)]
> - Known attacker techniques: [LATERAL MOVEMENT METHODS OBSERVED]
> - Available log sources: [LIST — AD, DNS, PROXY, EDR, CLOUD TRAIL, ETC.]
> - Time window: [FIRST KNOWN ACTIVITY TO PRESENT]
>
> Provide: (1) Systems/accounts to investigate for compromise (prioritized), (2) Specific queries or searches to run per log source, (3) Indicators of lateral movement to look for, (4) Network segments potentially affected, (5) Data repositories the attacker could have accessed.
> Flag anything that would change the severity level if confirmed.

**What you'll get:** Prioritized scoping checklist with specific searches to run.
**Safety note:** Scope assessment is iterative. New findings may expand the scope. Do not declare containment until scoping is complete.

---

### 7. Evidence Preservation Checklist
**When to use:** Need to ensure forensic evidence is properly preserved before containment or remediation actions destroy it.
**Prerequisites:** List of affected systems, current incident status, whether law enforcement or legal may be involved.

> Generate an evidence preservation checklist for this incident:
> - Affected systems: [LIST WITH OS TYPES]
> - System states: [RUNNING/POWERED OFF/CLOUD INSTANCE]
> - Incident type: [CATEGORY]
> - Legal/LE involvement: [YES/NO/POSSIBLE]
> - Cloud environment: [AWS/AZURE/GCP/ON-PREM/HYBRID]
>
> For each system, provide: (1) Volatile evidence to capture first (order of volatility), (2) Specific commands or tools to use, (3) Non-volatile evidence to preserve, (4) Chain of custody documentation requirements, (5) What NOT to do (actions that would destroy evidence).
> Flag any evidence that has a time-sensitive collection window.

**What you'll get:** Prioritized evidence collection checklist following order of volatility.
**Safety note:** Evidence preservation must happen BEFORE containment actions when possible. If you are unsure about legal requirements, consult legal counsel before collecting. Document every action with timestamps and analyst name.

---

### 8. Stakeholder Communication Draft
**When to use:** Need to notify leadership, legal, customers, or regulators about an incident.
**Prerequisites:** Incident classification, current status, scope, and audience for the communication.

> Draft a stakeholder communication for this incident:
> - Audience: [EXECUTIVE LEADERSHIP / LEGAL / CUSTOMERS / REGULATOR / BOARD / ALL-HANDS]
> - Incident summary: [BRIEF DESCRIPTION]
> - Current status: [DETECTION / CONTAINMENT / ERADICATION / RECOVERY]
> - Impact: [KNOWN AND POTENTIAL]
> - Timeline: [KEY DATES]
> - Tone: [URGENT / INFORMATIONAL / REASSURING]
>
> Include: (1) What happened (appropriate detail for audience), (2) What we are doing about it, (3) What the impact is to them specifically, (4) What actions they need to take (if any), (5) Next update schedule.
> Do NOT include: specific IOCs, attacker TTPs, or internal security architecture details.

**What you'll get:** Audience-appropriate communication draft ready for review.
**Safety note:** All external communications must be reviewed by legal and approved by incident commander before sending. Do not disclose details that could aid the attacker or create legal liability. This is a draft, not a final product.

---

### 9. Forensic Artifact Analysis
**When to use:** You have collected forensic artifacts and need help interpreting them.
**Prerequisites:** Artifact descriptions, hashes, metadata, or summarized content. Tool output from forensic utilities.

> Analyze these forensic artifacts:
> - Artifact type: [MEMORY DUMP STRINGS / REGISTRY EXPORT / PREFETCH DATA / EVENT LOG EXPORT / BROWSER HISTORY / SCHEDULED TASKS / ETC.]
> - Collection tool: [TOOL USED]
> - Context: [WHAT SYSTEM, WHAT WE SUSPECT]
> - Data: [PASTE SUMMARIZED OUTPUT OR METADATA — NOT RAW BINARY]
>
> Provide: (1) What each artifact indicates, (2) Signs of malicious activity vs. normal behavior, (3) Timestamps and their significance, (4) Connections to known attacker techniques (with MITRE ATT&CK mapping), (5) Additional artifacts to collect based on what these reveal.

**What you'll get:** Interpreted artifact analysis with technique mapping and follow-up collection recommendations.
**Safety note:** Do not paste raw forensic images, memory dumps, or malware samples directly into the prompt. Use tool output, strings, hashes, and metadata only. Preserve original evidence integrity by working on copies.

---

### 10. Ransomware Response Playbook
**When to use:** Ransomware has been detected or detonated in the environment.
**Prerequisites:** Affected system(s), ransomware note or indicators, current spread status, backup availability.

> Guide me through ransomware response:
> - Ransomware identified: [NAME/FAMILY IF KNOWN, OR "UNKNOWN"]
> - Ransom note text: [PASTE OR SUMMARIZE]
> - Systems affected: [COUNT AND TYPES]
> - Is it still spreading: [YES/NO/UNKNOWN]
> - Backup status: [AVAILABLE/COMPROMISED/UNTESTED/OFFLINE]
> - Business impact: [WHAT IS DOWN]
>
> Provide a phased response plan:
> Phase 1 — Immediate (first 30 min): Stop the spread.
> Phase 2 — Assessment (30 min to 4 hrs): Determine scope and variant.
> Phase 3 — Decision point: Pay vs. recover analysis (no recommendation to pay, just factors).
> Phase 4 — Recovery: Restoration steps.
> Phase 5 — Hardening: Prevent recurrence.
> Include specific checks for: backup integrity, decryptor availability (nomoreransom.org), data exfiltration indicators.

**What you'll get:** Phased ransomware response plan tailored to your situation.
**Safety note:** Do NOT pay ransom without executive, legal, and potentially law enforcement consultation. Do not connect backups to the network until the threat is fully eradicated. Claude provides the framework, your team executes each step with proper authorization.

---

### 11. Data Breach Impact Assessment
**When to use:** Confirmed or suspected unauthorized access to sensitive data.
**Prerequisites:** What data was accessed/exfiltrated, affected data stores, data classification info, applicable regulations.

> Assess the impact of this data breach:
> - Data accessed: [DESCRIBE DATA TYPES — PII, PHI, FINANCIAL, IP, CREDENTIALS, ETC.]
> - Volume: [NUMBER OF RECORDS/FILES OR ESTIMATE]
> - Data subjects: [EMPLOYEES / CUSTOMERS / PARTNERS / PATIENTS]
> - Exfiltration confirmed: [YES / SUSPECTED / NO EVIDENCE]
> - Jurisdictions: [WHERE DATA SUBJECTS RESIDE]
> - Applicable regulations: [GDPR / HIPAA / PCI-DSS / STATE BREACH LAWS / FEDRAMP / OTHER]
>
> Provide: (1) Data sensitivity classification, (2) Notification requirements per regulation (with deadlines), (3) Regulatory bodies to notify, (4) Individual notification requirements, (5) Potential fines/penalties, (6) Recommended immediate risk mitigation for affected individuals.

**What you'll get:** Regulatory impact assessment with notification timelines and requirements.
**Safety note:** This is not legal advice. Engage legal counsel for all breach notification decisions. Notification deadlines are strict (e.g., 72 hours for GDPR) — start the clock when you confirm the breach. Document everything for potential litigation or regulatory inquiry.

---

### 12. Eradication Verification
**When to use:** Containment is complete, need to verify the threat has been fully removed before recovery.
**Prerequisites:** Known attacker TTPs, IOCs, compromised systems list, containment actions taken.

> Verify eradication for this incident:
> - Attacker techniques used: [LIST]
> - Known IOCs: [LIST]
> - Compromised systems: [LIST]
> - Containment actions taken: [WHAT WAS DONE]
> - Persistence mechanisms found: [LIST ANY KNOWN]
>
> Provide: (1) Checklist of persistence mechanisms to verify removal (registry keys, scheduled tasks, services, accounts, cron jobs, web shells, etc.), (2) Specific verification commands per OS type, (3) Network-level checks (DNS, firewall, proxy logs), (4) Identity-level checks (new accounts, modified permissions, OAuth tokens, API keys), (5) Cloud-specific checks if applicable, (6) Criteria for declaring eradication complete.

**What you'll get:** Comprehensive eradication verification checklist with specific commands and pass/fail criteria.
**Safety note:** Eradication is not complete until all persistence mechanisms are confirmed removed. Missing even one backdoor means re-compromise. Have a second analyst independently verify critical systems. Do not proceed to recovery until eradication is confirmed.

---

### 13. Recovery Plan
**When to use:** Threat is eradicated, need to bring systems back online safely.
**Prerequisites:** Eradication verification complete, clean backups identified, business priority for system restoration.

> Build a recovery plan for this incident:
> - Systems to restore: [LIST WITH BUSINESS PRIORITY]
> - Clean backup dates: [PER SYSTEM]
> - Eradication status: [CONFIRMED / PARTIAL]
> - Business dependencies: [WHAT NEEDS TO COME UP FIRST]
> - Monitoring in place: [WHAT DETECTION IS ACTIVE]
>
> Provide: (1) Restoration sequence based on business priority and dependencies, (2) Per-system restoration steps (rebuild vs. restore from backup vs. patch and return), (3) Validation checks before reconnecting each system to production, (4) Enhanced monitoring to deploy during recovery, (5) Rollback plan if re-compromise is detected, (6) Success criteria for declaring recovery complete.

**What you'll get:** Sequenced recovery plan with validation gates and monitoring requirements.
**Safety note:** Restore to an isolated network segment first and validate before reconnecting to production. Monitor restored systems closely for 72+ hours. Keep containment controls in place until recovery is fully validated. Do not rush recovery under business pressure without proper verification.

---

### 14. Post-Incident Report
**When to use:** Incident is resolved, need to document everything for leadership, compliance, and future reference.
**Prerequisites:** Incident timeline, actions taken, impact assessment, all analyst notes.

> Draft a post-incident report from these details:
> - Incident ID/name: [IDENTIFIER]
> - Date range: [DETECTION TO CLOSURE]
> - Classification: [TYPE AND SEVERITY]
> - Executive summary: [2-3 SENTENCES OF WHAT HAPPENED]
> - Timeline: [KEY EVENTS OR PASTE TIMELINE FROM PROMPT #3]
> - Root cause: [IF KNOWN]
> - Impact: [SYSTEMS, DATA, BUSINESS OPERATIONS, FINANCIAL]
> - Actions taken: [DETECTION, CONTAINMENT, ERADICATION, RECOVERY STEPS]
> - What worked well: [LIST]
> - What needs improvement: [LIST]
>
> Structure the report with: (1) Executive Summary (1 paragraph), (2) Incident Overview, (3) Timeline, (4) Technical Analysis, (5) Impact Assessment, (6) Response Actions, (7) Root Cause Analysis, (8) Recommendations, (9) Appendices (IOCs, evidence references).

**What you'll get:** Structured post-incident report draft ready for review and finalization.
**Safety note:** Mark the report with appropriate classification. Limit distribution to need-to-know. Redact specific IOCs and attacker infrastructure details from versions shared outside the security team. Have legal review before sharing externally.

---

### 15. Lessons Learned Facilitation
**When to use:** Scheduling or running a post-incident lessons learned meeting.
**Prerequisites:** Completed post-incident report, list of participants, incident timeline.

> Prepare a lessons learned session for this incident:
> - Incident summary: [BRIEF DESCRIPTION]
> - Incident duration: [DETECTION TO CLOSURE]
> - Teams involved: [LIST DEPARTMENTS/TEAMS]
> - Known pain points during response: [LIST]
> - Current detection/response gaps identified: [LIST]
>
> Provide: (1) Meeting agenda with time allocations (target 60-90 minutes), (2) Blameless discussion prompts for each IR phase (detection, analysis, containment, eradication, recovery, communication), (3) Key questions to surface systemic issues vs. one-off mistakes, (4) Framework for prioritizing improvements (effort vs. impact), (5) Action item template (owner, deadline, success criteria), (6) Metrics to track improvement over time.
> Keep the tone constructive and blameless. Focus on process, not people.

**What you'll get:** Complete lessons learned facilitation kit with agenda, discussion prompts, and action tracking templates.
**Safety note:** Lessons learned must be blameless to be effective. If anyone feels targeted, the session will shut down and you will lose valuable improvement opportunities. Focus on what the process allowed to happen, not who made a mistake. Document action items with real owners and deadlines or nothing will change.
