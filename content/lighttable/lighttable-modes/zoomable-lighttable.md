---
title: zoomable lighttable
id: zoomable-lighttable
draft: false
weight: 20
author: "people"
---

The _zoomable lighttable_ mode provides a different way to navigate large collections of images. 

# controls

zoom
: Scroll with the mouse wheel to zoom in and out of the lighttable (compared to Ctrl+scroll in [filemanager](./filemanager.md) mode).
: Zooming the thumbnails does not change the number of thumbnails per row, so the lighttable can exceed the visible area on all sides.

navigate
: Hold down the left mouse button to drag the images around on the lighttable to navigate through your collection.

select
: As with the filemanager mode, you can select the image under the pointer by clicking on its thumbnail or by pressing Enter. A range of images can be selected by clicking on the first image and then Shift+clicking on the last one. Images can be added or removed from a selection by Ctrl+clicking on their thumbnails or by pressing Spacebar.

---

**Hint:** you may find that the images are slow to load when zooming quickly through a large collection. One way to speed up the navigation is to generate a cache containing all the thumbnails using the [`darktable-generate-cache`](../../special-topics/program-invocation/darktable-generate-cache.md) command.

---

