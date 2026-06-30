---
title: color contrast
id: color-contrast
weight: 10
---

{{< details summary="Technical information" class="technical-info" >}}

description
: increase saturation and separation between opposite colors.

purpose
: creative.

input
: non-linear, Lab, display-referred.

processing
: non-linear, Lab.

output
: non-linear, Lab, display-referred

{{< /details >}}

A simplified control for changing the contrast or separation of colors between the green/magenta and blue/yellow axes in Lab color space. Higher values increase color contrast, lower values decrease it.

# module controls

green-magenta contrast
: Change the green-magenta color contrast. This is equivalent to raising or lowering the steepness of the a\* curve in Lab. Lower values desaturate greens and magenta, while higher values increase their saturation.

blue-yellow contrast
: Change the blue-yellow color contrast. This is equivalent to raising or lowering the steepness of the b\* curve in Lab. Lower values desaturate blues and yellows, while higher values increase their saturation.
