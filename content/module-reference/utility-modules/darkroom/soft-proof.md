---
title: soft proof
id: soft-proof
applicable-verison: 3.2.1
tags: 
view: darkroom
---

Click the icon on the right of the bottom panel to activate the soft proof display mode on your image. Soft proof allows you to preview your image rendered using a printer profile to see how colors will end up on the final print. You can also activate soft proof with the keyboard shortcut `Ctrl+S`. A message “soft proof" on the bottom left of your image tells you that you are in soft proof display mode.

Right-click on the icon to open a dialog with the following configuration parameters. 	

display intent
: Set the rendering intent for your display – only available if rendering with LittleCMS2 is activated. See [rendering intent](../../../special-topics/color-management/rendering-intent.md) for a list of available options.

softproof profile
: Set the color profile for soft proofing from the list of available profiles in `$DARKTABLE/share/darktable/color/out` and `$HOME/.config/darktable/color/out` (where `$DARKTABLE` represents darktable's installation directory and `$HOME` your home directory). Typically these profiles are supplied by your printer or generated during printer profiling.

display profile
: Set the color profile for the display. The option “system display profile” is the preferred setting when working with a calibrated display. The profile is taken either from your system's color manager or from your X display server. The method darktable uses to detect your system display profile can be changed in [`preferences > miscellaneous`](../../../preferences-settings/miscellaneous.md). For more information see [display profile](../../../special-topics/color-management/display-profile.md).
