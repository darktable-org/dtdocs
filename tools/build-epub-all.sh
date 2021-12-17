#!/usr/bin/env bash

OUTPUT=epub
HUGO_DIR=public-${OUTPUT}
HUGO_CONFIG=config-${OUTPUT}.yaml

# Get a list of languages
languages=`find po -name '*.po' | cut -d . -f 2 | sort -u`
# convert newlines to spaces and add English to the list
languages=`echo en $languages`

hugo -v --config ${HUGO_CONFIG} -d ${HUGO_DIR}

cd ${HUGO_DIR}

for language in $languages
do
  echo $language
  mkdir -p ../public/$language
  cp mimetype $language/mimetype
  cp -r OEBPS $language/OEBPS
  cp -r META-INF $language/META-INF
  cp darktable-logo.svg $language/OEBPS/
  cp style.css $language/OEBPS/
  cd $language
  find . -type f -name "*.html" -exec sed -i 's/..\/style\.css/style.css/' {} +
  find . -type f -name "*.html" -exec sed -i 's/..\/en\///' {} +
  find . -type f -name "*.html" -exec sed -i 's/..\/..\/en\///' {} +
  find . -type f -name "*.html" -exec sed -i 's/..\/..\/..\/en\///' {} +
  sed -i "s/content src\=\"$language\//content src\=\"/" toc.ncx
  sed -i "s/item href\=\"$language\//item href\=\"/" content.opf
  mv darkroom guides-tutorials lighttable lua map module-reference overview preferences-settings print slideshow special-topics tethering OEBPS
  mv *.html content.opf toc.xhtml toc.ncx index.html style.css darktable-logo* OEBPS
  zip -rX ../../public/$language/darktable_user_manual.epub mimetype OEBPS META-INF
  cd ..
done

cd ..
rm -r ${HUGO_DIR}
