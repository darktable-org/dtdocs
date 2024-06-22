---
title: Combine multiple images
id: combine-images.md
weight: 20
draft: false
author: "people"
---

To combine multiple images, such as creating a mosaic or inserting
additional content into an image (such as [replacing the
sky](sky-replacement.md):

- ensure that all images you want to combine have been
  [imported](../module-reference/utility-modules/lighttable/import.md)
  into your library

- use [_canvas enlargement_](../module-reference/processing-modules/enlarge-canvas.md)
  on one image (the "base" image) to add more space for the other images, if needed

- use the
  [_composite_](../module-reference/processing-modules/composite.md)
  module and drag the second image from the filmstrip into the module.
  Adjust the position, size, and rotation as desired.  Use a mask to
  include only part of the overlaid image.

- if you want to combine more than two images, create additional
  instances of the _composite_ module, one per image