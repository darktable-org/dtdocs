---
title: composite
id: composite
weight: 10
applicable-version: 4.8
---

Create a composite image by overlaying an already-processed image on top of the current image.

Drag and drop a processed image from the filmstrip onto the "drop image from filmstrip here" box to overlay the chosen image, and then alter the various placement and adjustment attributes of the image being overlaid.

The overlay image is first processed using its own history stack, except that modules in the current image's history stack which occur after `composite` in the pixelpipe are skipped to avoid double application.  Since _composite_ occurs fairly early by default, usually much of the overlay image's stack will be skipped; if you want to have very different processing for the overlay and the current image, you should move _composite_ later in the pixelpipe by dragging it upward.  Note that doing so will slow down processing, since modules will be applied separately to each image rather than once to the combined result.

You may also wish to move the module later in processing if the overlay contains smooth gradients and your base image's processing includes substantial changes in brightness or saturation, as you may experience banding in the overlay.  This is a result of the current implementation rendering the overlay to eight bits per channel before combining it with the base image.

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
