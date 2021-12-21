#!/usr/bin/env bash

#go to project root
PROJECT_ROOT="$(cd `dirname $0`/..; pwd)"
cd "$PROJECT_ROOT"

#generate translated files
./tools/generate-translations.sh --no-update

#build html site
./tools/build-html.sh

#build epubs
./tools/build-epub.sh

#build pdfs
./tools/build-pdf.sh
