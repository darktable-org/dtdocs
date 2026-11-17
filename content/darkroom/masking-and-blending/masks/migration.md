---
title: migrating from classic masks
id: migration
weight: 80
include_toc: true
---

The masking system of darktable was redesigned after version 5.6. This section is for users who know the previous ("classic") system. It explains what happens to existing edits and how familiar workflows translate to the [mask panel](./mask-panel.md).

# what changed

In darktable 5.6 and earlier, each module offered one of six mask modes -- off, uniformly, drawn mask, parametric mask, drawn & parametric mask, and raster mask -- each with its own controls. Drawn shapes were combined in an ordered list, where each shape had its own set operator, and were arranged in a separate utility module, the _mask manager_. Parametric channels could only be multiplied together, drawn and parametric masks could only be combined in one fixed way, and a raster mask replaced the module's mask entirely.

The new system replaces all of these with a single model, edited in a single panel:

- A module's mask is a tree of [groups](./groups-and-operators.md). Drawn shapes, parametric channels, raster masks and AI objects are all _elements_ that can be placed in any group and combined with any other element.
- Each group combines its members with one operator. In the classic system, the operator belonged to each _shape_ (how it changed the result of the shapes below it); it now belongs to the _group_ (how all of its members combine).
- Every element and every group has its own opacity, inversion and [refinements](./refinement-controls.md), and can be disabled, soloed and renamed.
- The mask manager has been removed: everything it did is done in the mask panel.

The following are now possible, and were not before:

- combining drawn shapes and parametric elements with any operator -- for example, a _union_ of a shape and a range of colors, or a range of colors _minus_ a drawn area;
- using the same channel several times, for example to select two separate ranges of hue in one module;
- combining a raster mask with shapes, parametric elements or other raster masks;
- refining (feathering, blurring...) individual elements or groups rather than only the final mask;
- softer combinations of feathered shapes (_screen_), and partial subtractions (a member with reduced opacity in a _difference_ group);
- temporarily disabling or soloing part of a mask, and locking a mask against changes.

# what happens to existing edits

When an image edited with darktable 5.6 or earlier is opened, its masks are converted automatically to the new format, and look exactly as before. This also happens when styles and presets created with older versions are applied, and when such history stacks are pasted.

The conversion translates each classic mask into an equivalent layout:

| classic mask | converted to |
|---|---|
| off | mask off |
| uniformly | mask on, with no elements (uniform blending) |
| drawn mask | the same shapes. Where shapes used different set operators, consecutive shapes with the same operator are put into a group with that operator, so that the result is unchanged. The drawn mask polarity becomes the _invert_ of the whole mask |
| parametric mask | a group with the _product (smooth intersection)_ operator, holding one parametric element for each channel that was used. The "combine masks" setting and the polarity of each channel are converted to the inversion of the elements and of the group |
| drawn & parametric mask | a _product (smooth intersection)_ group holding the parametric elements and the group of drawn shapes, with polarities and the "combine masks" setting converted as above |
| raster mask | a group holding a raster mask element, reading from the same module. The raster mask polarity becomes the _invert_ of the element |

Some classic settings produced a mask that did not depend on the image at all (for example, a parametric mask set up so that it selected everything or nothing). Such masks are converted to uniform blending, with an opacity of 0 where the classic mask was empty. In a few other unusual cases, the conversion keeps a shape at 0% opacity rather than deleting it, so that you can still see it in the mask layout.

The refinement settings (details threshold, feathering, blur, brightness and contrast) are kept and apply to the whole mask, as before.

---

**Important:** The conversion is one way. Once an edit has been saved by the new version of darktable, older versions cannot read its masks: darktable 5.6 and earlier report a mask version mismatch and drop **every** mask of that image. If you may still want to open your edits with an older version, back up your library database and XMP sidecar files first.

---

# how workflows translate

## the mask modes

