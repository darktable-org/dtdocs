---
title: development and deployment
id: development-and-deployment
weight: 2
---

darktable's documentation is maintained in the [dtdocs repository](https://github.com/darktable-org/dtdocs). Changes are introduced through pull requests (see [workflow](workflow.md)). Translations are maintained through weblate; see [translations](translating.md). 
 
## GitHub Pages deployment (for development)
 
For development purposes, the docs are deployed to GitHub Pages on every push: A GitHub Action runs `tools/build-all.sh`, which generates HTML, EPUB and PDF outputs using Hugo. These are committed to the repository's [gh-pages](https://github.com/darktable-org/dtdocs/tree/gh-pages) branch and served via GitHub Pages at https://darktable-org.github.io/dtdocs/. Generation of translated pages is disabled in this setup.
 
## Official deployment to darktable.org
 
The official home of the docs is the pixls.us server infrastructure at https://docs.darktable.org/usermanual/development/en/. There, the repository is pulled regularly and the documentation is built with Hugo, including translations as well as EPUB and PDF outputs.
