---
title: Preferences - storage tab
date: 2020-09-09
draft: false
---

The following options are related to the database and xmp files.

### database

check for database maintenance
: Indicates when darktable should check for database fragmentation and perform maintenance. Options are "never", "on startup", "on close" and "on both". Each of these is also available with an additional "(don't ask)" option to perform the checks automatically without prompting (default "on close".

database fragmentation ratio threshold
: Fragmentation ratio (in per cent) above which database maintenance should be performed (subject to the selection made in the option above) (default 25).

### xmp

write sidecar file for each image
: XMP files provide a redundant method of saving the changes you have made to an image, independently of darktable's database. XMP files can later be re-imported into a different database, preserving your changes to the image. It's strongly recommended to have this option activated so you don't lose data in case of a database corruption. Backing up your raw file plus the accompanying XMP file will allow you to fully restore your work (default on).

store xmp tags in compressed format
: Entries in XMP tags can get rather large and may exceed the available space to store the history stack in output files on export. This option allows binary XMP tags to be compressed in order to save space. Available options are “never”, “always”, and “only large entries” (default).

look for updated xmp files on startup
: Check file modification times of all XMP files on startup to find out if any have been updated in the meantime by some other software. If updated XMP files are found a menu opens for the user to decide which of the XMP files to be reloaded (replacing darktable's database entries by the XMP file contents) and which of the XMP files to be overwritten by darktable's database. Activating this option also causes darktable to check for text sidecar files that have been added after import time – see option “overlay txt sidecar over zoomed images” in the _preferences_ dialog, _lighttable_ tab (default off). 