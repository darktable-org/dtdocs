---
title: refinements
id: refinement-controls
weight: 60
---

The _refinements_ section of the [mask panel](./mask-panel.md) contains sliders that further refine a mask: they select by the amount of detail, align the mask's edges with the image, blur it, or change its tonal response.

Refinements are not limited to the final mask. They act on whatever is selected in the [mask layout](./mask-panel.md#mask-layout):

- with an element selected, they refine that element alone, before it is combined with the other members of its group;
- with a group selected, they refine the group's result, after its operator has combined its members;
- with the whole mask selected (nothing else selected), they refine the final mask of the module.

This allows, for example, feathering only the drawn part of a mask while leaving its parametric part untouched, or applying the details threshold to a single branch of the mask.

Click the section header to fold or unfold it. Two buttons in the header act on the refinements of the current selection:

![bypass](./refinement-controls/icon-eye.png#icon) bypass
: Temporarily disable the refinements of the selected member, keeping their settings. Click again to enable them.

reset
: Reset the refinements of the selected member to their default values.

The following controls are available:

details threshold
: Alter the opacity of the mask based on the amount of detail in the image. Use this slider to select either areas with lots of detail (positive values) or areas that are flat and lacking in detail (negative values). The default (zero) effectively bypasses details refinement. This is mostly useful to apply sharpening and blurring effects that ignore out-of-focus (bokeh) regions or to sharpen only blurry parts, preventing over-sharpening of in-focus regions.

---

**Note:** The data used for the detail mask refinement is taken from the demosaic or rawprepare stage in the processing pipeline, not from the module's input (which is used for the other parametric mask criteria). None of the processing modules after demosaic will have any effect on the detail mask and it is not available for non-RAW images.

---

feathering guide
: Mask feathering smooths a mask such that the mask's edges automatically align with the edges of features in the image. The smoothing is guided either by the module's input or output (before blending), and may happen before or after the mask blurring, depending on what is selected in the “feathering guide” combobox. Feathering is particularly sensitive to the choice of guide image when used with edge-modifying modules (modules for sharpening or blurring an image).
: - _output before blur_: feathering is guided using the _output_ image of the module and takes place _before_ the mask is blurred
: - _input before blur_: feathering is guided using the _input_ image of the module and takes place _before_ the mask is blurred
: - _output after blur_: feathering is guided using the _output_ image of the module and takes place _after_ the mask has been blurred
: - _input after blur_: feathering is guided using the _input_ image of the module and takes place _after_ the mask has been blurred

feathering radius
: Adjust the strength of the feathering effect. Feathering works best if the mask's edges already approximately match some edges in the guiding image. The larger the “feathering radius” the better the feathering algorithm can align the mask to more distant edges. If this radius is too large, however, the feathered mask may overshoot (cover regions that the user wants to exclude). Feathering is disabled when the feathering radius is set to 0.

blurring radius
: Blurring the mask creates a softer transition between blended and unblended parts of an image and can be used to avoid artifacts. The blurring radius slider controls the radius of a gaussian blur applied to the mask. The higher the radius, the stronger the blur (set to 0 for an unblurred mask). Mask blur is always applied after feathering if both kinds of mask adjustment are activated. This allows any resulting sharp edges or artifacts to be smoothed.

mask brightness
: Feathering and blurring the mask may reduce its opacity. The “mask brightness” slider shifts the tone curve of the mask to compensate. If the brightness is decreased (negative slider values) less opaque parts are affected more strongly. Conversely, if the brightness is increased (positive slider values) more opaque parts are affected more strongly. Completely opaque portions of the mask always remain opaque and completely transparent portions always remain transparent. This is to ensure that regions that have been fully excluded from or included in a module's effect (by setting the mask's opacity to 0% or 100%) remain fully excluded or included. This slider was called "mask opacity" in darktable 5.6 and earlier.

mask contrast
: This slider increases or decreases the mask contrast. This allows you to adjust the transition between the opaque and transparent parts of the mask.

# example: feathering a drawn mask

![feathering](./refinement-controls/feathering.png#w100)

It can be rather tedious to create a drawn mask that precisely covers a particular feature in an image. In this example, we want to enhance the color contrast of the lion sculpture shown in the left image above without affecting the background.

1. The first image above shows the original, unaltered image.
2. The second image shows a rough selection of the sculpture created with a drawn shape. Note that the mask is rather fuzzy and does not precisely follow the outline of the lion sculpture.
3. The third image shows the effect of adjusting the feathering radius, mask brightness and mask contrast, leading to a well matched mask with little effort. In this example the feathering radius has been adjusted to 50 and a blur radius of 5 was chosen to smooth the mask to some degree. The mask brightness and mask contrast have been increased to 0.3 and 0.5, respectively. In other words, the drawn mask was allowed to bleed outwards by feathering it, and that bleed was then re-sharpened using the brightness and contrast sliders.
4. The final image above shows the end result, where the color enhancement (via the [_color contrast_](../../../module-reference/processing-modules/color-contrast.md) module) is restricted to only the lion sculpture.

Mask feathering works particularly well in this example because the sculpture is well separated from the out-of-focus background. The distinct edge at the border of the sculpture guides the feathering mask adjustment to match the shape of the sculpture.

# display and comparison

The buttons to display the mask as a yellow overlay (![display mask](./refinement-controls/icon-mask.png#icon)) and to temporarily switch it off (![eye icon](./refinement-controls/icon-eye.png#icon)) are located in the [panel header](./mask-panel.md#panel-header) of the mask panel. To see the contribution of a single element or group, _solo_ it by Shift+clicking its eye in the mask layout, and display the mask.
