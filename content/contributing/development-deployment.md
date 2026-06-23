---
title: development and deployment
id: development-and-deployment
weight: 2
---

darktable's documentation is maintained in the [dtdocs repository](https://github.com/darktable-org/dtdocs). Changes are introduced through pull requests (see [workflow](workflow.md)). Translations are maintained through weblate; see [translations](translating.md). 
 
## GitHub Pages deployment (for development)
 
For development purposes, the docs are deployed to GitHub Pages on every push: A GitHub Action runs `tools/build-all.sh`, which generates HTML, EPUB and PDF outputs using Hugo. These are committed to the repository's [gh-pages](https://github.com/darktable-org/dtdocs/tree/gh-pages) branch and served via GitHub Pages at https://darktable-org.github.io/dtdocs/. Generation of translated pages is disabled in this setup.
 
## Official deployment to darktable.org
 
The official home of the docs is the pixls.us server infrastructure at https://docs.darktable.org/usermanual/development/. There, the repository is pulled regularly and the documentation is built with Hugo, including translations as well as EPUB and PDF outputs. The Build Log can be found [here](https://docs.darktable.org/buildlog.txt).

## Versioning of the docs 
Up to 4.6 versioned copies of the docs were maintained (e.g. [../usermanual/4.6/](https://docs.darktable.org/usermanual/4.6/)). From there on only one version documenting the current development version is maintained ([../usermanual/development/](https://docs.darktable.org/usermanual/development/)). Links to the released versions following 4.6 are linked to the development version (e.g. [../usermanual/5.4/](https://docs.darktable.org/usermanual/5.4/) links to [../usermanual/development/](https://docs.darktable.org/usermanual/development/)).  
