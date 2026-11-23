# Changelog

All notable changes to the SNKRS Architectural e-magazine.

## [0.13.0] - 2026-11-23
### Added
- `build-pages.sh`, which builds a standalone `docs/` for GitHub Pages.
  `index.html` is authored for Claude Artifacts, which supplies the document
  shell at publish time; served raw it would render in quirks mode with no
  viewport meta, so the script adds an equivalent doctype, charset, viewport
  and reset, drops the Artifact-only meta, and copies the plates.
- `README.md` with the gallery breakdown, the Pages setup, and a note that the
  plates and the SNKRS mark are Nike's, which matters for a public URL.

## [0.12.3] - 2026-11-23
### Changed
- Slideshow "Contents" button now reads "Return Home". Dropped its aria-label so
  the visible text is the accessible name (an aria-label of different wording
  overrides what people read out, failing WCAG 2.5.3 Label in Name), and
  retargeted the SNKRS mark's label, which still said "back to the contents".

## [0.12.2] - 2026-11-23
### Fixed
- Arrowing through a gallery no longer draws a tall outlined rectangle over the
  plate. Opening a gallery focused one of the click zones, and since a zone is a
  third of the screen wide and full height, its `:focus-visible` ring was that
  whole region. Focus now goes to the dialog itself (`tabindex="-1"`, ring
  suppressed because it is not tabbable), so arrow keys light up nothing.
- A zone reached by Tab still shows a focus ring, but around the arrow glyph
  instead of the region, so keyboard users keep a visible indicator.

## [0.12.1] - 2026-11-23
### Changed
- Gallery title slide: the oversized "01" numeral is now a "Gallery 01" label,
  set well below the gallery name (16.8px against 67.2px) as a 500-weight
  uppercase line, matching the labels on the cover cards. Recoloured to the
  accent red, since the old near-black grey only worked as a giant ghost
  numeral and would have been unreadable at label size.

## [0.12.0] - 2026-11-23
### Changed
- Typography now follows nike.com/jordan/air-jordan-11. Sampled computed styles
  from that page: headings are Neue Haas Grotesk Bold, uppercase, letter-spacing
  normal, line-height 1.2; body is Helvetica Now Text 400 at line-height 1.5;
  labels are the same face at 500, uppercase, no tracking. Weights 400/500/700.
- Dropped Archivo and IBM Plex Mono for a single grotesque, as they use. The
  stack is 'Helvetica Neue', Helvetica, Inter, Arial - real Helvetica where the
  viewer has it, Inter as the cross-platform stand-in, since neither Neue Haas
  Grotesk nor Helvetica Now is on Google Fonts and the artifact CSP allows no
  other font host.
- Removed every letter-spacing value in the page. Their system uses none, and
  the wide-tracked mono labels were the biggest departure from it.
- Slide captions now sit at 20px/400/1.5, matching their editorial callout.

## [0.11.0] - 2026-11-23
### Changed
- Tightened the gap between the caption and the plate at every width. It was
  three things stacked: the caption's bottom padding (30px), a 36px inset on the
  image, and vertical centring that floated short plates down the stage. The
  plate is now top-aligned in a flex stage with small padding, so the gap is
  fixed and the room above the caption is untouched.
- Title slide hint now reads "Press → to swipe through".

### Fixed
- The arrows no longer drift between slides. They were centred in the image
  stage, whose top edge moves when a caption wraps to two lines. The glyphs are
  now pinned to the viewport's vertical centre, while the tap zones still track
  the image area. Verified across 20 plates: caption block varies 80-108px, the
  arrow holds at one position.

## [0.10.0] - 2026-11-23
### Fixed
- Hero scrim now rides with the text block instead of sitting at fixed
  percentages of the hero height. At phone width the headline and dek were
  landing on bare red with no scrim under them, because the dark ramp started
  around 52% while the text began much higher. Covers the text at any viewport.

### Changed
- Swipe hardened: the listener moved from the image stage to the whole
  slideshow, so a swipe starting on the caption or padding counts. Threshold
  eased to 45px, and a swipe ending over a tap zone no longer fires that zone's
  click as well. `touch-action: pan-y pinch-zoom` on the stage keeps vertical
  and pinch gestures with the browser while the horizontal one is ours.

## [0.9.0] - 2026-11-23
### Changed
- Progress bar moved from under the top bar to under the image, above the rail.
- More room around the caption: roughly double the vertical padding. Side
  padding stays on the 16px gutter so the caption still lines up with the top
  bar and the thumbnail rail.

### Fixed
- The left arrow no longer shows on the title slide, and the right arrow no
  longer shows on the last plate - both pointed nowhere. This was lost when the
  Prev/Next buttons went: they carried the only disabled-state logic. Opening a
  gallery now focuses whichever zone is actually present.

## [0.8.2] - 2026-11-23
### Fixed
- Gallery 2 plates 1-9 were showing the wrong captions. The gallery has 40
  images for 39 captions, and I had assumed the extra one was a cover frame at
  the start. It is not: image `e81bb320` sits uncaptioned between plates 9 and
  10, so the first nine plates were shifted by one while 10-39 were correct.
- Pairing is now taken from document order on Nike's page (each caption belongs
  to the image immediately before it) instead of inferred from index counts.
  Galleries 1 and 3 were re-checked the same way and are clean - their only
  repeat is the hero, which is also plate 1.

## [0.8.1] - 2026-11-23
### Changed
- Slideshow arrows are now red, bolder, and carry a drop shadow so they read
  over light plates.

