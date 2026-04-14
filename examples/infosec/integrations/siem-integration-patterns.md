# SIEM Integration Patterns

> How to work with Splunk, Elastic, and Sentinel data in Claude Code via export and query building.

**Note:** There are no official MCP servers for these SIEMs yet. These patterns use export + analyze and query building.

---

## Pattern 1: Query Building

Claude builds queries in your SIEM's language. You run them, paste results back for analysis.

### Splunk (SPL)
```
"Build a Splunk SPL query to find failed SSH logins from external IPs in the last 24 hours.
Index: main, sourcetype: linux_secure.
Include source IP, username, and count. Sort by count descending."
```

### Elastic (KQL)
```
"Build a KQL query for Kibana to find outbound connections to known-bad IPs.
Index: network-*, time range: last 7 days.
Include source host, destination IP, port, and bytes transferred."
```

### Sentinel (KQL)
```
"Build a Sentinel KQL query to detect impossible travel.
Use SigninLogs table, compare consecutive login locations and timestamps.
Flag logins where the distance/time ratio exceeds reasonable travel speed."
```

## Pattern 2: Export + Analyze

Export search results from your SIEM and have Claude analyze them.

### How To
1. Run your SIEM query
2. Export results as CSV or JSON
3. Paste relevant rows into Claude (or save to a file and ask Claude to read it)
4. Ask Claude to analyze, correlate, or summarize

### Example
```
"I exported these Splunk results showing all authentication events for user jsmith
in the last 48 hours. Analyze for:
1. Unusual login times
2. New source IPs not seen before
3. Failed/success patterns
4. Lateral movement indicators

[PASTE CSV DATA]"
```

## Pattern 3: Dashboard/Report Analysis

Paste dashboard summaries or report extracts for analysis.

```
"Here's our weekly SIEM summary:
- Total alerts: 4,832
- Critical: 12, High: 89, Medium: 412, Low: 4,319
- Top sources: [LIST]
- New detections this week: [LIST]

Help me identify trends and areas that need attention."
```

## Reference in Your CLAUDE.md

```markdown
### SIEM (Splunk/Elastic/Sentinel)
- Query language: [SPL / KQL / LUCENE]
- Key indexes: [LIST YOUR INDEXES]
- Claude builds queries, I run them and paste results for analysis
- No direct SIEM access — export + analyze pattern
```

## Safety Notes

- **Redact PII** before pasting log data into Claude (usernames, IPs if needed)
- Don't paste more data than needed — scope your exports
- Claude builds queries, you run them — Claude doesn't have direct SIEM access
- Verify query syntax in your SIEM's documentation before running
