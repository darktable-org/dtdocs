---
title: Module Header
id: module-header
weight: 10
draft: false
---

At the top of each image operation module is the _module header_. 

**IMAGE HERE**

_Click_ on the module header to expand the module and display the parameters that control its operation.

By default darktable will only allow one image operation module to be expanded at a time. If you click the header of another module, the previous module controls are collapsed. If you want to see more than one module expanded, you may expand further modules with _Shift+click_: all previously expanded modules will remain open. The header bar behavior on _click_ and _Shift+click_, is controlled by a setting in the _darkroom_ tab of the _preferences_ dialog.

_N.B. Expanding a module does not activate it. See below_

The module header contains the following controls in order from left to right:

on/off button
: _Click_ to toggle the module on or off. Some modules are essential for image processing and cannot be disabled (though their parameters may be amended).
: _Ctrl+click_ to toggle whether the module has focus. The focus state is usually used to activate any overlays that a module places over the image to control its functionality (e.g. _crop & rotate_ controls). 

module name
: The module name consists of a description of the module's operation (which cannot be changed) and the module's instance name (which can). By default each module's instance name is blank. If you create additional instances, the name of each new instance is initiated with an integer. 
: _Ctrl+click_ on the module name to manually amend the instance name. This name is appended to the modules operation description.

multiple instance menu
: This drop-down menu allows you to create, delete, move and rename module instances. _Middle-click_ on this icon to directly create a new instance of the module. See the _multiple instances_ section for more details of the items available in this menu.

reset parameters
: _Click_ to reset all parameters within the module to their default values

presets menu
: This menu allows you to apply, create and edit module presets. See the _module presets_ section for more details of the items available in this menu.
