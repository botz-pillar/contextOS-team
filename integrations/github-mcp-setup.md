# GitHub MCP Setup

> Native MCP integration — Claude can read repos, review PRs, search code, and manage issues directly.

---

## Prerequisites

- Node.js 18+ installed
- GitHub account with access to your repos
- Personal access token (classic or fine-grained)

## Installation

```bash
npm install -g @modelcontextprotocol/server-github
```

## Configuration

Add to `~/.claude/settings.json`:

```json
{
  "mcpServers": {
    "github": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-github"],
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": "ghp_your_token_here"
      }
    }
  }
}
```

### Token Permissions (Fine-Grained — Recommended)

Create a fine-grained personal access token at GitHub Settings > Developer Settings > Personal Access Tokens:

**Read-only (start here):**
- Repository: Read access to code, issues, pull requests, metadata
- Organization: Read access to members (if needed)

**Read-write (add later if needed):**
- Issues: Read and write (to create/comment)
- Pull requests: Read and write (to review/comment)

## Verify It Works

Restart Claude Code, then ask:
```
"List my GitHub repos"
```

Claude should be able to list repos, read files, and search code.

## Reference in Your CLAUDE.md

```markdown
### GitHub MCP
- Connected to [YOUR-ORG] repos
- Access: read-only (code, PRs, issues)
- Use for: code security review, PR review, dependency scanning
```

## Example Workflows

### Security-Focused Code Review
```
"Review the latest PR on [REPO] for security issues.
Check for: hardcoded credentials, SQL injection, XSS, insecure deserialization,
and overly permissive file permissions."
```

### Dependency Audit
```
"Read package.json (or requirements.txt) from [REPO] and identify
any dependencies with known CVEs. Check for outdated major versions."
```

### Secret Scanning
```
"Search the [REPO] codebase for patterns that look like secrets:
API keys, tokens, passwords, connection strings. Check .env files,
config files, and any hardcoded strings."
```

## Safety Notes

- Start with **read-only** token — only add write permissions when needed
- Scope token to specific repos if possible (fine-grained tokens)
- Rotate tokens on your organization's schedule
- Claude should **never** merge PRs or push code without explicit approval

## Troubleshooting

| Issue | Fix |
|-------|-----|
| `Authentication failed` | Check token hasn't expired, regenerate if needed |
| `Not Found` on private repos | Ensure token has access to the specific repo |
| MCP server not loading | Restart Claude Code after config changes |
