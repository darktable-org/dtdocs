---
title: focus peaking
id: focus-peaking
---

Identify which parts of the image contain high contrast details such as edges and textures, which are usually a useful guide to sharpness and therefore focus.

Activate the module by clicking on the ![focus-peaking-icon](./focus-peaking/focus-peaking-icon.png#icon) icon. The sharpest parts of the image will be highlighted with a yellow, green and blue overlay:

Focus peaking works by filtering out most of the image noise, measuring the intensity gradients in the image and calculating average and standard deviation statistics. When the gradient of an edge differs significantly from the mean, the associated pixels are marked with a "heat map" indicating how sharp the edge is.

- _yellow_ represents a large (6σ) jump in gradient, indicating a very sharp edge.
- _green_ represents a medium (4σ) jump in gradient, indicating a reasonably sharp edge.
- _blue_ represents a small (2σ) jump in gradient, indicating a slightly sharp edge.

---

**Note:** While the algorithm in this module generally does a good job of locating the sharpest parts of an image, it does not necessarily detect _whether_ an image is sharp. Additionally, as it uses local contrast to detect sharpness, it will also highlight the edges of dark objects against bright backgrounds (and vice versa) even if those edges are blurred. Because it runs at the end of the pixelpipe, it may also detect the results of any sharpening you have performed within darktable.

---

The following example image was taken with a wide aperture to give a shallow depth of field, and you can see how the camera has focused on the chinese character written on the second red lantern along from the front. There are also stems of the pink flowers that fall within the area of acceptable sharpness around the focal plane, and these have also been marked up with yellow and green.

![focus-peaking-overview](./focus-peaking/focus-peaking-overview.png#w75)

