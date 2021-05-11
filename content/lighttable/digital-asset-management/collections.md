---
title: collections & film rolls
id: collections
draft: false
weight: 20
author: "people"
---

A collection is a set of images matching a given selection criteria. 

The most basic kind of collection is a film roll, which contains all of the images that have been imported from a specific folder on disk. Whenever you [import](../../module-reference/utility-modules/lighttable/import.md) images from the filesystem, those images are organized in a film roll whose name is derived from that of their parent folder. Re-importing a folder adds any new images to the existing film roll; images already present in the film roll are not reimported (though the contents of their XMP sidecar files are reloaded into the library database).

You can easily construct other kinds of collection based on various image attributes (Exif data, filename, tags etc.) in the [collections](../../module-reference/utility-modules/shared/collections.md) module. Multiple criteria can be logically combined to narrow or extend your collection.

darktable retains a list of the most recently used collections for quick access. These can be selected from the [recent collections](../../module-reference/utility-modules/shared/recent-collections.md)) module.
