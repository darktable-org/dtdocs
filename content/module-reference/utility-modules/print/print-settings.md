---
title: print settings
id: print-settings
applicable-version: 3.8
tags:
view: print
---

Manage settings for the [print view](../../../print/_index.md) and initiate printing.

## module controls

### printer

printer
: Select one of the installed printers.

media
: The type of media loaded on the printer (Plain Paper, Luster Photo Paper, etc.).

profile
: The printer's ICC profile for the loaded paper. This is the profile specific to the printer and paper. This profile is the last color space transformation applied to the picture whose goal is to create a high quality print.

intent
: The print rendering intent (“perceptual”, “relative colorimetric”, “saturation” or “absolute colorimetric”). See [rendering intent](../../../special-topics/color-management/rendering-intent.md) for more details.

black point compensation
: Whether to adjust the black point of the output profile, which is often lighter than the input profile. This should be “on” when the _intent_ is set to “relative colorimetric”.

### page

paper size
: The size of the paper on which to print.

orientation
: Portrait or landscape (note that darktable chooses the best fit by default).

units
: The unit to use for setting the margins: “mm”, “cm”, or “inch”.

margins
: Set each margin separately, or all together by clicking on the middle “lock” button.

display grid
: Select the grid size using the entry field (expressed in the currently selected unit). Tick the option to display the grid on the canvas.

snap to grid
: Help setting the image areas by snapping them to the grid for proper alignment.

borderless mode required
: Indicates whether the printer borderless mode is to be activated. This item is activated when the user's margins are smaller than the printer hardware margins. Note that it is only an indicator as it does not activate the borderless mode automatically.

### image layout

image width/height
: This information field displays the actual image width and height (given with the selected units) on the paper.

scale factor
: This information field displays the scaling of the image to fit on the paper. If this value is less than 1 the image is down-scaled, otherwise it is up-scaled. This is an important factor to watch -- a value that is too large (up-scale) may result in a low quality print. The corresponding dpi (dots per inch) is also displayed.

alignment
: Select the alignment of the image on its area.

new image area button
: Create a new image area. Drag and drop on the canvas to place it. If the option snap to grid is activated the area can be easily aligned to the grid lines. An image can be placed into this area by dragging it from the filmstrip and dropping it on the new area.

delete image area button
: Remove the currently selected image area from the composition.

clear layout button
: Remove all the image areas leaving the canvas empty.

The following four fields represent the position of currently selected area on the page -- the top/left corner on the first line and the width/height of the area on the second line.

When hovering an image area its position and size are displayed. It is also possible to grab the side and corner of the area to change the size or to drag the whole area to change its position.

The page layout can be recorded using a preset.

### print settings

profile
: The export profile to use. This profile is the entry point used for the next transformation using the printer's ICC profile. Usually it is better to prefer a large gamut (e.g. Adobe RGB) rather than a smaller one (e.g. sRGB).

intent
: The rendering intent to use when exporting the image. For more information see [rendering intent](../../../special-topics/color-management/rendering-intent.md).

style
: Choose a style to apply when exporting the image -- defaults to “none”. See the [export](../shared/export.md) module for a more detailed discussion of applying a style during export.

mode
: Whether the chosen style should be appended to the existing history stack or replace it completely. See the [export](../shared/export.md) module for more details.

### print button

When clicked, the images are first exported using the selected options, then composed on the page and finally sent to the printer.
