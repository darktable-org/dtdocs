---
title: Configuration files
date: 2023-01-18
draft: false
weight: 50
---

The configuration files of Ansel are located in :

* `$HOME/.config/ansel` for Mac OS and Linux
* `C:\%LOCALAPPDATA%\ansel` on Windows.

## Default configuration files

`anselrc`
: contains all user preferences except presets and styles. This may be opened in any text editor for manual edit if any preference makes the software crash at startup.

`shortcutsrc`
: contains all user-defined keyboard, mouse and MIDI shortcuts.

`data.db`
: contains user presets for modules, styles, tags and locations. This is an SQLite database. It is backed-up before updating to a new release and automatic snapshots can be configured (see below).

`library.db`
: contains all image known to Ansel, along with their directories (dubbed _film rolls_). Like the previous, it is an SQLite database backed-up before updating to new releases and with optional snapshots.

The frequency of snapshots can be defined in the software global _Preferences_ -> tab _Storage_ -> section _Database_ -> entry _Create database snapshots_ and _how many snapshot to keep_. By default, Ansel saves one snapshot every week when closing the software.

## Optional configuration files

`luarc`
: a text file containing enabled Lua modules. Note that Lua doesn't work yet on Ansel v0.0.

`lua` directory
: containing the tree of all available Lua modules. This directory is actually a local Git repository that can updated through `git pull` from the sources. It is added by the automatic Lua installer or can be addde manually.

`user.css`
: a stylesheet containing user-defined CSS tweaks to the default theme,

`watermark` directory,
: to add manually, containing SVG files to be used in the [watermark module](../modules/processing-modules/watermark.md),

`color` directory
: containing an `in` and an `out` sub-directory in which user-defined ICC v2 or v4 profiles can be dropped for later use respectively in the [input color profile](../modules/processing-modules/input-color-profile.md) and [output color profile](../modules/processing-modules/output-color-profile.md) modules. Input profiles will be used to decode images opened in Ansel, output profiles to export images, for softproofing in the darkroom or for display color management.


## XMP sidecars

Ansel allows to [write XMP sidecar files](./overview/sidecar-files/sidecar.md) along the raw images. These files duplicate the content of the local `library.db` in a text file hosted on the same storage as the raw pictures (which may be a server, a NAS or an external hard-drive), while the `library.db` stays locally in the home directory of the current computer user.

Ansel always loads the editing histories from the local `library.db` database first, and can optionally [look for updated XMP files on startup_](../preferences-settings/storage#xmp). If the editing version doesn't match between XMP and database, you will prompted with a conflict resolution window allowing to synchronize from XMP to database or from database to XMP, or to keep the most/least recent version. This can be used to synchronize edits between computers, but needs to be used carefully because the content of XMP is not checked, so all computers need to use the same version of Ansel.

XMP sidecars can also interfere with darktable if you use both. [Learn more](./darktable.md#working-with-ansel-alongside-darktable)
