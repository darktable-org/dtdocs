---
title: export
date: 2022-12-04T02:19:02+01:00
id: export
draft: false
weight: 40
author: "people"
---

Ansel is a non-destructive editor, which means that all changes are recorded in the library database (with a backup stored in an XMP sidecar file), and the original Raw file is left untouched. You therefore need to [export](../../modules/utility-modules/shared/export.md) images in order to bake your edits into an output file that can be distributed outside of Ansel.

1. Choose an export scenario.

   The export module offers many options, but by far the most common use is to “save a developed raw image as a JPEG”. You can either export the currently-edited image directly from the darkroom view or select one or more images from the lighttable view and export them all at once.

2. Select which images to export (if you are in the lighttable view), open the export module, set _target storage_ to "file on disk" and select a location to save your images -- by default, they will be exported to a "Ansel_exported" directory within the directory that contains your Raw file(s). Choose a "file format" of JPEG and keep the default settings.

3. Click the "export" button to save your processed images in the selected location.

_**Note:** While JPEG is useful for most purposes, if you wish to perform further edits in a raster editor like GIMP or Krita, it is normally better to export in TIFF format._
