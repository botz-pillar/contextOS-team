# Compliance Manager Prompts

> Evidence collection, audit preparation, gap analysis, POA&M management, and compliance reporting prompts.

---

### 1. Control Evidence Collection
**When to use:** You need to gather and organize evidence artifacts for a specific control or control family ahead of an audit or continuous monitoring cycle.
**Prerequisites:** Control ID and description, list of systems in scope, access to artifact repositories (ticketing system, SIEM, config management).

> I need to collect evidence for control [CONTROL-ID] ([control title]) under [FRAMEWORK — e.g., FedRAMP Moderate, CMMC Level 2, SOC 2]. The system boundary includes [LIST SYSTEMS/COMPONENTS]. For this control, identify: (1) the specific evidence artifacts I need to collect, (2) where each artifact typically lives (tool, system, or team), (3) the format the auditor will expect (screenshot, export, log extract, policy document), and (4) any common gaps or weak spots auditors flag for this control. Organize the output as a checklist I can hand to my team.

**What you'll get:** A structured evidence checklist with artifact names, source systems, expected formats, and risk areas.
**Safety note:** Verify artifact freshness -- evidence must fall within the audit period. Confirm screenshot timestamps and log date ranges before packaging.

---

### 2. POA&M Entry Draft
**When to use:** A control deficiency, failed scan finding, or audit observation needs to be formally tracked in your Plan of Actions and Milestones.
**Prerequisites:** Finding description, affected control(s), severity/risk rating, system owner information.

> Draft a POA&M entry for the following finding: [DESCRIBE THE FINDING]. The affected control is [CONTROL-ID] under [FRAMEWORK]. The weakness was identified on [DATE] during [ASSESSMENT TYPE — e.g., annual assessment, vulnerability scan, internal review]. Include: (1) weakness description, (2) affected control(s), (3) point of contact and responsible team, (4) planned remediation steps with milestones, (5) estimated completion date, (6) risk level and interim risk mitigation (if any), and (7) resource requirements. Format this as a table row compatible with the FedRAMP POA&M template.

**What you'll get:** A complete POA&M entry ready for review and insertion into your tracking spreadsheet or GRC tool.
**Safety note:** Confirm the scheduled completion date is realistic with the remediation team. Do not close or downgrade findings without documented evidence of remediation.

---

### 3. SSP Section Draft
**When to use:** You need to write or update a section of the System Security Plan for an authorization boundary.
**Prerequisites:** System name and boundary description, the specific SSP section or control family to draft, current architecture documentation.

> Draft SSP content for [SECTION — e.g., Section 9.1 Access Control (AC) family / Section 2 System Description / Section 13 Contingency Planning] for the [SYSTEM NAME] system. The system is a [BRIEF ARCHITECTURE — e.g., AWS-hosted SaaS application with a React frontend, Node.js API, and PostgreSQL RDS database]. The authorization boundary includes [BOUNDARY COMPONENTS]. Write in the style expected by a FedRAMP 3PAO reviewer: factual, specific, referencing actual components by name, and clearly stating how each control requirement is satisfied (implemented, partially implemented, planned, or inherited). Include responsible roles and reference specific policies/procedures where applicable.

**What you'll get:** Draft SSP narrative ready for SME review, written in the expected compliance documentation style.
**Safety note:** Every technical claim must be verified against the actual system configuration. SSP narrative that does not match reality is a material misrepresentation.

---

### 4. Gap Analysis (Framework vs Current State)
**When to use:** You are assessing readiness for a new framework, preparing for an initial authorization, or evaluating a second framework overlay against current controls.
**Prerequisites:** Target framework and maturity level, current control inventory or existing SSP/policies, access to system architecture documentation.

> Perform a gap analysis comparing our current security posture against [TARGET FRAMEWORK AND LEVEL — e.g., FedRAMP Moderate, CMMC Level 2, SOC 2 Type II]. Here is our current state: [PASTE CURRENT CONTROL SUMMARY, EXISTING SSP EXCERPT, OR LIST OF IMPLEMENTED CONTROLS]. For each control domain, identify: (1) controls we likely satisfy based on the information provided, (2) controls with partial implementation or gaps, (3) controls with no current coverage, and (4) recommended remediation priority (critical, high, medium, low) based on audit impact. Present the results as a table grouped by control family with a summary of total gap count and estimated remediation effort.

