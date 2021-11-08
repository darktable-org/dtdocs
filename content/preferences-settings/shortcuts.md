---
title: shortcuts
id: shortcuts
weight: 120
draft: false
---

You can perform almost any action in darktable with a keyboard/mouse shortcut. You can also use various other input devices, including MIDI devices and game controllers -- see the [midi device support](../special-topics/midi-device-support.md) section for details. These are referred to as _external devices_ or just _devices_ in this guide.

# defining shortcuts

A _shortcut_ is a combination of key or button presses and/or mouse or device movements that performs an _action_ in darktable.

A single action may have multiple shortcuts but a single shortcut can only be linked to one action in a given darktable view -- you can't chain actions together except by applying a preset or style. You can, however, set up a single shortcut that does one thing in the lighttable view, say, and another in the darkroom view.

## initiating a shortcut

A shortcut must be initiated by either

- pressing a key on the keyboard; or
- pressing a button or moving a knob/joystick on an external device 

You cannot initiate a shortcut by moving your mouse or pressing one of its buttons, as these actions are used to interact with darktable's UI.

## simple shortcuts

A shortcut that only includes button and/or key presses (and not mouse/device movements) is referred to as a _simple_ shortcut.

A simple shortcut must be initiated as above, but can include:

- One or more modifier keys (Shift, Ctrl, Alt), held down while executing the remainder of the shortcut
- Up to three key presses, the last one of which may be a long-press (defined as a key-press longer than your system's double-click duration)
- Similarly, up to three device-button presses or mouse-button clicks, the last of which may be long

Various combinations of keyboard, mouse, and device buttons can be used to create simple shortcuts.

### creating additional modifiers

The only valid modifiers are the Shift, Ctrl and Alt keys on the keyboard. You can define additional keys (or device buttons) as modifiers by assigning keys/buttons to the the "global/modifier" action. However, these will merely function as extra Ctrl, Alt or Shift keys -- you cannot create "new" modifiers.

## extending simple shortcuts with movement

For certain actions you can choose to _extend_ a simple shortcut using mouse/device movement. For example you might hold Ctrl+X while scrolling with your mouse to change the value of a slider. The following can be used to extend a simple shortcut:

- Movement of the mouse scroll wheel
- Horizontal, vertical or diagonal movement of the mouse cursor
- Movement of a knob/joystick on an external device

To extend a simple shortcut, you must hold the final key/button of the simple shortcut while performing the extending mouse/device movement. 

For external devices you do not need to start with a _simple_ shortcut -- you can directly assign a control knob or joystick to an action -- though this will significantly reduce the flexibility of such devices.

Long button and key presses cannot be extended, as the length of the click/press is timed using the release of the final button/key -- such shortcuts must be terminated with the raising of the final button/key.

# actions

Shortcuts are used to initiate _actions_ within darktable. 

An _action_ is usually (but not always) an operation that you might undertake using darktable's point-and-click user interface. For example:

- Increase, decrease or reset sliders
- Scroll through dropdown lists
- Enable, expand or focus modules
- Click buttons
- Switch between views

Such point-and-click type _actions_ are normally defined as the application of an _effect_ to an _element_ of a _widget_, where these terms are defined as follows:

widget
: Each visible part of the user interface is known as a _widget_. For example the darktable application window is a widget, containing side panel widgets, each of which contains module widgets, each of which contains button, slider and dropdown list widgets etc... When assigning a shortcut to an action, you must first decide which widget it is to be applied to.

element
: An _element_ is the part of a UI widget that is affected by your shortcut. For example, for a slider that has a color picker, you can make a shortcut activate the color picker _button_ element or change the _value_ element of the slider. For a row of tabs (the row is a single widget) you can select which tab element to activate.

effect
: A shortcut can sometimes have multiple possible _effects_ on a given _element_. For example, a button can be activated as if it was pressed with a plain mouse-click or as if it was pressed with Ctrl+click. A slider's value can be edited, increased/decreased or reset.

# assigning shortcuts to actions

There are two primary methods of assigning a shortcut to an action.

## visual shortcut mapping

Click on the ![visual mapping button](./shortcuts/visual-mapping-button.png#icon) icon in the [top panel](../overview/user-interface/top-panel.md) of any darktable view to enter visual shortcut mapping mode. 

The mouse cursor will change as you hover over UI widgets, to indicate whether or not a mapping can be created:

- A down arrow with a line ![expand icon](./shortcuts/expand-icon.png#icon) appears when you hover over a module header, to indicate that you can click to expand the module.
- A spiral ![spiral icon](./shortcuts/spiral-icon.png#icon) indicates that a shortcut can be defined for the widget under the cursor. 
- An up arrow ![up icon](./shortcuts/up-icon.png#icon) indicates that, in addition to assigning a shortcut, you can also add the widget to the [quick access panel](../darkroom/organization/quick-access-panel.md) in the darkroom (by Ctrl+clicking on it).
- A down arrow ![down icon](./shortcuts/down-icon.png#icon) indicates that the widget is already in the quick access panel (Ctrl+click to remove it).
- A cross ![cross icon](./shortcuts/cross-icon.png#icon) indicates that there is no mappable widget under the cursor. 

Press a key combination while hovering over a mappable widget to assign a shortcut to that widget -- a default action will be assigned to that shortcut based on the type of widget and whether you have keyed a _simple_ or _extended_ shortcut.  See below for details of some of the default assigned actions. 

Left-click on a mappable widget to open the shortcut mapping screen for that widget (see below). Left-click anywhere else on the screen to open the shortcut mapping screen, expanded (where possible) based on the part of the screen you have clicked on. This screen can be used to alter the action assigned to a shortcut and to configure shortcuts for non-visual actions. Entering the shortcut mapping screen exits visual shortcut mapping mode.

You can assign as many shortcuts as you like in a single mapping session and then exit mapping mode when you are finished by clicking the ![visual mapping button](./shortcuts/visual-mapping-button.png#icon) icon again or right-clicking anywhere on the screen.

You can delete a shortcut mapping by defining it a second time against the same widget. If you attempt to reallocate an existing shortcut to a new action, you will be notified of the conflict and asked whether you wish to replace the existing shortcut.

## shortcut mapping screen

The most flexible way to create shortcuts is by using the shortcut mapping screen, which can be accessed from the global preferences dialog or by left-clicking in visual mapping mode. This screen allows access to all available actions, including some that are not directly linked to a UI widget.

The top panel of the shortcut mapping screen shows a list of available UI widgets/actions and the bottom panel shows the shortcuts currently assigned to them. You can search the top and bottom panels using the text entry boxes at the bottom of the screen.

Double-click an item in the top panel to create a new shortcut for that item, and then enter your desired shortcut (right-click to cancel). Once you have done this, a new entry will appear in the bottom panel showing the shortcut you have created. You can then manually alter the _element_, _effect_, _speed_ or _instance_ of the assigned action against that shortcut in the bottom panel. To delete a shortcut, select it in the bottom panel and press the Delete key.

The following additional options are provided in the shortcut mapping screen:

export...
: Export the current shortcut mappings for one or all of your devices (keyboard/mouse, midi, game) to an external file. The dialog will show you how many shortcuts exist for each device.

import...
: Import shortcut mappings from an external file for one or all of your devices. When loading a device, you can chose to assign it a different number. This can for example be used to exchange midi layouts. Before loading, you can chose to wipe the specific device first. When loading all from an empty file, this will effectively delete all your shortcuts. 

restore...
: Restore your shortcut mappings to (a) The mappings shipped with darktable by default, (b) The start of your current session, or (c) The point at which the shortcut mapping screen was last opened. When restoring, you can choose to leave any additional shortcuts that were added after the relevant checkpoint as they are, so that only changed shortcuts are restored to their previous meaning. Or you can choose to first clear all shortcuts and just load the restore point.

# common actions

The following is a list of some of the actions to which you can assign shortcuts, organized by widget type. This is not an exhaustive list and you are encouraged to browse the shortcut mapping screen for a complete list of available actions. If you assign a shortcut to a widget, it will be given a default action, depending on the type of widget and on whether you have assigned a simple or extended shortcut.

Note that it is possible to assign a number of actions that have no effect. For example, all sliders include a _button_ element, regardless of whether such a button is actually present alongside a given slider.

## global

Actions in the "global" section of the shortcut mapping screen can be executed from any darktable view. Most of these actions do not have specific _elements_ as they are used to perform one-off operations.

## views

Actions in the "views" section can only be executed from the specified darktable view. As with global actions, most do not have specific _elements_ as they are used to perform one-off operations.

## buttons 

A button is a clickable icon in the darktable interface. The default action, when assigning a simple shortcut to a _button_, is to activate that button as if clicked with the left mouse button. You can modify this action to activate the button as if clicked while holding a modifier key.

## toggles

A toggle is a button that has a persistent on/off state. It therefore has additional _effects_ to allow you to toggle it or explicitly set its state. As with a normal button the default action, when assigning a simple shortcut to a toggle, is to activate the toggle as if clicked with the left mouse button (which toggles the button on/off).

## utility modules

All utility modules have the following elements:

_show_
: Acts as a _toggle_ that expands and collapses the module.

_reset_
: Acts as a _button_ that resets all module parameters when activated. The _ctrl-activate_ action can be used to re-apply any automatic presets for that module.

_presets_
: Allows you to select actions from the [presets](../darkroom/processing-modules/presets.md) menu (e.g. edit, update, previous, next). The default action, when assigning a simple shortcut to a _preset_ element, is to display a list of the available presets for selection. Extended shortcuts are not currently available for preset elements.

The default action, when assigning a simple shortcut to a utility module, is to _toggle_ the _show_ element (expand/collapse the module).

In addition, shortcuts are available for all of the controls on each module as well as any stored presets (see below).

## processing modules

Processing modules have the same elements and defaults as utility modules with the following additional elements:

_enable_
: Acts as a _toggle_ that switches the module on and off.

_focus_
: Acts as a _toggle_ that focuses or defocuses the module. This is useful for modules such as [_crop_](../module-reference/processing-modules/crop.md) or [_tone equalizer_](../module-reference/processing-modules/tone-equalizer.md), whose on-screen controls are only activated when those modules have focus. For _crop_, changes are saved only when the module loses focus.

_instance_
: Allows you to select actions from the [multiple-instance](../darkroom/processing-modules/multiple-instances.md) menu (e.g. move up/down, create new instance). The default action, when assigning a simple shortcut to the _instance_ element, is to display a list of the available options for selection; An extended shortcut will move the _preferred module instance_ (see below) up and down the pixelpipe.

If an action affects a processing module that can have multiple instances, you can choose which instance to adjust with a given shortcut. By default, all actions will affect the "preferred" instance, as defined using the settings in [preferences > miscellaneous > keyboard shortcuts with multiple instances](./miscellaneous.md#keyboard-shortcuts-with-multiple-instances).

## dropdowns

A dropdown is a multi-selection box and has the following elements available:

_selection_
: Allows values to be selected from the dropdown list in various ways. The default action, when assigning a simple shortcut to a dropdown, is to display a popup _edit_ box with a list of the available values for selection; An extended shortcut (including a mouse movement) will scroll through the available values. 

_button_
: A standard _button_ element that allows the button to the right of the dropdown (if present) to be activated. For example, the _aspect_ dropdown in the [_crop_](../module-reference/processing-modules/crop.md) module has a button that allows the crop controls to be changed from portrait to landscape and vice versa.

## sliders

A slider allows you to continuously alter an integer or decimal value, and has the following elements available:

_value_
: Allows the current value of the slider to be altered. The default action, when assigning a simple shortcut to a slider, is to display a popup _edit_ box so you can enter a value; An extended shortcut (including a mouse movement) will change the value up and down.  Value elements are also used for modifying some on-screen graphs. When modifying the _value_ element with a shortcut you may not exceed the bounds set in the visual slider.

_force_
: This is the same as the _value_ element described above, but it allows you to exceed the bounds set in the visual slider.

_zoom_
: Allows you to change the upper and lower bounds of the visual slider without altering the current value.

_button_
: A standard _button_ element that allows the button to the right of the slider (if present) to be activated. For example, a slider may include a color picker to visually set its value based on selected elements of the image.

You can alter the value of a slider more quickly or slowly than normal by defining the _speed_ of the action in the shortcut mapping screen. By default a _value_ (or _force_) effect is given a speed of 1.0, which means that it is changed at the default rate defined by the given slider. You can alter the slider more quickly by increasing the speed (a speed of 10 makes the action 10x faster) or more slowly by decreasing it (a speed of 0.1 makes the action 10x slower).

# fallbacks

Where a _widget_ can have multiple different _actions_ applied to it, it can be tedious to set up individual shortcuts for each one of those actions. To make this process simpler, if you create a simple shortcut a number of effects can be made available by default as extensions to that shortcut. These are known as _fallbacks_.

While fallbacks are a powerful way to quickly set up multiple actions using predefined and consistent shortcuts, they will assign a lot of actions automatically (which might not be what you want), and can be hard to understand. Fallbacks are therefore disabled by default and you will need to click on the "enable fallbacks" check box in the shortcuts setup window to enable them.

To take a brief example, you could create a simple shortcut (e.g. Ctrl+R) against a processing module. This will automatically set up the following _fallback_ effects using the defined shortcut, extended with mouse-clicks. In each case (except the first) you should hold the initial shortcut while clicking with your mouse. The final mouse-click will apply the action defined below:

- Ctrl+R (no mouse-click) to show/hide the module (the default fallback)
- Ctrl+R+left-click to enable/disable the module
- Ctrl+R+left-double-click to reset the module
- Ctrl+R+right-click to show the module's preset menu
- Ctrl+R+right-double-click to show the module's multiple instance menu

Similar fallbacks are defined for many common UI elements and all can be manually overridden.

Some fallback actions are defined using modifier keys (usually `Ctrl+` and `Shift+`). In this case you must define an initial shortcut without such a modifier in order to be able to use these fallbacks. For example, if you assign Ctrl+R to an action, you cannot use a `Ctrl+` fallback. Some default fallbacks of this type are provided for the _value_ element and for horizontal/vertical movements in the (zoomed) central area -- in this case, `Shift+` increases the speed to 10.0 and `Ctrl+` decreases the speed to 0.1.

To see a list of _all_ of the default fallbacks, click the "enable fallbacks" checkbox in the shortcut mapping screen and select the "fallbacks" category in the top panel. To see the fallbacks for a given widget (e.g. a slider) just select that widget in the top panel. In both cases an additional item (also named "fallbacks") will then appear in the bottom panel containing full details of the available fallbacks.

Fallbacks are only applied if no other shortcut using that combination has been explicitly created. In the above example, if you were to explicitly assign Ctrl+R+left-click to another action, the "enable/disable module" fallback would be ignored.

As with any other shortcut, fallback settings are fully customizable. 
