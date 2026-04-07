# AWS CLI Integration

> Claude Code runs AWS CLI commands directly and analyzes the output. No MCP server needed.

---

## Prerequisites

- AWS CLI v2 installed (`aws --version`)
- AWS credentials configured (`aws configure` or environment variables)
- Appropriate IAM permissions (see below)

## Recommended IAM Policy

Start with **read-only** access. This policy covers the most common security queries:

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "ec2:Describe*",
        "s3:GetBucket*", "s3:ListBucket", "s3:ListAllMyBuckets",
        "iam:Get*", "iam:List*",
        "cloudtrail:LookupEvents", "cloudtrail:GetTrailStatus",
        "guardduty:GetFindings", "guardduty:ListFindings", "guardduty:ListDetectors",
        "securityhub:GetFindings", "securityhub:BatchGetSecurityControls",
        "config:GetComplianceDetailsByConfigRule", "config:DescribeConfigRules",
        "kms:ListKeys", "kms:DescribeKey",
        "logs:FilterLogEvents", "logs:DescribeLogGroups"
      ],
      "Resource": "*"
    }
  ]
}
```

For temporary credentials (recommended), use STS AssumeRole:
```bash
aws sts assume-role --role-arn arn:aws:iam::ACCOUNT:role/SecurityAuditRole --role-session-name claude-session
```

## How It Works

Claude runs AWS CLI commands via bash and analyzes the JSON output. No special config needed — if `aws` works in your terminal, Claude can use it.

## Reference in Your CLAUDE.md

```markdown
### AWS Integration
- AWS CLI configured with SecurityAudit permissions
- Profile: [YOUR_PROFILE] (or default)
- Regions: [YOUR_REGIONS]
- Use `--output json` for structured analysis
```

## Example Workflows

### Security Group Audit
```
"Check all security groups in us-east-1 for rules allowing 0.0.0.0/0 inbound.
Run: aws ec2 describe-security-groups --region us-east-1
Flag any non-443/80 ports open to the internet."
```

### IAM User Audit
```
"List all IAM users without MFA enabled.
Run: aws iam generate-credential-report && aws iam get-credential-report
Identify users with password_enabled=true and mfa_active=false."
```

### GuardDuty Finding Triage
```
"Get the latest high-severity GuardDuty findings.
Run: aws guardduty list-findings --detector-id [ID] --finding-criteria '{\"Criterion\":{\"severity\":{\"Gte\":7}}}'
Then get details and prioritize by severity and affected resource."
```

### S3 Public Access Check
```
"Check all S3 buckets for public access configuration.
For each bucket, run: aws s3api get-public-access-block --bucket [NAME]
Flag any bucket where public access is not fully blocked."
```

### CloudTrail Suspicious Activity
```
"Search CloudTrail for console logins from unusual IPs in the last 24 hours.
Run: aws cloudtrail lookup-events --lookup-attributes AttributeKey=EventName,AttributeValue=ConsoleLogin --start-time [24H_AGO]
Flag any logins from IPs outside our expected ranges."
```

## Safety Notes

- Claude should **never** run write operations (`create`, `delete`, `modify`, `put`) without explicit user approval
- Always specify `--region` to avoid accidental cross-region queries
- Use `--dry-run` flag when testing commands that support it
- Review commands before approving execution — read the CLI command Claude proposes

## Troubleshooting

| Issue | Fix |
|-------|-----|
| `Unable to locate credentials` | Run `aws configure` or set `AWS_PROFILE` |
| `AccessDenied` | Check IAM policy has the required permissions |
| `ExpiredToken` | Re-run `aws sts assume-role` for fresh credentials |
| Wrong region results | Add `--region us-east-1` (or your region) explicitly |
