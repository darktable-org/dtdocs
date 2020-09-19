---
title: multiple instances
id: mutiple-instances
weight: 20
draft: false
---

Many of darktable's modules can be applied more than once in the pixelpipe. Each instance of a module behaves like any other module, taking its input from the module below in the pixelpipe delivering its output to the module above.

As with the base instance of a module, all instances can be moved independently within the pixelpipe either by holding `Ctrl+Shift` while dragging & dropping or by choosing "move up" or "move down" in the _multiple instances_ drop-down menu.

Instances can be renamed with `Ctrl+click` on the module header.

# typical use cases

There are many occasions where it makes sense to have an operation act more than once in the pixelpipe. Here are some typical use cases.

 - The [_exposure_](../../../module-reference/processing-modules/exposure.md) module can be used in combination with with [masks](../masking-and-blending/masks/_index.md) to lighten or darken parts of an image. A separate instance may be created to modify each part of the image.
- You may wish to apply a denoising module like [_denoise (profiled)_](../../../module-reference/processing-modules/denoise-profiled.md) with two different parameter sets: one for luma denoising and another for chroma denoising. This can be accomplished by generating two module instances and using the first one only on luma (by selecting [blend mode](../masking-and-blending/blend-modes.md) “lightness”) and the second one only on chroma (by selecting blend mode “color”).

Please note that each instance also adds to the workload of your pixelpipe. Generating too many instances – especially of the more demanding modules – will cause noticeable slow-down.

# managing multiple instances

_Click_ on the _multiple instance menu_ in the [module header](./module-header.md) to display a drop-down menu, with the following options.

new instance
: Create a new instance of the current module with all of its parameters reset to default. The 'instance name' is automatically set to a unique integer so that it can be distinguished from its parent. This name can be changed (see below).

duplicate instance
: Create a new instance of the current module with all of its parameters inherited from its parent. As with 'new instance' the 'instance name' is automatically set to a unique integer.

move up/down
: Move the instance up or down in the pixelpipe

delete
: Remove the current instance. This option is not available if only one instance is present.

rename
: Rename the current instance. See the [history stack](../../../module-reference/utility-modules/lighttable/history-stack.md) section for more details on how the instance name impacts copying and pasting history stacks.
