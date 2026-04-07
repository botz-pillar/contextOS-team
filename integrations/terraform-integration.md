# Terraform Integration

> Claude Code runs Terraform, Checkov, and tfsec via CLI to review and scan infrastructure code.

---

## Prerequisites

- Terraform installed (`terraform --version`)
- Checkov installed (`pip install checkov` or `brew install checkov`)
- tfsec installed (`brew install tfsec` or `go install github.com/aquasecurity/tfsec/cmd/tfsec@latest`)

## How It Works

Claude reads your Terraform files directly and runs scanning tools via bash. No MCP server needed.

## Reference in Your CLAUDE.md

```markdown
### Terraform / IaC Security
- Terraform [VERSION] installed
- Checkov for policy scanning
- tfsec for static analysis
- Review all .tf files before apply
```

## Example Workflows

### IaC Security Scan
```
"Run Checkov against the Terraform files in [DIRECTORY].
Run: checkov -d [DIRECTORY] --output json
Prioritize findings by severity and focus on CRITICAL and HIGH."
```

### Pre-Apply Review
```
"Read all .tf files in [DIRECTORY] and review for:
1. Overly permissive security groups or NACLs
2. Unencrypted storage (S3, EBS, RDS)
3. Public access to resources that should be private
4. Missing logging or monitoring
5. Hardcoded values that should be variables"
```

### tfsec Scan
```
"Run tfsec against [DIRECTORY].
Run: tfsec [DIRECTORY] --format json
Summarize findings by severity and suggest fixes."
```

### Compliance Mapping
```
"Run Checkov with CIS benchmark checks:
checkov -d [DIRECTORY] --check-type terraform --framework cis_aws
Map failures to specific CIS controls and suggest remediation."
```

## Safety Notes

- Claude should **read and scan** Terraform files, not run `terraform apply`
- `terraform plan` is safe to run — it shows what would change without changing anything
- Never let Claude run `terraform destroy` without explicit approval
- Review all proposed `.tf` changes before committing

## Troubleshooting

| Issue | Fix |
|-------|-----|
| `checkov: command not found` | `pip install checkov` or `brew install checkov` |
| `tfsec: command not found` | `brew install tfsec` |
| Checkov taking too long | Use `--skip-check` to exclude specific checks |