**What you'll get:** A structured gap analysis table with per-family status, gap counts, and prioritized remediation recommendations.
**Safety note:** A gap analysis is a point-in-time estimate. Validate each "satisfied" rating with actual evidence before reporting readiness to leadership or assessors.

---

### 5. ConMon Monthly Report
**When to use:** It is time to compile the monthly Continuous Monitoring report for your ATO or compliance program.
**Prerequisites:** Monthly vulnerability scan results, POA&M updates, significant change log, incident log, and any deviation requests for the reporting period.

> Generate a Continuous Monitoring monthly report for [SYSTEM NAME] for the reporting period [MONTH/YEAR]. Here are the inputs: Vulnerability scan summary: [PASTE OR DESCRIBE — e.g., 3 critical, 12 high, 45 medium, 120 low findings]. POA&M updates: [LIST OPEN/CLOSED/UPDATED ITEMS]. Significant changes: [LIST ANY — or "none"]. Security incidents: [LIST ANY — or "none"]. Include: (1) executive summary, (2) vulnerability scan trending (this month vs. prior month), (3) POA&M status summary with aging analysis, (4) significant change summary, (5) incident summary, and (6) risk posture assessment. Use the format and tone expected by a FedRAMP AO or ISSO reviewer.

**What you'll get:** A complete ConMon report draft with all required sections, ready for ISSO review and submission.
**Safety note:** Double-check all scan numbers against raw scan data. Verify POA&M closure evidence exists before marking items closed.

---

### 6. Audit Preparation Checklist
**When to use:** An external audit or assessment is scheduled and you need to ensure the team is ready.
**Prerequisites:** Audit type and framework, scheduled dates, scope of assessment, assessor/3PAO name if known.

> We have a [AUDIT TYPE — e.g., FedRAMP annual assessment, SOC 2 Type II audit, CMMC Level 2 assessment] scheduled for [DATE RANGE]. The scope covers [SYSTEM/BOUNDARY]. Create a comprehensive audit preparation checklist organized by timeline: (1) 60 days out — documentation review, evidence pre-staging, team notifications; (2) 30 days out — evidence collection, dry-run interviews, access provisioning for assessors; (3) 2 weeks out — final evidence review, open item resolution, logistics; (4) week of — daily readiness tasks, interview schedules, war room setup; (5) during audit — response protocols, evidence request tracking, escalation paths. Include specific artifacts to prepare for [FRAMEWORK] and common pitfalls that delay or derail assessments.

**What you'll get:** A phased audit prep checklist with specific tasks, owners, and deadlines working backward from the audit date.
**Safety note:** Confirm assessor access requirements (VPN, badge, NDA) well in advance. Never fabricate or backdate evidence artifacts.

---

### 7. Auditor Question Prep
**When to use:** You need to prepare control owners and SMEs for auditor interviews and evidence walkthroughs.
**Prerequisites:** Controls in scope for the interview, the role/team being interviewed, current control implementation details.

> Prepare me for an auditor interview covering [CONTROL FAMILY OR SPECIFIC CONTROLS — e.g., AC-2 Account Management, IR-4 Incident Handling]. The interview will be with the [ROLE — e.g., System Administrator, SOC Analyst, ISSO]. For each control, generate: (1) likely auditor questions (both standard and follow-up probes), (2) the ideal answer structure (what to cover, what evidence to reference), (3) red-flag answers to avoid, (4) specific artifacts the auditor may request during the interview, and (5) practice scenarios the auditor might pose. Tailor the questions to [FRAMEWORK] assessment methodology.

**What you'll get:** An interview prep guide with realistic questions, answer frameworks, and artifact references for each control.
**Safety note:** Coach interviewees to answer honestly. Scripted or evasive answers erode assessor trust and can trigger deeper scrutiny.

---

### 8. Control Mapping (Cross-Framework)
**When to use:** You need to map controls between two frameworks to leverage existing compliance work, identify overlaps, or prepare for a multi-framework audit.
**Prerequisites:** The two (or more) frameworks to map, specific control families or domains of interest.

> Create a control mapping between [FRAMEWORK A — e.g., NIST 800-53 Rev 5 Moderate baseline] and [FRAMEWORK B — e.g., CMMC Level 2 / SOC 2 Trust Services Criteria / ISO 27001 Annex A]. For each control in Framework A, identify: (1) the corresponding control(s) in Framework B, (2) the degree of overlap (full, partial, no match), (3) any additional requirements in Framework B not covered by Framework A, and (4) recommended approach for satisfying both with a single evidence set. Focus on [SPECIFIC FAMILIES — e.g., Access Control, Incident Response, Configuration Management] or provide the full mapping. Present as a table.

