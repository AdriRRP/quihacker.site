#!/bin/bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

EXTRA_ARGS=()
if [ "${DRAFTS:-0}" = "1" ]; then
  EXTRA_ARGS+=("-D")
fi

docker run --rm -it -p 1313:1313 -v "${ROOT_DIR}:/src" -w /src ghcr.io/gohugoio/hugo:latest server --bind 0.0.0.0 --baseURL http://localhost:1313 --disableFastRender "${EXTRA_ARGS[@]+"${EXTRA_ARGS[@]}"}"
