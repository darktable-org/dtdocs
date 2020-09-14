# Darktable Documentation

This is the user documentation for [darktable](https://darktable.org). The content is authored in markdown and rendered to HTML using [Hugo](https://gohugo.io) and to PDF and ePub using the [DITA Open Toolkit](https://dita-ot.org).

## Authoring content

All content is authored in markdown. Files should be encoded in UTF-8. Please do not do any column wrapping. We use YAML for the topic metadata, see the `architypes` folder for examples.

## Cloning

The theme for the site uses https://gitlab.com/patdavid/hugo-bootstrap-bare as a git submodule.
In order to clone this submodule along with the site you just need to add the flag `--recurse-submodules` to the clone command:

    git clone --recurse-submodules https://github.com/elstoc/dtdocs.git

If you already have the site cloned, but haven't included the submodule before:

    git submodule update --init --recursive


## Hugo

This site is built with the static site generator Hugo (extended).
Currently v0.73 extended:
```
$ ./hugo.exe version
Hugo Static Site Generator v0.73.0/extended windows/amd64 BuildDate: unknown
```

### SASS

If cloning the repo fresh, remember to build the bootstrap assets locally:

```
$ cd ./themes/hugo-bootstrap-bare/assets/
$ yarn install (or alternatively `npm install`).
```

## Updating

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


## Build

Building the site to test locally can be done from the root of the repo:

```
$ hugo server -D --disableFastRender
```

The site should then be available at http://localhost:1313/dtdocs/
