#!/usr/bin/env bash
# Check a branch name against the standard: <type>/<issue>-<slug>, release/<major>.x,
# or a bot branch. Usage: check.sh <branch>
set -euo pipefail

branch="${1:-}"

types='feat|fix|docs|refactor|test|ci|chore|perf|build'
patterns=(
	"^(${types})/[0-9]+-[a-z0-9]+(-[a-z0-9]+)*$"
	'^release/[0-9]+\.x$'
	'^dependabot/'
	'^release-please--'
	'^main$'
)

for pattern in "${patterns[@]}"; do
	if [[ "$branch" =~ $pattern ]]; then
		exit 0
	fi
done

echo "Branch name '${branch}' does not match the standard." >&2
echo "Expected one of:" >&2
printf '  %s\n' "${patterns[@]}" >&2
echo "Example: feat/42-tui-search" >&2
exit 1
