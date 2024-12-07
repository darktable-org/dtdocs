---
title: rgb curve
id: rgb-curve
weight: 10
applicable-version: 3.8
tags: 
working-color-space:  
view: darkroom
masking: 
---

A classic digital photography tool to alter an image's tones using curves.

This module is very similar to the [_tone curve_](./tone-curve.md) module but works in RGB color space.

Activate the [picker](../../darkroom/processing-modules/module-controls.md#pickers) on the left to show the picked values in the graph (Ctrl+click or right-click to use the picker in area mode). Numerical (Lab) values of the input and output (see below) at the selected spot or area are shown at the top left of the widget.

A second [picker](../../darkroom/processing-modules/module-controls.md#pickers) to the right can be used to automtaically create new nodes based on the sampled area. Ctrl+click+drag to alter the created nodes to have a positive curve for the selected area; Shift+click+drag to create a negative curve.

# module controls

_Please refer to the [curves](../../darkroom/processing-modules/curves.md) section for more details about how to modify curves including the **interpolation method** and **preserve colors** controls._

mode
: RGB is a linear color space designed to capture and display images in additive synthesis. It is related to the capture and display media and does not isolate color and lightness information in the same way that Lab and XYZ color spaces do. This module works in ProPhoto RGB. Adding contrast in RGB space is known to desaturate highlights and boost saturation in the shadows, but this has been proven to be the most reliable way to edit contrast, and is the standard method in most software

: Depending on the desired intent you can apply the RGB curve in two different modes

: - _RGB, linked channels_: Apply the L-channel curve to all three channels in the RGB color space.
: - _RGB, independent channels_: R, G and B curves can be adjusted independently.

compensate middle gray
: Select this to change the histogram display in the module. This option does not alter the processing but may assist when editing the curve.
