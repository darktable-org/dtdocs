---
title: module header
id: module-header
weight: 10
draft: false
---

At the top of each image operation module is the _module header_. 

**IMAGE HERE**

`Click` on the module header to expand the module and display the parameters that control its operation.

By default darktable will only allow one processing module to be expanded at a time. If you `click` the header of another module, the previous module controls are collapsed. If you want to see more than one module expanded, you may expand further modules with `Shift+click`: all previously expanded modules will remain open. The header bar behavior on `click` and `Shift+click`, is controlled by a setting in [`preferences` -> `darkroom`](../../../preferences-settings/darkroom.md).

_N.B. Expanding a module does not activate it. See below_

The module header contains the following controls in order from left to right:

on/off button
: `Click` to toggle the module on or off. Some modules are essential for image processing and cannot be disabled (though their parameters may be amended).
: `Ctrl+click` to toggle whether the module has focus. The focus state is usually used to activate any overlays that a module places over the image to control its functionality (for example, the [_crop & rotate_](../../../module-reference/processing-modules/crop-rotate.md) module only shows the guide lines on the image if it has focus). 

module name
: The module name consists of a description of the module's operation (which cannot be changed) and the module's instance name (which can). By default each module's instance name is blank. If you create additional instances, the name of each new instance is initiated with an integer. 
: `Ctrl+click` on the module name to manually amend the instance name. This name is appended to the modules operation description.

multiple instance menu
: This drop-down menu allows you to create, delete, move and rename module instances. `Middle-click` on this icon to directly create a new instance of the module. See the [multiple instances](./multiple-instances.md) section for more information.

reset parameters
: `Click` to reset all parameters within the module to their default values

presets menu
: This menu allows you to apply, create and edit module presets. See the [presets](./presets.md) section for more information.
