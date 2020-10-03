---
title: crop & rotate
id: crop-rotate
applicable-verison: 3.2.1
tags: 
working-color-space:  
view: darkroom
masking: 
---

Crop, rotate, and correct perspective distortions using on-screen guides.

Whenever the user interface of this module is in focus, the full uncropped image will be shown, overlaid with crop handles and optional guiding lines.

Resize the crop by dragging the border and corner handles. Move the crop rectangle by holding down the left mouse button and dragging. Constrain movement to the horizontal/vertical axis by holding `Ctrl`/`Shift`, respectively while dragging. Commit changes by either giving focus to another module or double-clicking on the image.

---

**Note:** Some of the tools in this module (angle adjustment and perspective distortion correction) require the original image data to be interpolated. For best sharpness results set “lanczos3” as the pixel interpolator in [`preferences` -> `processing`](../../preferences-settings/processing.md).

---

# module controls

flip
: Flip the image on the horizontal, vertical or both axes.

angle
: Correct the rotation angle to level an image by setting a numerical value or using the mouse. To use the mouse, `right-click` and drag to draw a line along a suitable horizontal or vertical feature. As soon as you release the mouse button the image is rotated so that the line you drew matches the horizontal or vertical axis.

keystone
: Correct perspective distortions. This tool is useful, for example, when you shoot a high building from the ground with a short focal length, aiming upwards with your camera. The combobox allows you to select the type of correction you want to use:
: _vertical_: Limit the correction to vertical lines
: _horizontal_: Limit the correction to horizontal lines
: _free_: Correct horizontal and vertical lines at the same time

: Depending on the selected correction type you will see two or four straight adjustment lines overlaid on your image. Two red circles on every line allow you to modify the line positions with your mouse. Each line additionally carries a “symmetry” button. If activated (and highlighted in red) all movements of the affected line will be mirrored by the opposite line.

: In order to correct perspective distortions, you need to find suitable horizontal and/or vertical features in your image and align the adjustment lines with them. When finished, press the “OK” button, located close to the center of your image. The image will be corrected immediately. You can at any time come back and refine your corrections by selecting “correction applied” in the keystone combobox.

automatic cropping
: Automatically crop the image to avoid black edges on the image borders. This is useful when rotating the image.

aspect
: Set the aspect ratio of the crop, constraining the width:height ratio of the crop rectangle to the chosen aspect. Many common numerical ratios are pre-defined. A few special aspect ratios deserve explanation:
: _freehand_: Crop without any ratio restrictions. 
: _original image_: The aspect ratio of the original image
: _golden cut_: The golden ratio (1.62:1)

: You can also select any other ratio after opening the combobox and typing it in the form of “x:y”. If you want to add an aspect ratio to the pre-defined list you can do this by including a line of the form `plugins/darkroom/clipping/extra_aspect_ratios/foo=x:y` in darktable's configuration file `$HOME/.config/darktable/darktablerc`. Here “foo” defines the name of the new aspect ratio and “x” and “y” the corresponding numerical values.

: Finally, the button beside the aspect combobox allows you to switch between portrait and landscape orientation if you have selected a rectangular aspect ratio.

---

**Note:** While in freehand mode you may retain the current aspect ratio by holding `Shift` while dragging on any of the resize controls.

---

guides
: Overlay standard compositional guide lines on the image while cropping. 

guides flip
: If the chosen guidelines are not symmetrical relative to the image frame, you can flip them on the horizontal, vertical or both axes.

