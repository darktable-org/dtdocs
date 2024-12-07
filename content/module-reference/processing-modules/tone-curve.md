---
title: tone curve
id: tone-curve
weight: 10
applicable-version: 3.8
tags: 
working-color-space:  
view: darkroom
masking: 
---

A classic digital photography tool to alter the tones of an image's using curves.

This module is very similar to the [_rgb curve_](./rgb-curve.md) module but works in Lab color space.

Activate the [picker](../../darkroom/processing-modules/module-controls.md#pickers) to show the picked values on the displayed histogram. Numerical (Lab) values of the input and output (see below) at the selected spot or area are shown at the top left of the graph.

# module controls

_Please refer to the [curves](../../darkroom/processing-modules/curves.md) section for more details about how to modify curves including the **interpolation method**, **scale for graph** and **preserve colors** controls._

color spaces
: Depending on the desired intent, the tone curve can be applied in one of three color spaces:

: - _Lab (linked or separated channels)_: Lab is a perceptual color space that is designed to approximate the way humans perceive colors and lightness. It represents color information independently of lightness. In “Lab, separated channels” mode, you are given fully independent control over the luminance (L-channel) and the chrominance (a/b-channels). In “Lab, linked channels” mode, only the luminance (L-channel) control is available. The color saturation correction is automatically computed, for each pixel, from the contrast correction applied to the luminance channel. This works better in cases where a subtle contrast correction is applied, but gives increasingly inaccurate saturation correction as the contrast is more dramatically altered.

: - _XYZ (linked channels)_: XYZ is a linear technical color space designed to link the physiological light response of the human eye to RGB color spaces. As with Lab, it separates lightness from color information, but does so in a way that does not account for the role of the brain's correction in human perception. The “XYZ, linked channels” mode offers an alternative to “Lab, linked channels”, and works by applying the L-channel curve to all three channels in the XYZ color space. Look at [blend mode](../../darkroom/masking-and-blending/blend-modes.md) “coloradjustment” if you want to tune the strength of automatic chroma scaling. This mode is known to produce a slight hue shift towards yellow.

: - _RGB (linked channels)_: RGB is a linear color space designed to capture and display images in additive synthesis. It is related to capture and display media and does not isolate color and lightness information. The “RGB, linked channels” mode works in ProPhoto RGB and applies the L-channel curve to all three channels in the RGB color space. Adding contrast in RGB space is known to desaturate highlights and boost saturation in the shadows, but this has proven to be the most reliable way to edit contrast, and is the standard method used in most software. This mode makes the tone curve module behave in much the same way as the [base-curve](./base-curve.md) module, except that the latter works in camera RGB space.

: Note that the module works in Lab color space in all cases. This means that the middle-gray coordinate is always 50% in the graph, no matter what color space is used. The same applies to the inset histogram displayed in the background of the curve. The controls are converted to the relevant color space before the corrections are applied -- in RGB and XYZ, the middle-gray is therefore remapped from 50% to 18%.

L-channel curve
: The tone curve in L-channel works on Lightness. To provide a better overview, a lightness histogram is displayed in the module. When working in one of the "linked channels" modes, the L-channel curve is the only one available.

: The horizontal axis represents the lightness of the input image pixels. The vertical axis represents the lightness of the output image pixels. The default straight diagonal line does not change anything. A curve above the default diagonal increases the lightness, whereas a curve below decreases it. An S-like curve will enhance the contrast of the image. You can move the end-points of the default diagonal to change the black and white points and hence alter the overall contrast -- this has the same effect as changing the black and white points in the [_levels_](./levels.md) module.

a/b-channel curves
: The curves in the a and b channels work on color values and are available only in the “Lab, separated channels” mode. The horizontal axis represents the color channel value of the input image pixels. The vertical axis represents the color channel value of the output image pixels. Positive a-values correspond to more magenta colors; negative a-values correspond to more greenish colors. Positive b-values correspond to more yellowish colors; negative b-values correspond to more blueish colors.

: The default diagonal straight line does not change anything. Shifting the center of the curve will give the image a color tint: shifting the a-channel upwards gives a magenta tint; shifting the b-channel upwards gives a yellow tint; shifting the a-channel downwards gives a green tint; shifting the b-channel downwards gives a blue tint.

: Increasing/decreasing the steepness of a curve, without shifting its center, will increase/decrease the color saturation of the respective channel. With properly defined curves you can exert fine control on color saturation, depending on the input pixel's colors.
