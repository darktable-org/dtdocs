---
title: focus peaking
id: focus-peaking
applicable-version: 3.2.1
tags: 
view: lighttable, darkroom, tethering, map
---

The _focus peaking_ module allows you to identify which parts of the image are sharp and in-focus. It works both in the lighttable view, where you can easily see at a glance which images are sharp and which are blurry, and in the darkroom view, when you are processing a single image.

The module is activated by clicking on the focus-peaking icon (![focus-peaking-icon](./focus-peaking/focus-peaking-icon.png#icon)). It highlights the sharp parts of the image with a yellow, green and blue overlay:

![focus-peaking-overview](./focus-peaking/focus-peaking-overview.png#w75)

The module works by filtering out image noise, measuring the gradients of intensity in the image and calculating average and standard deviation statistics. When the gradient of an edge differs significantly from the mean, the associated pixels are marked up with a "heat map" indicating how sharp the edge is.

- _yellow_ represents a large (6σ) jump in gradient, indicating a very sharp edge.
- _green_ represents a medium (4σ) jump in gradient, indicating a reasonably sharp edge.
- _blue_ represents a small (2σ) jump in gradient, indicating a slightly sharp edge.

The image above was taken with a wide aperture to give a shallow depth of field, and you can see how the camera has focused on the chinese character written on the second red lantern along from the front. There are also stems of the pink flowers which fall within the area of acceptable sharpness around the focal plane, and these have also been marked up with yellow and green.

