# darktable Documentation

This is the user documentation for [Ansel](https://ansel.photos). The content is authored in markdown and rendered to HTML using [Hugo](https://gohugo.io).

This repository tracks the current Ansel development version and can be found at [ansel.photos](https://ansel.photos/en/doc/).

## Obtaining and Building

### Cloning

```bash
git clone https://github.com/aurelienpierreeng/ansel-doc
```
### Hugo

This site is built with the static site generator Hugo v0.98.0

```bash
$ ./hugo version
```

The theme is imported from the main Ansel website. To force-update it:
```bash
$ hugo mod get -u ./...
```

### Updating

If you have the repo cloned but need to update things, it helps to make sure everything is up to date (since we are also using a submodule for the base theme).

```bash
$ git pull
$ hugo mod get -u ./...
```

### Building

You can build the HTML website locally, the production site to deploy to hosting, or the PDF.

## Local Website

Building the site to test locally can be done from the root of the repo.

```
$ hugo server -D
```

The site should then be available at http://localhost:1313/ (you can see the URL in the output of the `hugo server` command).

## Production Website

Run the `hugo` command:

```
$ hugo
```

The static files are now available to deploy to a webhost in the `public` directory. This is currently performed automatically when new changes are pushed to the master branch, via github Actions.
