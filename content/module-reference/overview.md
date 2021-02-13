---
title: overview
id: module-reference-overview
weight: 10
draft: false
author: "people"
---

The modules in this reference section are broken down into two types:

[processing modules](./processing-modules/_index.md)
: These modules are used exclusively in the darkroom view, and each performs its processing operation on the image before passing the image up to the next module for further processing. Together this sequence of processing steps forms the [pixelpipe](../darkroom/pixelpipe/the-pixelpipe-and-module-order.md).

[utility modules](./utility-modules/_index.md)
: These modules may be used in any darktable view. They are not directly involved in processing the pixels of your image; instead they perform other ancillary functions related to managing the image metadata and tags, editing history, modifying overall pixel pipeline order, snapshots and duplicates, image export and so on.

The two types of modules have a few aspects in common, as described below.

# module header

Each module has a header at the top, normally consisting of the following elements:

module name
: Click on the name to expand or collapse the rest of the module and show/hide its controls.

reset parameters button
: This normally appears to the right of the module name and is used to reset the state of the module back to its original condition.

presets  menu
: This normally appears at the far right of the module header. The [presets](../darkroom/interacting-with-modules/presets.md) menu is predominantly used in processing modules, but many of the utility modules allow presets to be defined as well. You can also access this menu by right-clicking on the module header.
 
Processing modules contain additional elements in their module header, as described in the [darkroom module header](../darkroom/interacting-with-modules/module-header.md) section.

# module resizing

Some modules contain lists of infomation which can grow as more entries are added. To help manage screen real-estate, it is possible to shrink or expand the number of entries that are displayed in the list of a module. Place the mouse over an entry in the list, and hold Ctrl while scrolling your mouse wheel to increase or reduce the number of entries that are shown. If the list contains more entries that can be shown at one time, a scrollbar will appear to the right of the list, so that you can access the hidden entries.

