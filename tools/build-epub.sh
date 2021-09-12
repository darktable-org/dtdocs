#!/bin/bash

OUTPUT=epub
HUGO_DIR=public-${OUTPUT}
HUGO_CONFIG=config-${OUTPUT}.yaml

rm -r ${HUGO_DIR} public/darktable.epub

hugo -v --config ${HUGO_CONFIG} -d ${HUGO_DIR}

cd ${HUGO_DIR}

mv darkroom guides-tutorials lighttable lua map module-reference overview preferences-settings print slideshow special-topics tethering OEBPS
mv *.html content.opf toc.xhtml toc.ncx index.html style.css darktable-logo* OEBPS

zip -rX ../darktable_user_manual.epub mimetype OEBPS META-INF

cd ..
rm -r ${HUGO_DIR}
