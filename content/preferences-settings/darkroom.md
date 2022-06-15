---
title: darkroom
id: darkroom
weight: 50
draft: false
---

Control functionality in the [darkroom](../darkroom/_index.md) view and associated modules.

# general

pen pressure control for brush masks
: Controls how the pressure reading of a graphics tablet impacts newly generated [drawn mask](../darkroom/masking-and-blending/masks/drawn.md) brush strokes. You can control the brush width, hardness and opacity. “Absolute” control means that the pressure reading directly defines the attribute with a value between 0% and 100%. “Relative” means that the pressure reading adjusts the attribute between zero and the pre-defined default value (default off).

smoothing of brush strokes
: Sets the level for smoothing of [drawn mask](../darkroom/masking-and-blending/masks/drawn.md) brush strokes. Stronger smoothing leads to fewer nodes and easier editing at the expense of lower accuracy.

scroll down to increase mask parameters
: By default, scrolling your mouse up increases the value of the relevant shape parameters in [drawn masks](../darkroom/masking-and-blending/masks/drawn.md). Set this preference to reverse the behavior (default off).

pattern for the image information line
: Set the information to be displayed in the [image information line](../module-reference/utility-modules/darkroom/image-info-line.md). You can use any variables in the [variables](../special-topics/variables.md) section as well as `$(NL)` for a new line.

position of the image information line
: Choose the darkroom panel in which the [image information line](../module-reference/utility-modules/darkroom/image-info-line.md) is displayed. Choose between “top left” “top right” “top center” “bottom” and “hidden” (default "bottom").

border around image in darkroom mode
: Display the center image in darkroom mode with an outside border of the given number of pixels (default 20). 

show scrollbars for center view
: Choose whether to show scrollbars in the center view of the darkroom (default off).

demosaicing for zoomed out darkroom mode
: Choose how to demosaic images in the darkroom view when not viewing the image at 1:1 zoom scale. Note: this setting is only used for interactive work and does not affect exported images.
: - _always bilinear (fast)_ is fastest, but not as sharp
: - _at most RCD (reasonable)_ uses RCD + interpolation modes. X-Trans sensors will use VNG as the middle-ground setting.
: - _full (possibly slow)_ will use the settings from the [_demosaic_](../module-reference/processing-modules/demosaic.md) module.
: (default "_at most RCD (reasonable)_"). 

reduce resolution of preview image
: Reduce the resolution of the [navigation preview](../module-reference/utility-modules/darkroom/navigation.md) image (choose from "original", "1/2", "1/3" or "1/4" size). This may improve the speed of the rendering but take care as it can also hinder accurate color picking and masking (default "original").

show loading screen between images
: Show gray loading screen when navigating between images in the darkroom. Switch this option off to just show a simple toast message and leave the previous image in place until the next image is loaded. Note that switching this option off can be very useful to quickly compare duplicate images, however, there might be issues with long loading times (leading you to think the next image has already loaded) and you may observe visual artifacts while the next image is loading (default on).

# modules

display of individual color channels
: Control how individual color channels are displayed when activated in the [parametric masks](../darkroom/masking-and-blending/masks/parametric.md) feature. You can choose between “false color” and “gray scale” (default "false color").

hide built-in presets for processing modules
: If enabled, only user-defined presets will be shown in the presets menu for processing modules -- built-in presets will be hidden (default off).

show the guides widget in modules UI
: Enable this to show the local [guides & overlays](../module-reference/utility-modules/darkroom/guides-overlays.md#local-guides) interface directly within the UI of the modules that support it (default on).

expand a single processing module at a time
: Control how [processing modules](../module-reference/processing-modules) are expanded in the darkroom. If this option is enabled, expanding a module by clicking collapses any currently expanded module. If you want to expand a module without collapsing the others you can do so with Shift+click. Disabling this option inverts the meaning of click and Shift+click (default on).

only collapse modules in current group
: When choosing to expand a single processing module at a time (using the logic defined in the previous setting), only collapse other modules that appear in the current visible group. Disable this option to ensure that modules in non-visible groups are also collapsed (default on).

expand the module when it is activated, and collapse it when disabled
: Select this option for the darkroom to automatically expand or collapse [processing modules](../module-reference/processing-modules) when they are enabled or disabled. (default off)

scroll to processing modules when expanded/collapsed
: With this option enabled [processing modules](../module-reference/processing-modules) are scrolled to the top of the right-hand panel when expanded or collapsed (default on).

white balance slider colors
: Controls the appearance of the temperature/tint sliders in the [white balance](../module-reference/processing-modules/white-balance.md) module.
: - _no color_: background of the sliders is not colored at all.
: - _illuminant color_: slider colors represent the color of the light source, i.e. the color you are adjusting to in order to achieve neutral white
: - _effect emulation_: slider colors represent the effect the adjustment would have had on the scene. This is how most other raw processors show temperature/tint sliders colors.
: (default _no color_)

colorbalance slider block layout
: Controls the appearance of the shadows/mid-tones/highlights sections in the [color balance](../module-reference/processing-modules/color-balance.md) module.
: - _list_: all sliders are shown in one long list (with headers)
: - _tabs_: use tabs to switch between the blocks of sliders
: - _columns_: the blocks of sliders are shown next to each other (in narrow columns)
: (default _list_)

show right-side buttons in processing module headers
: Choose whether to show the four buttons (mask indicator, multi-instance menu, reset, presets menu) on the right-hand-side of the [module header](../darkroom/processing-modules/module-header.md) for processing modules. These buttons will always appear when the mouse is over the module. At other times they will be shown or hidden according to this preference selection: 
: - _always_: always show all buttons
: - _active_: only show the buttons when the mouse is over the module
: - _dim_: buttons are dimmed when mouse is not over the module
: - _auto_: hide the buttons when the panel is narrow
: - _fade_: fade out all buttons when the panel narrows
: - _fit_: hide all the buttons if the module name doesn't fit
: - _smooth_: fade out all buttons in one header simultaneously
: - _glide_: gradually hide individual buttons as needed
: (default _always_)

show mask indicator in module headers
: If enabled, an icon will be shown in the header of any processing modules that have a [mask](../darkroom/masking-and-blending/masks/_index.md) applied (default on).

prompt for name on addition of new instance
: If enabled, when creating a new instance of a processing module, a prompt will be immediately displayed allowing you to set a name for the new instance (default off).
