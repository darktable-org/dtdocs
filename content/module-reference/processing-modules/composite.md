---
title: composite
id: composite
weight: 10
applicable-version: 4.8
---

Create a composite image by overlaying an already-processed image on top of the current image.

Drag and drop a processed image from the filmstrip onto the "drop image from filmstrip here" box to overlay the chosen image, and then alter the various placement and adjustment attributes of the image being overlaid.

The full pixel pipe of the overlayed image *before the point at which this module appears in the base image's pixel pipe* is used by the module, so if you want to drastically change the overlaid image beyond the controls of this module, you should first edit that image separately.  If the overlaid image needs *different* processing than the base image for modules coming after *composite*, you should move this module later in the pixel pipe by dragging it upwards in the right-hand panel.  Note that doing so will slow down processing, as modules which were previously applied a single time to the combined image will now be run separately for the base and overlay images.

Due to internal implementation reasons, the overlaid image only uses eight bits per channel, not the full floating-point values normally used internally.  If you are making large changes in color or tonality, this can lead to noticeable banding.  When this happens, move *composite* above the modules where you make those changes.

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
