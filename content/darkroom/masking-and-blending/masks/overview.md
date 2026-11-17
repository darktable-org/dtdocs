---
title: overview
id: overview
weight: 10
---

Masks allow you to limit the effect of a module so that it only applies to certain parts of the image.

A mask can be regarded as a grayscale image where each pixel has a value between 0 and 1.0 (or between 0% and 100%). This value is the _opacity_ and is used to determine how much a module affects each pixel. Where the mask is 0 the module has no effect; where it is 1.0 the module has its full effect.

---

**Note:** The masking system was redesigned after darktable 5.6. If you are familiar with the drawn, parametric and raster mask modes and the mask manager, read [migrating from classic masks](./migration.md) first.

---

# building blocks

Every mask in darktable is built from the same few pieces.

element
: A single source of opacity. There are four kinds of elements:
: - a [drawn shape](./drawn.md) -- a brush stroke, circle, ellipse, path or gradient drawn on the image;
: - a [parametric element](./parametric.md) -- a range of values of one color channel (for example a range of luminance or of hue);
: - a [raster mask](./raster.md) -- the final mask of another module, earlier in the pixelpipe;
: - an [AI object](./ai-masking.md) -- an object selected by clicking on it, with the help of an AI model.

group
: A container that combines its _members_ (elements and other groups) into one mask, using a single _operator_ (for example union, intersection or difference). Groups can be nested inside other groups, up to eight levels deep.

operator
: How a group combines its members. A group applies its operator to its members starting from the bottom one and working upwards, in the same way as modules are applied in the pixelpipe. See [groups & operators](./groups-and-operators.md).

whole mask
: The group at the top of the tree. It holds everything else, and its result is the module's mask. The whole mask is a group like any other: it has an operator, an opacity, and can be inverted and refined.

So a mask is a tree: elements are its leaves, groups are its branches and the whole mask is its root. Each kind of element can be combined with any other, in any group, with any operator.

# what each level can do

Every element and every group has the same set of controls, which are applied in order before the result is passed to the group above:

1. _refinements_ -- details threshold, feathering, blur, brightness and contrast (see [refinements](./refinement-controls.md)).
2. _invert_ -- select what was left out, and vice versa.
3. _opacity_ -- scale the result. A member at 50% opacity counts half as much in its group. The opacity of a group multiplies the opacities of its members.

In addition, any member can be temporarily _disabled_ (it then contributes nothing) or _soloed_ (it is then the only thing that contributes to the mask).

Finally, the whole mask is applied together with the [blend mode and the global opacity](../overview.md) of the module.

![how a mask is evaluated](./overview/information-flow.png#w75)

1. Each element produces its own opacity values, which are refined, optionally inverted and scaled by the element's opacity. Elements are shown here with a drawn shape, a parametric range, a raster mask and a second drawn shape.
2. A group combines its members with its operator. It then refines, inverts and scales the result, as an element does, before handing it on.
3. The whole mask is a group like any other. Here it combines the result of the group from step 2 with a further element.
4. The mask is scaled by the global opacity of the module and used to blend the module's output (at the bottom) over its input (at the top), using the chosen blend mode.

# a first mask

The quickest way to see how this works:

1. Expand a module that supports masks (for example [_exposure_](../../../module-reference/processing-modules/exposure.md)).
2. In the [mask panel](./mask-panel.md) at the bottom of the module, click the ![mask on/off](./mask-panel/icon-mask-toggle.png#icon) toggle to switch the mask on. The mask starts with the _default layout_ -- a single group (the whole mask) ready to receive shapes.
3. Click a shape button in the toolbar (for example the ellipse) and click on the image to place it. The module is now applied only inside the ellipse.
4. Click a parametric channel button (for example _Jz_ or _L_) to add a luminance element and narrow its range with the sliders in the _controls_ section.
5. The new channel was added to the same group as the ellipse. Change the group's operator to decide how the two combine: _union_ applies the module inside the ellipse _or_ to the selected tones; _intersection_ applies it only to the selected tones _inside_ the ellipse.

[Groups & operators](./groups-and-operators.md) explains how to plan and read more complex masks.

# reusing masks

Masks can be shared between modules in several ways:

- Drawn shapes and AI objects can be _linked_ into the mask of another module (editing one changes it everywhere) or _copied_ (independent copies) -- see [drawn shapes: reusing shapes](./drawn.md#reusing-shapes).
- Parametric elements can be copied from another module that uses the same blend colorspace -- see [parametric elements](./parametric.md#reusing-parametric-elements).
- The final mask of any active module can be used, as a [raster mask](./raster.md), by any module later in the pixelpipe.
- The _layout_ of a mask (its groups and operators, without elements) can be saved as a [group layout preset](./layout-presets.md) and applied in any module.

Modules can also be copied with their masks, and stored in [styles](../../../module-reference/utility-modules/shared/styles.md) and [presets](../../processing-modules/presets.md); their shapes are saved with them (see [presets and masks](../../processing-modules/presets.md#presets-and-masks)). A [locked](./mask-panel.md#panel-header) mask is kept as it is when a module is reset, or when a preset, a style or pasted parameters are applied to it.
