---
title: starting up
id: startup
draft: true
weight: 10
author: "people"
---

# the lighttable

The left pane primarily contains modules for managing your image collection.

The right pane primarily contains modules for manipulating the edits and metadata of groups of images.

The top pane ....

The bottom pane ....

Since these panels take up a considerable amount of space, each of them can be hidden using the triangles at
the middle of the corresponding side of darktable's window.  For left and right, clicking the triangle toggles
visibility of the panel, while top and bottom cycle through the four possible states of the two elements of
the panel.  You can also press Shift-Control-L/R/T/B to toggle the left, right, top, and bottom panels,
respectively.  Pressing Tab will temporarily hide all of the side panels; press Tab again to restore the
previous state.


# controlling darktable

You have probably already noticed that darktable does not use a traditional program menu.  Instead, it relies
heavily on local per-module menus as well as keyboard shortcuts and mouse actions (together with shifting keys
such as Shift and Control) and user presets.

Keyboard shortcuts are completely customizable, and nearly every action that can be performed in darktable can
be assigned to a shortcut.  The only shortcut you really need to remember is H -- darktable will pop up a
window showing all keyboard shortcuts and mouse actions available in the current context for as long as you
hold down that key.  Click on the {icon} at the top right of that window (while still holding down H) to make
the window stay visible permanently.  This permanent window will update every time there is a change in the
available shortcuts.


# preferences

Keyboard shortcuts are not the only thing you can customize.  darktable tries hard to let you work in whatever
way is most efficient for _you_, so it also has a large number of other preferences that can be set.  Global
preferences and those affecting multiple modules are set by clicking on the gear icon ({icon}) at the top right
of the center view.  Preferences affecting just a single module are set by clicking on the "hamburger" icon
({icon}) at the right of the module's header and selecting "preferences".

For this tour, we need to set two preferences to non-default values.  Click the gear icon, then click on
"processing" in the left-hand column of the preferences dialog.  Now select "scene-referred" for "auto-apply
pixel workflow defaults" and "modern" for "auto-apply chromatic adaptation defaults".  A dot will appear next
to each to indicate that you have changed the setting from its default.  These settings are actually the ones
recommended by the developers, but are not the default because they are a new paradigm which requires
unlearning some habits acquired in other programs.

