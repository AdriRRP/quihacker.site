#!/bin/bash

docker run --rm -it -p 1313:1313 -v /Users/adrianramos/Repos/quihacker.site/:/src -w /src ghcr.io/gohugoio/hugo:latest   server --bind 0.0.0.0 --baseURL http://localhost:1313 -D --disableFastRender
