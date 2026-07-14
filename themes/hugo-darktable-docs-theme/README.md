# hugo-darktable-docs-theme

A bootstrap v4 theme for darktable's documentation.

This theme was designed to run using only `hugo` and `yarn`. Javascript and SCSS are compiled using hugo's pipeline feature.

## Fetching assests

To fetch the assests:

```
cd assets
yarn install
```

## Site Search

`lunr.js` in the bundle to provide search functionality. In the `/content` folder you need to add a search page:

```
---
title: 'Search'
layout: 'search'
menu: 'main'
---
```

The important bit is `layout: 'search'`, which calls the search template.
