#!/bin/bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEFAULT_HUGO_IMAGE="ghcr.io/gohugoio/hugo:v0.165.0@sha256:608a19e34f86de36773503adbaab174fc28a6e338dc7904e03c70320b003a153"
HUGO_IMAGE="${HUGO_IMAGE:-${DEFAULT_HUGO_IMAGE}}"

DRAFTS_FLAG="${DRAFTS:-0}"
if [ "${1:-}" = "--drafts" ]; then
  DRAFTS_FLAG=1
fi

EXTRA_ARGS=()
if [ "${DRAFTS_FLAG}" = "1" ]; then
  EXTRA_ARGS+=("-D")
fi

TTY_ARGS=()
if [ -t 0 ] && [ -t 1 ]; then
  TTY_ARGS+=("-it")
fi

docker run \
  --rm \
  --init \
  "${TTY_ARGS[@]+"${TTY_ARGS[@]}"}" \
  --publish 127.0.0.1:1313:1313 \
  --volume "${ROOT_DIR}:/src" \
  --workdir /src \
  "${HUGO_IMAGE}" \
  server \
  --bind 0.0.0.0 \
  --baseURL http://localhost:1313 \
  --disableFastRender \
  "${EXTRA_ARGS[@]+"${EXTRA_ARGS[@]}"}"
