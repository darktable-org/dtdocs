---
title: security
date: 2022-12-04T02:19:02+01:00
id: security
weight: 80
draft: false
---

Control whether warning messages are shown before undertaking certain activities.

## general

ask before removing images from the library
: Always ask before removing image information from Ansel's library database, where the xmp file is retained (default on).

ask before deleting images from disk
: Always ask before deleting an image file (default on).

ask before discarding history stack
: Always ask before discarding the history stack of an image (default on).

try to use trash when deleting images
: Instead of physically deleting images from disk, attempt to put them into the system's trash bin (default on).

ask before moving images from film roll folder
: Always ask before moving an image file (default on).

ask before copying images to new film roll folder
: Always ask before copying an image file to a new location (default on).

ask before removing empty folders
: Always ask before removing any empty folder. This can happen after moving or deleting images (default off).

ask before deleting a tag
: Always ask before deleting a tag from an image (default on).

ask before deleting a style
: Always ask before deleting a style (default on).

ask before deleting a preset
: Always ask before deleting a preset (default on).

ask before exporting in overwrite mode
: Always ask before [exporting](../module-reference/utility-modules/shared/export.md) images in overwrite mode.

## other

password storage backend to use
: The backend to use for password storage. Options: “auto” (default), “none”, “libsecret”, “kwallet”.

executable for playing audio files
: Define an external program which is used in the lighttable view to play audio files that some cameras record to keep notes for images (default “aplay”).
