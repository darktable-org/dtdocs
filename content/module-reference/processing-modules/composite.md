---
title: composite
id: composite
weight: 10
applicable-version: 4.8
---

Create a composite image by overlaying an already-processed image on top of the current image.

Drag and drop a processed image from the filmstrip onto the "drop image from filmstrip here" box to overlay the chosen image, and then alter the various placement and adjustment attributes of the image being overlaid.

Please note the following points:

-   This module does not include the entire pixelpipe of the overlaid image -- only that part of the pixelpipe up to the composite module. If you wish to include any modules after that point, you should move the composite module within the overlaid image first and complete your edit before dropping it onto your target image.
-   Because the darktable will now be processes two images, this could significantly degrade performance, so try to avoid too many large edits on both images.
-   The overlaid image is imported with only eight bits per pixel rather than the full floating point values normally used within darktable's internal pipeline. This means that any major changes made after the composite module might introduce banding. In such cases you are advised to do as much processing as possible before the composite module in the pixelpipe. Move the composite module as needed to achieve this.

# module controls

drop image from filmstrip here
: The image to overlay onto the currently edited image (dragged from the filmstrip).

opacity
: The percentage of transparency applied to the overlaid image.

rotation
: The amount to turn the overlaid image. Rotation is around the alignment point.

scale
: The amount to shrink the overlaid image.

scale on
: The criteria on which to base the overlaid image scaling.

alignment
: The area on which to align the overlaid image.

x offset
: The amount to move the overlaid image horizontally.

y offset
: The amount to move the overlaid image vertically.
