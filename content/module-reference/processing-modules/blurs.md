---
title: blurs
date: 2022-12-04T02:19:02+01:00
id: blurs
applicable-version: 3.8
tags:
working-color-space: RGB
view: darkroom
masking: true
---

Simulate physically-accurate blurs in scene-referred RGB space.

## blur types

Three types of blur are provided:

1. _lens blur_: Simulates a lens diaphragm with a configurable number of blades and blade curvature to create synthetic bokeh.
2. _motion blur_: Simulates the effect of camera motion with a configurable path.
3. _gaussian blur_: This is not really an optical blur but can be used for denoising or for creative effects using [blend modes](../../darkroom/masking-and-blending/blend-modes.md)

A diagram at the top of the module shows the shape of the blurring operator (known as the [_point spread function_](https://en.wikipedia.org/wiki/Point_spread_function)). The module will turn each luminous point from the scene into a blot shaped like the displayed blurring operator, with the size of the blot defined by the _blur radius_.

## module controls

### general

blur radius
: The spreading size of the blur.

blur type
: Choose between the different blur variants (above).

### controls specific to lens blur

diaphragm blades
: The number of blades that the diaphragm is composed of. Older lenses used typically 5 or 7 blades, newer lenses typically use 9 or 11 blades. In any case, real lenses have an odd number of blades and any number greater than 11 blades comes very close to producing a perfect disc. If you degenerate the diaphragm settings with the _concavity_ to create a star or an asterisk, this control defines how many branches it has.

concavity
: - a concavity of 1 ensures the diaphragm is a [regular convex polygon](https://en.wikipedia.org/wiki/Regular_polygon#Regular_convex_polygons) (triangle, pentagon, heptagon, etc.).
: - a concavity greater than 1 but lower than `number of blades - 1` turns the shape into a star.
: - a concavity greater than `number of blades - 1` but lower than `number of blades` turns the shape into an asterisk, when decreasing _linearity_ below 1.
: - a concavity greater than or equal to `number of blades` degenerates the shape into a "burst pattern".

linearity
: - a linearity of 0 creates a disc, no matter the number of blades or the concavity.
: - a linearity of 1 makes all the outer bounds of the shape straight.
: - a linearity between 0 and 1 makes the outer bounds of the shape more or less curved.

rotation
: Allows the shape to be rotated with respect to its center -- mostly useful with a small number of blades, when a particular orientation is needed.

### controls specific to motion blur

direction
: The orientation of the motion's path in angular degrees. 0° is horizontal motion.

curvature
: The curvature of the motion. Zero produces a straight line, a negative value produces a concave curvature, a positive value produces a convex curvature.

offset
: Shifts along the motion path following its curve. This is useful to select a portion of the curved path that is symmetrical, which produces a coma shape (example 1: direction = -45°, curvature = +2, offset = +0.5 ; example 2 : direction = -45°, curvature = +1, offset = +1).

## caveats

This module is implemented using a "naive" convolution, which is a slow algorithm. Faster approaches are available (using FFT) but not yet implemented. The GPU implementation, through OpenCL, should hide this issue somewhat. In any case, the runtime of the module will increase with the square of the blur radius.

The blurring process does not take scene depth and depth-of-field into account, but blurs the whole image as a flat object. It is therefore not suitable for creating fake depth-of-field. Using Ansel's general masking will only partially work to isolate the foreground of an image, since it will still be blurred into the background.

## tips and tricks

All images are usually (even a tiny bit) noisy. If you blur only a part of the image, the blurred region will look suspiciously clean compared to the rest of the image. It is therefore a good idea to add a bit of noise on top of the blurred part to blend it with the rest, using either the [grain](./grain.md) or the [censorize](./censorize.md) modules.
