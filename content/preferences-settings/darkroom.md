---
title: darkroom
id: darkroom
weight: 50
draft: false
---

The following options control functionality in the [darkroom](../darkroom/_index.md) view and associated modules.

pen pressure control for brush masks
: Controls how the pressure reading of a graphics tablet impacts newly generated [drawn mask](../darkroom/masking-and-blending/masks/drawn.md) brush strokes. You can control the brush width, hardness and opacity. “Absolute” control means that the pressure reading directly defines the attribute with a value between 0% and 100%. “Relative” means that the pressure reading adjusts the attribute between zero and the pre-defined default value (default off).

smoothing of brush strokes
: Sets the level for smoothing of [drawn mask](../darkroom/masking-and-blending/masks/drawn.md) brush strokes. Stronger smoothing leads to fewer nodes and easier editing at the expense of lower accuracy.

display of individual color channels
: Controls how individual color channels are displayed when activated in the [parametric masks](../darkroom/masking-and-blending/masks/parametric.md) feature. You can choose between “false color” and “grey scale” (default "false color").

pattern for the image information line
: Control the information that is displayed in the [image information line](../module-reference/utility-modules/darkroom/image-info-line.md). You can use any variables in the [variables](../special-topics/variables.md) section as well as `$(NL)` for a new line.

position of the image information line
: Control the darkroom panel in which the [image information line](../module-reference/utility-modules/darkroom/image-info-line.md) is displayed. Choose between “top left” “top right” “top center” “bottom” and “hidden” (default "bottom").

show search module text entry
: Controls how [processing modules](../module-reference/processing-modules) can be searched and grouped. You can choose between “groups icons” “search entry” “both” (default "both"). See [searching for and grouping modules](../darkroom/interacting-with-modules/search-and-group.md). (need a restart)

expand a single darkroom module at a time
: Controls how [processing modules](../module-reference/processing-modules) are expanded. If this option is enabled, expanding a module by clicking collapses any currently expanded module. If you want to expand a module without collapsing the others you can do so with `Shift+click`. Disabling this option inverts the meaning of `click` and `Shift+click` (default on).

expand the module when it is activated, and collapse it when disabled
: Select this option for the darkroom to automatically expand or collapse [processing modules](../module-reference/processing-modules) when they are enabled or disabled. (default off)

scroll to darkroom modules when expanded/collapsed
: With this option enabled the darkroom side panel will scroll a [processing module](../module-reference/processing-modules) to the top when it is expanded or collapsed (default on).

border around image in darkroom mode
: Process the center image in darkroom mode with a small border of the given number of pixels (default 20). 

show scrollbars for center view
: Should scrollbars be shown in the center view of the darkroom (default off).

demosaicing for zoomed out darkroom mode
: Interpolation when not viewing 1:1 in darkroom mode
: _always bilinear (fast)_ is fastest, but not as sharp
: _at most PPG (reasonable)_ uses PPG + interpolation modes
: _full (possibly slow)_ will use exactly the settings for full-size export 
: (default _at most ppg (reasonable)_). 

reduce resolution of preview image
: Reduce the resolution of the [navigation preview](../module-reference/utility-modules/darkroom/navigation.md) image (choose from "original", "1/2", "1/3" or "1/4" size). This may improve the speed of the rendering but take care as it can also hinder accurate masking (default "original").
