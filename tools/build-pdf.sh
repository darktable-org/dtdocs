#!/usr/bin/env bash

OUTPUT=pdf
HUGO_DIR=public-${OUTPUT}
HUGO_CONFIG=config-${OUTPUT}.yaml

# Get a list of languages
languages=`find po -name '*.po' | cut -d . -f 2 | sort -u`
# convert newlines to spaces
languages=`echo $languages`

rm -r ${HUGO_DIR}

hugo serve --verbose --config ${HUGO_CONFIG} --bind 127.0.0.1 --port 1313 --disableFastRender -d ${HUGO_DIR} &
sleep 30
mkdir -p ./public/en
weasyprint -v http://127.0.0.1:1313/dtdocs/en/index.html ./public/en/darktable_user_manual.pdf
for language in $languages
do
  echo $language
  mkdir -p ./public/$language
  weasyprint -v http://127.0.0.1:1313/dtdocs/$language/index.html ./public/$language/darktable_user_manual.pdf
done
pkill hugo

rm -r ${HUGO_DIR}
