---
title: module header
id: module-header
weight: 10
draft: false
---

At the top of each image operation module is the _module header_. 

![module header](./module-header/module-header.png#w25)

`Click` on the module name to expand the module and display the parameters that control its operation.

By default darktable will only allow one processing module to be expanded at a time -- if you `click` the header of another module, the previously-opened module's controls are collapsed. If you want expand more than one module, you may expand further modules with `Shift+click` and all previously expanded modules will remain open. This behaviour can be reversed via a setting in [`preferences > darkroom`](../../../preferences-settings/darkroom.md).

---

**Note:** Expanding a module does not cause it to be activated. See below for how to activate modules.

---

The module header contains the following controls in order from left to right:

on/off button
: `Click` to toggle the module on or off. Some modules are essential for image processing and cannot be disabled (though their parameters may be amended). Similarly, some modules are not applicable for certain types of image and cannot be enabled.

: `Ctrl+click` on the on/off button to toggle whether the module has focus. The focus state is usually used to activate any overlays that a module places over the image to control its functionality. For example, the [_crop & rotate_](../../../module-reference/processing-modules/crop-rotate.md) module only shows the composition and crop guide lines on the image if it has focus. 

module name
: The module name consists of a description of the module's operation (which cannot be changed) followed by the module's instance name (which can). By default the first instance of a module has an empty instance name. If you create additional instances, the name of each new instance is initiated with unique integer. For example, the second created instance of an exposure module will be automatically named `"exposure 1"`.

: `Ctrl+click` on a module's name to manually amend its instance name. 

multiple instance menu
: This drop-down menu allows you to create, delete, move and rename module instances. `Middle-click` on this icon to directly create a new instance of the module. See the [multiple instances](./multiple-instances.md) section for more information.

reset parameters
: `Click` to reset all parameters within the module to their default values

presets menu
: This menu allows you to apply, create and edit module presets. See the [presets](./presets.md) section for more information.

The visibility of the three icons to the right of the module name can be controlled through [`preferences > darkroom > show right-side buttons in darkroom module headers`](../../preferences-settings/darkroom.md).