**What you'll get:** A cross-framework mapping table showing control relationships, overlap percentages, and dual-compliance strategies.
**Safety note:** Mappings are approximations. Always verify that a single piece of evidence truly satisfies both frameworks' specific language before claiming dual coverage.

---

### 9. Policy Draft/Review
**When to use:** You need to create a new security policy or review and update an existing one to align with framework requirements.
**Prerequisites:** Policy topic, applicable framework(s), organizational context (size, industry, system types), existing policy text (if reviewing).

> [DRAFT/REVIEW] a [POLICY TOPIC — e.g., Access Control Policy, Incident Response Policy, Configuration Management Policy] for [ORGANIZATION NAME]. The policy must satisfy [FRAMEWORK REQUIREMENTS — e.g., FedRAMP Moderate AC family, CMMC Level 2 AC.L2-3.1.1 through AC.L2-3.1.22, SOC 2 CC6.1-CC6.8]. Include: (1) purpose and scope, (2) roles and responsibilities, (3) policy statements mapped to specific control requirements, (4) enforcement and exceptions process, (5) review cycle and version history table. [IF REVIEWING: Here is the current policy text: [PASTE TEXT]. Identify gaps against the framework requirements, outdated references, and areas where language is too vague to satisfy an auditor.]

**What you'll get:** A complete policy draft (or a redlined review with specific gap callouts and recommended language fixes).
**Safety note:** Policies must reflect actual practice. Publishing a policy the organization does not follow creates audit findings and legal exposure.

---

### 10. Risk Acceptance Memo
**When to use:** A residual risk cannot be remediated within the required timeframe and leadership needs to formally accept it.
**Prerequisites:** Finding details, remediation analysis, business justification, compensating controls in place.

> Draft a risk acceptance memo for the following residual risk: [DESCRIBE THE RISK AND ASSOCIATED FINDING]. The affected control is [CONTROL-ID] under [FRAMEWORK]. Remediation is not feasible because [REASON — e.g., vendor dependency, legacy system constraint, cost-prohibitive, operational impact]. Include: (1) risk description and business context, (2) affected systems and data classification, (3) likelihood and impact assessment (use NIST 800-30 or organizational risk matrix), (4) compensating controls currently in place, (5) residual risk level after compensating controls, (6) business justification for acceptance, (7) acceptance duration and reassessment date, and (8) approval signature blocks (AO, ISSO, System Owner). Format as a formal memo suitable for the authorization package.

**What you'll get:** A formal risk acceptance memo ready for leadership review and signature.
**Safety note:** Risk acceptance must come from an authorized official with the authority to accept risk on behalf of the organization. Compliance staff document the risk -- they do not accept it.

---

### 11. Compliance Status Dashboard
**When to use:** You need to produce a compliance status summary for leadership, the PMO, or an authorization official.
**Prerequisites:** Current POA&M data, scan results trending, authorization status, key metric data.

> Create a compliance status dashboard summary for [SYSTEM NAME / PROGRAM NAME] as of [DATE]. Data inputs: Total controls: [N], Satisfied: [N], Partially implemented: [N], Not implemented: [N]. Open POA&M items: [N] (Critical: [N], High: [N], Moderate: [N], Low: [N]). Average POA&M age: [N days]. Overdue items: [N]. Vulnerability scan trend: [LAST 3 MONTHS SUMMARY]. Authorization status: [ATO/P-ATO/DATO — expiration date]. Generate: (1) a text-based executive summary with red/amber/green risk indicators, (2) key metrics table, (3) top 5 risks requiring leadership attention, (4) trend analysis narrative (improving/stable/declining), and (5) recommended actions for the next 30 days.

**What you'll get:** An executive-ready compliance dashboard narrative with prioritized risk items and action recommendations.
**Safety note:** Ensure metrics match source data exactly. Dashboards that understate risk exposure can lead to uninformed authorization decisions.

---

### 12. Vendor Compliance Assessment
**When to use:** You are evaluating a vendor, cloud service provider, or third-party tool for compliance impact and supply chain risk.
**Prerequisites:** Vendor name and service description, your framework requirements, vendor-provided compliance documentation (SOC 2 report, FedRAMP package, SIG questionnaire).

