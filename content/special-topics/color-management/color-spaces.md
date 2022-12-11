---
title: Ansel's color spaces
date: 2022-12-04T02:19:02+01:00
id: color-spaces
weight: 50
draft: false
author: "people"
---

Input images are either RGB files (like JPEGs or TIFFs) or camera RAWs. Both store visual information as a combination of primary colors (e.g. red, green and blue) which together describe a light emission to be recreated by a display.

The following image illustrates this concept.

![Spectral decomposition of a light emission into 3 RGB intensities](./color-spaces/spectral-decomposition.png#w100)

The left-hand-side of the image depicts a colored light that we need to represent digitally. We can use three ideal color filters to decompose this light into three colored primary lights at different intensities. In order to recreate the original colored light from our ideal decomposition (as illustrated in the center of the image) we simply need to recombine those three primary lights by addition.

It should be possible to reproduce the original colored light by taking a set of white lights at the correct intensities and projecting those lights through appropriately colored filters. This experiment can be performed at home using gels and dimmable white bulbs. This is roughly what old color CRT displays did and is how video projectors still work.

In photography, the initial decomposition step is performed by the color filter array that sits on top of your camera's sensor. This decomposition is not ideal, so it isn't possible to precisely recreate the original emission with simple addition -- some intermediate scaling is required to adjust the three intensities.

On screens, the LED bulbs are dimmed proportionally to each intensity, and the emissions of the three lights are physically added to reconstruct the original emission. Digital images store the intensities of these primary lights as a set of three numbers for each pixel, depicted on the right-hand side of the above image as shades of gray.

While a set of display intensities can be easily combined to recreate an original light on a screen (for example, if we created a synthetic image in-computer) the set of captured intensities from a sensor needs some scaling in order for the on-screen light addition to reasonably reproduce the original light emission. This means that every set of intensities, expressed as an RGB set, must be linked to a set of filters (or primary LED colors) that define a _color space_ -- any RGB set only makes sense with reference to a color space.

Not only do we need to temper the captured intensities to make them summable again, but if we are to recompose the original light on a display that does not have the same colored filters or primaries as the space in which our RGB set belongs, these intensities need to be rescaled to take into account the differing filters on the display. The mechanism for this scaling is described in _color profiles_, usually stored within `.icc` files.

---

**Note**: Color is not a physical property of light -- it exists only in the human brain, as a product of the decomposition of a light emission by the cone cells in the retina, again very similar in principle to the above filtering example. An "RGB" value should be understood as "light emissions encoded on 3 channels connected to 3 primaries", but the primaries themselves may look different from what humans would call "red", "green" or "blue".

---

The filters described here are overlapping band-pass filters. Since they overlap, summing them back together would not preserve the energy of the original spectrum so (long story short) we need to dial them down with regard to the retina cone response

Most of Ansel's actual image processing takes place in a large RGB "working profile" space, with some (mostly older) modules internally working in the CIELab 1976 color space (often just called “Lab”). The final output of the image processing pipeline is once again in an RGB space shaped for either the monitor display or the output file.

This process implies that the pixelpipe has two fixed color conversion steps: [_input color profile_](../../modules/processing-modules/input-color-profile.md) and [_output color profile_](../../modules/processing-modules/output-color-profile.md). In addition there is the [_demosaic_](../../modules/processing-modules/demosaic.md) step for raw images, where the colors of each pixel are reconstructed by interpolation.

Each module has a position in the pixelpipe that tells you which color space the module lives in:

- up to [_demosaic_](../../modules/processing-modules/demosaic.md)
: The raw image information does not yet constitute an "image" but merely "data" about the light captured by the camera. Each pixel carries a single intensity for one primary color, and camera primaries are very different from primaries used in models of human vision. Bear in mind that some of the modules in this part of the pipe can also act on non-raw input images in RGB format (with full information on all three color channels).

- between [_demosaic_](../../modules/processing-modules/demosaic.md) and [_input color profile_](../../modules/processing-modules/input-color-profile.md)
: Image is in RGB format within the color space of the specific camera or input file.

- between [_input color profile_](../../modules/processing-modules/input-color-profile.md) and [_output color profile_](../../modules/processing-modules/output-color-profile.md)
: Image is in the color space defined by the selected working profile (linear Rec2020 RGB by default). As Ansel processes images in 4x32-bit floating point buffers, we can handle large working color spaces without risking banding or tonal breaks.

- after [_output color profile_](../../modules/processing-modules/output-color-profile.md)
: Image is in RGB format as defined by the selected display or output ICC profile.
