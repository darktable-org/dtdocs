---
title: defringe (deprecated)
id: defringe
applicable-version: 3.6
tags: 
working-color-space: Lab 
view: darkroom
masking: true
---

---

**Please note that this module is deprecated in darktable 3.6 and should no longer be used for new edits. Please use the [_chromatic aberrations_](./chromatic-aberrations.md) module instead.**

---

Remove color fringing, which often results from Longitudinal Chromatic Aberrations (LCA), also known as Axial Chromatic Aberrations.

This module uses edge-detection. Where pixels are detected as a fringe, the color is rebuilt from less saturated neighboring pixels.

# module controls

operation mode
: _global average_: This mode is is usually the fastest but might show slightly incorrect previews at high magnification. It might also protect the wrong regions of color too much or too little by comparison with local average.

: _local average_: This mode is slower because it computes local color references for every pixel. However it might protect color better than global average and allows for rebuilding color where actually required. 

: _static threshold_: This mode does not use a color reference but directly uses the threshold as given by the user.

edge detection radius
: The algorithm uses the difference between the input image and a gaussian-blurred version of the same image to detect edges. This parameter controls the spatial extent of the gaussian blur used in the edge detection. Try increasing this value if you want a stronger detection of the fringes or the thickness of the fringe edges is too high.

threshold
: The threshold over which the edge of a pixel is counted as a “fringe”. Try lowering this value if there is not enough fringe detected and increasing it if too many pixels are desaturated.
