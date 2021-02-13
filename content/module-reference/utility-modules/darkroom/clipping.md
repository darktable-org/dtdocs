---
title: clipping warning
id: clipping
applicable-version: 3.4
tags: 
view: darkroom
---

When an image is sent to a display device, each pixel is normally represented as a set of 3 numbers, representing the intensity of the red, green and blue primary colors in the output color space. Because the output color space is usually closely related to hardware with physical limations, there is a maximum permitted value for the [R,G,B] channels, representing the maximum available intensity for that color space. Similarly, there is also a minimum value below which pixel values will be mapped to zero. When we try to convert from a larger color space to the final output color space, any values exceeding this maximum will be clamped to the maximum value, and any values below the minimum will be clamped to zero. This process is called "clipping" and it will lead to lost detail, or "incorrect" colors for any pixels with clipped channels.

There are two ways in which a pixel might become clipped when represented in the output color space.

- _luminance_ clipping can occur when a pixel is too bright to be represented in the output color space. The pixel luminance is calculated as a weighted average of the [R,G,B] channels. If this average exceeds the maximum allowed value, it is an indication of over-exposure. The overall luminance of a pixel can also be too dark to be represented by an [R,G,B] value in the output color space, in which case it will simply be shown as black. We normally deal with luminance clipping by carefully adjusting tone mappings and exposure levels.

- _gamut_ clipping. The output color space defines a set of primary colors that, mixed together in certain ratios, produce the final output color. However, there are only so many colors that can be produced by mixing together a combination of those three primary colors. Highly saturated colors in particular can be difficult to represent, especially for pixels that are very bright or very dark. If there is no set of positive [R,G,B] values that can represent a given color at a given level of brightness, we say the color is "out of gamut", and we'll need to settle for another color instead that _can_ be represented by permitted [R,G,B] values within the color space. We can handle gamut clipping by being careful not to over-saturate colors in the highlights and shadows, and possibly by using some color grading/color mapping techniques.

The "clipping warning" module is used to highlight those pixels that cannot be accurately represented in the output color space, either due to luminance or gamut clipping. Prior to darktable 3.4, the clipping highlighted any pixels that exceeded the maximum allowed value on any of the [R,G,B] channels, or that had been completely crushed to black. From darktable 3.4 onwards, the clipping warning indicator has some additional modes to help you to differentiate between luminance and gamut clipping, so that you can make better decisions about how to address any issues.

As the clipping warning runs at the end of the preview pixelpipe, it receives data in display color space then converts it to histogram color space. If you are using a display color space which is not "well behaved" (this is common for a device profile), then colors which are outside of the gamut of the display profile will clip or distort.

![clipping-menu](./clipping/clipping-menu.png#w33)

The clipping warning module, described here, deals with clipping caused by image processing and the limitations of the output color space. It should not be confused with the following similar tools:

- The [raw overexposed warning](./raw-overexposed.md) indicates where pixels in the original raw file are clipped due to physical limitations in the dynamic range of the camera sensor. This module highlights information that was permanently lost at the point of image capture, and you need to deal with it as best you can using highlight recovery techniques.

- The [gamut check](./gamut.md) module also provides information about clipping arising from image processing. It is based on the external littleCMS library, and is more or less equivalent to the _full gamut_ mode in the clipping warning module. The downsides of the gamut check module are that it doesn't allow you to distinguish between clipping caused by luminance and gamut mapping, and it is much slower than the clipping warning indicator.

# module controls

clipping preview mode
: This allows you to choose which type of clipping you want the indicator to highlight, and can be one of the following:

: - _any RGB channel_: Provides an over-clipping indication if any one of the three [R,G,G] channels exceeds the maximum permitted value for the histogram color space, or an under-clipping indication if the three [R,G,B] channels are too dark and are all forced to black. This was the default mode prior to darktable version 3.4.
: - _luminance only_: Indicates any pixels that are clipped because their luminance falls outside of the range set in the "upper threshold" and "lower threshold" sliders. If this happens, it generally means that tone mapping or exposure settings have been poorly set
: - _saturation only_: Indicates where over-saturated colors have pushed one or more of the [R,G,B] channels towards a value outside the permitted range of the histogram color space, even though the overall luminance of the pixel may lie within acceptable limits. This means this pixel color is imposible to represent in the histogram color space, and can arise from poorly set gamut mapping or saturation settings,
: - _full gamut_: Shows the combination of the 3 previous options. This is the default mode from darktable 3.4 onwards, and it gives the most complete indication of potentially problematic pixels.

color scheme
: By default, the indicator marks pixels with _red_ where the upper threshold is exceeded (over-clipping) and with _blue_ where the lower threshold is breached (under-clipping). This color scheme can be changed to _black & white_ or _purple & green_ for "over & under" indicators, which may be useful to improve visibility for some images.

lower threshold
: Expressed in EV relative to the white point (which is nominally EV = 0). If the [R,G,B] channels all fall below this value, an under-clipping indicator is shown warning that the pixel may be end up being crushed to black. Use the following reference to set this threshold, depending on your intended output medium:

: - _8-bit sRGB_ clips blacks at -12.69 EV
: - _8-bit Adobe RGB_ clips blacks at -19.79 EV
: - _16-bit sRGB_ clips blacks at -20.69 EV
: - _fine-art matte prints_ typically produce black at -5.30 EV
: - _color glossy prints_ typically produce black at -8.00 EV
: - _black-and-white glossy prints_ typically produce black at -9.00 EV

upper threshold
: How close a pixel should be to the upper limit before being flagged by the clipping warning, expressed as a percentage. Defaults to 98%. In the case of gamut checks, this controls how close the saturation of the pixel is allowed to get to the limits of the color space's gamut before a clipping indication is flagged.

