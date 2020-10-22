---
title: shortcuts
id: shortcuts
weight: 120
draft: false
---

Much of the functionality of darktable can be accessed via shortcuts using the keyboard or keyboard/mouse combinations. These shortcuts are user-configurable via the _shortcuts_ tab. 

Many important shortcut actions are provided with default key combinations, but most must be manually configured by the user. Any key may be used for a keyboard shortcut, and may be combined with the `Shift`, `Control` or `Alt` modifier keys (or any combination thereof).

When you open the _shortcuts_ tab you are initially presented with a hierarchical list of all actions that can be applied with a keyboard shortcut. At the top of this hierarchy is a short list of key _categories_ which are defined below.

# add or amend a shortcut

In order to add or amend a shortcut, first navigate to the action you want to change and double-click on it. You will be prompted to press the new key combination to be mapped to the selected action. 

If a conflict is found you will be given the option to retain the existing shortcut or replace it. Depending on context, it is possible to use the same keyboard shortcut for multiple actions. For example the same key combination may be used for one action in the lighttable view and another in the darkroom view.

# remove a shortcut

To remove a keyboard shortcut, single-click on the action you wish to remove it from and press the `backspace` key.

# search for a shortcut action

A search field is shown at the bottom of the _shortcuts_ tab. Enter the text you wish to search for and press `Enter` or click the `search` button. Press `Enter` or `search` multiple times to cycle through all matching shortcut actions.

# view currently assigned shortcuts

Press the `H` key in any darktable view to show a list of all shortcuts that are assigned for the current view.

# import, export, reset

You can import your shortcut mappings from or export them to a file.

Press the “`default`” button to reset all shortcuts to their default state. _Take care when using this option as it is not possible to restore back to a previous state unless you have first exported existing shortcuts to a file or taken a backup of your configuration directory._

# shortcut categories

Keyboard shortcuts are categorized within a hierarchical list so that they can easily be found. The following sections summarize these categories and list some common options.

## global

Shortcut actions in this section are applicable to all darktable views.

## views

A single section is provided for each darktable view. Shortcut actions are only applicable to the selected view.

## processing modules

Shortcut actions for the [processing modules](../module-reference/processing-modules/_index.md) in the darktable view. A section is provided for each processing module.

### common shortcuts

Every processing module provides the following shortcut actions by default

enable module
: Enable or disable the module, regardless of whether it is currently visible

show module
: Expand or collapse the module. If the module is not currently displayed on the screen, darktable will switch to an appropriate module group (if applicable) before displaying it

focus module
: Cause the module to receive or lose focus.

reset module parameters
: Reset the module to its default state

show preset menu
: Show the presets menu for the module

For comboboxes and sliders, some standard shortcut actions are provided, as described in the following sections.

In addition, other module-specific controls will be provided with their own shortcut actions.

### sliders

All sliders in processing modules can be adjusted via keyboard shortcuts, regardless of whether the module is currently shown or enabled. The following shortcut actions are provided as standard for each slider:

increase/decrease
: Separate shortcuts which allow you to increase or decrease the slider's value by a single step.

dynamic
: A single shortcut that can be used in combination with the mouse scroll wheel to increase and decrease slider values.

edit
: A shortcut to bring up the slider's edit dialog within which you may key a value directly or modify the slider with the mouse.

reset
: Reset the slider to its default value.

In addition, you can modify the coarseness of the increase/decrease operations with a _global_ keyboard shortcut. You can choose between fine, normal and coarse (see [module controls](../darkroom/interacting-with-modules/module-controls.md) for more details).

When performing increase/decrease and dynamic operations on sliders, if the module is not currently expanded, a toast message will appear at the top of the image to indicate the current value of the slider.

### comboboxes

As with sliders, all comboboxes in processing modules can be adjusted via keyboard shortcuts. The following shortcut actions are provided as standard for each combobox:

next/previous
: Separate shortcuts which allow you to change to the next or previous entry in the combobox

dynamic
: A single shortcut that can be used in combination with the mouse scroll wheel to change to the next/previous entry in the combobox

If the end of a combobox list is reached, these shortcuts will cycle back to the beginning of the list. Similarly, if the beginning of the list is reached the shortcuts will cycle to the end. 

### multiple module instances

It is possible to create [multiple instances](../darkroom/interacting-with-modules/multiple-instances.md) of many processing modules. In this scenario it is not always obvious which instance should be controlled by keyboard shortcut operations.

See [`preferences > miscellaneous`](./miscellaneous.md) for some additional settings that allow you to control how keyboard shortcuts are handled when multiple instances of a processing module are present.

## utility modules

Shortcut actions for the [utility modules](../module-reference/utility-modules/_index.md). These are modules that are not used for image processing and may appear on any panel. Some utility modules can be used in multiple views.

As with processing modules, some shortcut actions are provided by default for each module:

show module
: Expand or collapse the module.

reset module parameters
: Reset the module to its default state.

show preset menu
: Show the presets menu for the module.

Some of the above actions may not be available for all utility modules.
