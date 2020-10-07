---
title: rgb levels
id: rgb-levels
applicable-verison: 3.2.1
tags: 
working-color-space: RGB
view: darkroom
masking: true
---

Adjust black, white and mid-gray points in RGB color space. This module is silmilar to the [_levels_](./levels.md) module, which works in Lab color space.

The rgb levels tool shows a histogram of the image, and displays three bars with handles. Drag the handles to modify the black, middle-gray and white points in lightness (in "RGB, linked channels" mode) or independently for each of the R, G and B channels (in "RGB, independent channels" mode).

Moving the black and white bars to match the left and right borders of the histogram will make the output image span the full available tonal range. This will increase the image's contrast. 

Moving the middle bar will modify the middle-gray tones. Shifting it left will make the image look brighter, shifting it right will make it darker. This is often referred to as changing the image's "gamma".

Three color pickers are available for sampling the black, white and gray points from the image. 

---

**Note:** Under certain conditions, especially with highly saturated blue light sources, the _levels_ module may produce black pixel artifacts. See the "gamut clipping" option of the [_input color profile_](./input-color-profile.md) module for information about how to mitigate this issue.

---

# module controls

mode
: The mode of operation. "RGB, linked channels" (default) provides a single levels tool which updates all channels, taking into account the selected color preservation method (see "preserve colors" below). "RGB, independent channels" provides separate levels controls for each of the R, G and B channels.

auto
: Auto-adjust the black and white point and put the gray point exactly in the mean between them. Use the color picker to auto-adjust based on a selected region of the image.

preserve colors
: Choose a color preservation method when using "RGB, linked channels" mode (default "luminance").
