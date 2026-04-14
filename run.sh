#!/bin/bash
set -euo pipefail

EXTRA_ARGS=()
if [ "${DRAFTS:-0}" = "1" ]; then
  EXTRA_ARGS+=("-D")
fi

docker run --rm -it -p 1313:1313 -v /Users/adrianramos/Repos/quihacker.site/:/src -w /src ghcr.io/gohugoio/hugo:latest server --bind 0.0.0.0 --baseURL http://localhost:1313 --disableFastRender "${EXTRA_ARGS[@]}"
