# Contributing

## Development workflow

1. Branch from the latest `main`.
2. Keep one logical change per pull request.
3. Run a production build with warnings treated as errors.
4. When changing templates or content, also build drafts and future content.
5. Open a pull request and resolve every review thread before merging.

Recommended validation commands:

```bash
HUGO_ENVIRONMENT=production hugo --gc --minify --panicOnWarning
HUGO_ENVIRONMENT=production hugo --buildDrafts --buildFuture \
  --destination /tmp/quihacker-all-content --gc --minify --panicOnWarning
```

## Content rules

- Do not add an H1 inside article Markdown; the page template owns it.
- Keep Spanish and English translation keys and taxonomy slugs aligned.
- Use descriptive alternative text for meaningful images.
- Remove affiliate, analytics, and copied session parameters from links.
- Do not publish private identifiers, credentials, device secrets, or captured
  production data.

## Repository rules

- Never commit generated `public/`, Hugo caches, editor state, or secrets.
- Pin GitHub Actions by full commit SHA.
- Give vendored dependencies an upstream commit, license, and update process.
- Avoid runtime third-party scripts unless their exact version and integrity are
  verified.
- Preserve unrelated local changes when working in an existing worktree.

Security reports must follow [SECURITY.md](SECURITY.md), not public issues.
