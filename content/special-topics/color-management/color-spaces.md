---
title: darktable's color spaces
id: color-spaces
weight: 50
draft: false
author: "people"
---

darktable's input images are either RGB files (like JPEGs or TIFFs) or camera raws. Both store visual information as a combination of primary colours like red, green and blue which, together, describe a light emission to be later recreated by a display.

The following image illustrates this concept.

![Spectral decomposition of a light emission into 3 RGB intensities](./color-spaces/spectral-decomposition.png)

On the left-hand-side of the image is a colored light that we need to represent digitally. Using three color filters, we can decompose it into three colored primary lights at different intensities. This is how both the retina and the camera sensor filters work. To recreate the original colored light from our decomposition, in the center of the image, we simply need to recombine those 3 primary lights by addition.

Digital images store the intensities of these 3 primary lights for each pixel, depicted on the right as shades of grey. To illustrate this concept, you could also use a combination of white lights having these intensities along with appropriately colored filters to reconstruct the original colored light. This experiment can be performed at home using gels and dimmeable white bulbs - it is roughly what old color CRT displays did. Today, LED screens emit colored light directly, but they are dimmed in the same spirit.

The need for color spaces arises because, unlike the simple example presented above, the color-filters that split the incoming light on the left often don't have the same color as the ones used to recreate that light from digital intensities on the right. This means that these intensities need to be rescaled to take into account the change of primaries in order to retain the original color after reconstruction. The method for the scaling is described in color profiles, usually stored in .icc files.

It is important to note that color is not a physical property of light -- it exists only in the human brain, as a product of the decomposition of a light emission by the cone cells in the retina, again very similar in principle to the above filtering example. An "RGB" value should be understood as "light emissions encoded on 3 channels connected to 3 primaries", but the primaries themselves may look different from what humans would call "green", "red" or "blue".

Most of darktable's actual image processing takes place in a large RGB "working profile" space, with some (mostly older) modules internally working in the CIELab 1976 color space (often just called “Lab”). The final output of the image processing pipeline is once again in an RGB space shaped for either monitor display or the output file.

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
