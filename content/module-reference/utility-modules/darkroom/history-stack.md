---
title: history stack
id: history-staack
applicable-version: 3.8
tags: 
view: darkroom
---

View and modify the [history stack](../../../darkroom/pixelpipe/history-stack.md) of the current darkroom image.

This module lists every change of state (activate/de-activate/move/change parameters) for all processing modules that have been modified for the current image. Select a point in the stack to return to that point in the development history of the image. Shift+click an item in the history stack to expand that module in the right-hand module panel without changing the current edit.

---

**Caution:** If you select a module in the history stack and then make further modifications to the image, all edits above the currently selected step will be discarded. It is easy to lose development work on an image in this way! You can usually use Ctrl+Z to undo such changes.

---

It is safe to quit the program, leave the darkroom mode, or switch to another image after having selected some earlier state in the history stack module. When returning to that image you will find the history stack panel in the state where you left it.

Hover the mouse over an item in the history stack to show a tooltip with details of all changes that were made in that module compared to its previous or default state. This can help you to track down adjustments that were made unintentionally.

Click “compress history stack” to generate the shortest history stack that reproduces the current image. This causes all edits above the currently-selected step to be discarded. If any module appears multiple times in the remainder of the stack, these will be _compressed_ into a single step in the history.

Click "compress history stack" while holding the Ctrl key to truncate the history stack without compressing it i.e. discard all modules above the currently selected one but leaving the remainder of the history stack unchanged.

Click the "reset parameters" button in the module header to discard the entire history stack and reactivate any default modules. This can also be achieved by selecting the "original image" history item and clicking "compress history stack".

The button to the right of the "compress history stack" button allows you to create a new style from the history stack of the current image, which can then be applied to other images. Use the first line of the popup dialog window to name your style and the second to add a searchable description. You will be prompted to choose which of the modules from the current history stack to include in the style.

Once created, styles can be managed and applied to other images with the lighttable's [styles](../lighttable/styles.md) module.  You can also assign shortcut keys to your styles (see [preferences > shortcuts](../../../preferences-settings/shortcuts.md)) and apply the associated style to all selected images by pressing the shortcut key whenever you are in the lighttable or darkroom view.

