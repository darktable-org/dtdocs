---
title: translations setup
id: translations-setup
weight: 100
---

Translations of the darktable documentation are maintained via [Weblate](https://hosted.weblate.org/projects/darktable-documentation/). Please do all translation work through Weblate. 

# Overview of the setup for translations using weblate

## How new/updated strings flow from GitHub to weblate

1. The original english files (`content/*.md`) are changed through a pull request on GitHub (see [workflow](workflow.md)).
2. A nightly GitHub action updates the POT file (`/po/content.pot`) housing all translatable strings with `generate-translations.sh --no-translations`. Note: The script updates POT and PO files but we don't commit the updated PO files to the repository as in our setup the PO files are entirely managed by weblate to avoid merge conflicts.
3. weblate automatically pulls the updated POT file (triggered by the weblate GitHub app) and internally populates the PO file of each translated language with new/updated strings
4. weblate commits the changes to GitHub by opening a pull request.
5. Pull Request gets merged after review.

## How translations flow from weblate to GitHub

1. Translations happen on weblate. See [translators guide](translators-guide.md) for a guide on how to translate.
2. Weblate internally updates the updated languages po file and commits them to GitHub via pull request. To keep the number of pull requests at bay this happens in batches. 

## Deployment of translations

Upon deployment at [docs.darktable.org](https://docs.darktable.org) translated .md-files are generated from the PO files in `/po/` using ``generate-translations.sh --no-translations`. This step is disabled for the auto-build [github-pages](https://darktable-org.github.io/dtdocs/).

# Adding a new language

1. Add a new language to weblate by clicking the plus sign in the top left of the languages overview. Make sure it is committed to the dtdocs repository.
2. In the files `config.yaml` and `config-pdf.yaml`, locate the `languages:` line.
3. Add the language you wish to translate. For example, the English looks like this:
   ```
     en-us:
       title: darktable 3.4 user manual
       weight: 1
   ```

# Translating theme strings for website, epub, and PDF

There are three themes for the darktable documentation: one for the HTML website, one for epub, and one for the PDF. Each has a small set of UI strings (e.g. "Table of Contents", "Copyright", "Search") that must be translated manually — these strings are **not** managed by Weblate.

1. Go to `themes/hugo-darktable-docs-theme/i18n`.
2. Copy the file `en-us.yaml` and name the new file after your language using a locale code with a dash (e.g. `de-de.yaml`, `fr-fr.yaml`).
3. Translate the strings in the new yaml file.
4. Check the translated yaml file into git, push it to GitHub, and open a pull request to have your changes accepted.
5. Repeat for `themes/hugo-darktable-docs-epub-theme/i18n` and `themes/hugo-darktable-docs-pdf-theme/i18n`. These themes use a shorter code with an underscore instead of a dash (e.g. `de.yaml`, `pt_br.yaml`).


# generate-translations.sh

The script is a wrapper around `po4a` to orchestrate the interplay between the original .md files and the translations. The script reads `disable-languages`, filters out disabled languages, builds a temporary `po4a` config file containing all `content/**/*.md` files, and then calls `po4a $1 --verbose $po4a_conf` — the flag is passed through directly to `po4a`.
It requires one of the three arguments.

`--no-translations`
: Generates POT and POT files (`po/content.pot` and `po/content.{lang}.po`) from the source .md files (`content/*.md`). Does *not* produce any translated output files. New or changed strings from the source files are pulled into the POT/PO files, but no `*.{lang}.md` files are created. This is used after updates to the English source files to prepare the POT and PO files for weblate.

`--no-update`
: Generates the translated Markdown files from the existing PO files, without updating the POT/PO files. This means the source files (`content/*.md`) are not re-read; existing translations are rendered directly into localized `.{lang}.md` files.

`--rm-translations`
: Removes the generated translated files. `po4a` deletes the localized `*.{lang}.md` output files previously created by `--no-update`. The PO/POT files are left untouched.
