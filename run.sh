#!/bin/bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HUGO_VERSION="${HUGO_VERSION:-v0.150.0}"

DRAFTS_FLAG="${DRAFTS:-0}"
if [ "${1:-}" = "--drafts" ]; then
  DRAFTS_FLAG=1
fi

EXTRA_ARGS=()
if [ "${DRAFTS_FLAG}" = "1" ]; then
  EXTRA_ARGS+=("-D")
fi

docker run --rm -it -p 1313:1313 -v "${ROOT_DIR}:/src" -w /src "ghcr.io/gohugoio/hugo:${HUGO_VERSION}" server --bind 0.0.0.0 --baseURL http://localhost:1313 --disableFastRender "${EXTRA_ARGS[@]+"${EXTRA_ARGS[@]}"}"
