#!/usr/bin/env bash

#go to project root
PROJECT_ROOT="$(cd `dirname $0`/..; pwd)"
cd "$PROJECT_ROOT"

OUTPUT=pdf
HUGO_DIR="$PROJECT_ROOT/public-${OUTPUT}"
HUGO_PUBLIC="$PROJECT_ROOT/public"
HUGO_CONFIG="$PROJECT_ROOT/config-${OUTPUT}.yaml"

if [ ! -d "$PROJECT_ROOT/po" ]
then
   echo "po files not found"
   echo "exiting"
   exit 1
fi

#get list of disabled languages
disabled_languages=$(cat "$PROJECT_ROOT/disable-languages")

#remove disabled languages from the list
for lang in `find po -name '*.po' | cut -d . -f 2 | sort -u`
do
   if [[ ! "$disabled_languages" == *$lang* ]]
   then
      languages="$languages $lang"
   fi
done

# add English to the start of the list
languages=$(echo "en $languages")

#check for config
if [ ! -f "$HUGO_CONFIG" ]
then
   echo "config not found"
   echo "exiting"
   exit 1
fi

#initialise directories
rm -r "${HUGO_DIR}"
mkdir -p "$HUGO_DIR"

#start hugo server
env HUGO_DISABLELANGUAGES="$disabled_languages " hugo --config "${HUGO_CONFIG}" --bind 127.0.0.1 --port 1313 -d "${HUGO_DIR}" --disableFastRender --verbose server &
sleep 30

#make pdfs for each language
for language in $languages
do
  echo "processing language $language"

  if [ -d "$HUGO_DIR/$language" ]
  then
     echo $language
     mkdir -p "$HUGO_PUBLIC/$language"
     weasyprint -v http://127.0.0.1:1313/dtdocs/$language/index.html "$HUGO_PUBLIC/$language/darktable_user_manual.pdf"
  else
     echo "$language directory not found"
  fi
done

pkill hugo
