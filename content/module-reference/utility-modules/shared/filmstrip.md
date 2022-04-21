---
title: filmstrip
id: filmstrip
applicable-version: 4.0
tags: 
view: lighttable, darkroom, tethering, map, print
---

The filmstrip can be used to quickly switch between images in any darktable view. The images shown are the same as those displayed in the lighttable view and are defined by the currently-selected collection.

![filmstrip](./filmstrip/filmstrip.png)

The filmstrip can be switched on and off using the shortcut Ctrl+F. The height of the filmstrip panel can be changed by clicking and dragging its top border.

Quickly navigate through the images in the filmstrip by scrolling with the mouse. In the darkroom you can change the photo currently being processed by clicking on another image in the filmstrip.

In the darkroom, the image currently being processed is selected and highlighted. Hover over an image on the filmstrip with your mouse to select it (in order to act on it with a keyboard shortcut) without changing the image being processed.

If you wish to select multiple images in the filmstrip, use Alt+click to select the first image, followed by either Ctrl+click to select or de-select further images, or Shift+click to select a range of images.

The following shortcuts are available to select images in the filmstrip or to perform actions on the selected images:

```
Ctrl+A         select all images in the filmstrip
Ctrl+Shift+A   deselect all images
Ctrl+I         invert the current selection

F1 – F5        add or remove color label (red, yellow, green, blue, purple)
0 – 5          set/change image rating
R              reject image
Ctrl+D         duplicate image
Ctrl+C         copy the full history stack
Ctrl+V         paste all of the copied history stack
Ctrl+Shift+C   selectively copy the history stack
Ctrl+Shift+V   selectively paste from the copied history stack
```

_N.B. A color label will be added to all selected images if **any** of them do not currently have the label; otherwise the label will be removed from all selected images._

See the lighttable's [history stack](../lighttable/history-stack.md) module documentation for more information about the copy and paste functionality.
