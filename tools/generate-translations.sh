#!/usr/bin/env bash

# Adapted from https://gitlab.com/fdroid/fdroid-website/-/raw/master/tools/i18n.sh
# Requires po4a version 0.58 or higher.

set -e

# Is po4a installed?
if ! which po4a; then
    echo "ERROR: Install po4a from your package manager."
    exit 1
fi

# Is po4a new enough?
function version_gt() { test "$(printf '%s\n' "$@" | sort -V | head -n 1)" != "$1"; }

required_version='0.58'
current_version=$(po4a --version | sed -En 's,po4a version ([0-9][0-9.]+[0-9]).*,\1,p')
if version_gt $required_version $current_version; then
    echo "ERROR: po4a v0.58 or higher required."
    exit 1
fi

PROJECT_ROOT=$(cd `dirname $0`/..; pwd)
cd ${PROJECT_ROOT}

# Get a list of languages
languages=`find po -name '*.po' | cut -d . -f 2 | sort -u`
# convert newlines to spaces
languages=`echo $languages`

# Create a temporary po4a config file.
for section in content; do
    po4a_conf=$(mktemp)
    # po4a_conf=po/po_config
    echo "[po4a_langs] $languages" > $po4a_conf
    echo "[po4a_paths] po/${section}.pot \$lang:po/${section}.\$lang.po" >> $po4a_conf
    cat >> $po4a_conf <<EOF

[options] opt:"--addendum-charset=UTF-8" opt:"--localized-charset=UTF-8" opt:"--master-charset=UTF-8" opt:"--msgmerge-opt='--no-wrap'" opt:"--porefs=file" opt:"--wrap-po=newlines" opt:"--master-language=en_US"

[po4a_alias:markdown] text opt:"--option markdown" opt:"--option yfm_keys=title" opt:"--addendum-charset=UTF-8" opt:"--localized-charset=UTF-8" opt:"--master-charset=UTF-8" opt:"--option neverwrap"

EOF
    # for f in $section/*.md; do
    for f in  $(find content -type f -name '*.md'); do
	echo "[type: markdown] $f \$lang:$(dirname $f)/$(basename $f .md).\$lang.md" >> $po4a_conf
    done
    po4a --verbose $po4a_conf &
done
wait

# no need to keep these around
rm -f po/*.en.po
