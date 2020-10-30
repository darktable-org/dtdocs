---
title: darktable's color spaces
id: color-spaces
weight: 50
draft: false
author: "people"
---

darktable's input images are either RGB files (like JPEGs or TIFFs) or camera raws. Both store visual information as a combination of primary colours like red, green and blue which, together, describe a light emission to be later recreated by a display.

It is important to mention that colour only exists in the human brain, as a product of the decomposition of a light emission by the cone cells in the retina. What RGB files do is describing light emissions with a similar method, for technical reasons. However, the definition of each primary colour depends on the properties of each RGB space and might look very different to human eyes from what humans call "red", "green" or "blue".

Notice of warning, RGB is not really a color, but rather a light emission being encoded for computational purposes, that will later be physically created by your display, and interpreted as colour only once it enters your brain through your retina. Calling RGB "colour" is a shortcut.

Most of the actual image processing takes place in a large RGB "working profile" space, with some (mostly older) modules internally working in the CIELab 1976 color space (often just called “Lab”). The final output of the image processing pipeline is once again in an RGB space shaped for either monitor display or the output file.

This process implies that the pixelpipe has two fixed color conversion steps: [_input color profile_](../../module-reference/processing-modules/input-color-profile.md) and [_output color profile_](../../module-reference/processing-modules/output-color-profile.md). In addition there is the [_demosaic_](../../module-reference/processing-modules/demosaic.md) step for raw images, where the colors of each pixel are reconstructed by interpolation.

Each module has a position in the pixelpipe which tells you which color space the module lives in:

up to [_demosaic_](../../module-reference/processing-modules/demosaic.md)
: Image is in raw data format with only latent data. Each pixel carries a single intensity for one single primary color, and camera primaries are very different from human primaries. Bear in mind that some of the modules in this part of the pipe can also act on non-raw input images in RGB format with full information on all three color channels.

between [_demosaic_](../../module-reference/processing-modules/demosaic.md) and [_input color profile_](../../module-reference/processing-modules/input-color-profile.md)
: Image is in RGB format within the color space of the specific camera or input file.

between [_input color profile_](../../module-reference/processing-modules/input-color-profile.md) and [_output color profile_](../../module-reference/processing-modules/output-color-profile.md)
: Image is in the space defined by the selected working profile (linear Rec2020 RGB by default). As darktable processes images in 4x32-bit floating point buffers, we can handle large working color spaces without risking banding or tonal breaks.


after [_output color profile_](../../module-reference/processing-modules/output-color-profile.md)
: Image is in RGB format as defined by the selected display or output ICC profile.
