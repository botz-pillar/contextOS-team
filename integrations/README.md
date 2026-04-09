# Tool Integrations

> How to connect Claude Code to your team's tools — what works natively today and how to work with everything else.
> **Template note:** Pre-filled with security tool integrations (AWS, SIEM, EDR, Terraform, etc.) as examples. Replace with integration guides for your team's actual tools.

---

## How Claude Code Connects to Tools

There are three ways Claude Code can interact with your security tools:

| Method | How It Works | Best For |
|--------|-------------|----------|
| **MCP Servers** | Native protocol integration — Claude calls tool APIs directly | GitHub, filesystem, tools with official MCP packages |
| **CLI Tools** | Claude runs commands via bash and analyzes output | AWS CLI, Terraform, Prowler, tfsec, Checkov, kubectl |
| **Export + Analyze** | You export data (CSV, JSON, logs), Claude analyzes it | SIEM results, vuln scan reports, EDR findings |

Most security tools today fall into categories 2 and 3. MCP is new and growing — more native integrations will come. In the meantime, the CLI and export patterns are highly effective.

---

## Available Guides

### Native Integrations (MCP or CLI — Claude interacts directly)

| Guide | Tools | Method |
|-------|-------|--------|
| [AWS CLI Integration](aws-cli-integration.md) | AWS CLI, Security Hub, GuardDuty, Config | CLI (bash) |
| [GitHub MCP Setup](github-mcp-setup.md) | GitHub repos, PRs, issues, code search | MCP Server |
| [Terraform Integration](terraform-integration.md) | Terraform, Checkov, tfsec, trivy | CLI (bash) |

### Pattern Guides (Export + Analyze)

| Guide | Tools | Method |
|-------|-------|--------|
| [SIEM Integration Patterns](siem-integration-patterns.md) | Splunk, Elastic, Sentinel | Export + analyze |
| [Vulnerability Scanner Patterns](vulnerability-scanner-patterns.md) | Tenable, Qualys, Rapid7 | Export + analyze |
| [EDR Integration Patterns](edr-integration-patterns.md) | CrowdStrike, SentinelOne | Export + analyze |

---

## Where to Start

**If you use AWS:** Start with the AWS CLI integration — highest immediate value.

**If you do IaC:** Terraform integration gives you security scanning in your workflow.

**If you do code review:** GitHub MCP lets Claude read repos, review PRs, and search code natively.

**For everything else:** The export + analyze pattern works with any tool that can export data.

---

## Security Best Practices

1. **Start read-only.** Configure integrations with read-only access first. Add write access only when needed.
2. **Use least privilege.** Scope credentials to the minimum permissions required.
3. **Sandbox first.** Test integrations against dev/staging before production.
4. **Audit trail.** Log what Claude accesses. Most CLI tools log to CloudTrail, audit logs, etc.
5. **Short-lived credentials.** Use STS tokens, OAuth, or API keys with expiration over permanent credentials.
6. **Never store credentials in this repo.** Use environment variables or secrets managers.

---

## Contributing New Integration Guides

Built an integration that works well? PR it:

1. Follow the structure of existing guides
2. Include prerequisites, setup steps, example workflows, and safety notes
3. Be honest about limitations — mark anything untested
4. See [CONTRIBUTING.md](../CONTRIBUTING.md) for the PR process
