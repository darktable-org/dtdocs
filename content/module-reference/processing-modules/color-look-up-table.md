---
title: color look up table
id: color-look-up-table
applicable-version: 3.2.1
tags: 
working-color-space: Lab 
view: darkroom
masking: true
---

A generic color look up table implemented in Lab space. 

The input to this module is a list of source and target points and the complete mapping is interpolated using splines. The resulting look up tables (LUTs) are editable by hand and can be created using the darktable-chart utility to match given input (such as hald-cluts and RAW/JPEG with in-camera processing pairs). See [using darktable-chart](../../special-topics/darktable-chart/_index.md) for details.

# module controls

color board
: The color board grid shows a list of colored patches. The colors of the patches are the source points. The target color of the selected patch is shown as offsets which are controlled by sliders beneath the color board. An outline is drawn around patches that have been altered (where the source and target colors differ). 

: Click a patch to select it, or use the combo box or color picker. The currently-selected patch is marked with a white square, and its number is displayed in the combo box below.

: By default, the module will load the 24 patches of a classic color checker and initialise the mapping to identity (no change to the image). Configurations with more than 24 patches are shown in a 7x7 grid.

interaction
: To modify the color mapping, you can change the source and target colors, though the main use is to change the target colors.

: Start with an appropriate palette of source colors (either from the presets menu or from a style you have downloaded). You can then change the lightness (L), green-red (a), blue-yellow (b), or saturation \(c\) of the patches' target values with the sliders.

: To change the source color of a patch you can select a new color from your image by using the color picker and Shift+click on the patch you want to replace.

: Double-click a patch to reset it; Right-click a patch to delete it; Shift+click on empty space to add a new patch (with the currently picked color as the source).
