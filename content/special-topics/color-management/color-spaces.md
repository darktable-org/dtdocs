---
title: darktable's color spaces
id: color-spaces
weight: 50
draft: false
author: "people"
---

darktable's input images are either RGB files (like JPEGs or TIFFs) or camera raws. Both store visual information as a combination of primary colours like red, green and blue which, together, describe a light emission to be later recreated by a display.

![Spectral decomposition of a light emission into 3 RGB intensities](./color-spaces/spectral-decomposition.png)

The above illustration shows how any light emission can be decomposed with color filters and later recomposed. The colored light, on the left, gets filtered by 3 colors filters that will split it into 3 primary colored lights at different intensities. This is what a camera sensor does. Recombining those 3 primary lights by a simple addition, in the center, recreates the original colored light.

In practice, digital images store the 3 intensities of the 3 primary lights, depicted on the right in shades of grey. Using these intensities, on the right, to dim a white light going through colored filters will also reconstruct the original colored light, when adding them together. This experiment can be redone at home using gels and dimmeable white bulbs. It is roughly what old color CRT did, now LED screens emit colored light directly, but they are dimmed in the same spirit.

The need for color spaces arises because, unlike the simple example presented above, the color-filters splitting the incoming light on the left don't have the same color as the ones used to recreate it from ditigal intensities on the right. It means that intensities need to be rescaled to take into account the change of primaries to retain the original color after the reconstruction. The method for the scaling is described in color profiles, usually stored in .icc files.

It is important to mention that colour only exists in the human brain, as a product of the decomposition of a light emission by the cone cells in the retina, again very similar in principle to the above filtering example. "RGB" is to be taken as "light emissions encoded on 3 channels connected to 3 primaries", but the primaries themselves may look different from what humans would call "green", "red" or "blue".

Most of the actual image processing takes place in a large RGB "working profile" space, with some (mostly older) modules internally working in the CIELab 1976 color space (often just called “Lab”). The final output of the image processing pipeline is once again in an RGB space shaped for either monitor display or the output file.

This process implies that the pixelpipe has two fixed color conversion steps: [_input color profile_](../../module-reference/processing-modules/input-color-profile.md) and [_output color profile_](../../module-reference/processing-modules/output-color-profile.md). In addition there is the [_demosaic_](../../module-reference/processing-modules/demosaic.md) step for raw images, where the colors of each pixel are reconstructed by interpolation.

Each module has a position in the pixelpipe which tells you which color space the module lives in:

* up to [_demosaic_](../../module-reference/processing-modules/demosaic.md)
: The raw image information does not yet constitute an "image" but merely "data" about the light captured by the camera. Each pixel carries a single intensity for one single primary color, and camera primaries are very different from human primaries. Bear in mind that some of the modules in this part of the pipe can also act on non-raw input images in RGB format with full information on all three color channels.

* between [_demosaic_](../../module-reference/processing-modules/demosaic.md) and [_input color profile_](../../module-reference/processing-modules/input-color-profile.md)
: Image is in RGB format within the color space of the specific camera or input file.

* between [_input color profile_](../../module-reference/processing-modules/input-color-profile.md) and [_output color profile_](../../module-reference/processing-modules/output-color-profile.md)
: Image is in the space defined by the selected working profile (linear Rec2020 RGB by default). As darktable processes images in 4x32-bit floating point buffers, we can handle large working color spaces without risking banding or tonal breaks.


* after [_output color profile_](../../module-reference/processing-modules/output-color-profile.md)
: Image is in RGB format as defined by the selected display or output ICC profile.
