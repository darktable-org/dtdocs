# darktable Documentation

This is the user documentation for [darktable](https://darktable.org). The content is authored in markdown and rendered to HTML using [Hugo](https://gohugo.io) as well as to PDF and ePub.

This repository tracks the current darktable development version. The auto-built website for the development user manual can be found at https://darktable-org.github.io/dtdocs/.

The user manual for the current stable release of darktable can be found at [darktable.org](https://docs.darktable.org/usermanual/stable/en/).

## Contributing

Please see https://darktable-org.github.io/dtdocs/en/special-topics/contributing/ for information about contributing content

## Obtaining and Building

### Cloning

The themes for the site and PDF use [hugo-darktable-docs-theme](https://github.com/pixlsus/hugo-darktable-docs-theme.git) and [hugo-darktable-docs-pdf-theme](https://github.com/pixlsus/hugo-darktable-docs-pdf-theme.git) as git submodules.
In order to clone these submodules along with the site you just need to add the flag `--recurse-submodules` to the clone command:

    git clone --recurse-submodules https://github.com/darktable-org/dtdocs.git

If you already have the site cloned, but haven't included the submodules before:

    git submodule update --init --recursive


### Hugo

This site is built with the static site generator Hugo (*extended*).
Currently v0.75.1 extended:
```
$ ./hugo version
Hugo Static Site Generator v0.73.0/extended windows/amd64 BuildDate: unknown
```

#### SASS

If cloning the repo fresh, remember to build the bootstrap assets locally:

```
$ cd ./themes/hugo-darktable-docs-theme/assets/
$ yarn install (or alternatively `npm install`)
$ cd ../../hugo-darktable-docs-pdf-theme/assets/
$ yarn install
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
cd themes/hugo-darktable-docs-theme/assets/
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

The static files are now available to deploy to a webhost in the `public` directory. This is currently performed automatically when new changes are pushed to the master branch, via github Actions.

## PDF

Ensure you have the [`weasyprint`](https://weasyprint.org) application installed; this will transform the generated HTML to PDF.

```
mkdir -p public
hugo server --disableFastRender --config config-pdf.yaml
weasyprint http://localhost:1313/dtdocs/index.html public/darktable_user_manual.pdf
pkill hugo
```

The PDF is available in the `public` directory.
