---
title: color equalizer
id: color-equalizer
weight: 10
applicable-version: 4.8
---

Selectively adjust the hue, saturation, and/or brightness of pixels based on their current hue.

This module is an attempt to recreate _some_ of the functionality of the [_color zones_](./color-zones.md) module in the [scene-referred](../../special-topics/color-pipeline.md) part of the pipeline whilst overcoming some of that module's limitations. Specifically, the _color zones_ module is prone to create increased chroma/luma noise, artefacts or harsh transitions. These are mitigated within _color equalizer_ with the following techniques:

- a fixed number of equally-spaced adjustment nodes means a smoother adjustment curve
- adjustments are applied using a guided filter, which takes into account the hue of neighboring pixels, meaning that transitions between pixels are less harsh

You can use each of the provided tabs (either individually or in combination) to adjust the hue, saturation, and/or brightness at each of the 8 provided color nodes. While you cannot alter the distance between nodes (see above), if you wish to target a particular hue that does not currently lie on a node, you can use the "node placement" slider to move all of the nodes simultaneously. This can be used in conjunction with the color picker, which can display the color of the "picked" pixel or area on the curve adjustment section of the module.

---

**Note**: While the above mitigations can reduce the amount of chroma/luma noise being introduced by this module, they cannot remove the possibility entirely, and you are therefore advised to use this module with care. Try not to make very large changes, and look at some of the options for tweaking the guided filter if introduced noise is excessive.

---

# module controls

## hue/saturation/brightness adjustment

The main controls of this module are the hue/saturation/brightness adjustment curves. Use these tabs to adjust the hue, saturation, or brightness of pixels based on their current hue. Click and drag on each of the nodes (up/down) to alter the properties of pixels with the given hue. You can also adjust nodes using the scroll wheel on your mouse and, as with sliders, you can change the speed of the adjustment by combining the scroll with Ctrl (to adjust more slowly) or Shift (to adjust more quickly).

You can also adjust the same values using sliders, which can be shown/hidden by middle-clicking on the curve adjustment section of the module with your mouse.

As with sliders, you can also right-click on a node/slider to perform fine adjustments (see [module controls/sliders](../../darkroom/processing-modules/module-controls.md#sliders) for more details).

Use the color picker to choose a pixel or area on the image and show the hue of that pixel/area on the adjustment curve.

node placement
: Adjust the position of all of the nodes simultaneously (move them left/right).

---

**Note**: The slider color names will not change when you move the nodes with the "node placement" slider.

---

## options

### general

white level
: Set the upper bound of brightness corrections that can be made with the module -- the module will not allow brightness of any pixels to be greater than this value. Use the picker to set based on a point/area on the image. This should usually be kept at its default value.

hue curve (_N/A for saturation/brightness curves_)
: Control how the hue adjustment curve is interpolated between nodes. Values greater than 1 make the transitions between the nodes more gradual. Values less than 1 create sharper transitions, allowing for more precise adjustments to individual hues, while affecting neighbouring areas/colors less. Be aware that lower values can increase the likelihood of introducing noise or artefacts.

### guided filter

In order to reduce the amount of noise/artefacts introduced, this module uses a guided filter by default. The guided filter attempts to smooth out changes by taking into account both the hue of the neighboring pixels and their overall saturation. This guided filter is ultimately a compromise between adjustment precision (targeting colors more specifically) and avoiding artefacts (which will generally require less precise targeting). The following options allow the guided filter to be adjusted and visualised in order to better manage these compromises:

use guided filter
: Toggle the guided filter on/off.

hue analysis radius
: Choose how much to take neighboring pixels into account when accounting for hue in the guided filter. The default value (1.5px) is a compromise intended to ensure that individual "noisy" pixels (whose color differs significantly from their neighbors) don't become more noisy as a result of any adjustments. Increase this value to smooth out any introduced noise (such as Moiré). However, be aware that very large values can cause halos and other artefacts at edges.

saturation threshold
: Since this module is intended to perform operations based on a pixel's hue, it is usually desirable to restrict its operation to only those pixels that have the highest saturation (and for it to have more of an effect on more highly-saturated pixels). The saturation threshold can be used to choose how saturated a pixel must be to be included in the mask (guided filter) for adjustment. Decrease to allow adjustment of less-saturated pixels. Increase to restrict adjustment of less-saturated pixels.

visualize weighting function (saturation)
: The first "visualization" button (to the right of the "saturation threshold" slider) can be used to see which pixels might be impacted by the operation of this module, based on their saturation, and by how much. Pixels with lower saturation, which will not be adjusted, are shown in shades of blue. Pixels with higher saturation, which might be adjusted (depending on the adjustment curves), are shown in shades of red. The more saturated the red/blue, the more/less (respectively) a pixel will be affected by any adjustment. This visualization only depends on a pixel's saturation, and will not change when you alter the hue/saturation/brightness adjustment curves. It is also affected by the "contrast" setting (below).

contrast
: Regulate the steepness of the saturation adjustment curve. This is used in conjunction with the "saturation threshold" slider to determine how much a pixel might be adjusted based on its saturation. The generated curve is shown overlaid on the image when the "visualise weighting function" button is toggled. Positive values result in a steeper transition (highly-saturated pixels are more likely to be changed, low-saturation pixels are less likely to be changed). Negative values result in a shallower transition (highly-saturated pixels are less likely to be changed, low-saturation pixels are more likely to be changed)

effect radius
: Set the radius of the applied parameters in the guided filter. Larger values will smooth the effects of any adjustments, and will better retain pre-existing detail within the image, though can cause bleeding at edges that will need to be mitigated by other means.

visualize changed output for the selected tab
: The second "visualization" button (to the right of the "effect radius" slider) can be used to visualize the overall effect of the adjustments made in the current tab, taking into account both the guided filter and the adjustment curve. Red pixels indicate where the value of the chosen adjustment (hue/saturation/brightness) has increased. Blue pixels indicate where the value of the adjustment has decreased.