| in darktable 5.6 and earlier | now |
|---|---|
| choose the "off" mode | switch the mask off with the ![mask on/off](./migration/icon-mask-toggle.png#icon) toggle in the [panel header](./mask-panel.md#panel-header) |
| choose the "uniformly" mode | switch the mask on, and leave it empty |
| choose "drawn", "parametric" or "drawn & parametric" | switch the mask on, then add shapes or parametric elements from the [toolbar](./mask-panel.md#toolbar). To start from a familiar arrangement, choose one of the _classic_ [group layout presets](./layout-presets.md), or set one as the default layout for new masks |
| choose "raster mask", then the module | switch the mask on, then use [import](./mask-panel.md#toolbar) > _add raster mask_ |
| blending options menu (blend colorspace, show output channels) | right-click the mask toggle for the [mask options](./mask-panel.md#mask-options) (blend colorspace); show the output slider of a parametric element with the toggle in the controls header |

## drawn masks

| in darktable 5.6 and earlier | now |
|---|---|
| click a shape icon below the module and draw | click a shape button in the [toolbar](./mask-panel.md#toolbar) and draw. The shape goes into the selected group |
| "show and edit mask elements" button | ![edit on canvas](./migration/icon-edit-on-canvas.png#icon) _edit on canvas_ in the panel header (Ctrl+click for restricted mode, as before) |
| drawn mask polarity (+/-) | invert the group that holds the shapes (or the whole mask) |
| right-click a shape in the mask manager > _mode_ (union, intersection, difference, exclusion, sum) | put the shape in a group with the corresponding [operator](./groups-and-operators.md#operators): select it and use [restructure](./mask-panel.md#selection-caption) > _wrap in group_ or _compose_, or drag it into an existing group |
| _use inverted shape_ | the ![invert](./migration/icon-invert.png#icon) invert button on the shape's row |
| _move up_ / _move down_ | drag the row |
| _group the forms_ | select the shapes (Ctrl+click) and use _group together..._ |
| _add existing shape_ | [import](./mask-panel.md#toolbar) > _link shapes_ |
| _use same shapes as_ | [import](./mask-panel.md#toolbar) > _link shapes_ (to share the shapes) or _copy shapes_ (for independent copies) |
| _delete unused shapes_ | [import](./mask-panel.md#toolbar) > _clean up unused shapes_ |
| rename a shape in the mask manager | Alt+click its row (Ctrl+click on macOS) |
| shape properties (size, feather, opacity...) in the mask manager | select the shape: its settings are in the [controls](./mask-panel.md#controls) section |
| pen pressure and smoothing settings in the mask manager | shown in the controls section while a brush stroke is being drawn |

## parametric masks

| in darktable 5.6 and earlier | now |
|---|---|
| select a channel tab and move its sliders | click the channel's button in the toolbar to add an element, and move its sliders in the [controls](./mask-panel.md#controls) section |
| several channels, multiplied together | several elements in a group with the _product (smooth intersection)_ operator, as in the "parametric (classic)" layout. _minimum (intersection)_ gives a similar result with harder transitions |
| polarity button (+/-) of a channel | the invert button of the element |
| "invert all channel's polarities" | Shift+click the invert button of the group |
| invert button above the sliders | the invert button of the group |
| reset button above the sliders | double-click the slider, or delete the element |
| press C over a slider to display the channel | rest the pointer on the channel's button in the toolbar, or Shift+click it to keep the preview on |
| press M over a slider to display the mask, A for log/linear | unchanged |
| "combine masks: exclusive" | a group with an intersection operator (_product_ or _minimum_) |
| "combine masks: inclusive" | a group with a union operator. _screen (smooth union)_ is exactly what inclusive mode computed; _maximum (union)_ usually gives cleaner transitions |
| "... & inverted" modes | invert the group |

## raster masks and refinements

| in darktable 5.6 and earlier | now |
|---|---|
| raster mask drop-down | [import](./mask-panel.md#toolbar) > _add raster mask_. The raster mask can now be combined with other elements |
| raster mask polarity | the invert button of the raster mask element |
| refinement sliders at the bottom of the blending section | the [refinements](./refinement-controls.md) section, which acts on the selected element or group, or on the whole mask when nothing is selected |
| "mask opacity" refinement slider | "mask brightness" (same effect) |
| display mask and temporarily switch off mask buttons | in the [panel header](./mask-panel.md#panel-header) |

## preferences and shortcuts

- _scroll down to increase mask parameters_ and _show mask indicator in module headers_ are no longer in the preferences dialog: they are in the [mask options](./mask-panel.md#mask-options) of the mask panel.
- The settings of the path _shrink or grow_ slider are in a popover opened with the gear next to the slider (see [drawn shapes](./drawn.md#shape-controls)).
- Shortcuts that were assigned to mask manager actions are re-assigned to the equivalent actions of the mask panel automatically. See [shortcuts](./mask-panel.md#shortcuts) for the list of mask panel actions.

# a new way to think about masks

The main difference to get used to is where the operator lives. In the classic mask manager, a list of shapes such as

```
circle 1
path 1 (difference)
circle 2 (union)
```

meant "start with _circle 1_, then subtract _path 1_ from it, then add _circle 2_ to the result". In the new system, each group has one operator, so the same mask is written with a group for each step:

```
whole mask: maximum (union)
├ circle 2
└ circle 1 without path 1: difference
  ├ path 1
  └ circle 1
```

This is the structure that the automatic conversion produces (with generic group names). It is more explicit, and it makes masks easier to read and to change. For example, to subtract _path 1_ from both circles rather than from the first one only, wrap _circle 1_ in a new _maximum (union)_ group (with [restructure](./mask-panel.md#selection-caption) > _wrap in group_) and drag _circle 2_ into it: the _difference_ group then reads "the union of both circles, minus _path 1_". See [groups & operators](./groups-and-operators.md) for a step-by-step guide to designing masks this way.
