---
title: zoomable lighttable
id: zoomable-lighttable
draft: false
weight: 20
author: "people"
---

The _zoomable lighttable_ mode provides an alternative way to navigate large collections of images, but with some similarities to the filemanager mode (described below).

# controls

zoom
: Scroll with the mouse wheel to zoom in and out of the lighttable (compared to Ctrl+scroll in [filemanager](./filemanager.md) mode).
: Zooming the thumbnails does not change the number of thumbnails per row, so the lighttable can exceed the visible area on all sides.

navigate
: Hold down the left mouse button and drag to move the lighttable around and navigate through your collection.

select
: As with the filemanager mode, you can select the image under the pointer by clicking on its thumbnail or by pressing Enter. To select a range of images, click on the first image and then Shift+click on the last one. To add or remove images in a selection, Ctrl+click on a thumbnail or hover over a thumbnail and press Spacebar.

hover
: Hovering over a thumbnail highlights and impicitly selects it for keyboard shortcuts as in filemanager mode. However, dragging pans the entire thumbnail display, so you cannot change images' [custom sort](../../module-reference/utility-modules/shared/collection-filters.md#custom-sort) order in this mode.

---

**Hint:** you may find that image thumbnails are slow to load when zooming quickly through a large collection. One way to speed up the navigation is to generate a cache containing all the thumbnails using the [`darktable-generate-cache`](../../special-topics/program-invocation/darktable-generate-cache.md) command.

---
