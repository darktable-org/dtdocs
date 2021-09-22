---
title: sidecar files
id: sidecar
weight: 10
draft: false
author: "people"
---

darktable is a non-destructive image editor and opens all images in read-only mode. Any data created within darktable (metadata, tags, and image processing steps) is stored in separate `.XMP` _sidecar_ files. These files are stored alongside the original Raw files and allow darktable to store information about the images as well as the full editing history without touching the original raw files. When you import an image into darktable for the first time, an XMP file is automatically generated. The generation of XMP files can be disabled in [preferences > storage > xmp](../../preferences-settings/storage.md#xmp) but this is not recommended in normal use.

For a given source image, multiple editing versions, called _duplicates_, can co-exist, sharing the same input image data but each having their own metadata, tags and processing steps. Each duplicate of a given image (named `<basename>.<extension`) is represented by a separate XMP sidecar file (with a filename constructed in the form `<basename>_nn.<extension>.xmp`, where `nn` represents the version number of that edit). Information for the initial edit -- the “duplicate” with version number zero -- is stored in the sidecar file named `<basename>.<extension>.xmp`. The version number of each duplicate is displayed in the [image information](../../module-reference/utility-modules/shared/image-information.md) module in each of darktable's views.

Your work is automatically synchronised to the sidecar files without the need to press a “save” button. When backing up your data, make sure that you also retain copies of the XMP files, as these are required to fully reconstruct your work in case of a disaster.

In addition to the sidecar files, darktable keeps all image-related data in its library database for fast access. An image can only be viewed and edited from within darktable if its data has first been loaded into the library database. This happens automatically when you first [import](../../module-reference/utility-modules/lighttable/import.md) an image. If an image is subsequently re-imported, the database will be updated from the contents of its XMP file.

Once an image has been imported into darktable, the database entries take precedence over the XMP file. Subsequent changes to the XMP file by any other software are not visible to darktable -- such changes will be overwritten the next time darktable synchronizes the file. On request, darktable can be configured to search for updated XMP files at startup, offering a choice to update the database or overwrite the XMP file where changes are identified. This configuration can be changed in [preferences > storage > xmp](../../preferences-settings/storage.md#xmp).
