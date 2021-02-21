---
title: translating dtdocs
id: translating
weight: 100
draft: false
author: "people"
---

To translate the darktable documentation, you can either use the [Weblate instance](https://weblate.pixls.us/) or follow the sections below to translate using the traditional PO workflow.

# Making a new branch in git
1. Make a new branch to work on it git.
   For example:
   `git checkout -b new-translation`

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
3. Translate the PO file with your translation tool of choice.
4. Generate the translated files:
   `cd tools/ && ./generate-translations.sh --no-update`.
5. Check the translation by starting hugo's internal server:
   `hugo server`
6. Open a web browser and check the changes. The URL is in the output of the `hugo server` command.
7. Remove the translated files, as we never check them into git:
   `cd tools/ && ./generate-translations.sh --rm-translations`.
6. Check the translated PO file into git, push it to github, and open a pull request to have your changes accepted.

# Translating website and PDF strings

There are two themes for the darktable documentation: one for the HTML website and one for the PDF. You'll need to translate the strings for both.

1. Go to `themes/hugo-darktable-docs-themes/i18n`.
2. Copy content of the file `en.yaml` and name the new file `<your language>.yaml`.
3. Translate the content of the new yaml file.
4. Check the translated PO file into git, push it to github, and open a pull request to have your changes accepted.
5. Repeat the last four steps for the other theme, `themes/hugo-darktable-docs-pdf-theme`.