> Assess the compliance posture of [VENDOR NAME] for use within our [FRAMEWORK — e.g., FedRAMP Moderate] authorization boundary. The vendor provides [SERVICE DESCRIPTION]. Here is what they have provided: [LIST COMPLIANCE ARTIFACTS — e.g., SOC 2 Type II report dated X, FedRAMP Agency ATO, ISO 27001 cert, completed SIG Lite]. Evaluate: (1) does their compliance coverage satisfy our inherited control requirements, (2) what gaps exist between their attestation scope and our needs, (3) what customer responsibilities remain (shared responsibility model), (4) are there any red flags in their SOC 2 report (qualified opinions, exceptions, CAMs), (5) what additional contractual or technical controls do we need, and (6) what is the overall risk rating for onboarding this vendor (low/moderate/high)?

**What you'll get:** A vendor compliance assessment with gap identification, shared responsibility mapping, and a risk-rated recommendation.
**Safety note:** Always verify the scope of vendor attestations matches your actual use case. A SOC 2 report for Product A does not cover Product B from the same vendor.

---

### 13. Significant Change Request
**When to use:** A system change may affect the security posture or authorization boundary and needs to be evaluated through the change management/significant change process.
**Prerequisites:** Change description, affected components, current authorization details.

> Evaluate the following system change for significant change determination under [FRAMEWORK — e.g., FedRAMP, CMMC]: [DESCRIBE THE CHANGE — e.g., migrating database from RDS to Aurora, adding a new third-party API integration, deploying a new microservice, changing authentication providers]. Provide: (1) significant change determination (yes/no/needs further analysis) with rationale per [FRAMEWORK] significant change criteria, (2) list of controls potentially affected by this change, (3) required security assessment activities (full assessment, targeted assessment, or documentation-only update), (4) documentation updates needed (SSP sections, network diagrams, data flow diagrams, POA&M), (5) stakeholder notifications required (AO, ISSO, 3PAO, JAB if applicable), and (6) draft significant change request form content.

**What you'll get:** A significant change determination with required assessment scope, documentation updates, and a draft change request.
**Safety note:** When in doubt, escalate to your AO or ISSO. Undisclosed significant changes can result in ATO revocation.

---

### 14. Compliance Training Material
**When to use:** You need to create role-specific compliance training content for system users, developers, administrators, or management.
**Prerequisites:** Target audience and their role, framework requirements, specific compliance topics to cover.

> Create compliance training material for [AUDIENCE — e.g., developers, system administrators, end users, new hires, management] covering [TOPICS — e.g., security awareness for FedRAMP systems, CMMC CUI handling requirements, incident reporting procedures, access control responsibilities]. Include: (1) learning objectives (3-5 measurable outcomes), (2) key concepts explained in plain language (avoid jargon where possible), (3) real-world scenarios or examples relevant to the audience's daily work, (4) do's and don'ts checklist, (5) quick-reference card summarizing key responsibilities, and (6) quiz questions (5-10) to verify comprehension. Target a [DURATION — e.g., 15-minute, 30-minute, 1-hour] session. The tone should be practical and engaging, not checkbox compliance.

**What you'll get:** A complete training module with objectives, content, scenarios, a reference card, and assessment questions.
**Safety note:** Training materials must be reviewed by compliance and legal before distribution. Ensure all regulatory citations are current and accurate for your authorization.

---

### 15. Executive Compliance Brief
**When to use:** You need to brief the CISO, CTO, or executive leadership on compliance status, upcoming risks, or authorization decisions.
**Prerequisites:** Current compliance posture data, upcoming milestones or deadlines, budget or resource constraints, any urgent issues.

> Prepare an executive compliance brief for [AUDIENCE — e.g., CISO, CTO, Board] covering [SYSTEM/PROGRAM NAME]. Context: [PASTE KEY DATA — authorization status, open finding counts, upcoming audit dates, budget issues, staffing gaps]. The brief should include: (1) 3-sentence compliance posture summary (current state in plain English), (2) authorization status and timeline (key dates, deadlines, dependencies), (3) top 3 risks with business impact translation (not technical jargon -- frame in terms of revenue, reputation, contractual obligations), (4) resource asks with justification (headcount, tools, budget -- tied to specific compliance outcomes), (5) decision points requiring executive input, and (6) recommended actions with clear owners and deadlines. Keep the entire brief to one page. Executives have 5 minutes -- lead with what matters.

**What you'll get:** A one-page executive brief with a clear narrative, prioritized risks, and specific decision points.
**Safety note:** Verify all numbers before presenting to leadership. Inaccurate compliance data in an executive brief undermines credibility and can lead to poor authorization decisions.
