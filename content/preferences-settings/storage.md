---
title: storage
id: storage
weight: 100
draft: false
---

The following options are related to darktable's library database and [XMP sidecar files](../overview/sidecar-files/_index.md).

# database

allow for multiple workspaces
: allows for multiple workspaces that can be selected via a popup window at startup. It is possible to create a new workspace or to work from memory (no database). A workspace is a combination of a library database and a darktablerc using the same shared configuration folder settings (data database and shortcuts). (default off)

create database snapshot
: Specifies how often darktable should create database snapshots. Options are "never", "once a month", "once a week", "once a day" and "on close" (default "once a week")

how many snapshots to keep
: Number of snapshots to keep after creating a new snapshot, not counting database backups taken when moving between darktable versions. Enter "-1" to store an unlimited number of snapshots. (default 10)

# XMP sidecar files

create XMP files
: XMP sidecar files provide a redundant method of saving the changes that you have made to an image, in addition to the changes saved to darktable's database. This option allows you to choose when files will _first be written_. Once written, they will subsequently be updated each time you edit or add a tag to the image. Choose from:

: - _never_: Don't write sidecar files. This can be useful if you are running multiple version of darktable for development/testing purposes but is not normally recommended,
: - _on import_: A sidecar file will be written as soon as you add an image to darktable's library,
: - _after edit_: A sidecar will not be written until the first time you edit or add a tag to an image.

: It's strongly recommended that you choose either "on import" or "after edit". Sidecar files provide a useful fail-safe to prevent data loss if your database becomes corrupted. Backing up your raw file plus the accompanying sidecar file will allow you to fully restore your work at a later date by re-importing your edit history back into darktable (default "on import").

store XMP tags in compressed format
: Entries in XMP tags can get rather large and may exceed the available space to store the history stack in some output files on export. This option allows binary XMP tags to be compressed in order to save space. Available options are “never”, “always”, and “only large entries” (default).

auto-save interval
: This preference sets the interval (in seconds) after which the processing history for an image will be automatically saved (while in the darkroom view). Set to zero to disable auto-saving. Note that this option might be ignored for slow drives (default 10s).

look for updated XMP files on startup
: Scan all XMP files on startup and check if any have been updated in the meantime by some other software. If updated XMP files are found, a menu is opened for the user to choose which of the XMP files to reload (replacing darktable's database entries by the XMP file contents) and which of the XMP to overwrite from darktable's database. Activating this option also causes darktable to check for text sidecar files that have been added after import time (default off). 
