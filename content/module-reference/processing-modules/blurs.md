---
title: blurs
id: blurs
applicable-version: 3.8
tags:
working-color-space: RGB
view: darkroom
masking: true
---

The _blurs_ module allows to simulate physically-accurate blurs in scene-referred RGB.

# blur types

The module provides 3 types of blurs:

1. _lens blur_, simulating a lens diaphragm with a configurable number of blades and blade curvature to create synthetic bokeh.
2. _motion blur_, simulating the effect of a lens motion with a configurable path.
3. _gaussian blur_, which is not really an optical blur but could be used to help denoising or for creative effects using [blend modes](../../darkroom/masking-and-blending/blend-modes.md)

A graph displays a visual feedback of the blurring operator, called the [point spread function](https://en.wikipedia.org/wiki/Point_spread_function). This means that each luminous point from the scene will be turned into a blot shaped like the blurring operator shown in the graph in the module's output, and the size of the blot is defined by the _blur radius_ setting.

# module controls

blur radius
: defines the spreading size of the blur.

blur type
: choose between the different blur variants.

## specific controls to lens blur

diaphragm blades
: select the number of blades composing the diaphragm. Older lenses used typically 5 or 7 blades, newer lenses typically use 9 or 11 blades. In any case, real lenses have an add number of blades and more than 11 blades is very close to producing a perfect disc. If you degenerate the diaphragm settings with the _concavity_ to shape a star or an asterisk, this defines the number of its branches.

concavity
: - a concavity of 1 ensures the diaphragm is a [regular convex polygon](https://en.wikipedia.org/wiki/Regular_polygon#Regular_convex_polygons) (pentagon, heptagon, enneagon, etc.).
: - a concavity greater than 1 but strictly lower than `number of blades - 1` turns the shape into a star.
: - a concavity greater than `number of blades - 1` but strictly lower than `number of blades` turns the shape into an asterisk when decreasing _linearity_ below 1.
: - a concavity greater or equal to `number of blades` degenerates the shape into a "burst pattern".

linearity
: - a linearity of 0 creates a disc no matter the number of blades or the concavity.
: - a linearity of 1 makes all the outer bounds of the shape strictly straight.
: - a linearity between 0 and 1 makes the outer bounds of the shape more or less curved.

rotation
: it allows to rotate the shape compared to its center and is mostly useful with a small number of blades, when a particular orientation is needed.

## specific controls to motion blur

direction
: the orientation of the motion path in degrees of angle. 0° is horizontal motion.

curvature
: zero produces a straight line, a negative value produces a concave curvature, a positive value produces a convex curvature.

offset
: shifts along the motion path following its curve. This is useful to select a portion of the curved path that is symmetrical, which produces a coma shape (example 1: direction = -45°, curvature = +2, offset = +0.5 ; example 2 : direction = -45°, curvature = +1, offset = +1).


# caveats

The module is implemented using a naive convolution, which is a slow algorithm. Faster approaches are available (using FFT) and not yet implemented. The GPU implementation, through OpenCL should hide some of this issue. In any case, the runtime of the module will increase with the square of the blur radius.

The blurring process does not take scene depth and focusing depth of field into account, but blurs the whole picture as a flat object. Therefore, it is not suitable to create fake depth of field. Using the general masking controls of darktable will only partially work to isolate the foreground of an image, since it will still be blurred into the background.

# tips and tricks

Any image is usually (even a tiny bit) noisy. If you blur only a part of the image, this region will look suspiciously clean compared to the rest of the image. It is therefore a good idea to add a bit of noise on top of the blurred part to blend it with the rest, using either the [grain](grain.md) or the [censorize](censorize.md) modules.
