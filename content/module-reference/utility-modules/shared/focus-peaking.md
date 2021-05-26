---
title: focus peaking
id: focus-peaking
applicable-version: 3.2.1
tags: 
view: lighttable, darkroom, tethering, map
---

Identify which parts of the image contain sharp edges, which usually indicates that those areas are in focus.

Activate the module by clicking on the ![focus-peaking-icon](./focus-peaking/focus-peaking-icon.png#icon) icon. The sharp parts of the image will be highlighted with a yellow, green and blue overlay:

Focus peaking works by filtering out image noise, measuring the intensity gradients in the image and calculating average and standard deviation statistics. When the gradient of an edge differs significantly from the mean, the associated pixels are marked with a "heat map" indicating how sharp the edge is.

- _yellow_ represents a large (6σ) jump in gradient, indicating a very sharp edge.
- _green_ represents a medium (4σ) jump in gradient, indicating a reasonably sharp edge.
- _blue_ represents a small (2σ) jump in gradient, indicating a slightly sharp edge.

![focus-peaking-overview](./focus-peaking/focus-peaking-overview.png#w75)

The image above was taken with a wide aperture to give a shallow depth of field, and you can see how the camera has focused on the chinese character written on the second red lantern along from the front. There are also stems of the pink flowers that fall within the area of acceptable sharpness around the focal plane, and these have also been marked up with yellow and green.

