---
title: storage
id: storage
weight: 100
draft: false
---

The following options are related to Ansel's library database and [XMP sidecar files](../overview/sidecar-files/_index.md).

# database

create database snapshot
: Specifies how often Ansel should create database snapshots. Options are "never", "once a month", "once a week", "once a day" and "on close" (default "once a week")

how many snapshots to keep
: Number of snapshots to keep after creating a new snapshot, not counting database backups taken when moving between Ansel versions. Enter "-1" to store an unlimited number of snapshots. (default 10)

# xmp

write sidecar file for each image
: XMP files provide a redundant method of saving the changes that you have made to an image, in addition to the changes saved to Ansel's database. This option allows you to choose when to write these files. Choose from:

: - _never_: Don't write XMP files. This can be useful if you are running multiple version of Ansel for development/testing purposes but is not normally recommended
: - _on import_: An XMP file will be written as soon as you add an image to Ansel's library and will be subsequently updated each time you edit it
: - _after edit_: An XMP file will be written the first time you perform an edit on an image and will be updated on each subsequent edit. Importing will not generate an XMP file by default.

: It's strongly recommended that you choose either "on import" or "after edit". XMP files provide a useful fail-safe so that you don't lose data if your database becomes corrupted. Backing up your raw file plus the accompanying XMP file will allow you to fully restore your work at a later date by re-importing your edit history back into Ansel (default "on import").

store xmp tags in compressed format
: Entries in XMP tags can get rather large and may exceed the available space to store the history stack in some output files on export. This option allows binary XMP tags to be compressed in order to save space. Available options are “never”, “always”, and “only large entries” (default).

look for updated xmp files on startup
: Scan all XMP files on startup and check if any have been updated in the meantime by some other software. If updated XMP files are found, a menu is opened for the user to choose which of the XMP files to reload (replacing Ansel's database entries by the XMP file contents) and which of the XMP to overwrite from Ansel's database. Activating this option also causes Ansel to check for text sidecar files that have been added after import time (default off).
