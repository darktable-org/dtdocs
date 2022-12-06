---
title: multiple instances
id: mutiple-instances
weight: 20
draft: false
---

Many of Ansel's modules can be applied more than once in the pixelpipe. Each instance of a module behaves independently, taking its input from the module below it in the pixelpipe and delivering its output to the next module.

As with the base instance of a module, all instances can be moved independently within the pixelpipe either by holding Ctrl+Shift while dragging & dropping or by choosing "move up" or "move down" in the _multiple instances_ drop-down menu.

Instances can be renamed by Ctrl+clicking on the module name.

## typical use cases

There are many occasions where it makes sense to have a module apply more than once in the pixelpipe. Here are some typical use cases.

 - The [_exposure_](../../../module-reference/processing-modules/exposure.md) module can be used in combination with [masks](../masking-and-blending/masks/_index.md) to lighten or darken parts of an image. A separate instance may be created to modify each masked region of the image.
- You may wish to handle luma and chroma noise independently. This can be accomplished by generating two instances of your chosen denoising module and using the first one only on luma (by selecting [blend mode](../masking-and-blending/blend-modes.md) “lightness”) and the second one only on chroma (by selecting blend mode “color”).

---

**Note:** Each instance also adds to the workload of your pixelpipe. Generating too many instances – especially of the more demanding modules – will cause noticeable slow-down.

---

## managing multiple instances

Click on the _multiple instance menu_ in the [module header](./module-header.md) to display a menu with the following options. Right-click on the menu icon to create a new instance directly (same action as clicking on the "new instance" option of the menu).

new instance
: Create a new instance of the current module with all of its parameters reset to their default values. The 'instance name' is automatically set to a unique integer so that it can be distinguished from its parent.

duplicate instance
: Create a new instance of the current module with all of its parameters inherited from the current instance. As with 'new instance' the 'instance name' is automatically set to a unique integer.

move up/down
: Move the instance up or down in the pixelpipe

delete
: Remove the current instance. This option is not available if only one instance is present.

rename
: Rename the current instance. See the [history stack](../../../module-reference/utility-modules/lighttable/history-stack.md) section for more details on how the instance name impacts copying and pasting history stacks.
