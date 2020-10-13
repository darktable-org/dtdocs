# Darktable Documentation

This is the user documentation for [darktable](https://darktable.org). The content is authored in markdown and rendered to HTML using [Hugo](https://gohugo.io) and to PDF and ePub using the [DITA Open Toolkit](https://dita-ot.org).

The auto-built version of the website can be found at https://elstoc.github.io/dtdocs/.

## Styles and Conventions

### Markdown Files

- Files should be encoded in UTF-8
- Do not use any column wrapping
- Use YAML for the topic metadata, see the `architypes` folder for examples

### Authoring Content

- All content is authored in *plain*  markdown; no shortcodes and HTML should be kept to an absolute minimum , if at all
- Minimalism is an absolute must. Less words are preferred
- Markdown files should be as short as possible
- Images are used only when necessary
- Follow the naming and capitalization norms present in the GUI of the application
- Headers in a file are not to exceed level three
- The primary authoring language is English
- Assume the reader has the application open while reading the user manual
- You will be copy edited, don't take it personally
- Changes to the content should be proposed via pull request or a similar mechanism
- Use image callouts if you need to annotate an image, do not add words into the image for annotations, this makes localization difficult

### Link conventions

Internal links should be relative to the current file and must point to a markdown file or an image.

See the following examples for the conventions used in the manual

- Links to a processing module should be in italics: ``[_some processing module_](../../module-reference/processing-modules/some-processing-module.md)``
- Links to a utility module should be in plaintext ``[some utility module](../../module-reference/utility-modules/darkroom/some-utility-module.md)``
- Link to a top level section by referencing the _index.md file: ``[module reference](../../module-reference/_index.md)``
- Link to a tab in the preferences dialog:  ``[`preferences` -> `general`](../../preferences-settings/general.md)``
- Link to a specific preference setting:  ``[`preferences` -> `general` -> `interface language`](../../preferences-settings/general.md)``
- Link to an image:  ``![image-name](./filmic-rgb/image-name.png)`` (images are placed in a subdirectory named after the `.md` file, but without the `.md` extension.
- Link to an icon image:  ``![image-name-icon](./filmic-rgb/image-name-icon.png)`` (the "-icon" after the name puts the icon image in-line within the text)

## Obtaining and Building

### Cloning

The theme for the site uses https://gitlab.com/patdavid/hugo-bootstrap-bare as a git submodule.
In order to clone this submodule along with the site you just need to add the flag `--recurse-submodules` to the clone command:

    git clone --recurse-submodules https://github.com/elstoc/dtdocs.git

If you already have the site cloned, but haven't included the submodule before:

    git submodule update --init --recursive


### Hugo

This site is built with the static site generator Hugo (*extended*).
Currently v0.73 extended:
```
$ ./hugo version
Hugo Static Site Generator v0.73.0/extended windows/amd64 BuildDate: unknown
```

#### SASS

If cloning the repo fresh, remember to build the bootstrap assets locally:

```
$ cd ./themes/hugo-bootstrap-bare/assets/
$ yarn install (or alternatively `npm install`).
```

### Updating

If you have the repo cloned but need to update things, it helps to make sure everything is up to date (since we are also using a submodule for the base theme).

As normal, from the project root directory, update things like normal:
```
git pull
```

Double check that the submodule is being updated as well:
```
git submodule update --init --recursive
```

And finally make sure the assets are built:
```
cd themes/hugo-bootstrap-bare/assets/
yarn install (or alternatively `npm install`).
```
This should get things up and running.


### Building

You can build the HTML website locally, the production site to deploy to hosting, or the PDF.

## Local Website

Building the site to test locally can be done from the root of the repo.

```
$ hugo server -D --disableFastRender
```

The site should then be available at http://localhost:1313/dtdocs/

## Production Website

Run the `hugo` command:

```
hugo
```

The static files are now available to deploy to a webhost in the `public` directory.

## PDF

Ensure you have the [`weasyprint`](https://weasyprint.org) application installed; this will transform the generated HTML to PDF.

```
mkdir -p public
hugo server --disableFastRender --config config-pdf.yaml
weasyprint http://localhost:1313/dtdocs/index.html public/darktable_user_manual.pdf
pkill hugo
```

The PDF is available in the `public` directory.
