---
title: crop
date: 2022-12-04T02:19:02+01:00
id: crop
applicable-version: 3.8
tags:
working-color-space:
view: darkroom
masking:
---

Crop an image using on-screen guides.

This module appears later in the pipeline than the deprecated [_crop and rotate_](./crop-rotate.md) module, meaning that the full image can remain available for source spots in the [_retouch_](./retouch.md) module. For best results, you are advised to use the [_rotate and perspective_](./rotate-perspective.md) module to perform rotation and perspective correction (if required), and then perform final creative cropping with this module.

Whenever this module is in focus, the full uncropped image will be shown, overlaid with crop handles and optional guiding lines.

![screen controls](./crop/screen-controls.png#w75)

Resize the crop by dragging the border and corner handles.

Move the crop rectangle by clicking and dragging inside the crop area. Constrain movement to the horizontal/vertical axis by holding Ctrl/Shift, respectively while dragging. Commit changes by giving focus to another module.

## module controls

The _crop_ module controls are split into two sections as follows:

### crop settings

aspect
: Set the aspect ratio of the crop, constraining the width:height ratio of the crop rectangle to the chosen aspect. Many common numerical ratios are pre-defined. A few special aspect ratios deserve explanation:
: - _freehand_: Crop without any restrictions
: - _original image_: Retain the aspect ratio of the original image
: - _square_: Constrains the aspect ratio to be 1:1
: - _golden cut_: The golden ratio (1.62:1)

: You can also enter any other ratio after opening the combobox by typing it in the form of “x:y” or as a decimal (e.g. "0.5" to apply a ratio of 2:1).

: The button beside the aspect combobox allows you to switch between portrait and landscape orientation if you have selected a rectangular aspect ratio.

: If you want to add an aspect ratio to the pre-defined drop-down list you can do this by including a line of the form "`plugins/darkroom/clipping/extra_aspect_ratios/foo=x:y`" in Ansel's configuration file `$HOME/.config/Ansel/Anselrc`. Here “`foo`” defines the name of the new aspect ratio and “`x`” and “`y`” the corresponding numerical values (`x` and `y` must be integers). Note that you can only add new entries for ratios not already present in the drop-down list.

---

**Note:** When resizing an image in freehand mode you may retain the currently-set aspect ratio by holding Shift while dragging on any of the resize controls.

---

### margins

These sliders allow you to directly set how much of the image to crop from each side. They are automatically updated if you move or resize the crop area on the image using the mouse.

As this section is rarely used, it is collapsed by default.

left
: The percentage of the image that should be cropped from the left side.

right
: The percentage of the image that should be cropped from the right side.

top
: The percentage of the image that should be cropped from the top.

bottom
: The percentage of the image that should be cropped from the bottom.

### guides

Tick the box to show guide overlays whenever the module is activated. Click the icon on the right to control the properties of the guides. See [guides & overlays](../utility-modules/darkroom/guides-overlays.md) for details.
