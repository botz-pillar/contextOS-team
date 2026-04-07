# Risk & GRC Prompts

> Risk assessments, vendor reviews, policy development, and governance prompts.

---

### 1. Risk Scenario Analysis
**When to use:** Evaluating a specific threat scenario against your environment.
**Prerequisites:** Scenario description, affected assets/processes, existing controls.

> Analyze this risk scenario:
> - Threat: [DESCRIBE THE THREAT]
> - Affected assets: [SYSTEMS/DATA/PROCESSES]
> - Existing controls: [CURRENT MITIGATIONS]
> - Business context: [WHAT THE ASSET SUPPORTS]
>
> Provide: (1) Likelihood rating (1-5) with justification, (2) Impact rating (1-5) across confidentiality/integrity/availability, (3) Inherent vs. residual risk score, (4) Control gaps, (5) Three realistic attack paths for this scenario.
> Use qualitative ratings unless I provide a quantitative framework.

**What you'll get:** Structured risk analysis with ratings and attack path reasoning.
**Safety note:** Risk ratings are advisory. Validate likelihood against your threat intelligence and actual environment before recording in your register.

---

### 2. Vendor Security Assessment
**When to use:** Evaluating a new vendor or reassessing an existing one.
**Prerequisites:** Vendor name, service description, data they'll access/process, their SOC 2 or security documentation if available.

> Assess this vendor's security posture:
> - Vendor: [NAME]
> - Service: [WHAT THEY PROVIDE]
> - Data involved: [WHAT DATA THEY TOUCH AND CLASSIFICATION]
> - Documentation provided: [SOC 2 / ISO 27001 / SIG / QUESTIONNAIRE RESPONSES]
> - [PASTE RELEVANT EXCERPTS OR FINDINGS]
>
> Evaluate: (1) Key risks based on the service type, (2) Gaps or concerns in their documentation, (3) Questions to ask the vendor, (4) Recommended contract clauses, (5) Ongoing monitoring requirements.
> Flag anything that would be a dealbreaker for [REGULATED/STANDARD] environments.

**What you'll get:** Vendor risk profile with specific follow-up questions and contract recommendations.
**Safety note:** Never rely solely on AI analysis for vendor approval. Review actual audit reports and certifications yourself.

---

### 3. Risk Register Update
**When to use:** Adding a new risk or updating an existing entry in the risk register.
**Prerequisites:** Risk description, current register format/fields, any recent incidents or audit findings.

