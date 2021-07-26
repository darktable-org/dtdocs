---
title: print settings
id: print-settings
applicable-version: 3.2.1
tags: 
view: print
---

Manage settings for the [print view](../../../print/_index.md) and initiate printing.

# module controls

## printer

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

## page

paper size
: The size of the paper on which to print.

orientation
: Portrait or landscape (note that darktable chooses the best fit by default).

units
: The unit to use for setting the margins: “mm”, “cm”, or “inch”.

margins
: Set each margin separately, or all together by clicking on the middle “lock” button.

image width/height
: This information field displays the actual image width and height (given with the selected units) on the paper.

scale factor
: This information field displays the scaling of the image to fit on the paper. If this value is less than 1 the image is down-scaled, otherwise it is up-scaled. This is an important factor to watch -- a value that is too large (up-scale) may result in a low quality print. The corresponding dpi (dots per inch) is also displayed.

alignment
: Select the alignment of the image on the paper.

## print settings

profile
: The export profile to use. This profile is the entry point used for the next transformation using the printer's ICC profile. Usually it is better to prefer a large gamut (e.g. Adobe RGB) rather than a smaller one (e.g. sRGB).

intent
: The rendering intent to use when exporting the image. For more information see [rendering intent](../../../special-topics/color-management/rendering-intent.md).

style
: Choose a style to apply when exporting the image -- defaults to “none”. See the [export](../shared/export.md) module for a more detailed discussion of applying a style during export.

mode
: Whether the chosen style should be appended to the existing history stack or replace it completely. See the [export](../shared/export.md) module for more details.

## print button

When clicked, the image is exported using the selected options and sent to the printer.
