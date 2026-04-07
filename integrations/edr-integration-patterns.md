# EDR Integration Patterns

> How to work with CrowdStrike, SentinelOne, and other EDR data in Claude Code.

**Note:** No official MCP servers for EDR tools yet. These patterns use export + analyze and query building.

---

## Pattern 1: Threat Hunt Query Building

Claude builds detection/hunting queries in your EDR's query language.

### CrowdStrike (Event Search / Falcon Query Language)
```
"Build a CrowdStrike Event Search query to find:
- PowerShell executions with encoded commands (-enc or -encodedcommand)
- In the last 7 days
- On Windows endpoints
Include: hostname, username, command line, parent process, timestamp."
```

### SentinelOne (Deep Visibility)
```
"Build a SentinelOne Deep Visibility query to detect:
- Processes making outbound connections to non-standard ports (not 80/443)
- From endpoints in the [DEPARTMENT] group
- In the last 48 hours"
```

## Pattern 2: Alert/Detection Analysis

Paste EDR alert details for analysis.

```
"Analyze this CrowdStrike detection:
- Detection: [NAME]
- Severity: [LEVEL]
- Tactic: [MITRE TACTIC]
- Technique: [MITRE TECHNIQUE]
- Host: [HOSTNAME]
- User: [USERNAME]
- Process: [PROCESS TREE]
- Command Line: [COMMAND]

Questions:
1. True positive, false positive, or needs investigation?
2. What MITRE ATT&CK stage is this?
3. What should I look for next?
4. Recommended containment actions (if TP)?"
```

## Pattern 3: IOC Analysis

```
"Analyze these IOCs from an EDR detection:
- File hash: [SHA256]
- IP addresses: [LIST]
- Domains: [LIST]
- User agents: [LIST]

What do you know about these from your training data?
Flag anything you're uncertain about so I can verify against VirusTotal/TI platforms."
```

## Reference in Your CLAUDE.md

```markdown
### EDR (CrowdStrike / SentinelOne)
- Claude builds hunting queries and analyzes detection details
- Paste alert data for triage assistance
- No direct EDR access — query building + analysis pattern
```

## Safety Notes

- Claude should **never** execute containment actions (isolate host, kill process) — recommend only, you execute
- Redact sensitive hostnames/usernames if data leaves your environment
- IOC reputation from Claude's training data has a cutoff — always verify against live TI
- Process trees and command lines may contain sensitive paths — review before sharing
