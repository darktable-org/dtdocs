---
title: film rolls
id: film-rolls
draft: false
weight: 10
author: "people"
---

The basic element for organizing images in darktable is called a film roll – a kind of virtual folder. Whenever you [import](../../module-reference/utility-modules/lighttable/import.md) images from the filesystem, the images are organized in a film roll whose name is derived from the name of their parent folder. Re-importing a folder will add any new images to the existing film roll; images already present in the film roll are not reimported (though the contents of their XMP sidecar files are reloaded into the library database).

When the parent folder of imported images is modified or relocated, darktable can no longer access these images, and their respective film rolls will be listed as strikethrough in the collect images module. A right-click on a strikethrough film roll will open a "search filmroll" dialogue box in which the user can update the current location of the respective images.

---

**Note:** Importing images in darktable does not physically copy them to another location: _importing images will not back up your files_.

---
