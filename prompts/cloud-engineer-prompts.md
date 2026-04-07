# Cloud Security Engineer Prompts

> Cloud posture management, IaC security, AWS/Azure hardening, and automation prompts.

---

### 1. Security Group Audit
**When to use:** Periodic review or after an incident — find overly permissive security groups.
**Prerequisites:** AWS account access, VPC/region scope, and current security group export or CLI access.

> Audit these security groups for security issues:
> [PASTE SG RULES OR `aws ec2 describe-security-groups` OUTPUT]
>
> Identify: (1) Rules allowing 0.0.0.0/0 ingress on non-web ports, (2) Overly broad CIDR ranges, (3) Unnecessary port ranges, (4) Groups with no associated resources (orphaned), (5) Rules that violate least-privilege.
> For each finding, provide the SG ID, the offending rule, risk level, and a recommended fix.

**What you'll get:** Prioritized list of security group misconfigurations with specific remediation steps.
**Safety note:** Do not modify security groups without change management approval — removing rules can break production.

---

### 2. IAM Policy Review
**When to use:** Reviewing a custom IAM policy before deployment, or auditing existing policies for over-permission.
**Prerequisites:** The IAM policy JSON document(s).

> Review this IAM policy for security issues:
> ```json
> [PASTE POLICY JSON]
> ```
>
> Analyze: (1) Overly broad actions (wildcards), (2) Missing resource constraints, (3) Missing conditions (MFA, source IP, tags), (4) Privilege escalation paths, (5) Compliance with least-privilege principle.
> For each issue, explain the risk and provide a tightened version of the statement.

**What you'll get:** Line-by-line policy review with a hardened replacement policy.
**Safety note:** Test revised policies in a dev account or with IAM Access Analyzer before applying to production.

---

### 3. S3 Bucket Security Check
**When to use:** Auditing S3 bucket configurations for public exposure, encryption gaps, or logging issues.
**Prerequisites:** Bucket name(s) and output from relevant CLI commands (bucket policy, ACLs, encryption, versioning, logging config).

> Assess the security posture of this S3 bucket:
> Bucket name: [NAME]
> Bucket policy: [PASTE JSON]
> ACL: [PASTE OUTPUT]
> Encryption config: [PASTE OUTPUT]
> Public access block: [PASTE OUTPUT]
> Versioning: [ENABLED/DISABLED]
> Logging: [ENABLED/DISABLED]
>
> Check for: (1) Public access paths (policy + ACL + block settings), (2) Encryption at rest (SSE-S3/SSE-KMS/none), (3) Encryption in transit enforcement, (4) Versioning and MFA delete, (5) Access logging enabled, (6) Lifecycle policy for cost control.
> Rate overall risk and provide remediation commands.

**What you'll get:** Bucket security scorecard with AWS CLI commands to fix each issue.

---

### 4. IaC Security Scan (Checkov/tfsec)
**When to use:** Before merging Terraform/CloudFormation code — review scan results or raw IaC for misconfigurations.
**Prerequisites:** Terraform/CloudFormation files or Checkov/tfsec output.

> Review these IaC security scan results and the underlying code:
> Scanner: [CHECKOV/TFSEC/TRIVY]
> Scan output:
> [PASTE RESULTS]
>
> Source code (if relevant):
> ```hcl
> [PASTE TERRAFORM OR CFN]
> ```
>
> For each finding: (1) Explain the real-world risk, (2) Determine if it's a true issue or acceptable in context, (3) Provide the fixed code block, (4) If it should be suppressed, provide the inline suppression comment with justification.

**What you'll get:** Prioritized findings with fix-ready code patches and suppression guidance.
**Safety note:** Always run `terraform plan` after applying fixes to verify no unintended resource changes.

---

### 5. CloudTrail Investigation
**When to use:** Investigating suspicious API activity or building a timeline of actions by a principal.
**Prerequisites:** CloudTrail event data (JSON exports, Athena query results, or console search output).

> Analyze these CloudTrail events for suspicious activity:
> Principal: [IAM USER/ROLE/ACCOUNT]
> Time range: [START — END]
> Events:
> [PASTE CLOUDTRAIL JSON OR ATHENA RESULTS]
>
> Determine: (1) Timeline of actions in chronological order, (2) Privilege escalation attempts (CreateRole, PutRolePolicy, AttachUserPolicy, etc.), (3) Data access patterns (S3 GetObject, DynamoDB scans, Secrets Manager reads), (4) Persistence mechanisms (new keys, new users, Lambda backdoors), (5) Anomalies vs. normal behavior for this principal.
> Flag anything that warrants immediate response.

**What you'll get:** Structured investigation timeline with risk-rated findings.
**Safety note:** If you find active compromise indicators, escalate immediately — do not wait for a complete analysis.

---

### 6. GuardDuty Finding Triage
**When to use:** New GuardDuty finding needs assessment and response decision.
**Prerequisites:** GuardDuty finding details (type, severity, resource, raw JSON).

