---
title: shortcuts
id: shortcuts
weight: 120
draft: false
---

Much of the functionality of darktable can be accessed via shortcuts using the keyboard or keyboard/mouse combinations. These shortcuts are user-configurable via the _shortcuts_ tab. 

Many of the key shortcuts are provided with default values but most must be configured by the user. Any key may be used for a keyboard shortcut, and may be modified with one or more of `Shift`, `Control` or `Alt`.

When you open the _shortcuts_ tab you are initially presented with a hierarchical list of all actions that can receive a keyboard shortcut. 

# add or amend a shortcut

In order to add or amend a shortcut, first navigate to the action you want to change and double-click on it. You will be prompted to press the new key combination to be mapped to the selected action. 

If a conflict is found you will be given the option to retain the existing shortcut or replace it. Depending on context, it is possible to use the same keyboard shortcut for multiple actions. For example the same key combination may be used for one action in the lighttable view and another in the darkroom view.

# remove a shortcut

To remove a keyboard shortcut, single-click on the action you wish to remove and press the backspace key.

# search for a shortcut action

A search field is shown at the bottom of the _shortcuts_ tab. Enter the text you wish to search for and press `Enter` or click the _search_ button. Press `Enter` or _search_ multiple times to cycle through all matching actions.

# view currently assigned shortcuts

Press the `H` key in any darktable view to show a list of all shortcuts that are applicable to the current view. This shortcut is itself amendable in the _global_ section of the _shortcuts_ tab.

# import, export, reset

You can export your shortcut mappings to or import them from a file.

Press the “default” button to reset all shortcuts to their default state. _Take care when using this option as it is not possible to restore back to a previous state unless you have first exported existing shortcuts to a file._

# shortcut categories

Keyboard shortcuts are categorized so that they can easily be found. The following sections summarize these categories and also list some additional options that are specific to certain categories.

## global

Shortcuts in this section are applicable to all darktable views.

## views

A single section is provided for each darktable view. Shortcuts are only applicable to the selected view.

## processing modules ('image operations') 

Shortcuts in the _image operations_ section of this tab are only applicable to the [processing modules](../module-reference/processing-modules/_index.md) in the darktable view. A section is provided for each processing module.

### common shortcuts

Every processing module provides the following shortcuts by default

enable module
: enable or disable the module, regardless of whether it is currently visible

show module
: expand or collapse the module. If the module is not currently displayed on the screen, darktable will switch to an appropriate module group (if applicable) before displaying it

focus module
: cause the module to receive or lose focus.

reset module parameters
: reset the module to its default state

show preset menu
: show the presets menu for the module

Shortcuts may be present for any module operation. For comboboxes and sliders, some standard shortcuts are available, as described in the following sections.

### sliders

All sliders in processing modules can be edited via keyboard shortcuts (regardless of whether the module is currently shown or enabled). The following actions are provided for each slider:

increase/decrease
: separate shortcuts which allow you to increase or decrease the slider by a single step

dynamic
: a single shortcut that can be used in combination with the mouse scroll wheel to increase and decrease slider values

edit
: a shortcut to bring up the slider edit dialog within which you may key a value directly or modify the slider with the mouse

reset
: reset the slider to its default value

In addition, you can modify the coarseness of the increase/decrease operations with a _global_ keyboard shortcut. You can choose between fine, normal and coarse.

When performing increase/decrease and dynamic operations on sliders, if the module is not currently shown, a toast message will appear over the image to indicate the current value of the slider.

### comboboxes

As with sliders, all comboboxes in processing modules can be edited via keyboard shortcuts. The following actions are provided for each combobox:

next/previous
: separate shortcuts which allow you to change to the next or previous entry in the combobox

dynamic
: a single shortcut that can be used in combination with the mouse scroll wheel to change to the next/previous entry in the combobox

If the end of the list of combobox values is reached, these shortcuts will cycle back to the beginning of the list. Similarly, if the beginning of values is reached the shortcuts will cycle to the end. 

### handling multiple module instances

It is possible to create multiple instances of many processing modules. In this scenario it is not always obvious which instance should be controlled by keyboard shortcut operations.

See [`preferences` -> `miscellaneous`](./miscellaneous.md) for some additional settings that allow you to control how keyboard shortcuts are handled when multiple instances of an image operations module are present.

## (utility) modules

Shortcuts in the _modules_ section apply to [utility modules](../module-reference/utility-modules/_index.md) only. These are modules that are not used for image processing and may appear on either the left or right panel. Some utility modules can be used in multiple views.

As with processing modules, some shortcuts are provided by default for each module:

show module
: expands or collapses the module

reset module parameters
: resets the module to its default state

show preset menu
: shows the presets menu for the module

Some of the above options may not be applicable to all modules.
