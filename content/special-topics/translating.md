---
title: translating dtdocs
id: translating
weight: 100
draft: false
author: "people"
---

Translation of the darktable documentation is done via our [Weblate instance](https://weblate.pixls.us/projects/darktable/).

You can either use Weblate's web UI to translate the documentation or download the translation from Weblate to your computer, edit it, and then upload the changes.

Please do all translation work through Weblate. We will not accept pull requests directly on github to update PO files.


## Making a new branch in git
1. Make a new branch to work on it in git.
   For example:
   `git checkout -b fr-translation-init`

## Adding a new language to Hugo

1. In the files `config.yaml` and `config-pdf.yaml`, locate the `languages:` line.
2. Add the language you wish to translate. For example, the English looks like this:
   ```
     en-us:
       title: darktable 3.4 user manual
       weight: 1
   ```

3. Save the files.

## Generating a PO file

Do the following steps if you want to update the POT and PO files from the markdown source.

1. Create an empty PO file for your language in the `po` folder with the file name `content.<language>.po`.
   For example:
   `touch po/content.fr-fr.po`
2. Run the script to populate the PO file:
   `cd tools/ && ./generate-translations.sh --no-translations`

## Generating translated files

Do the following steps to generate the website files from a translation.

1. Generate the translated files:
   `cd tools/ && ./generate-translations.sh --no-update`.
2. Check the translation by starting hugo's internal server:
   `hugo server`
3. Open a web browser and check the changes. The URL is in the output of the `hugo server` command.
4. Remove the translated files, as we never check them into git:
   `cd tools/ && ./generate-translations.sh --rm-translations`.

## Translating website, epub, and PDF strings

There are two themes for the darktable documentation: one for the HTML website and one for the PDF. You'll need to translate the strings for both.

1. Go to `themes/hugo-darktable-docs-themes/i18n`.
2. Copy content of the file `en.yaml` and name the new file `<your language>.yaml`.
3. Translate the content of the new yaml file.
4. Check the translated PO file into git, push it to github, and open a pull request to have your changes accepted.
5. Repeat the last four steps for the other themes, `themes/hugo-darktable-docs-epub-theme` and `themes/hugo-darktable-docs-pdf-theme`.

## Integrating new translations from Weblate

The following assumes that you're git working directory is clean, that you have API access to the Weblate instance, that you've configured the Weblate git repo as a remote in your local `dtdocs` git repo, and that `wlc`, the Weblate command line client, is configured.

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
11. Commit the `POT` and`PO` files: `git commit -m "Updated POT and PO files."`
12. Create a Pull Request in Github.
13. After the Pull Request is accepted, reset the Weblate repo to match the `dtdocs` repo: `wlc reset darktable/dtdocs`
