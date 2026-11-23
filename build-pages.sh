#!/bin/sh
# Build a standalone copy of the magazine for GitHub Pages into ./docs
#
# index.html is authored for Claude Artifacts, which wraps it in a document
# shell at publish time. Served raw it would render in quirks mode with no
# viewport meta, so this adds an equivalent shell. Everything else is already
# static and relative, so it just gets copied.
set -e
cd "$(dirname "$0")"
rm -rf docs
mkdir -p docs

cat > docs/index.html <<'HEAD'
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">
<meta name="description" content="A SNKRS e-magazine of the Evan Collins x CARI Nike Visual Archive - 116 archival plates across three galleries.">
<style>
  :root{color-scheme:light;
    padding-top:env(safe-area-inset-top,0px);
    padding-bottom:env(safe-area-inset-bottom,0px)}
  body{margin:0}
  img{max-width:100%}
  [hidden]{display:none!important}
</style>
HEAD

# the authored file is head content (title/meta/link/style) followed by body
# content; split it at the first markup that belongs in the body
python3 - <<'PY'
src = open('index.html').read()
marker = '\n<div class="wrap">'
if marker not in src:
    marker = '\n<main'
i = src.index(marker)
head, body = src[:i], src[i:]
# the viewport-fit-sides meta is an Artifact platform hint; it means nothing here
head = '\n'.join(l for l in head.split('\n') if 'claude:viewport-fit-sides' not in l)
with open('docs/index.html', 'a') as f:
    f.write(head)
    f.write('\n</head>\n<body>\n')
    f.write(body)
    f.write('\n</body>\n</html>\n')
PY

cp -R images docs/
touch docs/.nojekyll   # serve the files as-is, no Jekyll processing

echo "built docs/ ($(du -sh docs | cut -f1))"
