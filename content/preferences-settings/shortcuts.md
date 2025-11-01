---
title: shortcuts
id: shortcuts
weight: 120
draft: false
---

_Shortcuts_ are a way to control darktable using your keyboard, pointing device or external controller. They allow you to perform _actions_ without interacting directly with a UI element.

An _action_ is usually (but not always) an operation that you might undertake using darktable's point-and-click user interface.
See [common actions](#common-actions) below for a list of the most common ones. For example:

-   Increase, decrease or reset sliders
-   Scroll through dropdown lists
-   Enable, expand or focus modules
-   Click buttons
-   Switch between views

A _shortcut_ is a combination of inputs that triggers one of the actions available in a given context.

Darktable comes with many predefined shortcuts that use a combination of key presses and mouse movements, but you can also use various other input devices, including MIDI devices and game controllers -- see the [midi device support](../special-topics/midi-device-support.md) section for details. These are referred to as _external devices_ or just _devices_ in this guide.

# types of actions and shortcuts

There are two types of actions:

_Discrete_ actions
: E.g., executing a command, focusing a UI element or resetting a slider

_Continuous actions_
: E.g., adjusting the value of a slider or scrolling through a list of presets

As the two action types are inherently different, so are the shortcuts you can use to trigger them:

- _Discrete actions_ can be triggered by _discrete shortcuts_ consisting only of key presses and optionally mouse clicks
- _Continuous actions_ need also a direction (and, in the case of sliders, a magnitude). Hence, the corresponding _continuous shortcuts_ will also incorporate a mouse movement

For example:

- The key `e` can be used to focus a module, or to toggle it on/off
- The key `e`, combined with up/down movements or your pointing device, can be used to control the value of a slider 

If you are using keyboard and mouse, **all shortcuts must start with one or more key presses**, as mouse actions in isolation are used to navigate and interact with the UI.

If you have an external controller, you can trigger discrete actions by pressing one or more buttons on the controller. Continuous actions can use a combination of buttons and a knob/joystick movement, or just knob/joystick movement.

# anatomy of a shortcut

Shortcuts can consist of up to three key/button presses **of the same key/button** (in a quick sequence).
So, for example, `E`, `E + E` and `E + E + E` are all valid shortcuts to trigger discrete actions, as well as `E + left-click`, `E + right-click` or `E + E + left-click`.

On the contrary, `E + A` is not a valid shortcut, and darktable will interpret it as a two different shortcuts: `E` followed by `A`.

Your shortcut can include one or more modifiers (`Shift`, `Ctrl/Cmd` and `Alt/Option`). In this case, the modifier(s) have to be held down while executing the remainder of the shortcut. So, `Ctrl + E + E` means holding down `Ctrl` while pressing `E` twice in a rapid sequence.

If you are defining a continuous shortcut, then the movement part of the shortcut must be executed while the last key, mouse or controller button is held down.

For example, the shortcut `E + E + pan`, can be activated by pressing `E` twice, holding down `E` on the second press and moving the mouse horizontally. While you are holding down `E`, moving the mouse horizontally will adjust the value associated with the shortcut's action. As you release the `E` key, moving the mouse horizontally will just move the mouse on the screen.

**Shortcuts must be unique within a view.**
A single action may have multiple shortcuts but a single shortcut can only be linked to one action in a given darktable view -- you can't chain actions together except by applying a preset or style. You can, however, set up a single shortcut that does one thing in the lighttable view, say, and another in the darkroom view.

**Additional modifiers.** As mentioned above, the only valid modifiers are the Shift, Ctrl/Cmd and Alt/Option keys on the keyboard. You can define additional keys (or device buttons) as modifiers by assigning keys/buttons to the "global/modifier" action. However, these will merely function as extra Ctrl, Alt or Shift keys -- you cannot create "new" modifiers.

## defining continuous shortcuts

The following movements are supported when defining continuous shortcuts:

-   Movement of the mouse scroll wheel
-   Horizontal, vertical or diagonal movement of the mouse cursor
-   Movement of a knob/joystick on an external device

---

**Note:** You may need to switch off the "disable touchpad while typing" setting if you want to use continuous shortcuts with a laptop touchpad.

---

As mentioned above, when employing an external device you can directly assign a control knob or joystick to an action. However, this will significantly reduce the flexibility of such devices, as you will be able to use the knob/joystick only to control one action. Conversely, by prefixing the movement with a key or button press you can use the same knob/joystick to control multiple actions.

# anatomy of an action

_Actions_ apply an _effect_ to an _element_ of a _widget_, where these terms are defined as follows:

widget
: Each visible part of the user interface is a _widget_. For example, the darktable application window is a widget, containing side panel widgets, each of which contains module widgets, each of which contains button, slider and dropdown list widgets etc. When assigning a shortcut to an action, you must first decide which widget it will apply to.

element
: An _element_ is the part of a UI widget that is affected by your shortcut. For example, for a slider that has a [picker](../darkroom/processing-modules/module-controls.md#pickers), you can make a shortcut activate the picker _button_ element or change the _value_ element of the slider. For a row of tabs (the row is a single widget) you can select which tab element to activate or use your mouse scroll wheel to scroll through the tabs.

effect
: A shortcut can sometimes have multiple possible _effects_ on a given _element_. For example, a button can be activated as if it was pressed with a plain mouse-click or as if it was pressed with Ctrl+click. A slider's value can be edited, increased/decreased or reset.

So, for example, you can assign the shortcut `E + mouse-scroll` to change the value (the _effect_) of the exposure slider (the _element_) of the exposure correction _widget_.

# assigning shortcuts to actions

There are two primary methods of assigning shortcuts to actions: [visual shortcut mapping](#visual-shortcut-mapping) (recommended) and the [shortcut mapping screen](#shortcut-mapping-screen). The former makes it easier to remap multiple shortcuts at once, while the latter allows for finer control and more flexibility. Both options are detailed below.

## visual shortcut mapping

Click on the ![visual mapping button](./shortcuts/visual-mapping-button.png#icon) icon in the [top panel](../overview/user-interface/top-panel.md) of any darktable view to enter visual shortcut mapping mode. If you hold Ctrl while clicking the button, no confirmation will appear when overwriting an existing shortcut mapping.

The mouse cursor will change as you hover over UI widgets, to indicate whether or not a mapping can be created:

-   ![modified pointer](./shortcuts/modified-pointer.png#icon) appears when you hover over a module header, to indicate that you can click to expand the module.

-   ![keyboard plus sign](./shortcuts/plus-keyboard.png#icon) indicates that, in addition to assigning a shortcut, you can also add the widget to the [quick access panel](../darkroom/organization/quick-access-panel.md) in the darkroom (by Ctrl+clicking on it).

-   ![keyboard minus sign](./shortcuts/minus-keyboard.png#icon) indicates that the widget is already in the quick access panel (Ctrl+click to remove it).

-   ![keyboard](./shortcuts/keyboard.png#icon) indicates that a shortcut can be defined for the widget under the cursor but it cannot be added to or removed from the quick access panel.

-   ![Don't signal](./shortcuts/no-signal.png#icon) indicates that there is no mappable widget under the cursor.

**To define new shortcuts:**
press a key combination while hovering over a mappable widget. A _default action_ will be assigned to that shortcut based on the type of widget and whether your shortcut includes a movement. See the [common actions](#common-actions) section below for examples of some of the defaults.
You can assign as many shortcuts as you like in a single mapping session and then exit mapping mode when you are finished by clicking the ![visual mapping button](./shortcuts/visual-mapping-button.png#icon) icon again or right-clicking anywhere on the screen.

**To explore already defined shortcuts:**
left-click on a mappable widget to open the shortcut mapping screen for that widget (see below). Left-click anywhere else on the screen to open the shortcut mapping screen, expanded (where possible) based on the part of the screen you have clicked on. This screen can be used to alter the action assigned to a shortcut and to configure shortcuts for non-visual actions. Entering the shortcut mapping screen exits visual shortcut mapping mode.

**To update existing shortcuts:**
define a second shortcut against the same widget. If you attempt to reallocate an existing shortcut to a new action, you will be notified of the conflict and prompted to replace the existing shortcut.

**To change the default speed of a slider:**
scroll with your mouse wheel while in visual mapping mode (without pressing any other buttons/keys) when hovering over the slider -- scroll up to increase and down to decrease. When you leave mapping mode, normal mouse scrolls over that slider will change its value with the adjusted speed.

## shortcut mapping screen

The shortcut mapping screen can be accessed from the global preferences dialog or by right-clicking on the visual mapping button. This screen allows access to all available actions, including some that are not directly linked to a UI widget.

The top panel of the shortcut mapping screen shows a list of available UI widgets/actions and the bottom panel shows the shortcuts currently assigned to them. Fields that can be changed by user action are shown in bold.

---

**Note:**
You can **search** the top and bottom panels using the text entry boxes at the bottom of the screen, and use the **up/down** arrow keys to navigate between matches. 

---

**To create a new shortcut for an item:**
Double-click an item in the top panel, and then enter your desired shortcut (right-click to cancel). Once you have done this, a new entry will appear in the bottom panel showing the shortcut you have created. You can then manually alter the _element_, _effect_, _speed_ or _instance_ of the assigned action against that shortcut in the bottom panel. To delete a user-defined shortcut, select it in the bottom panel and press the Delete key.

Selecting an existing shortcut in the bottom panel will highlight (in bold) the matching action and its parents in the top panel. You can use this to navigate the top panel and find related actions.

The following additional options are provided in the shortcut mapping screen:

export...
: Export the current shortcut mappings for one or all of your devices (keyboard/mouse, midi, game controller) to an external file. The dialog will show you how many shortcuts exist for each device.

import...
: Import shortcut mappings from an external file for one or all of your devices. When loading a device, you can chose to assign it a different number. This can for example be used to exchange midi layouts. Before loading, you can chose to wipe the specific device first. When loading all from an empty file, this will effectively delete all your shortcuts.

restore...
: Restore your shortcut mappings to (a) The mappings shipped with darktable by default, (b) The start of your current session, or (c) The point at which the shortcut mapping screen was last opened. When restoring, you can choose to leave any additional shortcuts that were added after the relevant checkpoint as they are, so that only changed shortcuts are restored to their previous meaning. Or you can choose to first clear all shortcuts and just load the restore point.

## deleting default shortcuts

When you delete a shortcut that has been created by darktable by default, that shortcut is moved to a separate "disabled defaults" category, in order to prevent it from being reloaded the next time darktable is launched. To reinstate a deleted shortcut, simply delete the shortcut from that category. You will be prompted if reinstating this shortcut overwrites another one that has been created in the meantime.

Alternatively, you may disable [preferences > miscellaneous > interface > load default shortcuts at startup](./miscellaneous.md) to prevent default shortcuts from being loaded on startup. While this option is disabled, darktable will only load user-defined shortcuts and any defaults that you have not subsequently deleted or overridden.

# common actions

The following is a list of some of the actions to which you can assign shortcuts, organized by widget type. This is not an exhaustive list and you are encouraged to browse the shortcut mapping screen for a complete list of available actions.

---

**Note:**
some actions may have no effect. For example, all sliders include a _button_ element, regardless of whether such a button is actually present alongside a given slider.

---

## global actions

Actions in the "global" section of the shortcut mapping screen can be executed from any darktable view. Most of these actions do not have specific _elements_ as they are used to perform one-off operations.

For example, the predefined shortcut `Tab` triggers the action `globals/panels/all`, which toggles the visibility of all the side panels in the current view.

## view-specific actions

Actions in the "views" section can only be executed from the specified darktable view. As with global actions, most do not have specific _elements_ as they are used to perform one-off operations.

For example, the predefined shortcut `Ctrl/Cmd + B` triggers the action `views/darktable/guide lines/toggle`, which toggles guide lines in the darktable view.

## actions on modules

All _utility_ and _processing_ modules have the following elements:

_show_
: Acts as a _toggle_ that expands and collapses the module.

_reset_
: Acts as a _button_ that resets all module parameters when activated. The _ctrl-activate_ action can be used to re-apply any automatic presets for that module.

_presets_
: Allows you to select actions from the [presets](../darkroom/processing-modules/presets.md) menu (e.g. edit, update, previous, next). The default action, when assigning a discrete shortcut to a _preset_ element, is to display a list of the available presets for selection.

When a shortcut is assigned to a utility module, the default action is to _toggle_ the _show_ element (expand/collapse the module).

### processing modules

Additionally, processing modules have the following elements:

_enable_
: Acts as a _toggle_ that switches the module on and off.

_focus_
: Acts as a _toggle_ that focuses or defocuses the module. This is useful for modules such as [_crop_](../module-reference/processing-modules/crop.md) or [_tone equalizer_](../module-reference/processing-modules/tone-equalizer.md), whose on-screen controls are only activated when those modules have focus. For _crop_, changes are saved only when the module loses focus.

_instance_
: Allows you to select actions from the [multiple-instance](../darkroom/processing-modules/multiple-instances.md) menu (e.g. move up/down, create new instance). The discrete action associated to the _instance_ element displays a list of the available options for selection; a continuous action is also available and will move the _preferred module instance_ (see below) up and down the pixelpipe.

If an action affects a processing module that can have multiple instances, you can choose which instance to adjust with a given shortcut. By default, all actions will affect the "preferred" instance, as defined using the settings in [preferences > miscellaneous > shortcuts with multiple instances](./miscellaneous.md#shortcuts-with-multiple-instances).

Additional options are available in the shortcuts mapping screen to adjust the blend parameters (the \<blending\> section) and module controls (the \<focused\> section) for the currently-focused module. The latter section allows you to assign shortcuts to the first, second, third (etc.) button, drop-down, slider and tab on the module. The shortcuts will affect different module controls depending on which module currently has focus (as the available list of controls changes).

For example, you if you assign `' + mouse-scroll` to `processing modules/\<focused\>/sliders` and set `element` to `1st`, you will be able to use the scroll wheel while holding down `'` to adjust the value of the first slider of the currently focused module. If `exposure` is focused you will affect the `exposure correction` slider, if `denoise (profiled)` is focused you will affect the `denoising strength` slider.

## actions on specific widget types

### buttons

A button is a clickable icon in the darktable interface. The default action is to activate that button as if clicked with the left mouse button. You can modify this action to activate the button as if clicked while holding a modifier key.

### toggles

A toggle is a button that has a persistent on/off state. It therefore has additional _effects_ to allow you to toggle it or explicitly set its state. As with a normal button, the default action is to activate the toggle as if clicked with the left mouse button (which toggles the button on/off).

For example, the predefined shortcut `Shift + O` is associated to `views/darkroom/raw overexposed/toggle`, which toggles on/off the raw overexposure indicator in the darkroom.

### dropdowns

A dropdown is a multi-selection box and has the following elements available:

_selection_
: Allows values to be selected from the dropdown list in various ways. The default action, when assigning a discrete shortcut to a dropdown, is to display a popup _edit_ box with a list of the available values for selection; A continuous shortcut (i.e., including a mouse movement) will scroll through the available values.

_button_
: A standard _button_ element that allows the button to the right of the dropdown (if present) to be activated. For example, the _aspect_ dropdown in the [_crop_](../module-reference/processing-modules/crop.md) module has a button that allows the crop controls to be changed from portrait to landscape and vice versa.

### sliders

A slider allows you to continuously alter an integer or decimal value, and has the following elements available:

_value_
: Allows the current value of the slider to be altered. The default action, when assigning a discrete shortcut to a slider, is to display a popup _edit_ box so you can enter a value; A continuous shortcut will change the value up and down. Value elements are also used for modifying some on-screen graphs. When modifying the _value_ element with a shortcut you may not exceed the bounds set in the visual slider.

_force_
: This is the same as the _value_ element described above, but it allows you to exceed the bounds set in the visual slider.

_zoom_
: Allows you to change the upper and lower bounds of the visual slider without altering the current value.

_button_
: A standard _button_ element that allows the button to the right of the slider (if present) to be activated. For example, a slider may include a [picker](../darkroom/processing-modules/module-controls.md#pickers) to visually set its value based on selected elements of the image.

You can alter the value of a slider more quickly or slowly than normal by defining the _speed_ of the action in the shortcut mapping screen. By default a _value_ (or _force_) effect is given a speed of 1.0, which means that it is changed at the default rate defined by the given slider. You can alter the slider more quickly by increasing the speed (a speed of 10 makes the action 10x faster) or more slowly by decreasing it (a speed of 0.1 makes the action 10x slower).

# fallbacks (a.k.a. generalized shortcut extensions)

As discussed above, a _widget_ can have multiple different _actions_ applied to it, and you may want to set shortcuts to control several of them. For example, to toggle a module on/off, expand/collapse it, and reset it to its default state. Normally, this would require setting 3 shortcuts for each module. If you want to control 5 modules in this fashion, you have to define 15 shortcuts. Setting up all these shortcuts one by one can be tedious and error prone.

To make this process simpler and to ensure consistency across all modules, you can create a single discrete shortcut for each module and then have a number of effects made available by default as _extensions_ to that shortcut. These _generalized shortcut extensions_ are called shortcut _fallbacks_.

---

**Note:**
Fallbacks are a powerful way to quickly set up multiple actions using predefined and consistent shortcuts. They will assign a lot of actions automatically, which may be confusing if you are not aware of them. Fallbacks are therefore _disabled_ by default and you will need to click on the `enable fallbacks` check box in the shortcuts setup window to enable them.

---

If they are enabled, when you create a discrete shortcut (e.g., `Ctrl + R`) against a processing module the following shortcuts will be defined automatically:

-  `Ctrl + R` to show/hide the module (the default fallback)
-  `Ctrl + R + left-click` to enable/disable the module
-  `Ctrl + R + left-double-click` to reset the module
-  `Ctrl + R + right-click` to show the module's preset menu
-  `Ctrl + R + right-double-click` to show the module's multiple instance menu

In each case (except the first) you should hold the initial shortcut while clicking with your mouse. The final single/double mouse-click will apply the corresponding action.

Similar fallbacks are defined for many common UI elements.
As with any other shortcut, fallback settings are fully customizable.

To see a list of _all_ of the default fallbacks, click the "enable fallbacks" checkbox in the shortcut mapping screen and select the "fallbacks" category in the top panel. To see the fallbacks for a given widget (e.g. a slider) just select that widget in the top panel. In both cases an additional item (also named "fallbacks") will then appear in the bottom panel containing full details of the available fallbacks.

Fallbacks are only applied if no other shortcut using the resulting combination has been explicitly created. In the above example, if you were to explicitly assign `Ctrl + R + left-click` to another action, the "enable/disable module" fallback would be ignored.

Some fallback actions are defined using modifier keys (usually `Ctrl+` and `Shift+`). In this case you must define an initial shortcut without such a modifier in order to be able to use these fallbacks. For example, if you assign `Ctrl + R` to an action, you cannot use a `Ctrl+` fallback. Some default fallbacks of this type are provided for the _value_ element and for horizontal/vertical movements in the (zoomed) central area -- in this case, `Shift+` increases the speed to 10.0 and `Ctrl+` decreases the speed to 0.1.