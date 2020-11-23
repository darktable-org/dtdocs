---
title: miscellaneous
id: miscellaneous
weight: 110
draft: false
---

# interface

sort built-in presets first
: Choose how the presets menu is sorted. If this option is enabled, built-in presets are shown first. If the option is disabled, user presets are shown first (default on).

mouse wheel scrolls modules side panel by default
: When enabled, the mouse wheel scrolls side panels by default and `Ctrl+Alt+mouse wheel` scrolls data entry fields. When disabled, this behavior is reversed (default off). 

always show panels' scrollbars
: Defines whether the panel scrollbars should be always visible or activated only depending on the panel content (default on). (needs a restart) 

method to use for getting the display profile
: This option allows the user to force darktable to use a specific method to obtain the current display profile for [color management](../special-topics/color-management/_index.md). In the default setting “all”, darktable will choose to query the X display server's xatom or the colord system service. You can set this option to “xatom” or “colord” to enforce a specific method if the two methods give different results. You can run the [darktable-cmstest](../special-topics/program-invocation/darktable-cmstest.md) binary to examine your color management subsystem.

# tags

omit hierarchy in simple tag lists
: When exporting images any hierarchical tags are also added as a simple list of non-hierarchical tags to make them visible to some other programs. When this option is checked darktable will only include the last part of the hierarchy and ignore the rest. So `foo|bar|baz` will only add `baz`. 

disable the entry completion
: The entry completion is useful for those who enter tags using the keyboard only. For others the entry completion can be embarrassing (default off). (needs a restart) 

# keyboard shortcuts with multiple instances

It is possible to create multiple instances of many processing modules. In this scenario it is not always obvious which instance should be controlled by keyboard shortcut operations. The following options control rules that are applied (in order) to decide which module instance keyboard shortcuts should be applied to.

These rules are also used when clicking and dragging on the histogram to change exposure.

prefer expanded instances
: If instances of the module are expanded, ignore collapsed instances (default off).

prefer enabled instances
: After applying the above rule, if remaining instances of the module are active, ignore inactive instances (default off).

prefer unmasked instances
: After applying the above rules, if remaining instances of the module are unmasked, ignore masked instances (default off).

selection order
: After applying the above rules, apply the shortcut to the first or last instance remaining (default "last instance").

# other

do not show april 1st game
: Don't show a game when opening darktable on April 1st (default on). 

password storage backend to use
: The backend to use for password storage. Options: “auto” (default), “none”, “libsecret”, “kwallet”. 

executable for playing audio files
: Define an external program which is used in the lighttable view to play audio files that some cameras record to keep notes for images (default “aplay”). 
