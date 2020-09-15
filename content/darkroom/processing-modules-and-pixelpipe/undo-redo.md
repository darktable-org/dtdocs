---
title: Undo and Redo
id: undo-redo
weight: 40
draft: false
---

While you are editing your image, darktable records all of your changes in the _history stack_. This includes modifications of any parameter in a module itself but also if a module instance is added or removed. Thanks to this recording it is possible to undo and redo changes to recover a previous editing state. Note that this undo/redo facility is unlimited in the number of steps while editing an image but it is reset each time the darkroom is switched to a new image.

The default key shortcuts are:

Ctrl+Z
: undo last history modification

Ctrl+Y 
: redo last undo (does nothing if undo has not been used yet)



