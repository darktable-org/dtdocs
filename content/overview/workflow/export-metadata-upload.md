---
title: exporting and uploading images with metadata
id: export-metadata-upload
draft: false
weight: 50
author: "people"
---

Changes to an image are not saved as in a regular image editor. Rather, darktable is a non-destructive editor, which means all changes are recorded in a database, and the original image is untouched. Therefore, you need to export images to bake the processing options into an output file that can be distributed outside of darktable.

Images are exported from the lighttable view, using the [_export selected_](../../module-reference/utility-modules/lighttable/export-selected.md) module in the right panel. The _export selected_ module offers a lot of options, but by far the most common use is to "save my developed raw image as a JPEG".

When exporting a set of images in darktable , there are two basic questions you need to answer:

- _To where shall I send the exported images?_ Very often this would be to write the files to a folder on your local disk, but other options include writing them to a LaTeX photo book template or sending them to another program such as _hugin_ (for panarama stitching) or _gimp_ (for further editing).

- _In what format shall I save the exported images?_ This covers not only the image file format (such as JPEG, PNG, TIFF, OpenEXR etc.) but also what sort of quality, how much compression, what resolution, what sort of picture profile settings and which metadata to embed in the exported image.

The most common steps would therefore be:

1.  Select images on the lighttable

2.  Choose the target storage and file format

3.  Set the maximum width and height image restraints. Leave the width and height restraints at zero to export at full resolution.

By default, an image will be saved to local disk as a high-quality JPEG at full resolution. For further information on all the available export options, please refer to the [_export selected_](../../module-reference/utility-modules/lighttable/export-selected.md) module reference section.
