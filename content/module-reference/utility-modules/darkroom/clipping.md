---
title: clipping warning
id: clipping
applicable-verison: 3.4
tags: 
view: darkroom
---

When performing developing steps on raw image and converting it to the final output color space, the _R_, _G_ or _B_ channels of some of the pixels may end up being driven to values that are outside the allowed range, and those illegal values will need to be clipped so that they fall within the allowed range of minimum and maximum values. The clipping warning feature deals with out-of-range values that occur as a result of the processing, and is not to be confused with the [raw overexposed warning](raw-overexposed-warning.md) which indicates pixels that could not be captured properly by the camera due to limitations in the dynamic range of the sensor.

There are two main reasons why we can end up with illegal _RGB_ values as a result of our image processing: 

- _luminance_ clipping, which results from parts of the image being overexposed
- _gamut_ clipping, where the processing has produced a color that cannot be represented in the final color space (which can often occur with strongly saturated colors).

The _clipping warning_ indicator provides a number of different modes to help us diagnose why we have out-of-range _RGB_ values requiring clipping. We can make some informed decisions on how to adjust the preceding processing steps to effectively mitigate the effects of this.

![clipping-menu](./clipping/clipping-menu.png)

The [gamut check](gamut-check.md) indicator also provides information about clipping arising from our processing, based on the external littleCMS library, and is more or less equivalent to the _full gamut_ mode in the clipping warning. The downsides ofthe gamut check indicator are that it doesn't allow you to distinguish between clipping caused my luminance or gamut mapping, and it is much slower than the clipping warning indicator because it uses the external littleCMS library and doesn't support OpenCL GPU acceleration.

# module controls

clipping preview mode
: This allows you to set which type of clipping you want the indicator to highlight, and can be one of the following modes.

- _any RGB channel_ mode, which provides an indication if any one of the three _RGB_ channels is out of range. This was the default mode in darktable versions prior to 3.4.
- _luminance only_ mode, which shows the clipping over luminance, which means tone mapping or exposure settings have been ill-set
- _saturation only_ mode, which shows the over-saturated colors, imposible to represent in the target color space, which means gamut mapping or saturation settings have been ill-set,
- _full gamut_ mode, that shows the combination of the 3 previous options. This is the default mode from darktable 3.4 onwards, and it give the most complete picture where there are problem areas.

color scheme
: By default, the indicator marks with _red_ pixels where the upper threshold is exceeded, or marks with _blue_ areas where the lower threshold is exceeded. This color scheme can be changed to _black & white_ or _purple & green_ for "over & under" indicators, which may be useful to improve visibility if the indicators for some images.

lower threshold
: Expressed in EV relative to the white point (which is nominally EV = 0). For your reference:

- _8-bit sRGB_ clips blacks at -12.69 EV
- _8-bit Adobe RGB_ clips blacks at -19.79 EV
- _16-bit sRGB_ clips blacks at -20.69 EV
- _fine-art matte prints_ typically produce black at -5.30 EV
- _color glossy prints_ typically produce black at -8.00 EV
- _black-and-white glossy prints_ typically produce black at -9.00 EV

upper threshold
: Expressed as a percentage of how close a pixel should be to the upper limit before being flagged by the clipping warning. Defaults to 98%.

