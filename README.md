# darktable Documentation

This repository maintains the user documentation for [darktable](https://darktable.org). The content is authored in Markdown and rendered to HTML using [Hugo](https://gohugo.io) as well as to PDF and EPUB.

The docs currently only track the development version. Versioned docs were last maintained for version 5.2.

The official release documentation is hosted at [docs.darktable.org](https://docs.darktable.org/usermanual/development/en/). The auto-built development preview is at https://darktable-org.github.io/dtdocs/.

## Contributing

Please see https://darktable-org.github.io/dtdocs/en/contributing for information about contributing content and how dtdocs are maintained. 

For a list of outstanding work please see the [issues](https://github.com/darktable-org/dtdocs/issues) in this repository and a list of [undocumented pull requests](https://github.com/darktable-org/darktable/pulls?q=is%3Apr+is%3Aclosed+label%3A%22documentation:%20pending%22) in the darktable repository.

Translations are maintained through [Weblate](https://hosted.weblate.org/projects/darktable-documentation/). 

<a href="https://hosted.weblate.org/engage/darktable-documentation/"><img src="https://hosted.weblate.org/widget/darktable-documentation/svg-badge.svg" alt="Translation status"></a>

## Obtaining and Building

### Cloning

From a terminal:

    git clone https://github.com/darktable-org/dtdocs.git

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

From the project root:
```
git pull
```

And finally make sure the stylesheets are up to date by rebuilding them (see [Generating stylesheets](#generating-stylesheets)).

## Building

You can build the HTML website locally, the production site to deploy to hosting, or the PDF.

This site is built with the static site generator [Hugo](https://github.com/gohugoio/hugo) (*extended*).

You can use a prebuilt binary of the latest *extended* version for your system. A detailed guide for installation of the prebuilt binaries is given in the [Hugo installation documentation](https://gohugo.io/installation/).

### Local Website for development

Building the site to test locally can be done from the root of the repo.

```
hugo server -D --disableFastRender
```

This builds the pages locally to the `public` directory and makes the site available at http://localhost:1313/usermanual/development/ (you can see the URL in the output of the `hugo server` command).

### Production Website

Run `hugo` to generate the HTML output files.

```
hugo
```

The static files are now available to deploy to a webhost in the `public` directory. For docs.darktable.org this is automated, see *Deployment* below.

### PDF

Ensure you have the [`weasyprint`](https://weasyprint.org) application installed; this will transform the generated HTML to PDF.

To render just one language while editing (English shown here):

```
mkdir -p public
hugo server --disableFastRender --config config-pdf.yaml
```
Since `hugo server` runs in the foreground open another shell session and execute:

```
weasyprint http://localhost:1313/dtdocs/en/index.html public/darktable_user_manual.pdf
```

The PDF is written to the `public` directory. Stop hugo with `pkill hugo` when `weasyprint` is done. 

### EPUB

The EPUB can be built with: 

```
./tools/build-epub.sh
```

This builds an EPUB for every enabled language and writes them to
`public/<lang>/darktable_user_manual.epub`. As with the PDF, a language is only built if its translated content has been generated first (which
`tools/build-all.sh` does for you).

## Deployment

See [development & deployment](https://docs.darktable.org/usermanual/development/en/contributing/development-deployment/) within the docs for more detailed information on how dtdocs is deployed.
