---
title: Preferences - miscellaneous tab
date: 2020-09-09
draft: false
---

### interface

mouse wheel scrolls modules side panel by default
: When enabled, mouse wheel scroll modules side panel, and Ctrl+Alt+mouse wheel scroll data entry. When disabled, this behavior is reversed (default off). 

always show panels scrollbars
: Defines whether the panel scrollbars should be always visible or activated only depending on the content (default on). (need a restart) 

method to use for getting the display profile
: This option allows the user to force darktable to use a specific method to obtain the current display profile for color management **see LINK TBC**. In the default setting “all” darktable will either query the X display server's xatom or the colord system service. You can set this option to “xatom” or “colord” to enforce a specific method if the two methods give different results. 

### tags

omit hierarchy in simple tag lists
: When exporting images the hierarchical tags are also added as a simple list of non-hierarchical ones to make them visible to some other programs. When this option is checked darktable will only include their last part and ignore the rest. So “foo|bar|baz” will only add “baz”. 

disable the entry completion
: The entry completion is useful for those who enter tags from keyboard only. For others the entry completion can be embarrassing (default off). (need a restart) 

### keyboard shortcuts with multiple instances

It is possible to create multiple instances of many image operations modules. In this scenario it is not always obvious which instance should be controlled by keyboard shortcut operations. The following options control rules that are applied (in order) to decide which module instance keyboard shortcuts will be applied to.

* **prefer expanded instances**: if instances of the module are expanded, ignore collapsed instances
* **prefer enabled instances**: after applying the above rule, if instances of the module are active, ignore inactive instances
* **prefer unmasked instances**: after applying the above rules, if instances of the module are unmasked, ignore masked instances
* **selection order**: after applying the above rules, apply the shortcut to the first or last instance remaining

These rules are also used when clicking and dragging on the histogram to change exposure.

### other

do not show april 1st game
: Don't show a game when opening darktable on April 1st (default on). 

password storage backend to use
: The storage backend for password storage. Options: “auto” (default), “none”, “libsecret”, “kwallet”. 

executable for playing audio files
: Defines an external program which is used in the lighttable view to play audio files that some cameras record to keep notes for images (default “aplay”). 