### Fixed
- Restored CSS lost in 0.8.0: the `.f-zone` click-zone rules, the `plate` slide
  animation, and the phone-width overrides. A substring match on `.f-cap{` had
  also matched inside the `.f-stage.go img,.f-stage.go .f-cap{...}` selector and
  deleted everything up to `.f-rail`, leaving the click zones unpositioned.
- The slide transition now runs off `.film`, so the caption animates with the
  image again — it sits outside `.f-stage` since the caption moved above.

## [0.8.0] - 2026-11-23
### Changed
- Plate captions moved above the image as a single line; the bottom caption bar
  is removed entirely.

### Removed
- Prev/Next buttons from the slideshow bar.
- The "As published" credit block from every slide.
- The title slide's duplicated gallery name and "In this gallery" block, which
  only existed inside the removed caption bar.

### Notes
- The left/right click zones were already real, labelled, focusable buttons, so
  dropping Prev/Next leaves keyboard and screen-reader navigation intact — which
  matters on phones, where the thumbnail rail is hidden. Focus on open now lands
  on the "Next plate" zone.

## [0.7.0] - 2026-11-23
### Changed
- Accent switched from blue to Nike red across the gallery labels, arrow CTAs,
  slideshow eyebrows, progress fill and focus rings.
- Light theme uses a slightly deeper red (#D10015) because #FF0017 on the paper
  background only reaches 3.5:1; dark theme keeps #FF0017 and the slideshow uses
  #FF3040. All three clear WCAG AA at 4.8-5.0:1.

## [0.6.2] - 2026-11-23
### Changed
- Gallery cards: the "Gallery 01" badge moved off the thumbnail and sits above
  the gallery title as a small mono label, on all three cards.

## [0.6.1] - 2026-11-23
### Changed
- The dek now sits on one line on desktop (its 26em cap was forcing "history."
  onto a line of its own); it still wraps at narrow widths.
- Cover masthead trimmed to the SNKRS mark alone — the "Content Thread /
  Editorial · Galleries 01–03" line and the rule under it are gone.

## [0.6.0] - 2026-11-23
### Changed
- The Evan Collins bio moved into the hero, directly under the byline, in light
  type over the scrim.
- Gallery cards drop the "Open · N plates →" line for a bare arrow.
- Plate-count copy removed from visible UI: the slideshow bar's "Plate 2 / 39"
  counter is gone, the title slide reads "Press → to begin", and plate captions
  lead with the gallery name alone. Position is still carried by the progress
  bar, the thumbnail rail, and the screen-reader live region.

## [0.5.1] - 2026-11-23
### Removed
- The "Contents" header block and its rule (a `border-bottom` on `.sec-head`,
  not a separate `<hr>`). The bio and gallery grid now follow the hero directly.

### Fixed
- Gallery card titles promoted from `h3` to `h2` so the cover's heading order no
  longer skips a level now that the "Contents" `h2` is gone.

## [0.5.0] - 2026-11-23
### Added
- Galleries 2 (Merchandise, 39 plates) and 3 (Graphics, 38 plates), found via the
  parent thread `content-thread-editorial-evan-collins-cari`. Gallery 2's real slug
  is `...-gallery-2-us`, which is why guessing `-gallery-2` returned 404.
- Real Evan Collins bio from the parent thread as the intro below the hero.

### Changed
- Contents is now the three real galleries in Nike's own order, replacing the
  eight thematic groupings that were invented here.
- Plate captions are shown verbatim as published; the invented short titles and
  the split source line are gone, so no copy on the page is written by us.

### Fixed
- Gallery 2's first image is a cover-only frame, not plate 1 (39 captions, 40
  images); plates are offset by one so caption and image stay aligned.

## [0.4.0] - 2026-11-23
### Changed
- New hero: the Nike Visual Archive contact sheet as a full-bleed banner, with
  the heading "Nike Visual Archive," the dek, and an Evan Collins byline. Replaces
  the Evan Collins x CARI / Architectural header.
- The SNKRS mark is now a link home: the cover mark returns to the top of the
  issue, the slideshow mark closes back to the contents.
- The source thread's description moved from the hero into the contents intro so
  the attribution survives the colophon's removal.

### Removed
- The colophon section and everything below it.

## [0.3.0] - 2026-11-23
### Changed
- Replaced the typeset "SNKRS" wordmark in both lockups (cover masthead and
  slideshow bar) with the official Nike SNKRS SVG mark, taken from nike.com/launch
  and kept in brand red #FF0017. Inlined, so it needs no network request.

## [0.2.0] - 2026-11-23
### Changed
- Reworked the reader from a two-page book spread into a full-screen slideshow:
  plates are now full-bleed on a black stage with a fixed caption bar, thumbnail
  rail, segmented progress and large click zones.

### Added
- Focus handling for the slideshow overlay: `inert` on the cover while open,
  focus returned to the originating card on close.

## [0.1.0] - 2026-11-23
### Added
- Cover with SNKRS masthead, the source thread's intro copy, and a contents grid
  of 8 galleries built over the 39 plates.
- 39 plates and their captions pulled from the SNKRS content thread
  "Gallery 1 — Architectural" (Evan Collins & CARI), saved locally to `plates/`
  because the Nike CDN is blocked by the artifact CSP.
- Keyboard (arrows, space, Home/End, Escape), swipe and hash routing per gallery.
- WCAG pass: live region announcing each plate, visible focus rings, alt text
  from each published caption, `prefers-reduced-motion` support.
