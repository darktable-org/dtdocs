---
title: miscellaneous
date: 2022-12-04T02:19:02+01:00
id: miscellaneous
weight: 110
draft: false
---

## interface

load default shortcuts at startup
: When launching the application, Ansel loads default shortcuts first, and then loads user-defined shortcuts on top. This allows default shortcuts to be overridden with a new action but prevents them from being deleted (since the deleted shortcut will be automatically reloaded on the next restart). Deactivate this preference to stop loading default shortcuts on startup -- only load the user-defined ones (including any defaults that you have not subsequently deleted or overridden). This makes deletion easier but also means that you will not benefit from new shortcuts added in future versions without first re-enabling this preference (default on).

scale slider step with min/max
: When activated, the default step-size, when altering sliders, will depend on the current min/max values for that slider (default on).

sort built-in presets first
: Choose how the presets menu is sorted. If this option is enabled, built-in presets are shown first. If the option is disabled, user presets are shown first (default on).

mouse wheel scrolls modules side panel by default
: When enabled, the mouse wheel scrolls side panels by default and Ctrl+Alt+wheel scrolls data entry fields. When disabled, this behavior is reversed (default off).

always show panels' scrollbars
: Defines whether the panel scrollbars should be always visible or activated only depending on the panel content (default on). (needs a restart)

duration of the ui transitions in ms
: Defines how long modules and other ui elements will take to transition between states (expand/collapse). Set to 0 to disable animation (default 250ms).

position of the scopes module
: Choose whether to show the [scopes](../modules/utility-modules/shared/scopes.md) module in the left or right panel (default right). (needs a restart)

method to use for getting the display profile
: This option allows the user to force Ansel to use a specific method to obtain the current display profile for [color management](../special-topics/color-management/_index.md). In the default setting “all”, Ansel will choose to query the X display server's xatom or the colord system service. You can set this option to “xatom” or “colord” to enforce a specific method if the two methods give different results. You can run the [Ansel-cmstest](../special-topics/program-invocation/Ansel-cmstest.md) binary to examine your color management subsystem.

order or exclude midi devices
: Semicolon-separated list of device-name fragments. If matched, load the midi device at the id given by the location in the list. If preceded by "-", prevent the matched device from loading. You can also add encoding and number of knobs. For example "BeatStep:63:16". Please see [midi device support](../special-topics/midi-device-support.md#additional-midi-configuration) for more information.

## tags

omit hierarchy in simple tag lists
: When exporting images any hierarchical tags are also added as a simple list of non-hierarchical tags to make them visible to some other programs. When this option is checked Ansel will only include the last part of the hierarchy and ignore the rest. So `foo|bar|baz` will only add `baz`.

## shortcuts with multiple instances

It is possible to create multiple instances of many processing modules. In this scenario it is not always obvious which instance should be controlled by keyboard shortcut operations. The following options control rules that are applied (in order) to decide which module instance keyboard shortcuts should be applied to.

These rules are also used when clicking and dragging on the scopes module to change exposure.

prefer focused instance
: If an instance has focus, apply the shortcut to that instance and ignore any other rules. Note that this option does not impact blending shortcuts, which are always applied to the focused instance (default on).

prefer expanded instances
: If instances of the module are expanded, ignore collapsed instances (default off).

prefer enabled instances
: After applying the above rule, if remaining instances of the module are active, ignore inactive instances (default off).

prefer unmasked instances
: After applying the above rules, if remaining instances of the module are unmasked, ignore masked instances (default off).

selection order
: After applying the above rules, apply the shortcut to the first or last instance remaining (default "last instance").

## map / geolocalisation view

pretty print the image location
: Show a more readable representation of the geo-location in the [image information](../modules/utility-modules/shared/image-information.md) module (default on).

## slideshow view

waiting time before each picture in slideshow
: The number of seconds before displaying the next image (default 5) in the [slideshow view](../views/slideshow/_index.md).
