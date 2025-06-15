---
title: collections & film rolls
id: collections
draft: false
weight: 20
author: "people"
---

A collection is a set of images matching a given selection criterion. 

The most basic kind of collection is a film roll, which contains all of the images that have been imported from a specific folder on disk. Whenever you [import](../../module-reference/utility-modules/lighttable/import.md) images from the filesystem, those images are organized in a film roll whose name is derived from that of their parent folder. 

You can easily construct other kinds of collection based on one of many image attributes (Exif data, filename, tags, etc.) in the [collections](../../module-reference/utility-modules/shared/collections.md) module.[^1] The [collection filters](../../module-reference/utility-modules/shared/collection-filters.md) module sets selection and exclusion criteria for many attributes to refine the focus of darktable's display, processing, and export of a collection.

darktable retains a list of the most recently used collections for quick access. These can be accessed from the [recent collections](../../module-reference/utility-modules/shared/recent-collections.md) module.

[^1]: While collections are based on a single attribute, the attribute's selection criterion may be multi-valued (_i.e._, range, wild-card expression, or non-leaf hierarchy node).
