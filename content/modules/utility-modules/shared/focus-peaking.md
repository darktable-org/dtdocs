---
title: focus peaking
date: 2022-12-04T02:19:02+01:00
id: focus-peaking
applicable-version: 3.2.1
tags:
view: lighttable, darkroom, tethering, map
---

Identify which parts of the image contain high-contrast details, like edges and textures, which usually indicates that those areas are in focus.

Activate the module by clicking on the ![focus-peaking-icon](./focus-peaking/focus-peaking-icon.png) icon. The sharp parts of the image will be highlighted with a yellow, green and blue overlay:

Focus peaking works by filtering out most of the image noise, measuring the intensity gradients in the image and calculating average and standard deviation statistics. When the gradient of an edge differs significantly from the mean, the associated pixels are marked with a "heat map" indicating how sharp the edge is.

- _yellow_ represents a large (6σ) jump in gradient, indicating a very sharp edge.
- _green_ represents a medium (4σ) jump in gradient, indicating a reasonably sharp edge.
- _blue_ represents a small (2σ) jump in gradient, indicating a slightly sharp edge.

![focus-peaking-overview](./focus-peaking/focus-peaking-overview.png)

The image above was taken with a wide aperture to give a shallow depth of field, and you can see how the camera has focused on the chinese character written on the second red lantern along from the front. There are also stems of the pink flowers that fall within the area of acceptable sharpness around the focal plane, and these have also been marked up with yellow and green.

{{< note >}}
The focus peaking detects local contrast and uses it as an estimation of sharpness. This is the only known method to do so as of 2023. While local contrast and sharpness are fairly correlated most of the time, edges between two objects having very different luminances (bright sky and tree leaves) will have a very high local contrast even when blurry, which will make them detected as sharp by focus peaking. A mechanism is in place to mitigate this issue in most cases, but very high-contrast edges will still be detected as sharp no matter their actual sharpness.
{{</ note >}}

{{< warning >}}
The focus peaking does __not__ detect __if__ the images are sharp, but __where__ the sharpest region of the image is, which is likely to be on the focal plane. This can help to spot front/back-focus, if any. But there is no guaranty that the most sharp region of the picture is actually sharp by some metric of definition of sharpness.
{{</ warning >}}

{{< warning >}}
Downscaled images have their gradients affected by interpolation methods, where noise is made less visible and local contrast is lost around small details, making focus peaking on small thumbnails inaccurate.
{{</ warning >}}

{{< warning >}}
The focus peaking is runs the detection on the final image as it appears in the graphic interface, after all processing steps if any. It will therefore take into account all the blurring and sharpening, as well as contrast enhancements, that may have happened in the processing.
{{</ warning >}}