> Help me draft a risk register entry:
> - Risk title: [SHORT NAME]
> - Risk description: [WHAT COULD HAPPEN]
> - Risk category: [OPERATIONAL/STRATEGIC/COMPLIANCE/FINANCIAL/TECHNOLOGY]
> - Threat source: [INTERNAL/EXTERNAL/ENVIRONMENTAL]
> - Affected assets: [SYSTEMS/PROCESSES/DATA]
> - Current controls: [WHAT'S IN PLACE]
> - Recent events: [ANY INCIDENTS OR NEAR-MISSES]
>
> Generate: (1) Formal risk statement (if-then format), (2) Inherent risk rating, (3) Control effectiveness assessment, (4) Residual risk rating, (5) Recommended risk response (accept/mitigate/transfer/avoid), (6) KRIs to monitor.

**What you'll get:** Complete risk register entry ready for review and approval.
**Safety note:** Risk ownership must be assigned to a human. Verify ratings against your organization's risk matrix.

---

### 4. Security Policy Draft
**When to use:** Writing a new policy or updating an existing one.
**Prerequisites:** Policy topic, applicable framework (NIST/ISO/SOC 2), organizational context, target audience.

> Draft a security policy for: [TOPIC]
> - Framework alignment: [NIST CSF / ISO 27001 / SOC 2 / CIS / OTHER]
> - Organization type: [INDUSTRY AND SIZE]
> - Audience: [WHO MUST FOLLOW THIS]
> - Existing policy (if updating): [PASTE OR SUMMARIZE CURRENT VERSION]
> - Key requirements to address: [SPECIFIC ITEMS TO INCLUDE]
>
> Include: (1) Purpose and scope, (2) Roles and responsibilities, (3) Policy statements, (4) Standards/procedures (high-level), (5) Exceptions process, (6) Enforcement, (7) Review cadence.
> Write in plain language. Avoid legalese unless required.

**What you'll get:** Draft policy document aligned to your framework with standard sections.
**Safety note:** All policies require legal review and management approval before publishing. This is a starting draft, not a final document.

---

### 5. Risk Appetite Statement
**When to use:** Defining or revising the organization's risk appetite for board/executive review.
**Prerequisites:** Business strategy, current risk posture, industry context, any regulatory constraints.

> Help me draft a risk appetite statement:
> - Organization: [TYPE/INDUSTRY/SIZE]
> - Strategic priorities: [KEY BUSINESS GOALS]
> - Regulatory environment: [APPLICABLE REGULATIONS]
> - Recent risk events: [ANY INCIDENTS OR NEAR-MISSES THAT SHIFT APPETITE]
> - Current posture: [CONSERVATIVE/MODERATE/AGGRESSIVE]
>
> Produce: (1) Overall risk appetite statement (2-3 sentences), (2) Risk appetite by category (operational, strategic, compliance, financial, technology), (3) Risk tolerance thresholds (what triggers escalation), (4) Specific boundaries (what we will never accept), (5) Review triggers (when to revisit appetite).
> Write for a board-level audience.

**What you'll get:** Board-ready risk appetite statement with category-level detail.
**Safety note:** Risk appetite must be approved by the board or executive leadership. This is a draft for their consideration.

---

### 6. Third-Party Risk Questionnaire Review
**When to use:** Reviewing a vendor's completed security questionnaire (SIG, CAIQ, custom).
**Prerequisites:** Completed questionnaire responses, your organization's risk thresholds.

> Review this completed vendor security questionnaire:
> - Questionnaire type: [SIG LITE / SIG FULL / CAIQ / CUSTOM]
> - Vendor: [NAME]
> - Service criticality: [LOW/MEDIUM/HIGH/CRITICAL]
> - Data classification: [PUBLIC/INTERNAL/CONFIDENTIAL/RESTRICTED]
> - Responses: [PASTE KEY SECTIONS OR FULL RESPONSES]
>
> Identify: (1) Answers that indicate control gaps, (2) Vague or non-committal responses that need follow-up, (3) Contradictions between answers, (4) Missing or skipped questions, (5) Overall risk tier recommendation, (6) Specific follow-up questions to send back.
> Prioritize findings by risk to our data.

**What you'll get:** Questionnaire review with flagged concerns and follow-up questions.
**Safety note:** Questionnaire self-assessments are unverified claims. Request evidence for critical controls.

---

### 7. Risk Treatment Options
**When to use:** A risk has been identified and you need to evaluate treatment strategies.
**Prerequisites:** Risk description, current residual risk level, budget/resource constraints, business context.

> Evaluate risk treatment options for:
> - Risk: [DESCRIPTION]
> - Current residual risk: [RATING]
> - Risk appetite for this category: [THRESHOLD]
> - Budget constraints: [AVAILABLE BUDGET OR "LIMITED"]
> - Timeline: [WHEN DOES THIS NEED TO BE ADDRESSED]
> - Business constraints: [ANYTHING THAT LIMITS OPTIONS]
>
> For each treatment option (mitigate, transfer, accept, avoid), provide: (1) Specific actions, (2) Estimated cost and effort, (3) Expected residual risk after treatment, (4) Pros and cons, (5) Implementation timeline.
> Recommend the best option with justification.

**What you'll get:** Decision-ready comparison of treatment options with a recommendation.
**Safety note:** Cost estimates are approximate. Get actual quotes for insurance, tooling, and staffing before committing.

---

### 8. Security Metrics Dashboard
**When to use:** Building or refreshing a security metrics program for management reporting.
**Prerequisites:** Audience (CISO, board, ops), current tools/data sources, reporting cadence.

> Design security metrics for a [AUDIENCE]-level dashboard:
> - Organization: [TYPE/SIZE]
> - Security program maturity: [EARLY/DEVELOPING/ESTABLISHED/ADVANCED]
> - Available data sources: [SIEM/VULN SCANNER/EDR/GRC TOOL/TICKETING]
> - Reporting cadence: [WEEKLY/MONTHLY/QUARTERLY]
> - Key concerns: [WHAT LEADERSHIP CARES ABOUT]
>
> For each metric provide: (1) Metric name and definition, (2) Data source, (3) Target/threshold, (4) Trend direction (good = up or down), (5) How to present it (number, percentage, trend line, RAG status).
> Include a mix of leading and lagging indicators. Keep it to 8-12 metrics max.

**What you'll get:** Dashboard design with metric definitions, sources, and targets.
**Safety note:** Metrics should reflect real data. Do not fabricate baselines; measure first, then set targets.

---

### 9. Board/Executive Risk Report
**When to use:** Preparing a risk update for board or executive leadership.
**Prerequisites:** Current risk register highlights, recent incidents, metric trends, program updates.

> Draft an executive risk report:
> - Audience: [BOARD / C-SUITE / RISK COMMITTEE]
> - Reporting period: [DATE RANGE]
> - Top risks (paste from register): [LIST TOP 5-10 RISKS WITH RATINGS]
> - Notable incidents: [SUMMARY OF INCIDENTS THIS PERIOD]
> - Key metrics: [PASTE CURRENT METRICS]
> - Program updates: [NEW INITIATIVES, COMPLETED PROJECTS, AUDIT RESULTS]
> - Emerging risks: [NEW THREATS OR CHANGES IN LANDSCAPE]
>
> Format as: (1) Executive summary (3-5 sentences), (2) Risk posture overview (RAG status), (3) Top risk changes (what moved up/down and why), (4) Incident summary, (5) Key metrics with trend, (6) Recommendations requiring board action, (7) Outlook.
> Keep it to 2 pages max. Use plain business language.

**What you'll get:** Board-ready risk report draft.
**Safety note:** Verify all numbers and incident details before presenting. Remove any sensitive technical details not appropriate for this audience.

---

### 10. Exception Request Review
**When to use:** Someone has submitted a policy exception request and you need to evaluate it.
**Prerequisites:** Exception request details, the policy being excepted, business justification, compensating controls proposed.

> Evaluate this security policy exception request:
> - Policy: [POLICY NAME AND SECTION]
> - Requested by: [TEAM/INDIVIDUAL/ROLE]
> - Exception: [WHAT THEY WANT TO DO THAT VIOLATES POLICY]
> - Business justification: [WHY THEY NEED IT]
> - Duration: [TEMPORARY WITH DATE / PERMANENT]
> - Compensating controls proposed: [WHAT THEY'LL DO INSTEAD]
> - Data/systems affected: [SCOPE OF IMPACT]
>
> Assess: (1) Risk introduced by the exception, (2) Adequacy of compensating controls, (3) Whether the business justification is proportionate to the risk, (4) Additional compensating controls to require, (5) Conditions and monitoring requirements, (6) Recommendation (approve/deny/approve with conditions).

**What you'll get:** Structured exception review with a recommendation and conditions.
**Safety note:** Exception approvals need appropriate authority (risk owner, CISO). Document the decision and set a review date.

---

### 11. Business Impact Analysis
**When to use:** Assessing the impact of a system/process outage for BCP/DR planning.
**Prerequisites:** System or process name, business function it supports, stakeholder input.

> Conduct a business impact analysis for:
> - System/process: [NAME]
> - Business function: [WHAT IT SUPPORTS]
> - Users/stakeholders: [WHO DEPENDS ON IT]
> - Current dependencies: [UPSTREAM AND DOWNSTREAM SYSTEMS]
> - Data processed: [TYPE AND CLASSIFICATION]
>
> Determine: (1) Impact over time (1 hour, 4 hours, 24 hours, 72 hours, 1 week), (2) Financial impact per hour of downtime (categories if exact numbers unknown), (3) Regulatory/compliance impact, (4) Reputational impact, (5) Recommended RTO and RPO, (6) Recovery priority tier, (7) Manual workarounds available.
> Rate impacts as None/Low/Medium/High/Critical at each time interval.

**What you'll get:** BIA worksheet with time-based impact ratings and recovery recommendations.
**Safety note:** Financial impact estimates require validation from business owners. Do not publish estimated dollar figures without their sign-off.

---

### 12. Risk Heat Map Generation
**When to use:** Visualizing your risk register for presentations or management review.
**Prerequisites:** Risk register data with likelihood and impact ratings.

> Generate a risk heat map from this data:
> - Risk matrix size: [3x3 / 4x4 / 5x5]
> - Likelihood scale: [DESCRIBE YOUR SCALE]
> - Impact scale: [DESCRIBE YOUR SCALE]
> - Risks (paste from register):
>   - [RISK 1]: Likelihood [X], Impact [Y]
>   - [RISK 2]: Likelihood [X], Impact [Y]
>   - [CONTINUE FOR ALL RISKS]
>
> Provide: (1) Text-based heat map with risks plotted, (2) Risk distribution summary (how many in each zone), (3) Risks requiring immediate attention (red zone), (4) Risks trending in the wrong direction (if previous ratings provided), (5) Concentration analysis (are risks clustered in specific categories).

**What you'll get:** Visual risk summary with distribution analysis and priority callouts.
**Safety note:** Heat maps simplify complex risk data. Always provide the full register alongside the visual for context.

---

### 13. Security Awareness Content
**When to use:** Creating training content, phishing simulation scenarios, or awareness campaign materials.
**Prerequisites:** Target audience, topic, format (email, slide, poster, quiz), tone.

> Create security awareness content:
> - Topic: [PHISHING/PASSWORD HYGIENE/SOCIAL ENGINEERING/DATA HANDLING/PHYSICAL SECURITY/OTHER]
> - Audience: [ALL EMPLOYEES/DEVELOPERS/EXECUTIVES/NEW HIRES]
> - Format: [EMAIL/TRAINING SLIDE/POSTER COPY/QUIZ QUESTIONS/PHISHING SIMULATION]
> - Tone: [SERIOUS/CONVERSATIONAL/HUMOROUS]
> - Recent context: [ANY RECENT INCIDENTS TO REFERENCE WITHOUT NAMING INDIVIDUALS]
> - Key behavior change: [WHAT YOU WANT PEOPLE TO DO DIFFERENTLY]
>
> Requirements: (1) Lead with the "why" — real consequences, (2) Include a specific action item, (3) Keep it under [WORD COUNT] words, (4) Avoid jargon and fear-mongering, (5) Include a test-your-knowledge element if appropriate.

**What you'll get:** Ready-to-use awareness content for your chosen format.
**Safety note:** Have HR review content for tone and appropriateness. Never reference real incidents in a way that identifies individuals.

---

### 14. Regulatory Change Impact
**When to use:** A new regulation, framework update, or compliance requirement has been announced and you need to assess impact.
**Prerequisites:** The regulation or change details, your current compliance posture, affected systems/processes.

> Assess the impact of this regulatory change:
> - Regulation/framework: [NAME AND VERSION/SECTION]
> - Change summary: [WHAT'S NEW OR DIFFERENT]
> - Effective date: [WHEN IT TAKES EFFECT]
> - Our current posture: [HOW WE COMPLY TODAY]
> - Affected systems/processes: [WHAT'S IN SCOPE]
> - [PASTE RELEVANT REGULATORY TEXT IF AVAILABLE]
>
> Analyze: (1) Gap analysis — what we do today vs. what's now required, (2) New controls or changes needed, (3) Estimated effort and cost category (low/medium/high), (4) Compliance deadline and milestones, (5) Dependencies on other teams (legal, IT, HR), (6) Risk of non-compliance (penalties, audit findings).
> Do NOT provide legal interpretations — flag items needing legal review.

**What you'll get:** Impact assessment with gap analysis and implementation roadmap.
**Safety note:** This is a technical assessment, not legal advice. Involve legal counsel for interpretation of regulatory requirements.

---

### 15. Annual Risk Assessment Summary
**When to use:** Year-end or annual risk assessment roll-up for management and auditors.
**Prerequisites:** Full year of risk register data, incident history, audit findings, metric trends, program changes.

> Compile an annual risk assessment summary:
> - Assessment period: [FISCAL/CALENDAR YEAR]
> - Total risks tracked: [NUMBER]
> - Risk register snapshot: [PASTE OR SUMMARIZE TOP RISKS]
> - Incidents this year: [COUNT AND CATEGORIES]
> - Audit findings: [INTERNAL AND EXTERNAL FINDINGS]
> - Key metric trends: [PASTE YEAR-OVER-YEAR DATA]
> - Program milestones: [WHAT WAS ACCOMPLISHED]
> - New risks identified: [RISKS ADDED DURING THE YEAR]
> - Risks closed/accepted: [RISKS REMOVED AND WHY]
>
> Produce: (1) Executive summary of the year's risk posture, (2) Year-over-year risk trend analysis, (3) Top 5 risks entering next year, (4) Control effectiveness summary, (5) Lessons learned from incidents, (6) Program maturity assessment, (7) Recommendations for next year's priorities, (8) Appendix structure for supporting data.
> Format for both executive review and audit evidence.

**What you'll get:** Comprehensive annual risk summary suitable for leadership and auditors.
**Safety note:** Verify all statistics against source data. This document may be requested by auditors or regulators, so accuracy is critical.
