---
title: setup of the docs
id: setup-of-dtdocs
weight: 2
---

darktable's docs are maintained through their [GitHub repository](https://github.com/darktable-org/dtdocs). A GitHub action is set up to run `tools/build-all.sh` which will generate html, epub and pdf outputs using Hugo. Those are saved to the repository's branch [gh-pages](https://github.com/darktable-org/dtdocs/tree/gh-pages) and deployed through GitHub pages to https://darktable-org.github.io/dtdocs/.

On the pixls infrastructure, the repository is pulled regularly, and the documentation is deployed using Hugo to https://docs.darktable.org/usermanual/development/en/.
