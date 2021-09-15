#!/usr/bin/env bash

OUTPUT=html
HUGO_DIR=public
HUGO_CONFIG=config.yaml

rm -r ${HUGO_DIR}

hugo --config ${HUGO_CONFIG} -d ${HUGO_DIR}

rm -r ${HUGO_DIR}
