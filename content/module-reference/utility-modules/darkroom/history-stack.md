---
title: history stack
id: history-staack
applicable-verison: 3.2.1
tags: 
view: darkroom
---

Query and modify the history stack of the current darkroom image.

This module lists every change of state (activate/de-activate/move/change parameters) for all image processing modules that have been modified for the current image. You can select a point in the stack to return to that point in the development history of the image.

_Caution: adjusting any module will cause all modules above the currently selected one to be discarded. It is easy to lose development work on an image in this way!_

It is safe to quit the program, leave the darkroom mode, or switch to another image while having selected some earlier state in the history stack panel. The history stack remains unchanged. When returning to the image you will find the history stack panel in the state where you left it.

Hovering the mouse over an item in the history stack will show a tooltip with details of all changes that were made in that module compared to its previous or the default state. This could help track down adjustments that were made unintentionally and that cause a module to have unintended effects. Especially in complex modules with many tabs, or in parametric blending settings, this can avoid tedious searching.

Clicking “compress history stack” generates the shortest history stack that reproduces the current image. It causes all modules above the currently-selected one to be discarded. If any module appears multiple times in the remainder of the stack, these multiple appearances will be _compressed_ into a single step in the history.

Clicking "compress history stack" while holding the _Ctrl_ key truncates the history stack, but without compressing it i.e. it discards all modules above the currently selected one but leaving the remainder of the history stack unchanged.

Clicking on the "reset parameters" button in the module header discards the entire history stack and reactivates any default modules.

The button to the right of the "compress history stack" button allows you to create a new style from the history stack of the current image, which can then be applied to other images. Use the first line of the popup dialog window to name your style and the second to add a searchable description. You are prompted to choose which of the current history stack modules to include in the style.

Once created styles can then be managed and applied to other images through lighttable's _styles_ panel. 
