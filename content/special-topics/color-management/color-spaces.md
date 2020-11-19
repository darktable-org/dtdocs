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

On the left-hand-side of the image is a colored light that we need to represent digitally. Using three ideal color filters, we can decompose it into three colored primary lights at different intensities. To recreate the original colored light from our ideal decomposition, in the center of the image, we simply need to recombine those 3 primary lights by addition.

The decomposition process is performed in camera sensors, by the color filter array (CFA), and
is not ideal, so we cannot recreate the original emission directly by a simple addition:
we will need intermediate scalings of the 3 intensities.
On screens, the LED bulbs are dimmed proportionnaly to each intensity, and
the three lights emissions are physically added to recompose the original emission.
In-between, digital images store the intensities of these 3 primary lights as numbers for each pixel, depicted on the right as shades of grey.

Instead of LED light bulbs, you could use a combination of white lights powered proportionaly to these intensities, projecting through appropriately colored filters, to reconstruct the original colored light on a white screen. This experiment can be performed at home using gels and dimmeable white bulbs - it is roughly what old color CRT displays did, and what video-projectors still do.

While a set of display intensities can be simply turned into light together to recreate an original light on a screen, for example if we created a synthetic image in-computer,
a the set of captured intensities from a sensor needs some scaling in order for the
light addition to reproduce the original light emission.
It means that every set of intensities, expressed as an RGB set, is linked to a set of filters
(or primary LED colors) that defines a color space: any RGB set is circumstancially tied to a
colorspace.
Not only do we need to temper the captured intensities to make them summable again,
but if we are to recompose the original light on a display that does not have the same
filters or primaries as the space in which our set belongs, these intensities
will need to be rescaled to take into account the change of filters. The method for the scaling is described in color profiles, usually stored in .icc files.

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
