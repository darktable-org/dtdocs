---
title: Preferences - darkroom tab
date: 2020-09-09
draft: false
---

The following options control functionality in the darkroom view.

pen pressure control for brush masks
: Controls how the pressure reading of a graphics tablet impacts newly generated drawn-mask brush strokes. You can control the brush width, its hardness and its opacity. “Absolute” control means that the pressure reading directly defines the attribute with a value between 0% and 100%. “Relative” means that the pressure reading adjusts the attribute between zero and the pre-defined default value (default off).

smoothing of brush strokes
: Sets the level for smoothing of brush strokes. Stronger smoothing leads to fewer nodes and easier editing at the expense of lower accuracy.

display of individual color channels
: Controls how individual color channels are displayed when activated in the parametric masks feature. You can choose between “false color” and “grey scale” (default "false color").

pattern for the image infos line
: See **TBC** for available values.

position of the image info line
: Control the panel in which the image info line is displaye. Choose between “top left” “top right” “top center” “bottom” and “hidden” (default "bottom").

show search module text entry
: Controls how the darkroom determines which modules are shown at the same time in the right panel. You can choose between “groups icons” “search entry” “both” (default "both"). (need a restart)

expand a single darkroom module at a time
: Controls how darkroom modules are expanded. If this option is enabled, expanding a module by clicking collapses any currently expanded module. If you want to expand a module without collapsing the others you can do so with Shift+click. Disabling this option reverts the meaning of click and Shift+click (default on).

expand the module when it is activated, and collapse it when disabled
: This option means that darktable will automatically expand or collapse darkroom modules when they are enabled or disabled. (default off)

scroll to darkroom modules when expanded/collapsed
: With this option enabled the darkroom side panel will scroll a module to the top when it is expanded or collapsed (default on).

border around image in darkroom mode
: Process the image in darkroom mode with a small border of the given number of pixels (default 20). 

show scrollbars for center view
: Should scrollbars be shown in the center view of the darkroom (default off).

demosaicing for zoomed out darkroom mode
: Interpolation when not viewing 1:1 in darkroom mode: “always bilinear (fast)” is fastest, but not as sharp. “at most PPG (reasonable)” is using PPG + interpolation modes specified below, “full (possibly slow)” will use exactly the settings for full-size export (default “at most ppg (reasonable)”). 

reduce resolution of preview image
: Reduce the resolution of the navigation preview image (choose from "original", "1/2", "1/3" or "1/4" size). This may improve the speed of the rendering but take care as it can also hinder accurate masking (default "original").