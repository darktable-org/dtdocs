---
title: filmstrip
id: filmstrip
applicable-version: 4.6
tags: 
view: darkroom, tethering, map, print
---

The filmstrip panel allows users to quickly switch between images in the currently-selected collection without leaving the current view. It sits under the centre panel in all views except lighttable where it is replaced by the timeline panel. It can be switched on and off using the shortcut Ctrl+F.

![filmstrip](./filmstrip/filmstrip.png)

The images shown in the filmstrip panel are the same as those displayed in the lighttable view.  The height of the panel can be changed by clicking and dragging its top border.

Clicking on an image in the filmstrip panel selects that image for display and processing in the centre panel.

**navigation**
- `space` moves forward one image in the filmstrip
  
- `backspace` moves backward one image in the filmstrip
  
- `scroll` with the mouse allows you to navigate through the images in the filmstrip
  
- `shift+scroll` increases scroll speed

**actions on the selected images**
- `F1, F2, F3, F4, F5` adds or removes a color label (red, yellow, green, blue, purple, respectively). A color label will be added if _any_ selected image does not currently have the label; otherwise the label will be removed

- `0, 1, 2, 3, 4, 5` sets the star rating

- `R` rejects the image(s)

- `Ctrl+D` duplicates the image(s)

- `Ctrl+C` copies the full history stack

- `Ctrl+V` pastes all of the copied history stack

- `Ctrl+Shift+C` selectively copies the history stack

- `Ctrl+Shift+V` selectively pastes from the copied history stack

Hover over an image on the filmstrip with your mouse to select it without changing the image being processed.  This can be useful for example to compare metadata against other images or to act on the selected image with a keyboard shortcut.

**selecting images**

- `Ctrl+A` selects all images in the filmstrip

- `Ctrl+Shift+A` deselects all images

- `Ctrl+I` inverts the current selection

To select multiple images in the filmstrip, use Alt+click to select the first image, followed by either Ctrl+click to select or de-select further images, or Shift+click to select a range of images.

See the lighttable's [history stack](../lighttable/history-stack.md) module documentation for more information about the copy and paste functionality.
