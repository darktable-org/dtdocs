#!/bin/bash

rm -rf public darktable.epub

hugo -v --config config-epub.yaml

cd public
mkdir OEBPS

mv darkroom guides-tutorials lighttable lua map module-reference overview preferences-settings print slideshow special-topics tethering OEBPS
mv content.opf toc.xhtml toc.ncx index.html style.css darktable-logo* OEBPS

zip -rX ../darktable.epub mimetype OEBPS META-INF
