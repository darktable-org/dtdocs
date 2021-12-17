#!/usr/bin/env bash

OUTPUT=epub
HUGO_DIR="$(pwd)/public-${OUTPUT}"
HUGO_CONFIG="$(pwd)/config-${OUTPUT}.yaml"
HUGO_PUBLIC="$(pwd)/public"

# Get a list of languages
if [ -d "$(pwd)/po" ]
then
   languages=`find $(pwd)/po -name '*.po' | cut -d . -f 2 | sort -u`
else
   echo "po files not found -- you must run this from the root of your dtdocs repo"
   echo "exiting"
   exit 1
fi

#check for config
if [ ! -f "$HUGO_CONFIG" ]
then
   echo "config not found -- exiting"
   exit 1
fi

#initialise directories
rm -r "$HUGO_DIR"
mkdir -p "$HUGO_PUBLIC"
mkdir -p "$HUGO_DIR"

# convert newlines to spaces and add English to the list
languages=`echo en $languages`

hugo -v --config "${HUGO_CONFIG}" -d "${HUGO_DIR}"

#create copy of image files from the English site for use in other languages
if [ -d "$HUGO_DIR/en" ]
then
   mkdir "${HUGO_DIR}/all_images"
   cd "${HUGO_DIR}/en"
   find . -type f \( -name "*.png" -o -name "*.jpg" \) -exec cp -n --parents {} "${HUGO_DIR}/all_images" \;
else
   echo "no English language directory found -- exiting"
   exit 1
fi

for language in $languages
do
  echo "processing language $language"

  if [ -d "$HUGO_DIR/$language" ]
  then

     #create target directory for epub if it doesn't exist
     mkdir -p "$HUGO_PUBLIC/$language"

     #copy non-languuage files to language dir
     cd "${HUGO_DIR}"
     cp mimetype $language/mimetype
     cp -r OEBPS $language/OEBPS
     cp -r META-INF $language/META-INF
     cp darktable-logo.svg $language/OEBPS/
     cp style.css $language/OEBPS/

     #copy images
     cd "${HUGO_DIR}/all_images"
     find . -type f \( -name "*.png" -o -name "*.jpg" \) -exec cp -n --parents {} "${HUGO_DIR}/$language" \;
     
     #replace occurences of en or $language string
     cd "$HUGO_DIR/$language"
     find . -type f -name "*.html" -exec sed -i "s/\.\.\/$language\///g" {} +
     find . -type f -name "*.html" -exec sed -i 's/\.\.\/style\.css/style.css/' {} +
     sed -i "s/content src\=\"$language\//content src\=\"/" toc.ncx
     sed -i "s/item href\=\"$language\//item href\=\"/" content.opf
     sed -i "s/a href\=\"$language\//a href\=\"/" toc.xhtml
     sed -i "s/\.\.\/style\.css/style.css/" toc.xhtml

     #move files to target epub directories
     mv darkroom guides-tutorials lighttable lua map module-reference overview preferences-settings print slideshow special-topics tethering OEBPS
     mv *.html content.opf toc.xhtml toc.ncx index.html style.css darktable-logo* OEBPS

     #create epub
     zip -rX "$HUGO_PUBLIC/$language/darktable_user_manual.epub" mimetype OEBPS META-INF

  else
     echo "$language directory not found"
  fi
done
