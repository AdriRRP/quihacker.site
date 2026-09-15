#!/bin/bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEFAULT_HUGO_IMAGE="ghcr.io/gohugoio/hugo:v0.166.0@sha256:9f3cccb54b48e83a5468cd44f0372b10834b6d8418ef692d9821bb1314761829"
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