> Triage this GuardDuty finding:
> Finding type: [e.g., UnauthorizedAccess:IAMUser/InstanceCredentialExfiltration.OutsideAWS]
> Severity: [LEVEL]
> Resource: [AFFECTED RESOURCE]
> Details: [PASTE FINDING JSON]
>
> Provide: (1) Plain-English explanation of what this finding means, (2) Likely TP/FP assessment with reasoning, (3) Common benign causes for this finding type, (4) Investigation steps (specific CLI commands to run), (5) Recommended response if confirmed true positive.
> Do NOT recommend disabling or archiving the finding without investigation.

**What you'll get:** Triage assessment with actionable investigation runbook.
**Safety note:** Some GuardDuty findings (e.g., CryptoCurrency, CredentialExfiltration) warrant immediate containment — flag these clearly.

---

### 7. CIS Benchmark Gap Analysis
**When to use:** Assessing an AWS account against CIS benchmarks, or reviewing Prowler/ScoutSuite output.
**Prerequisites:** Benchmark scan results or manual assessment data.

> Analyze these CIS Benchmark results for [AWS/AZURE/GCP]:
> Benchmark version: [e.g., CIS AWS v3.0]
> Scanner: [PROWLER/SCOUTSUITE/MANUAL]
> Failed checks:
> [PASTE FAILED CHECK LIST WITH IDS]
>
> For each failure: (1) Business risk in plain English, (2) Priority (critical/high/medium/low) based on exploitability, (3) Remediation steps with CLI commands or Terraform, (4) Whether it can be automated or needs manual intervention.
> Group findings by CIS section and suggest a remediation order.

**What you'll get:** Prioritized remediation plan organized by CIS section with implementation commands.

---

### 8. SCP (Service Control Policy) Draft
**When to use:** Need to create or modify an SCP to enforce guardrails across an AWS Organization.
**Prerequisites:** Organizational structure context, the control objective, and any existing SCPs.

> Draft a Service Control Policy to enforce this guardrail:
> Objective: [e.g., Prevent disabling CloudTrail in all member accounts]
> Scope: [WHICH OUs/ACCOUNTS]
> Exceptions needed: [ANY ROLES/ACCOUNTS THAT SHOULD BE EXEMPT]
> Existing SCPs to consider: [PASTE ANY RELEVANT EXISTING POLICIES]
>
> Provide: (1) The SCP JSON with comments explaining each statement, (2) Deny list vs. allow list approach recommendation, (3) Impact analysis — what legitimate actions this might block, (4) Testing strategy before applying to production OUs.

**What you'll get:** Production-ready SCP with impact analysis and rollout plan.
**Safety note:** SCPs can lock out entire accounts including root. Always test on a sandbox OU first and ensure a break-glass role is exempt.

---

### 9. Config Rule Development
**When to use:** Building custom AWS Config rules for compliance monitoring.
**Prerequisites:** The compliance requirement and the resource type to monitor.

> Develop an AWS Config rule for this requirement:
> Requirement: [e.g., All EBS volumes must be encrypted with a CMK]
> Resource type: [e.g., AWS::EC2::Volume]
> Evaluation trigger: [CONFIGURATION CHANGE / PERIODIC]
> Existing managed rules considered: [ANY THAT WERE CLOSE BUT NOT SUFFICIENT]
>
> Provide: (1) Check if a managed rule already covers this — use managed rules first, (2) If custom is needed: Lambda function code (Python) for the evaluation, (3) Config rule definition (CloudFormation or Terraform), (4) Remediation action (SSM Automation or manual steps), (5) Test cases: compliant resource example, non-compliant resource example.

**What you'll get:** Complete Config rule with evaluation logic, deployment code, and test cases.
**Safety note:** Auto-remediation can break workloads. Start with detection-only mode before enabling automatic fixes.

---

### 10. Cloud Architecture Security Review
**When to use:** Reviewing a proposed or existing cloud architecture diagram/design for security gaps.
**Prerequisites:** Architecture description, diagram, or IaC that defines the infrastructure.

> Review this cloud architecture for security issues:
> Description: [WHAT THE SYSTEM DOES]
> Components:
> [LIST SERVICES AND HOW THEY CONNECT — OR PASTE IaC/DIAGRAM DESCRIPTION]
>
> Evaluate: (1) Network segmentation and traffic flow, (2) Authentication and authorization between components, (3) Data protection (at rest and in transit), (4) Logging and monitoring coverage, (5) Single points of failure, (6) Blast radius if any component is compromised.
> Provide a risk-rated findings table and architecture-level recommendations.
> Do NOT redesign the architecture — flag issues and suggest targeted fixes.

**What you'll get:** Security review document with risk-rated findings and targeted recommendations.

---

### 11. Cost-Security Analysis
**When to use:** Evaluating the cost impact of security controls, or finding cost-effective alternatives.
**Prerequisites:** Current security tooling/configuration details and AWS Cost Explorer data if available.

