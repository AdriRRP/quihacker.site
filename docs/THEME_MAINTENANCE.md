# PaperMod maintenance

PaperMod is vendored under `themes/PaperMod`; it is not a submodule. The exact
source revision, source tree, review horizon, license, and local patches are
recorded in `themes/PaperMod.upstream.toml`.

## Current baseline

- Repository: <https://github.com/adityatelange/hugo-PaperMod>
- Vendored commit: `ff85b9cd65790824a5bbe860e74fe96ce0ea493d`
- Vendored tree: `7153ddcdf939a555a9d18fab5f71dac5affd24ad`
- License: MIT; the upstream license remains at `themes/PaperMod/LICENSE`

The imported tree was independently matched against upstream Git history. The
repository then applied the local Hugo API migration recorded in the metadata
file.

## Upstream review status

Upstream was reviewed through
`d3768854d00ad003b0a8dbdba254ce9224377a01` on 2026-08-10. A direct replacement
was intentionally rejected because it fails the strict Hugo 0.164 build and
breaks current overrides:

- upstream still uses the deprecated `.Language.LanguageDirection` API;
- layouts moved from `_default`/`partials` to the Hugo 0.146 layout structure;
- the removed scrollbar resource is still consumed by the local head override;
- upstream's `data-theme` toggle must be reconciled with local `.dark` styles.

Treat the next import as a theme migration, not as a file copy.

## Review procedure

1. Run `./scripts/check-papermod-upstream.sh` to detect a new upstream commit.
2. Create a dedicated branch and clone PaperMod outside this repository.
3. Diff from `vendored_commit` to the candidate commit and review executable
   templates, JavaScript, CSS, workflow files, and license changes.
4. Port the local overrides to the candidate layout structure. Do not silently
   discard the commits listed under `local_patches`.
5. Build production and all draft/future content with `--panicOnWarning`.
6. Verify search, language switching, theme switching, Mermaid, metadata, and
   responsive covers in both light and dark modes.
7. Update `vendored_commit`, `vendored_tree`, `last_reviewed_commit`, and dates in
   `themes/PaperMod.upstream.toml` in the same pull request.

The scheduled `PaperMod upstream audit` workflow fails when upstream advances
beyond the recorded review horizon, making dependency drift visible without
allowing an automatic, unreviewed theme replacement.
