---
title: highlight reconstruction
id: highlight-reconstruction
applicable-verison: 3.2.1
tags: 
working-color-space: not-applicable (RAW)
view: darkroom
masking: true
---

Attempt to reconstruct color information for pixels that are clipped in one or more RGB channel. 

If these pixels are left partially clipped it can result in unrealistic colors appearing in the image. For example pixels with both green and blue channels clipped will appear to be red without any highlight reconstruction.

Three methods of reconstruction are available:

clip highlights
: Clamp all pixels to the white level (i.e. clip the remaining color channels). This method is most useful in cases where clipped highlights occur in naturally desaturated objects (e.g. clouds).

reconstruct in LCh
: Analyse each pixel with at least one clipped channel and attempt to correct the clipped pixel (in LCh color space) using the values of the other (3 for Bayer or 8 for X-Trans) pixels in the affected sensor block. The reconstructed highlights will still be monochrome, but brighter and with more detail than with “clip highlights”. This method works fairly well with a high-contrast base curve, which renders highlights desaturated. As with _clip highlights_ this method is a good option for naturally desaturated objects.

reconstruct color
: Use an algorithm that transfers color information from unclipped surroundings into the clipped highlights. This method works very well on areas with homogeneous colors and is especially useful on skin tones with smoothly fading highlights. Please note that this method can produce maze-like artifacts on highlights behind high-contrast edges, for example well-exposed fine structures in front of an overexposed background.

---

For highlight reconstruction to be effective you need to also apply a negative EV correction in the [exposure](./exposure.md) module

---

When using the highlight reconstruction included with the [filmic rgb](./filmic-rgb.md) module it may be useful to disable this module so that filmic has more information to work with.

---

# module controls

method
: Choose the method for highlight reconstruction (see above)

clipping threshold
: Manually adjust the clipping threshold against magenta highlights. You shouldn't need to adjust this.
