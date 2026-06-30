---
title: translations setup
id: translations-setup
weight: 100
---

Translations of darktable's documentation are maintained via [Weblate](https://hosted.weblate.org/projects/darktable-documentation/). 

# Overview of the setup and flow of information for translations using Weblate

In short: 
1. The docs are primarily maintained in English in the .md files present in `content/*.md`. 
2. From there a POT file (`po/content.pot`) of all *translatable* strings is maintained. 
3. Weblate maintains each language's individual PO files (`po/content.{lang}.po`) which contain the *translated* strings. 
4. Upon deployment of the docs language-specific .md-files are generated using `generate-translations.sh` which hugo then renders to .html files and the epub and PDF variants. 

## GitHub to Weblate: source string synchronisation

1. The original English files (`content/*.md`) are changed through a pull request on GitHub (see [workflow](workflow.md)).
2. A nightly GitHub action updates the POT file (`po/content.pot`) housing all translatable strings with `generate-translations.sh --no-translations`. Note: The script updates POT and PO files but we don't commit the updated PO files to the repository as in our setup the PO files are entirely managed by Weblate to avoid merge conflicts.
3. Weblate automatically pulls the updated POT file (triggered by the Weblate GitHub app) and internally populates the PO file of each translated language with new/updated strings
4. Weblate commits the changes to GitHub by opening a pull request.
5. The pull request gets merged after review.

## Weblate to GitHub: translation synchronisation

1. Translations happen on Weblate. See [translators guide](translators-guide.md) for a guide on how to translate.
2. Weblate internally updates each language's PO file and commits them to GitHub via pull request. To keep the number of pull requests at bay this happens in batches.

## Deployment of translations

Upon deployment at [docs.darktable.org](https://docs.darktable.org) translated .md-files are generated from the PO files in `/po/` using `generate-translations.sh --no-update`. This step is disabled for the auto-build [GitHub Pages](https://darktable-org.github.io/dtdocs/).

# Adding a new language

1. Add a new language to Weblate. See [Weblate's documentation](https://docs.weblate.org/en/latest/devel/translations.html#adding-new-translations) for how to do this. Make sure the newly created PO file is committed to the dtdocs repository.
2. In the files `config.yaml` and `config-pdf.yaml`, locate the `languages:` line.
3. Add the language you wish to translate. For example, the English entry looks like this:
   ```
     en-us:
       title: darktable user manual
       weight: 1
   ```

# Enabling and disabling languages

Languages are controlled by two independent systems that must be manually kept in sync:

- **`config.yaml` and `config-pdf.yaml`** — hugo's configuration. Languages listed here get their own section of the built website or PDF.
- **`disable-languages`** — A space-separated list of language codes in the repository's base directory. `generate-translations.sh` reads this file and skips generating `.{lang}.md` files for any language listed here, regardless of whether a PO file exists for it.

The language switcher in the theme only lists a language when translated `.{lang}.md` files exist for the current page — it uses Hugo's `.IsTranslated` and `.Translations` variables, which reflect actual files on disk, not `config.yaml` entries. A language present in `config.yaml` but listed in `disable-languages` will therefore not appear in the switcher, as no translated files are generated for it. Its `config.yaml` entry is dormant until it is removed from `disable-languages`.

To enable a language, it should be present in `config.yaml` and `config-pdf.yaml` and absent from `disable-languages`.

To disable a language, it should be listed in `disable-languages`. The `config.yaml` and `config-pdf.yaml` entries can remain in place for when the language is re-enabled.

# Translating theme strings for website, epub, and PDF

There are three themes for the darktable documentation: one for the HTML website, one for epub, and one for the PDF. Each has a small set of UI strings (e.g. "Table of Contents", "Copyright", "Search") that must be translated manually — these strings are **not** managed by Weblate.

1. Go to `themes/hugo-darktable-docs-theme/i18n`.
2. Copy the file `en-us.yaml` and name the new file after your language using a locale code with a dash (e.g. `de-de.yaml`, `fr-fr.yaml`).
3. Translate the strings in the new yaml file.
4. Check the translated yaml file into git, push it to GitHub, and open a pull request to have your changes accepted.
5. Repeat for `themes/hugo-darktable-docs-epub-theme/i18n` and `themes/hugo-darktable-docs-pdf-theme/i18n`. These themes use shorter locale codes, using only the language code (e.g. `de.yaml`) or an underscore for regional variants (e.g. `pt_br.yaml`).


# generate-translations.sh

This script is used by the nightly GitHub action and can also be run locally by maintainers who need to update translations manually or debug the build.

The script is a wrapper around `po4a` to orchestrate the interplay between the original .md files and the translations. The script reads the `disable-languages` file in the repository's base directory, filters out disabled languages, builds a temporary `po4a` config file containing all `content/**/*.md` files, and then calls `po4a $1 --verbose $po4a_conf` — the flag is passed through directly to `po4a`.
It requires one of the three arguments.

`--no-translations`
: Generates POT and PO files (`po/content.pot` and `po/content.{lang}.po`) from the source .md files (`content/*.md`). Does *not* produce any translated output files. New or changed strings from the source files are pulled into the POT/PO files, but no `*.{lang}.md` files are created. This is used after updates to the English source files to prepare the POT and PO files for Weblate.

`--no-update`
: Generates the translated Markdown files from the existing PO files, without updating the POT/PO files. This means the source files (`content/*.md`) are not re-read; existing translations are rendered directly into localized `.{lang}.md` files.

`--rm-translations`
: Removes the generated translated files. `po4a` deletes the localized `*.{lang}.md` output files previously created by `--no-update`. The PO/POT files are left untouched.
