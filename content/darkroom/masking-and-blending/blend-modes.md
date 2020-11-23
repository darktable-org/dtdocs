---
title: blend modes
id: blend-modes
weight: 20
draft: false
---

Blend modes define how the input and output of a module are combined (blended) together before a module's final output is passed to the next module in the pixelpipe. Most of the blend modes should be familiar from other imaging software and are thoroughly discussed in the [GIMP user manual](https://docs.gimp.org/2.8/en/gimp-concepts-layer-modes.html). 

This section therefore only discusses some of the darktable-specific blend modes in detail.

Some blend modes depend on a fulcrum for their operation. This fulcrum usually defines the point at which the blend mode results in a "no-operation" which may be white or grey depending on the blend mode. The additional _blend fulcrum_ parameter allows the position of this fulcrum to be adjusted where blending is performed within the RGB scene-referred color space. The effect depends on the operator used. For example, values above the fulcrum might be brightened and values below darkened, or vice versa.

normal
: The most commonly used blend mode, "normal" simply mixes input and output to an extent determined by the opacity parameter. This mode is commonly used to reduce the strength of a module's effect by reducing the opacity. This is also usually the blend mode of choice when applying a module's effect selectively with masks.

normal bounded
: This blend mode is the same as “normal”, except that the input and output data are clamped to a particular min/max value range. Out-of-range values are effectively blocked and are not passed to subsequent modules. Sometimes this helps to prevent artifacts. However, in most cases (e.g. highly color-saturated extreme highlights) it is better to let unbound values travel through the pixelpipe to be properly handled later. The “normal” blend mode is therefore usually preferred.

lightness
: This blend mode mixes lightness from the input and output images. Color (chroma and hue) is taken unaltered from the input image.

chroma
: This blend mode mixes chroma (saturation) from the input and output images. Lightness and hue are taken unaltered from the input image.

hue
: This blend mode mixes hue (color tint) from the input and output images. Lightness and chroma are taken unaltered from the input image.

color
: This blend mode mixes color (chroma and hue) from the input and output images. Lightness is taken unaltered from the input image. 

: _Caution: When modules drastically modify hue (e.g. when generating complementary colors) this blend mode can result in strong color noise._

Lab lightness
: Only available with modules that work in the Lab color space, this blend mode mixes lightness from the input and output images, while color is taken unaltered from the input image. In contrast to “lightness” this blend mode does not involve any color space conversion and does not clamp any data. In some cases this blend mode is less prone to artifacts than “lightness”.

Lab color
: Only available with modules that work in the Lab color space, this blend mode mixes Lab color channels a and b from the input and output images, while lightness is taken unaltered from the input image. In contrast to “color” this blend mode does not involve any color space conversion and does not clamp any data. In some cases this blend mode is less prone to artifacts than “color”.

HSV lightness
: Only available with modules that work in the RGB color space, this blend mode mixes lightness from the input and output images, while color is taken only from the input image. In contrast to “lightness” this blend mode does not involve clamping.

HSV color
: Only available with modules that work in the RGB color space, this blend mode mixes color from the input and output images, while lightness is taken only from the input image. In contrast to “color” this blend mode does not involve clamping.

color adjustment
: Some modules act predominantly on the tonal values of an image but also perform some color saturation adjustments (e.g. the [_levels_](../../module-reference/processing-modules/levels.md) and [_tone curve_](../../module-reference/processing-modules/tone-curve.md) modules). This blend mode takes the lightness from the module's output and mixes colors from input and output, enabling control of the module's color adjustments.

