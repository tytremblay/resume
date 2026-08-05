# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

A single-page LaTeX resume for Ty Tremblay (`src/resume.tex`) that is compiled to PDF and published as a GitHub Pages site on every push to `main`. There is no application code — the "product" is the PDF and the generated landing page that embeds it.

## Commands

Building requires a local LaTeX distribution (`latexmk` + `pdflatex`), which is not part of the repo.

- `make` / `make all` — compile `src/resume.tex` to `resume.pdf` (via `latexmk`, output staged in `build/`)
- `make clean` / `make rebuild` — remove artifacts / clean-then-build
- `make docs` — copy the built PDF into `docs/` (the Pages publish dir)
- `make serve` — build, then serve `docs/` at http://localhost:8000
- `make install-deps-macos` / `make install-deps-ubuntu` — install a LaTeX toolchain

There are no tests, linters, or a JS build. Validation = the PDF compiles cleanly.

## Architecture / things worth knowing

- **CI is the source of truth for the deployed site.** `.github/workflows/build-and-deploy.yml` compiles `src/resume.tex` with `xu-cheng/latex-action`, then copies the committed `site/` directory plus the freshly built `resume.pdf` into `docs/` and deploys `docs/` to Pages.
- **The landing page and SEO assets are committed under `site/`** — `site/index.html` (a full semantic-HTML version of the resume with schema.org JSON-LD, Open Graph, and canonical/meta tags), `site/robots.txt`, and `site/sitemap.xml`. To change the landing page, edit files in `site/`, not the workflow or `docs/`.
- **`site/index.html` is a hand-maintained mirror of `src/resume.tex` content.** When you edit resume content in the `.tex`, update the matching HTML in `site/index.html` (and the JSON-LD / `dateModified` / sitemap `lastmod` if relevant) so the two stay in sync. The `.tex`/PDF is the canonical résumé; the HTML exists for crawlers and humans browsing the page.
- `docs/` is a build artifact created by CI/`make docs`; don't hand-author files there expecting them to survive.
- Local builds and CI use the same flags: `-pdf -file-line-error -halt-on-error -interaction=nonstopmode`. Keep them in sync if you change one.

## Editing the resume (`src/resume.tex`)

The template defines custom macros used throughout the document; reuse them rather than raw LaTeX:
- `\resumeSubheading{title}{dates}{org}{location}` — job/education entries
- `\resumeProjectHeading{name $|$ tech}{year}` — projects
- `\resumeItem{...}` inside `\resumeItemListStart` … `\resumeItemListEnd` — bullets
- Section wrappers: `\resumeSubHeadingListStart` … `\resumeSubHeadingListEnd`

Constraints baked into the preamble: `fontawesome` is intentionally removed for compatibility (icons are plain text/links), margins are hand-tuned via `\addtolength`, and `\pdfgentounicode=1` is set to keep the PDF ATS-parsable — preserve these when restyling.
