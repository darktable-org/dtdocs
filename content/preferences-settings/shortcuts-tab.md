---
title: Preferences - shortcuts tab
date: 2020-09-09
draft: false
---

Much of the functionality of darktable can be accessed via shortcuts using the keyboard or keyboard/mouse combinations. These shortcuts are user-configurable via the *shortcuts* tab of the *preferences* dialog. Many of the key shortcuts are provided with default values but most must be configured by the user. Any key may be used for a keyboard shortcut, and may be modified with one or more of *shift*, *control* or *alt*.

When you open the *shortcuts* tab you are presented with a hierarchical list of all actions that can receive a keyboard shortcut. 

## Adjusting Keyboard Shortcuts

### Adding/Amending Shortcuts

In order to add or amend shortcut, first navigate to the action you want to change and double-click on it. You will be prompted to press the new key combination to be mapped to the selected action. 

If a conflict is found you will be given the option to retain the existing shortcut or replace it. Depending on context, it is possible to use the same keyboard shortcut for multiple actions. For example the same key combination may be used for one action in the lighttable view and another in the darkroom view.

### Removing Shortcuts

To remove a keyboard shortcut, single-click on the action you wish to remove and press the backspace key.

### Searching for Shortcuts

A search field is shown at the bottom of the *shortcuts* tab. Enter the text you wish to search for and press *enter* or click the *search* button. Pressing *enter* or *search* multiple times will cycle through all matching actions.

## Viewing Current Shortcuts

Pressing the 'h' button in any darktable view will show a list of all shortcuts that are applicable to the current view. This shortcut is itself amendable in the *global* section of the *shortcuts* tab.

## Import, Export, Reset

You can export your shortcut mappings to a file or import from a file.

Press “default” to reset all shortcuts to their default state. Take care when using this option as it is not possible to restore back to a previous state unless you have first exported existing shortcuts to a file.

## Shortcut Categories

Keyboard shortcuts are categorized so that they can easily be found. The following sections summarize these categories and also list some additional options that are specific to certain categories.

### global

Shortcuts in this section are applicable to all darktable views.

### views

A single section is provided for each darktable view. Shortcuts are only applicable to the selected view.

### image operations

Shortcuts in this section are only applicable to the 'image operations' modules in the darktable view (i.e. those modules to the right of the edited image below the histogram and above the 'module order' module). A section is provided for each image operation module.

#### common shortcuts

Every image operation module provides the following shortcuts by default

* **enable module**: enable or disable the module, regardless of whether it is currently visible
* **show module**: expand or collapse the module. If the module is not currently displayed on the screen, darktable will switch to an appropriate module group (if applicable) before displaying it
* **focus module**: cause the module to receive or lose focus.
* **reset module parameters**: reset the module to its default state
* **show preset menu**: show the presets menu for the module

Shortcuts may be present for any module operation. For comboboxes and sliders, some standard shortcuts are available, as described in the following sections.

#### sliders

All sliders in image operation modules can be edited via keyboard shortcuts (regardless of whether the module is currently shown or enabled). The following actions are provided:

* **increase/decrease**: separate shortcuts which allow you to increase or decrease the slider by a single step
* **dynamic**: a single shortcut that can be used in combination with the mouse scroll wheel to increase and decrease slider values
* **edit**: a shortcut to bring up the slider edit dialog within which you may key a value directly or modify the slider with the mouse
* **reset**: reset the slider to its default value

In addition, it is possible to modify the coarseness of the increase/decrease operations with a *global* keyboard shortcut. You can choose between fine, normal and coarse.

When performing increase/decrease and dynamic operations on sliders, if the module is not currently shown, a toast message will appear over the image to indicate the current value of the slider.

#### comboboxes

As with sliders, all comboboxes in image operation modules can be edited via keyboard shortcuts. The following actions are provided:

* **next/previous**: separate shortcuts which allow you to change to the next or previous entry in the combobox
* **dynamic**: a single shortcut that can be used in combination with the mouse scroll wheel to change to the next/previous entry in the combobox

If the end of the combobox values is reached, these shortcuts will cycle back to the beginning of the list. Similarly, if the beginning of values is reached it will cycle to the end. 

#### handling multiple module instances

It is possible to create multiple instances of many image operations modules. In this scenario it is not always obvious which instance should be controlled by keyboard shortcut operations.

See the _handling multiple module instances_ section of the _miscellaneous_ tab in the _preferences_ dialog for some additional settings that allow you to control how keyboard shortcuts are used when multiple instances of an image operations module exist.

### (lib) modules

Shortcuts in the *modules* section apply to what are known as *library (or lib) modules*. These are modules that are not used for image operations, may appear on either side of the screen and may apply to one or more views.

As with image operation modules, some shortcuts are provided by default:

* **show module**: expands or collapses the module
* **reset module parameters**: resets the module to its default state
* **show preset menu**: shows the presets menu for the module

Some of the above options may not be applicable to all modules.