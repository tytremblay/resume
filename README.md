# Ty Tremblay's Résumé

This repository holds my résumé. The source is a single LaTeX file (`src/resume.tex`);
every push to `main` compiles it to a PDF and publishes it, along with a simple
viewer page, via GitHub Pages.

**📄 View it live:** https://tytremblay.github.io/resume/

## How it works

- `src/resume.tex` is the single source of truth.
- On every push to `main`, `.github/workflows/build-and-deploy.yml` compiles the
  `.tex` to `resume.pdf` and deploys it to GitHub Pages.
- The landing page is generated inline by the workflow; there is no committed
  `index.html`. To change the page, edit the workflow, not `docs/`.

## Editing

The template defines custom macros (`\resumeSubheading`, `\resumeItem`,
`\resumeProjectHeading`, and the section list wrappers). Reuse them rather than
raw LaTeX so formatting stays consistent. See `CLAUDE.md` for the full set of
constraints baked into the preamble.

## Building locally

Requires a LaTeX toolchain (`latexmk` + `pdflatex`), which isn't part of the repo.

```bash
make                  # compile src/resume.tex -> resume.pdf (staged in build/)
make docs             # copy the built PDF into docs/
make serve            # build, then serve docs/ at http://localhost:8000
make clean            # remove build artifacts
make install-deps-macos   # install a LaTeX toolchain (macOS)
```

Don't have LaTeX installed? Just push and CI compiles and deploys it.

## License

[MIT](LICENSE).
