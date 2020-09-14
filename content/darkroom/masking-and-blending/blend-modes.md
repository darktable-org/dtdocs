---
title: Blend Modes
id: blend-modes
date: 2020-09-13
draft: false
---

Blend modes define how the input and output of a module are to be combined (blended) together before the final output is passed to the next module in the pixelpipe. Many of the blend modes should be familiar from other imaging software and are thoroughly discussed in the GIMP user manual (https://docs.gimp.org/2.8/en/gimp-concepts-layer-modes.html). 

This section therefore only discusses some of the darktable-specific blend modes in more detail.

normal
: The most commonly used blend mode, "normal" simply mixes input and output allowing the strength of a module's effect to be reduced with the opacity slider. This is usually the blend mode of choice when applying a module's effect selectively with masks.

normal bounded
: This blend mode is similar to “normal”, except that input and output data are clamped to a particular min/max value range. Out-of-range values are effectively blocked and not passed to subsequent modules. Sometimes this helps to prevent artifacts. However, in most cases (e.g. highly color saturated extreme highlights) it is better to let unbound values travel through the pixelpipe to be properly handled later. The “normal” blend mode is therefore usually preferred.

lightness
: This blend mode mixes lightness from the input and output images. Color (chroma and hue) is taken unaltered from the input image.

chroma
: This blend mode mixes chroma (saturation) from the input and output images. Lightness and hue are taken unaltered from the input image.

hue
: This blend mode mixes hue (color tint) from the input and output images. Lightness and chroma are taken unaltered from the input image.

color
: This blend mode mixes color (chroma and hue) from the input and output images. Lightness is taken unaltered from the input image. 

_Caution: When modules drastically modify hue (e.g. when generating complementary colors) this blend mode can result in strong color noise._

Lab lightness
: Only available with modules that work in the Lab color space, this blend mode mixes lightness from the input and output images, while color is taken unaltered from the input image. In contrast to “lightness” this blend mode does not involve any color space conversion and does not clamp any data. In some cases this is less prone to artifacts compared to “lightness”.

Lab color
: Only available with modules that work in the Lab color space, this blend mode mixes Lab color channels a and b from the input and output images, while lightness is taken unaltered from the input image. In contrast to “color” this blend mode does not involve any color space conversion and does not clamp any data. In some cases this is less prone to artifacts compared to “color”.

HSV lightness
: Only available with modules that work in the RGB color space, this blend mode mixes lightness from the input and output images, while color is taken only from the input image. In contrast to “lightness” this blend mode does not involve clamping.

HSV color
: Only available with modules that work in the RGB color space, this blend mode mixes color from the input and output images, while lightness is taken only from the input image. In contrast to “color” this blend mode does not involve clamping.

color adjustment
: Some modules act predominantly on the tonal values of an image but also perform some color saturation adjustments (e.g. the _levels_ and _tone curve_ modules). This blend mode takes the lightness only from output data and mixes colors from input and output enabling control of the module's color adjustments.
