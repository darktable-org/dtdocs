---
title: unbounded colors
id: unbounded-colors
weight: 60
draft: false
author: "people"
---

Theoretically the individual components of color data are confined to certain minimum and maximum levels. As an example the intensity of an individual red, green or blue color channel in RGB can be anything in the range between 0% and 100% (or between 0.0 and 1.0). Likewise the L channel in Lab can be anything between 0 (pure black) and 100 (pure white).

In practice the image processing steps in darktable's modules can sometimes lead to values which lie outside of these confined ranges. In fact even the well established color matrices, which convert from camera RGB to Lab, may sometimes produce pixels with negative L values.

Pixels with these kind of values are said to have “unbounded colors”. One could clamp (i.e. confine) those values to the allowed range at every processing step. However, it has been found that it is much preferred and less prone to artifacts to not clamp in-between unbounded colors, but treat them just like any other color data.

In darktable there is no technical requirement for clamping. Due to the fact that darktable uses floating point arithmetics for all processing steps, unbounded values can be passed along like any other value until the final color conversion module makes sure that they are transferred into the most reasonable color within the selected output color space. Therefore darktable avoids clamping as far as the underlying algorithms allow.
