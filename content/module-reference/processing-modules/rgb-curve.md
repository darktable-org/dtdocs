---
title: rgb curve
id: rgb-curve
applicable-verison: 3.2.1
tags: 
working-color-space:  
view: darkroom
masking: 
---

A classic digital photography tool to alter an image's tones using curves.

This module is very similar to the [_tone curve_](./tone-curve.md) module but works in RGB color space.

Activate the color picker on the left to show the picked values in the graph (`Ctrl+click` to use the picker in area mode). Numerical (Lab) values of the input and output (see below) at the selected spot or area are shown at the top left of the widget.

A second color picker to the right can be used to directly amend the curve based on the sampled area. `Ctrl+click+drag` will create a positive curve for the selected area; `Shift+click+drag` will create a negative curve.

# module controls

_Please refer to the [curves](../../darkroom/interacting-with-modules/curves.md) section for more details about how to modify curves including the **interpolation method** and **preserve colors** controls._

mode
: RGB is a linear color space designed to capture and display images in additive synthesis. It is related to the capture and display media and does not isolate color and lightness information in the same way that Lab and XYZ color spaces do. This module works in ProPhoto RGB. Adding contrast in RGB space is known to desaturate highlights and boost saturation in the shadows, but this has been proven to be the most reliable way to edit contrast, and is the standard method in most software

: Depending on the desired intent you can apply the RGB curve in two different modes

: - "RGB, linked channels" mode applies the L-channel curve to all three channels in the RGB color space.

: - "RGB, independent channels" allows you to adjust the R, G and B curves independently.

compensate middle grey
: Select this to change the histogram display in the module. This option does not alter the processing but may assist when editing the curve.
