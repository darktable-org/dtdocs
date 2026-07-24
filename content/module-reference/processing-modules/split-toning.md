---
title: split-toning
id: split-toning
weight: 10
---

{{< details summary="Technical information" class="technical-info" >}}

description
: use two specific colors for shadows and highlights and create a linear toning effect between them up to a pivot.

purpose
: creative.

input
: linear, RGB, scene-referred.

processing
: linear, RGB.

output
: linear, RGB, scene-referred.

{{< /details >}}

Create a two color linear toning effect where the shadows and highlights are represented by two different colors.

The split-toning module does not convert images to black and white and has limited benefits on color images. In order to perform traditional split-toning, the input to this module should therefore be monochrome.

# module controls

shadows and highlights color
: Set the desired hue and saturation for both shadows and highlights. Clicking on the colored squares will open a color selector dialog which offers you a choice of commonly used colors, or allows you to define a color in RGB color space.

balance
: The ratio of toning between shadows and highlights. When set to 50%, half of the lightness range in image is used for shadows toning and the other half for highlights toning.

compress
: The percentage of total (mid-tone) lightness range that is not affected by color toning. This compresses the effect on the shadows and highlights while preserving the mid-tones.