> Analyze the cost-security tradeoff for this scenario:
> Current state: [DESCRIBE CURRENT SECURITY SETUP]
> Monthly cost: [AMOUNT OR ESTIMATE]
> Proposed change: [WHAT YOU'RE CONSIDERING]
>
> Evaluate: (1) Security impact of the proposed change (what risk increases/decreases), (2) Cost impact (estimated monthly delta), (3) Alternative approaches that balance cost and security, (4) What's the minimum viable security posture for this workload, (5) Hidden costs (data transfer, API calls, log storage).
> Present as a comparison table with risk ratings.

**What you'll get:** Cost-security tradeoff analysis with alternatives and a recommendation.

---

### 12. Cross-Account Access Audit
**When to use:** Reviewing IAM roles, resource policies, and trust relationships that grant cross-account access.
**Prerequisites:** Trust policies, resource policies, and/or IAM Access Analyzer findings.

> Audit cross-account access for this AWS environment:
> Organization structure: [DESCRIBE OR LIST ACCOUNT IDS AND NAMES]
> Trust policies / assume-role configurations:
> [PASTE ROLE TRUST POLICIES]
> Resource-based policies (S3, KMS, SNS, SQS, etc.):
> [PASTE RELEVANT POLICIES]
> IAM Access Analyzer findings (if available):
> [PASTE FINDINGS]
>
> Identify: (1) All cross-account access paths (who can access what from where), (2) Overly broad trust relationships (trusting entire accounts vs. specific roles), (3) External access (non-org accounts), (4) Missing external ID conditions on third-party roles, (5) Confused deputy risks.
> Map each access path and rate its risk.

**What you'll get:** Cross-account access map with risk ratings and remediation priorities.
**Safety note:** Revoking cross-account access can break integrations. Validate with workload owners before modifying trust policies.

---

### 13. Container/EKS Security Review
**When to use:** Assessing EKS cluster configuration, pod security, or container image posture.
**Prerequisites:** EKS cluster config, RBAC setup, pod security policies/standards, and image scan results.

> Review the security posture of this EKS/container environment:
> Cluster config: [PASTE `kubectl cluster-info` AND RELEVANT CONFIGS]
> RBAC: [PASTE CLUSTERROLES/CLUSTERROLEBINDINGS OR DESCRIBE]
> Pod security: [PSA MODE / PSP / OPA GATEKEEPER POLICIES]
> Network policies: [PASTE OR DESCRIBE]
> Image scan results: [PASTE TRIVY/ECR SCAN OUTPUT]
> Node config: [MANAGED/FARGATE, AMI, INSTANCE TYPES]
>
> Assess: (1) Control plane security (API server access, audit logging, secrets encryption), (2) RBAC over-permissions (cluster-admin bindings, wildcard rules), (3) Pod security (privileged containers, host mounts, capabilities), (4) Network segmentation (namespace isolation, egress controls), (5) Image supply chain (base image currency, critical CVEs, unsigned images), (6) Node security (IMDSv2, SSM patching, runtime protection).

**What you'll get:** Container security assessment with prioritized findings across all layers.
**Safety note:** Restricting pod security or network policies can break running workloads. Test changes in a staging namespace first.

---

### 14. Automated Remediation Script
**When to use:** Need a script to automatically fix a specific cloud misconfiguration.
**Prerequisites:** The misconfiguration to fix, target environment details, and acceptable remediation approach.

> Write an automated remediation script for:
> Issue: [e.g., Unencrypted EBS volumes attached to running instances]
> Scope: [SINGLE ACCOUNT / ORG-WIDE]
> Language: [PYTHON BOTO3 / BASH AWS CLI / LAMBDA]
> Constraints: [e.g., Must snapshot before encrypting, skip volumes tagged "exception"]
>
> Include: (1) Discovery logic (find all affected resources), (2) Dry-run mode that reports what would change without modifying anything, (3) Remediation logic with error handling, (4) Logging of all actions taken, (5) Rollback approach if something fails, (6) IAM permissions required to run this script.
> Default to DRY RUN mode — never auto-execute destructive changes.

**What you'll get:** Production-ready remediation script with dry-run safety and required IAM policy.
**Safety note:** Always run in dry-run mode first. Get change management approval before executing in production. Test in a non-prod account.

---

### 15. Cloud Compliance Evidence Collection
**When to use:** Preparing for an audit (SOC 2, FedRAMP, ISO 27001, PCI) and need to gather cloud-native evidence.
**Prerequisites:** The compliance framework, specific control requirements, and AWS account access.

> Generate evidence collection commands for this compliance requirement:
> Framework: [SOC 2 / FEDRAMP / ISO 27001 / PCI-DSS / HIPAA]
> Control: [CONTROL ID AND DESCRIPTION, e.g., CC6.1 — Logical access controls]
> Cloud provider: [AWS/AZURE/GCP]
> Scope: [ACCOUNTS/SUBSCRIPTIONS IN SCOPE]
>
> Provide: (1) Specific CLI commands to collect evidence for this control, (2) What each command output proves, (3) How to format the output for auditor consumption, (4) Gaps — what this evidence alone does NOT prove (requires policy docs, interviews, etc.), (5) Automation approach to collect this evidence on a recurring basis.
> Output should be copy-pastable and auditor-friendly.

**What you'll get:** Complete evidence collection playbook with CLI commands and auditor-ready formatting guidance.
