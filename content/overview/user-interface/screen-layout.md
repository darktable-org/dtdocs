---
title: screen layout
id: screen-layout
draft: false
weight: 20
author: "people"
---

The layout of all darktable views is similar and consists of a center area with panels at the edges: 

![screen-layout](./screen-layout/screen-layout.png#w100)

1. center area
: Contains information and functionality specific to the current view.

2. left panel
: Contains modules primarily used to provide information.

3. right panel
: Contains modules primarily used for image processing.

4. top banner
: Contains information about the current darktable version and allows you to switch between views. Also used by some modules to show additional hints and messages.

5. [top panel](./top-panel.md)
: Provides access to global settings and shortcuts

6. bottom panel
: Provides access to view-specific settings and shortcuts.

7. [filmstrip](../../module-reference/utility-modules/shared/filmstrip.md)/[timeline](../../module-reference/utility-modules/lighttable/timeline.md) panel
: An optional panel that can be enabled at the bottom of the screen to display a timeline (in the lighttable view) or a filmstrip (in other views) of images in the current collection.

# panel size and visibility

The left, right and filmstrip/timeline panels can be resized by dragging their inner borders. 

Each of the panels can be expanded or collapsed by pressing the triangle located at the outside edge of the panels. Panel visibility can also be adjusted using keyboard shortcuts, as follows:

 - `TAB` temporarily expands the centre view to fill the whole window. Press again to return to the previous view.
 - `F11` toggles fullscreen mode
 - `Shift+Ctrl+t` toggles the top panel (between the image and the top banner)
 - `Shift+Ctrl+b` toggles the bottom panel (between the image and the filmstrip/timeline, if shown)
 - `Shift+Ctrl+l` toggles the left panel
 - `Shift+Ctrl+r` toggles the right panel
 - `Ctrl+f` toggle sthe filmstrip/timeline
 - `Ctrl+h` toggles the top banner
 - `b` toggles all borders and panel-collapse controls

---

**Note:** The size and visibility of the panels are stored independently for each view.

---
