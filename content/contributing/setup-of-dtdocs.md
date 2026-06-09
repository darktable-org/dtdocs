---
title: setup of the docs
id: setup-of-dtdocs
weight: 2
---

Darktables docs are maintained through their [github repository]https://github.com/darktable-org/dtdocs). A github action is set up to run `tools/build-all.sh` which will will generate html, epub and pdf outputs using hugo. Those are saved to the repositories branch [gh-pages](https://github.com/darktable-org/dtdocs/tree/gh-pages) and deployed through github pages to https://darktable-org.github.io/dtdocs/.

On pixls infrastructure the repository is pulled regularily and the pages deployed through hugo to https://docs.darktable.org/usermanual/development/en/.
