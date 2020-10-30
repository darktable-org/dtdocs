---
title: unbounded colors
id: unbounded-colors
weight: 60
draft: false
author: "people"
---

Screens and most image file formats can only encode RGB intensities confined within a certain range. For example, images encoded on 8 bits can only contain values from 0 to 255, images on 10 bits from 0 to 1023, and so on… Graphic standards postulate that the maximum of that range, no matter its actual value, will always represent the maximum brightness that the display medium is able to render, usually between 100 and 160 Cd/m² (or nits) depending on the actual standard. We generally call this maximum the "100 % display-referred". The minimum of the range, encoded 0 no matter the bit-depth used, becomes then the "0 % display-referred". 100 % encodes pure white, 0 % encodes pure black.

This is a limitation for image processing applications, because it means any pixel lying outside of that range will be clipped to the nearest bound, resulting in non-recoverable losses of data (colours and/or textures).

For the longest time, image processing software too were bounded to this limitation, for technical reasons, and some still are, but now by design choice. As a result, they would clip RGB intensities at 100 % display-referred between image operations.

darktable uses floating-point arithmetic inside its color pipeline, which means it can handle any RGB value internaly, even out of the display-referred range, as long as it is positive. Only at the very end of the pipeline, before the image is saved to a file or sent to display, will the RGB values be clipped if needed.

Pixels that can take values outside of the display range are said to have “unbounded colors”. One could clamp (i.e. confine) those values to the allowed range at every processing step or choose to carry on with them, and clamp them at the last step in the pipeline. However, it has been found that it is much preferred and less prone to artifacts to not clamp in-between unbounded colors, but treat them just like any other color data.

At the end of the pipeline, modules like [filmic](../../module-reference/processing-modules/filmic-rgb.md) can help you remap RGB values to the display-referred range while maximizing the data preservation and avoiding hard clipping, which is usually not visually pleasing.

However, at any time in the pipeline, you must ensure to not create negative RGB values. Indeed, RGB intensities encode light emissions. Negative light does not exist, and those modules which rely on a physical understanding of light to process pixels will fail if they encounter a non-physical light emission, encoded with negative RGB values. For safety, negative RGB values are still clipped whenever they might make the algorithms fail, but the visual result might look degraded. Negative values can be produced when abusing the *black level* in [exposure](../../module-reference/processing-modules/exposure.md) or the *offset* in [color balance](../../module-reference/processing-modules/color-balance.md).
