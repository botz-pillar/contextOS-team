#!/bin/bash
# SessionStart hook — detects uncustomized team repo (placeholders in core files).
# stdout is injected into the session context as info for Claude.

set -e

REPO_ROOT="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
cd "$REPO_ROOT"

# Check if any core file still has {{PLACEHOLDER}} strings
PLACEHOLDER_FOUND=false
CORE_FILES=("team-overview.md" "tools-and-integrations.md" "guardrails.md")
for f in "${CORE_FILES[@]}"; do
  if [ -f "$f" ] && grep -q "{{.*}}" "$f" 2>/dev/null; then
    PLACEHOLDER_FOUND=true
    break
  fi
done

if [ "$PLACEHOLDER_FOUND" = true ]; then
  cat <<'EOF'
🚀 TEAM REPO NOT YET CUSTOMIZED — core files still contain {{PLACEHOLDER}} strings.

This user is a team lead running contextOS-team for the first time. Kick off team customization:

1. Load `skills/team-setup.md`
2. Greet the user warmly and walk through the 8 steps (~15 min)
3. Do NOT wait for the user to ask — if their first prompt is unrelated, kick off setup first, then return to their question after customization is complete

After filling all placeholders, confirm completion and guide the user through committing and pushing.
EOF
fi
