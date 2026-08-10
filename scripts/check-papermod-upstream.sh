#!/usr/bin/env bash
set -euo pipefail

readonly METADATA_FILE="themes/PaperMod.upstream.toml"
readonly REPOSITORY="adityatelange/hugo-PaperMod"

command -v gh >/dev/null 2>&1 || {
  echo "gh is required to check PaperMod." >&2
  exit 2
}

reviewed_commit="$(sed -n 's/^last_reviewed_commit = "\([0-9a-f]\{40\}\)"$/\1/p' "${METADATA_FILE}")"
if [ -z "${reviewed_commit}" ]; then
  echo "Could not read last_reviewed_commit from ${METADATA_FILE}." >&2
  exit 2
fi

latest_commit="$(gh api "repos/${REPOSITORY}/commits/master" --jq .sha)"
if [ "${latest_commit}" != "${reviewed_commit}" ]; then
  echo "PaperMod has unreviewed upstream changes." >&2
  echo "Last reviewed: ${reviewed_commit}" >&2
  echo "Latest:        ${latest_commit}" >&2
  echo "Review the update using docs/THEME_MAINTENANCE.md." >&2
  exit 1
fi

echo "PaperMod upstream is reviewed through ${reviewed_commit}."
