# darktable Documentation

This respository maintains the user documentation for [darktable](https://darktable.org). The content is authored in markdown and rendered to HTML using [Hugo](https://gohugo.io) as well as to PDF and ePub. 

The docs currently only track the development version. Maintenance of versioned docs has been suspended since darktables version 5.2. 

The documentation is primarily hosted at [docs.darktable.org](https://docs.darktable.org/usermanual/development/en/). The current auto-built website for the development user manual can be found at https://darktable-org.github.io/dtdocs/.


## Contributing

Please see https://darktable-org.github.io/dtdocs/en/contributing for information about contributing content and how dtdocs are maintained. 

For a list of the outstanding work please see the [issues](https://github.com/darktable-org/dtdocs/issues) in this repository and a list of [undocumented pull requests](https://github.com/darktable-org/darktable/pulls?q=is%3Apr+is%3Aclosed+label%3A%22documentation:%20pending%22) in the darktable repository.

**Translations** are maintained through [Weblate](https://hosted.weblate.org/projects/darktable-documentation/). 

<a href="https://hosted.weblate.org/engage/darktable-documentation/"><img src="https://hosted.weblate.org/widget/darktable-documentation/svg-badge.svg" alt="Translation status"></a>

## Obtaining and Building

### Cloning

From a terminal:

    git clone https://github.com/darktable-org/dtdocs.git

### Hugo

This site is built with the static site generator [Hugo](https://github.com/gohugoio/hugo) (*extended*).

You can use a prebuilt binary of the latest *extended* version for your system. A detailed guide for installation of the prebuilt binaries is given in the [Hugo installation documentation](https://gohugo.io/installation/).

#### Generating stylesheets

If cloning the repo fresh, remember to build the bootstrap assets locally:

```
cd ./themes/hugo-darktable-docs-theme/assets/
yarn install
cd ../../hugo-darktable-docs-pdf-theme/assets/
yarn install
```

Instead of yarn install you can use `npm install`.

### Updating

If you have the repo cloned but need to update things, it helps to make sure everything is up to date (since we are also using a submodule for the base theme).

As normal, from the project root directory, update things like normal:
```
git pull
```

And finally make sure the stylesheets are up to date by rebuilding them (see above).

### Building

You can build the HTML website locally, the production site to deploy to hosting, or the PDF.

## Local Website for development

Building the site to test locally can be done from the root of the repo.

```
hugo server -D --disableFastRender
```

The site should then be available at http://localhost:1313/usermanual/development/ (you can see the URL in the output of the `hugo server` command).

## Production Website

Run the `hugo` command to generate the html output files. 

```
hugo
```

The static files are now available to deploy to a webhost in the `public` directory. This is currently performed automatically when new changes are pushed to the master branch, via GitHub actions. See also [development & deployment](https://docs.darktable.org/usermanual/development/en/contributing/development-deployment/) within the docs.

## PDF

Ensure you have the [`weasyprint`](https://weasyprint.org) application installed; this will transform the generated HTML to PDF.

```
mkdir -p public
hugo server --disableFastRender --config config-pdf.yaml
weasyprint http://localhost:1313/dtdocs/index.html public/darktable_user_manual.pdf
pkill hugo
```

The PDF is available in the `public` directory.

## EPUB


