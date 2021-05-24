---
title: crop
id: crop
applicable-version: 3.6
tags: 
working-color-space:  
view: darkroom
masking: 
---

Crop an image using on-screen guides. 

This module appears later in the pipeline than the [_crop & rotate_](./crop-rotate.md) module, meaning that the full image can remain available for source spots in the [_retouch_](./retouch.md) module. For best results, you are advised to use the _crop & rotate_ module to perform rotation and keystone correction (if required), and then perform final creative cropping with this module.

Whenever this module is in focus, the full uncropped image will be shown, overlaid with crop handles and optional guiding lines.

![screen controls](./crop/screen-controls.png#w75)

Resize the crop by dragging the border and corner handles.

Move the crop rectangle by clicking and dragging inside the crop area. Constrain movement to the horizontal/vertical axis by holding Ctrl/Shift, respectively while dragging. Commit changes by either giving focus to another module or by double-clicking on the image.

# module controls

The _crop_ module controls are split into two sections as follows:

## crop settings

aspect
: Set the aspect ratio of the crop, constraining the width:height ratio of the crop rectangle to the chosen aspect. Many common numerical ratios are pre-defined. A few special aspect ratios deserve explanation:
: - _freehand_: Crop without any restrictions 
: - _original image_: Retain the aspect ratio of the original image
: - _square_: Constrains the aspect ratio to be 1:1
: - _golden cut_: The golden ratio (1.62:1)

: You can also enter any other ratio after opening the combobox by typing it in the form of “x:y” or as a decimal (e.g. "0.5" to apply a ratio of 2:1). 

: If you want to add an aspect ratio to the pre-defined drop-down list you can do this by including a line of the form "`plugins/darkroom/clipping/extra_aspect_ratios/foo=x:y`" in darktable's configuration file `$HOME/.config/darktable/darktablerc`. Here “`foo`” defines the name of the new aspect ratio and “`x`” and “`y`” the corresponding numerical values (`x` and `y` must be integers).

: Finally, the button beside the aspect combobox allows you to switch between portrait and landscape orientation if you have selected a rectangular aspect ratio.

---

**Note:** When resizing an image in freehand mode you may retain the currently-set aspect ratio by holding Shift while dragging on any of the resize controls.

---

guides
: Overlay standard compositional guide lines on the image while cropping. When selecting "golden mean", some additional options become available in an "extra" drop-down. When selecting "grid", you can choose the number of lines and subdivisions.

guides flip
: If the chosen guidelines are not symmetrical relative to the image frame, you can flip them on the horizontal, vertical or both axes.

## margins

These sliders allow you to directly set how much of the image to crop from each side. They are automatically updated if you move or resize the crop area on the image using the mouse.

As this section is rarely used, it is collapsed by default.

left
: The percentance of the image that should be cropped from the left side.

right
: The percentance of the image that should be cropped from the right side.

top
: The percentance of the image that should be cropped from the the top.

bottom
: The percentance of the image that should be cropped from the bottom.

