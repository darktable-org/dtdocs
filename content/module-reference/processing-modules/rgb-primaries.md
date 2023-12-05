---
title: rgb primaries
id: rgb-primaries
applicable-version: 4.6
tags:
working-color-space: RGB
view: darkroom
masking: true
---

Adjust the hue and [purity](../../special-topics/color-management/color-dimensions.md#definitions) of the RGB primary colors (i.e. _which_ red, green and blue they represent), while leaving uncolored (gray) pixels unchanged. In addition to preserving gray pixels, the opponency relationships between the colors are also preserved under this adjustment: If you increase the purity of the blue primary, the opponent yellow's intensity increases to balance things out; If you twist the blue hue toward cyan, the opponent yellow is twisted toward orange.

This module is essentially a channel mixer (as in the [color calibration](./color-calibration.md) module) but with a different interface. Even though the sliders are named "red", "green" and "blue", all adjustments are global and affect the overall colorimetry of the image, just like a channel mixer does.

When applied before the [_filmic rgb_](./filmic-rgb.md) or [_sigmoid_](./sigmoid.md) tone mapping modules _rgb primaries_ can be used to make small adjustments to colorimetry. When applied after the tone mapping modules it may be used to apply creative edits such as tinting.

# module controls

red hue
: Shift red towards yellow (positive values) or magenta (negative values)

red purity
: The purity of the red primary

green hue
: Shift green towards cyan (positive values) or yellow (negative values)

green purity
: The purity of the green primary

blue hue
: Shift blue towards magenta (positive values) or cyan (negative values)

blue purity
: The purity of the blue primary

tint hue
: When applied after tone mapping, this control allows the gray (achromatic) parts of the image to be tinted. When applied before tone mapping, it acts like a white balance control.

tint purity
: The purity of the tint that is applied to the image

