# SNKRS Architectural

An interactive e-magazine of the Nike Visual Archive — the SNKRS content thread
curated by Evan Collins and the Consumer Aesthetics Research Institute (CARI).
A cover with three galleries, each opening into a full-screen slideshow of
archival plates with their captions as published.

116 plates across three galleries:

| Gallery | Subject | Plates |
|---|---|---|
| 01 | Architectural | 39 |
| 02 | Merchandise | 39 |
| 03 | Graphics | 38 |

## Layout

```
index.html                      the whole magazine: markup, styles, data, behaviour
images/architectural/           Gallery 01 plates (plate-01.jpg … plate-39.jpg)
images/merchandise/             Gallery 02 plates, plus cover.jpg
images/graphics/                Gallery 03 plates
images/hero-visual-archive.jpg  cover hero
build-pages.sh                  builds docs/, a standalone copy of the page
```

No build step, no dependencies, no framework. The only external request is a
Google Fonts stylesheet.

`index.html` is authored for Claude Artifacts, which supplies the document
shell (doctype, charset, viewport meta, a small reset) when publishing. Run
`./build-pages.sh` to produce `docs/`, a self-contained copy with that shell
added, for serving anywhere static.

## Before publishing it publicly

The plates are Nike's copyrighted images, scanned from trade press, and the
SNKRS wordmark is Nike's trademark. That is fine for a private artifact or a
local copy. Putting it on a public URL republishes all of it, so treat this as
a personal study rather than something to promote, or swap the imagery for
material you hold the rights to.

## Source

Every plate, caption and credit comes from the SNKRS content thread
"Nike Visual Archive" by Evan Collins:

- <https://www.nike.com/launch/t/content-thread-editorial-evan-collins-cari>
- Gallery 1 — Architectural: `…-cari-gallery-1`
- Gallery 2 — Merchandise: `…-cari-gallery-2-us`
- Gallery 3 — Graphics: `…-cari-gallery-3`

Captions are reproduced verbatim, in the order the source thread presents them.
