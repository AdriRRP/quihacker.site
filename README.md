# Quihacker's Lab

[![CI and deploy Hugo to GitHub Pages](https://github.com/AdriRRP/quihacker.site/actions/workflows/deploy.yml/badge.svg)](https://github.com/AdriRRP/quihacker.site/actions/workflows/deploy.yml)

Source for [quihacker.site](https://quihacker.site), a bilingual technical lab
about Rust, hardware hacking, software architecture, offensive security, and
pragmatic AI.

## Stack

- Hugo Extended 0.164.0
- vendored PaperMod theme plus local layout overrides
- GitHub Actions and GitHub Pages
- Spanish as the default language under `/es/`, with English under `/en/`

The production pipeline pins every Action by full commit SHA and verifies the
Hugo archive with SHA-256 before building. Only `main` can deploy to the
protected `github-pages` environment.

## Repository layout

| Path | Purpose |
| --- | --- |
| `config/_default/` | Hugo, language, menu, and site parameters |
| `content/` | Bilingual pages, posts, taxonomies, and series |
| `layouts/` | Local templates and render hooks overriding PaperMod |
| `assets/` | CSS and resources processed by Hugo Pipes |
| `static/` | Files copied verbatim to the published site |
| `themes/PaperMod/` | Vendored upstream theme |
| `.github/workflows/` | CI, validation, and Pages deployment |

## Local development

Docker is the only required runtime:

```bash
./run.sh
```

The site is then available at <http://localhost:1313>. To include draft
content:

```bash
./run.sh --drafts
# or
DRAFTS=1 ./run.sh
```

If Hugo Extended 0.164.0 is installed locally, the production-equivalent build
is:

```bash
HUGO_ENVIRONMENT=production hugo --gc --minify --panicOnWarning
```

Generated output belongs in `public/` and must not be committed.

## Content workflow

New articles remain drafts until they are ready in both intended languages.
Hugo generates the page title as the document's `<h1>`; article content should
start at `##` to preserve heading hierarchy. Keep source links canonical and
remove tracking query parameters before publication.

## Contributions and security

See [CONTRIBUTING.md](CONTRIBUTING.md) for the pull-request workflow. Report
security issues privately as described in [SECURITY.md](SECURITY.md).

The original code and content in this repository are published with all rights
reserved; see [LICENSE](LICENSE). No permission for reuse or redistribution is
granted beyond rights provided by applicable law. Third-party components retain
their own licenses, including PaperMod under `themes/PaperMod/LICENSE`.
