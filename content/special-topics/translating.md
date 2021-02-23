---
title: translating dtdocs
id: translating
weight: 100
draft: false
author: "people"
---

Translation of the darktable documentation is done via our [Weblate instance](https://weblate.pixls.us/projects/darktable/).

You can either use Weblate's web UI to translate the documentation or download the translation to your computer, edit it, and then upload the changes.


# Making a new branch in git
1. Make a new branch to work on it git.
   For example:
   `git checkout -b fr-translation-init`

# Adding your language to Hugo

1. In the files `config.yaml` and `config-pdf.yaml`, locate the `languages:` line.
2. Add the language you wish to translate. For example, the English looks like this:
   ```
     en-us:
       title: darktable 3.4 user manual
       weight: 1
   ```

3. Save the files.

# Generating a PO file

1. Create an empty PO file for your language in the `po` folder with the file name `content.<language>.po`.
   For example:
   `touch po/content.fr-fr.po`
2. Run the script to populate the PO file:
   `cd tools/ && ./generate-translations.sh --no-translations`

# Generating translated files.

1. Generate the translated files:
   `cd tools/ && ./generate-translations.sh --no-update`.
2. Check the translation by starting hugo's internal server:
   `hugo server`
3. Open a web browser and check the changes. The URL is in the output of the `hugo server` command.
4. Remove the translated files, as we never check them into git:
   `cd tools/ && ./generate-translations.sh --rm-translations`.

# Translating website and PDF strings

There are two themes for the darktable documentation: one for the HTML website and one for the PDF. You'll need to translate the strings for both.

1. Go to `themes/hugo-darktable-docs-themes/i18n`.
2. Copy content of the file `en.yaml` and name the new file `<your language>.yaml`.
3. Translate the content of the new yaml file.
4. Check the translated PO file into git, push it to github, and open a pull request to have your changes accepted.
5. Repeat the last four steps for the other theme, `themes/hugo-darktable-docs-pdf-theme`.
