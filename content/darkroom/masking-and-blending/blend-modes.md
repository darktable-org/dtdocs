---
title: blend modes
id: blend-modes
weight: 20
draft: false
---

Blend modes define how the input and output of a module are combined (blended) together before the module's final output is passed to the next module in the pixelpipe. 

Classic blending modes, designed for display-referred RGB (constrained to 0-100%), implicitly define a fulcrum at 50% (gray) or 100% (white) in their algorithms, depending on the blend mode. Because scene-referred is not subject to these restrictions, this fulcrum needs to be explicitly defined by the user when performing blending operations in the "RGB (scene)" color space. The additional _blend fulcrum_ parameter will be presented to the user when using one of these blend modes in this color space. The effect depends on the operator used. For example, values above the fulcrum might be brightened and values below darkened, or vice versa.

The final output of a module is computed 'per-pixel' as follows:

```
final_output = (1.0 - opacity) * module_input + opacity * blended_output
```

where the `blended_output` is a combination of the input and output images, depending on the blend mode (below), and the `opacity` is defined 'per-pixel' by a combination of the mask and global opacity parameter. An opacity of 0% outputs an image that is identical to the input image of the module.

The "reverse" button ![blend-reverse](./blend-modes/blend-reverse.png#icon) effectively reverses the roles of the input and output images in the 'per-pixel' computation:

```
final_output = (1.0 - opacity) * module_output + opacity * blended_input
```

where the `blended_input` is a combination of the output and input images, depending on the blend mode below where _output_ and _input_ image references are reversed. In "reversed" blend modes, an opacity of 0% outputs an image that is identical to the _output_ image of the module.

# normal modes

normal
: The most commonly used blend mode, "normal" simply mixes input and output to an extent determined by the opacity parameter. This mode is commonly used to reduce the strength of a module's effect by reducing the opacity. This is also usually the blend mode of choice when applying a module's effect selectively with masks. This mode is also known as the "over" Porter-Duff alpha blending operator (see [alpha compositing](https://en.wikipedia.org/wiki/Alpha_compositing) for more details).

normal bounded
: _not available in the "RGB (scene)" color space_
: This blend mode is the same as “normal”, except that the input and output data are clamped to a particular min/max value range. Out-of-range values are effectively blocked and are not passed to subsequent modules. Sometimes this helps to prevent artifacts. However, in most cases (e.g. highly color-saturated extreme highlights) it is better to let unbound values travel through the pixelpipe to be properly handled later. The “normal” blend mode is therefore usually preferred.

# arithmetic modes

addition
: Add together the pixel values of the input and output images, lightening the output. When blending in the "RGB (scene)" color space, the pixel values of the output image are multiplied by a value proportional to the "blend fulcrum".

subtract
: Subtract the pixel value of the _output_ from the _input_. When blending in the "RGB (scene)" color space, the pixel values of the output image are multiplied by a value proportional to the "blend fulcrum". Pixel values less than 0 are set to 0.

multiply
: Multiply the pixel values of the input and output together. When blending in display-referred color spaces, pixel values are between 0 and 1.0, the final output will be clamped and will always be darker. When blending in the "RGB (scene)" color space, this value is further multiplied by a value proportional to the "blend fulcrum". In this case, values may be greater than 1.0 and therefore brighten the base image. This may have other side-effects, such as updating the white point in the filmic module.

: Multiply blending simulates an optical variable density filter, where the density is defined by the output of the module. It has many applications, from blooming and local contrast enhancements (when used with a blur or low-pass filter) to dodging/burning and global contrast enhancements (when used with exposure). The fulcrum sets the output intensity threshold between darkening and brightening (any RGB value below fulcrum will darken).

divide
: Divide the pixel values of the input by the output. When blending in the "RGB (scene)" color space, the pixel values of the output image are multiplied by a value proportional to the "blend fulcrum".

: Since this is the inverse of the multiply mode, it will darken where multiply brightens and vice versa. Everything else works in essentially the same way.

screen
: _not available in the "RGB (scene)" color space_
: Invert the input and output pixel values, multiply those values together and invert the result. This yields approximately the opposite effect to "multiply" mode -- the resulting image is usually brighter, and sometimes “washed out” in appearance.

average
: Return the arithmetic mean of the input and output pixel values.

difference
: Return the absolute difference between the input and output pixel values.

geometric mean
: Return the square root of the product of the input and output pixel values.

harmonic mean
: Return the product of the input and output pixel values, multiplied by 2 and divided by their sum.

# contrast enhancing modes

The following modes are not available in the "RGB (scene)" blending color space as they rely on an assumption of "50% mid gray" which only applies to display-referred and non-linear color spaces.  In addition, they clamp pixel values of *both* input and output images as the underlying math is not valid outside the range 0..1, and can thus cause visible changes *anywhere* in the image.  To avoid these, you will need to ensure that the module's input does not exceed the display-referred range.

overlay
: This mode combines the "multiply" and "screen" blend modes: The parts of the input where the output is brighter, become brighter; The parts of the image where the output is darker, become darker; Mid-gray is unaffected. This mode is often combined with the [_lowpass_](../../../module-reference/processing-modules/lowpass.md) and [_highpass_](../../../module-reference/processing-modules/highpass.md) modules.

softlight
: This mode is similar to "overlay", except the results are softer and less bright. As with overlay, it is often combined with the [_lowpass_](../../../module-reference/processing-modules/lowpass.md) and [_highpass_](../../../module-reference/processing-modules/highpass.md) modules.

hardlight
: This mode is not related to "softlight" in anything but name. Like overlay mode it is a combination of "multiply" and "screen" modes and has a different effect above and below mid-gray. The results with hardlight blend mode tend to be quite intense and usually need to be combined with a reduced opacity.

vividlight
: This mode is an extreme version of overlay/softlight. Values darker than mid-gray are darkened; Values brighter than mid-gray are brightened. You will probably need to tone down its effect by reducing the opacity

linearlight
: This mode is similar to the effect of "vividlight".

pinlight
: This mode performs a darken and lighten blending simultaneously, removing mid-tones. It can result in artifacts such as patches and blotches.

# color channel modes

## Lab channels

The following are available for blending in the Lab color space only

Lab lightness
: Mix the lightness from the input and output images, while taking the color channels (a and b) unaltered from the input image. In contrast to “lightness” this blend mode does not involve any color space conversion and does not clamp any data. In some cases this blend mode is less prone to artifacts than “lightness”.

Lab a-channel
: Mix the Lab "a" color channel from the input and output images, while taking the other channels unaltered from the input image.

Lab b-channel
: Mix the Lab "b" color channel from the input and output images, while taking the other channels unaltered from the input image.

Lab color
: Mix the Lab color channels (a and b) from the input and output images, while taking the lightness unaltered from the input image. In contrast to “color” this blend mode does not involve any color space conversion and does not clamp any data. In some cases this blend mode is less prone to artifacts than “color”.

## RGB channels

The following are available when blending in RGB color spaces only.

RGB red channel
: Mix the "red" channel from the input and output images, while taking the other channels unaltered from the input image. When blending in the "RGB (scene)" color space, the "red" channel from the output image is multiplied by a value proportional to the "blend fulcrum". 

RGB green channel
: Mix the "green" channel from the input and output images, while taking the other channels unaltered from the input image. When blending in the "RGB (scene)" color space, the "green" channel from the output image is multiplied by a value proportional to the "blend fulcrum". 

RGB blue channel
: Mix the "blue" channel from the input and output images, while taking the other channels unaltered from the input image. When blending in the "RGB (scene)" color space, the "blue" channel from the output image is multiplied by a value proportional to the "blend fulcrum". 

# HSV channels

The following are available when blending in the "RGB (display)" color space only.

HSV value
: Mix the lightness from the input and output images, while taking color unaltered from the input image. In contrast to “lightness” this blend mode does not involve clamping.

HSV color
: Mix the color from the input and output images, while taking lightness unaltered from the input image. In contrast to “color” this blend mode does not involve clamping.

# others

lightness
: Mix lightness from the input and output images, while taking color (chromaticity and hue) unaltered from the input image.

chromaticity
: Mix chromaticity from the input and output images, while taking lightness and hue unaltered from the input image. This blend mode uses RGB ratios, divided by a Euclidean norm.

lighten
: _not available in the "RGB (scene)" color space_
: Compare the pixel values of the input and output images, and output the lighter value.

darken
: _not available in the "RGB (scene)" color space_
: Compare the pixel values of the input and output images, and output the darker value.

hue
: _not available in the "RGB (scene)" color space_
: Mix hue (color tint) from the input and output images, while taking lightness and chroma unaltered from the input image.

color
: _not available in the "RGB (scene)" color space_
: Mix color (chroma and hue) from the input and output images while taking lightness unaltered from the input image. 

: _Caution: When modules drastically modify hue (e.g. when generating complementary colors) this blend mode can result in strong color noise._

coloradjustment
: _not available in the "RGB (scene)" color space_
: Some modules act predominantly on the tonal values of an image but also perform some color saturation adjustments (e.g. the [_levels_](../../module-reference/processing-modules/levels.md) and [_tone curve_](../../module-reference/processing-modules/tone-curve.md) modules). This blend mode takes the lightness from the module's output and mixes colors from input and output, enabling control over the module's color adjustments.

