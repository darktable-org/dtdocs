---
title: framing
id: framing
applicable-version: 3.8
tags: 
working-color-space: RGB 
view: darkroom
masking: true
---

Generate a frame around the image. 

The frame consists of a border (with a user-defined color) and a frame line within that border (with a second user-defined color). Various options are available to control the geometry and color of the frame.

# module controls

border size
: The size of the frame as a percentage of the underlying full image.

aspect
: The aspect ratio of the final module output (i.e. the underlying image plus the frame)

orientation
: The orientation of the frame (portrait/landscape). Select 'auto' for darktable to choose the most reasonable orientation based on the underlying image.

horizontal/vertical position
: Select from a set of pre-defined ratios to control where the underlying image will be positioned on the horizontal/vertical axis. You can also right click and enter your own ratio as "x/y".

frame line size
: The percentage of the frame line size, relative to the border size at its smallest part.

frame line offset
: The position of the frame line, relative to the underlying image. Choose 0% for a frame line that touches the image. Choose 100% for a frame line that touches the outer border.

border color / frame line color
: A pair of color selectors which allow the border and frame line colors to be defined. Clicking on the colored field will open a color selector dialog which offers a choice of commonly-used colors, or allows you to define a color in RGB color space. You can also activate a color picker to take a color probe from the image.

show guides
: Tick the box to show guide overlays whenever the module is activated. Click the icon on the right to control the properties of the guides. See [guides & overlays](../utility-modules/darkroom/guides-overlays.md) for details.

