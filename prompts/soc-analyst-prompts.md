# SOC Analyst Prompts

> Alert triage, log analysis, threat hunting, and investigation prompts.

---

### 1. Triage Unknown Alert
**When to use:** New alert hits the queue, need quick assessment.
**Prerequisites:** Alert details (source, name, severity, affected asset, raw data).

> Triage this security alert:
> - Source: [SIEM/EDR/IDS/CLOUD]
> - Alert name: [NAME]
> - Severity: [LEVEL]
> - Affected: [HOST/USER/SERVICE]
> - Details: [PASTE ALERT DATA]
>
> Determine: (1) Likely TP/FP/needs investigation, (2) MITRE ATT&CK mapping, (3) What to check next, (4) Recommended immediate actions.
> Do NOT recommend containment without my confirmation.

**What you'll get:** Structured triage with next steps.
**Safety note:** Claude's verdict is a starting point — verify with your own investigation.

---

### 2. Build SIEM Query
**When to use:** Need to search for specific activity in your SIEM.
**Prerequisites:** Know your SIEM language (SPL/KQL/Lucene) and relevant indexes.

> Build a [SPL/KQL] query to find [WHAT YOU'RE LOOKING FOR].
> Index/table: [INDEX]
> Time range: [RANGE]
> Include fields: [FIELDS]
> Add comments explaining each part of the query.

**What you'll get:** Copy-pastable query with explanations.
**Safety note:** Verify syntax in your SIEM docs before running on production.

---

### 3. Log Correlation
**When to use:** Multiple log sources need to be correlated for an investigation.
**Prerequisites:** Log snippets or exported data from 2+ sources.

> Correlate these log entries from multiple sources:
> Source 1 ([TOOL]): [PASTE DATA]
> Source 2 ([TOOL]): [PASTE DATA]
>
> Build a timeline (UTC). Identify: (1) Sequence of events, (2) Common entities (IPs, users, hosts), (3) Gaps in the timeline, (4) Anomalies.

**What you'll get:** Chronological timeline with cross-source correlation.
**Safety note:** Redact PII before pasting. Verify timestamps are in the same timezone.

---

### 4. False Positive Assessment
**When to use:** Suspect an alert is a false positive, need structured reasoning.

> Assess if this alert is a false positive:
> Alert: [DESCRIPTION]
> Context: [WHAT THE USER/SYSTEM NORMALLY DOES]
> Evidence for FP: [WHY YOU THINK IT'S FALSE]
> Evidence against FP: [WHY IT MIGHT BE REAL]
>
> Provide: (1) FP probability with reasoning, (2) What would confirm FP, (3) What would confirm TP, (4) Tuning recommendation if FP.

**What you'll get:** Structured FP/TP assessment with next steps.

---

### 5. Threat Hunt Hypothesis
**When to use:** Starting a proactive threat hunt, need a structured hypothesis.

> Generate a threat hunting hypothesis for: [TECHNIQUE/THREAT/BEHAVIOR]
> Environment: [DESCRIBE YOUR ENVIRONMENT]
> Data sources available: [SIEM/EDR/NETWORK/CLOUD]
>
> Provide: (1) Hypothesis statement, (2) Expected evidence if true, (3) Data sources to query, (4) Specific queries to run, (5) Baseline: what normal looks like, (6) False positive considerations.

**What you'll get:** Complete hunt plan ready to execute.

---

### 6. IOC Enrichment
**When to use:** Have IOCs from a detection, need context before acting.

> Enrich these IOCs:
> IPs: [LIST]
> Domains: [LIST]
> Hashes: [LIST]
>
> For each: (1) What do you know from training data? (2) Associated malware families or campaigns, (3) MITRE ATT&CK relevance, (4) Recommended blocking/monitoring actions.
> Flag anything you're uncertain about — I'll verify against live TI.

**What you'll get:** IOC context and recommended actions.
**Safety note:** Claude's TI has a cutoff. Always verify against VirusTotal, AbuseIPDB, or your TI platform.

---

### 7. Detection Rule Draft
**When to use:** Writing a new SIEM detection rule.

> Draft a detection rule for: [WHAT TO DETECT]
> SIEM: [SPLUNK/ELASTIC/SENTINEL]
> Format: [SPL correlation search / KQL analytics rule / Sigma]
>
> Include: (1) Detection logic with comments, (2) Severity and confidence levels, (3) MITRE ATT&CK mapping, (4) Expected false positive rate and tuning guidance, (5) Recommended response actions.

**What you'll get:** Detection rule ready for testing.
**Safety note:** Test in a dev environment before deploying to production.

---

### 8. Shift Handoff Summary
**When to use:** End of shift, need to brief the next analyst.

> Generate a shift handoff summary:
> Shift: [START-END TIME]
> Open investigations: [LIST WITH STATUS]
> Notable alerts: [LIST]
> Actions taken: [LIST]
> Pending items: [LIST]
>
> Format as a concise handoff note. Highlight anything time-sensitive.

**What you'll get:** Structured handoff document.

---

### 9. MITRE ATT&CK Mapping
**When to use:** Need to map observed behaviors to ATT&CK techniques.

> Map these observed behaviors to MITRE ATT&CK:
> [DESCRIBE WHAT YOU OBSERVED]
>
> For each mapping: (1) Technique ID and name, (2) Tactic, (3) Confidence (high/medium/low), (4) What additional evidence would confirm, (5) Recommended detections for this technique.

**What you'll get:** ATT&CK mapping with detection recommendations.

---

### 10. Alert Tuning Recommendation
**When to use:** Noisy alert needs tuning to reduce false positives.

> This alert fires [FREQUENCY] with a [X%] false positive rate:
> Alert name: [NAME]
> Current logic: [QUERY OR DESCRIPTION]
> Common FP causes: [DESCRIBE]
>
> Recommend tuning: (1) Modified detection logic, (2) Exclusions to add, (3) Threshold adjustments, (4) Estimated FP reduction, (5) Risk of missing true positives.

**What you'll get:** Tuning recommendations with tradeoff analysis.

---

### 11. Malware Behavior Analysis
**When to use:** EDR detected something suspicious, need to understand the behavior.

> Analyze this process behavior from EDR:
> Process: [NAME AND PATH]
> Parent: [PARENT PROCESS]
> Command line: [FULL COMMAND]
> Network activity: [CONNECTIONS]
> File activity: [FILES CREATED/MODIFIED]
>
> Assess: (1) Is this behavior consistent with known malware? (2) What malware families exhibit this pattern? (3) Kill chain stage, (4) Recommended response.

**What you'll get:** Behavioral analysis with malware family assessment.

---

### 12. Phishing Email Analysis
**When to use:** Suspicious email reported, need to assess.

> Analyze this reported phishing email:
> From: [SENDER]
> Subject: [SUBJECT]
> Body: [PASTE OR DESCRIBE]
> Links: [LIST URLs]
> Attachments: [LIST]
> Headers: [PASTE RELEVANT HEADERS]
>
> Assess: (1) Phishing indicators, (2) Sender legitimacy, (3) URL/domain reputation (from training data), (4) Recommended actions, (5) User communication template.

**What you'll get:** Phishing assessment with response recommendations.
**Safety note:** Do NOT click links or open attachments. Claude analyzes the text/metadata only.

---

### 13. Lateral Movement Detection
**When to use:** Investigating potential lateral movement after initial compromise.

> Check for lateral movement from compromised host [HOSTNAME]:
> Build queries for [SIEM/EDR] to detect:
> 1. RDP/SSH connections from this host to others
> 2. SMB/WMI/PSExec activity
> 3. New service installations on remote hosts
> 4. Credential usage (pass-the-hash, pass-the-ticket)
> 5. Unusual admin tool usage (PsExec, WinRM, etc.)
> Time range: [SINCE COMPROMISE]

**What you'll get:** Query set for lateral movement investigation.

---

### 14. Escalation Brief
**When to use:** Need to escalate to Tier 3 or management with a clear summary.

> Write an escalation brief for:
> Incident: [DESCRIPTION]
> Current status: [WHERE WE ARE]
> Impact: [WHAT'S AFFECTED]
> Actions taken: [WHAT WE'VE DONE]
> Why escalating: [WHY THIS NEEDS HIGHER ATTENTION]
>
> Format: concise, fact-based, with clear ask for the escalation target.

**What you'll get:** Professional escalation document.

---

### 15. Weekly Metrics Summary
**When to use:** Generating SOC performance metrics for reporting.

> Summarize these SOC metrics for [PERIOD]:
> Total alerts: [NUMBER]
> By severity: [BREAKDOWN]
> True positive rate: [%]
> MTTD: [TIME]
> MTTR: [TIME]
> Escalations: [NUMBER]
> Open investigations: [NUMBER]
>
> Provide: (1) Summary narrative, (2) Trends vs previous period, (3) Areas of concern, (4) Recommendations.
> Audience: [SOC MANAGER / CISO / TEAM]

**What you'll get:** Formatted metrics report with analysis.
