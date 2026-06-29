---
title: translations maintenance
id: translations-maintenance
weight: 100
---

Translations of the darktable documentation are maintained via [Weblate](https://hosted.weblate.org/projects/darktable-documentation/). Please do all translation work through Weblate. We will not accept pull requests directly on github to update PO files.

# Overview of the translations workflow using weblate

1. The original english files (`content/*.md`) are changed through pull requests (see [workflow](workflow.md)).
2. The POT file housing all translatable strings is updated with `generate-translations.sh --no-translations` every night. 
3. Weblate automatically pulls the POT file upon update (triggered by the weblate GitHub app).
4. Weblate populates the PO file of each translated language with new/updated strings and commits the changes to GitHub by opening a pull request. 
5. Translations happen on weblate, this internally generates updated PO files for each language.
6. The new PO files are committed from weblate to dtdocs repository via pull request.
7. Upon deployment translated .md-files are generated from those PO files at [docs.darktable.org](https://docs.darktable.org). This step is disabled for the auto-build [github-pages](https://darktable-org.github.io/dtdocs/).


# Adding a new language

1. Add a new language to weblate by clicking the plus sign in the top left of the languages overview. Make sure it is committed to the dtdocs repository.
2. In the files `config.yaml` and `config-pdf.yaml`, locate the `languages:` line.
3. Add the language you wish to translate. For example, the English looks like this:
   ```
     en-us:
       title: darktable 3.4 user manual
       weight: 1
   ```

# Generating a PO file

Do the following steps if you want to update the POT and PO files from the markdown source.

1. Create an empty PO file for your language in the `po` folder with the file name `content.<language>.po`.
   For example:
   `touch po/content.fr-fr.po`
2. Run the script to populate the PO file:
   `cd tools/ && ./generate-translations.sh --no-translations`

## Translating website, epub, and PDF strings

There are two themes for the darktable documentation: one for the HTML website and one for the PDF. You'll need to translate the strings for both.

1. Go to `themes/hugo-darktable-docs-themes/i18n`.
2. Copy content of the file `en.yaml` and name the new file `<your language>.yaml`.
3. Translate the content of the new yaml file.
4. Check the translated PO file into git, push it to github, and open a pull request to have your changes accepted.
5. Repeat the last four steps for the other themes, `themes/hugo-darktable-docs-epub-theme` and `themes/hugo-darktable-docs-pdf-theme`.

## Integrating new translations from Weblate

The following assumes that your git working directory is clean, that you have API access to the Weblate instance, that you've configured the Weblate git repo as a remote in your local `dtdocs` git repo, and that `wlc`, the Weblate command line client, is configured.

1. Commit any changes in Weblate: `wlc commit darktable/dtdocs`
2. Lock the Weblate project to prevent further changes: `wlc lock darktable/dtdocs`
3. In your local `dtdocs` git repo, create a new branch: `git checkout -b po-updates`
4. Update the Weblate remote: `git remote update weblate`
5. Merge the Weblate changes into your locally created branch: `git merge weblate/master`
6. Squash all the Weblate commits, since there are so many: `git reset $(git merge-base master $(git rev-parse --abbrev-ref HEAD))`
7. Stage the changed PO files: `git add -A`
8. Commit the `PO` files: `git commit -m "Updated with the PO files from weblate."`
9. Update the `POT` and `PO` files: `cd tools/ && ./generate-translations.sh --no-translations && cd ..`
10. Stage the `POT` and `PO` files: `git add -A`
11. Commit the `POT` and `PO` files: `git commit -m "Updated POT and PO files."`
12. Create a Pull Request in Github.
13. After the Pull Request is accepted, reset the Weblate repo to match the `dtdocs` repo: `wlc reset darktable/dtdocs`


# generate-translations.sh

The script is a wrapper around `po4a` to orchestrate the interplay between the original .md files and the translations. The script reads `disable-languages`, filters out disabled languages, builds a temporary `po4a` config file containing all `content/**/*.md` files, and then calls `po4a $1 --verbose $po4a_conf` — the flag is passed through directly to `po4a`.
It requires one of the three arguments.

`--no-translations`
: Generates POT and POT files (`po/content.pot` and `po/content.{lang}.po`) from the source .md files (`content/*.md`). Does *not* produce any translated output files. New or changed strings from the source files are pulled into the POT/PO files, but no `*.{lang}.md` files are created. This is used after updates to the English source files to prepare the POT and PO files for weblate.

`--no-update`
: Generates the translated Markdown files from the existing PO files, without updating the POT/PO files. This means the source files (`content/*.md`) are not re-read; existing translations are rendered directly into localized `.{lang}.md` files. 

`--rm-translations`
: Removes the generated translated files. `po4a` deletes the localized `*.{lang}.md` output files previously created by `--no-update`. The PO/POT files are left untouched. 
