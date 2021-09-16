---
title: export
id: export
draft: false
weight: 40
author: "people"
---

darktable is a non-destructive editor, which means that all changes are recorded in the library database (with a backup stored in an XMP sidecar file), and the original Raw file is left untouched. You therefore need to [export](LINK) images in order to bake your edits into an output file that can be distributed outside of darktable.

The export module offers many options, but by far the most common use is to “save a developed raw image as a JPEG”. You can either export the currently-edited image directly from the darkroom view or select one or more images from the lighttable view and export them all at once. 

Choose which images you want to export (if you are in the lighttable view), open the export module, set _target storage_ to "file on disk" and select a location to save your images -- by default, they will be exported to a "darktable" directory within the directory that contains your Raw file(s). Choose a "file format" of JPEG and keep the default settings. 

Finally, click the "export" button to save your processed images in the selected location.
