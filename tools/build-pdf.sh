#!/bin/bash

OUTPUT=pdf
HUGO_DIR=public-${OUTPUT}
HUGO_CONFIG=config-${OUTPUT}.yaml

rm -r ${HUGO_DIR}

hugo serve --verbose --config ${HUGO_CONFIG} --bind 127.0.0.1 --port 1313 --disableFastRender -d ${HUGO_DIR} &
sleep 30
weasyprint -v http://127.0.0.1:1313/dtdocs/index.html ./public/darktable_user_manual.pdf
pkill hugo

rm -r ${HUGO_DIR}
