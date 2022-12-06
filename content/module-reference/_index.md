---
title: Module Reference
id: module-reference
weight: 80
draft: false
author: "people"
---

The modules in this reference section are broken down into two distinct types:

[processing modules](./processing-modules/_index.md)
: Processing modules are used exclusively in the darkroom view. Each module performs a processing operation on the image before passing its output to the next module for further processing. Together this sequence of processing steps forms the [pixelpipe](../darkroom/pixelpipe/the-pixelpipe-and-module-order.md).

[utility modules](./utility-modules/_index.md)
: Utility modules may be used in any Ansel view. They are not directly involved in processing the pixels of an image but perform other ancillary functions (managing image metadata and tags, editing history, modifying pixel pipeline order, snapshots and duplicates, image export etc.).

The two types of modules have a few aspects in common, described below.

## module header

Each module has a header at the top, normally consisting of the following elements:

module name
: Click on the name to expand or collapse the rest of the module and show/hide its controls.

reset parameters button
: This normally appears to the right of the module name and is used to reset the state of the module back to its original condition.

presets  menu
: This normally appears at the far right of the module header. The [presets](../darkroom/processing-modules/presets.md) menu is predominantly used in processing modules, but many of the utility modules allow presets to be defined as well. You can also access this menu by right-clicking anywhere on the module header.

Processing modules contain additional elements in their module header, as described in the [processing module header](../darkroom/processing-modules/module-header.md) section.

## module resizing

#### utility modules

Some utility modules contain lists of information that can grow as more entries are added. To help manage screen real-estate, it is possible to increase or decrease the maximum number of entries that can be displayed before a scroll bar is added. To alter the maximum number of entries, place the mouse over an entry in the list, and hold Ctrl while scrolling your mouse wheel. If the list currently contains more entries than this maximum, a scrollbar will appear so that you can access the hidden entries.

---

**Note:** It is not possible to extend these areas beyond the number of entries currently shown. If you attempt to do so using Ctrl+scroll, the maximum number of entries _will_ increase, and a toast message will appear informing you of the new maximum. However, the module itself will not be resized unless its content exceeds this maximum.

---

#### processing modules

Some processing modules contain drawn graphical elements that can take up too much or too little screen space depending on the width of your side panels. These drawing areas usually default to a 16:9 aspect ratio and can be similarly resized by hovering over them and holding Ctrl while scrolling.
