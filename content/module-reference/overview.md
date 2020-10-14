---
title: overview
id: module-reference-overview
weight: 10
draft: false
author: "people"
---

The modules in this reference section have been broken down into two types:

[processing modules](./processing-modules/_index.md)
: These modules are used exclusively in the darkroom view. Together they form the [pixelpipe](../darkroom/processing-modules-and-pixelpipe/the-pixelpipe-and-module-order.md), and they directly perform pixel operations on an image to take its from the original format through to the final output form.

[utility modules](./utility-modules/_index.md)
: These modules are used not only in the darkroom view, but in all the other views as well. They perform any other ancillary functions related to managing the image metadata and tags, editing history, pixel pipeline order, snapshots and duplicates, image export and so on.

The two types of modules have a few aspects in common, which are described below.

# module header

Each module will have a header which normally consists of the following elements:

module name
: The name of the module appears art the top, and if you `Click` on the name it will expand or collapse the rest of the module.

reset parameters
: to the right of the module name there is normally a _reset parameters_ button that can be used to reset the state of the module back to its original condition.

presets menu
: At the far right of the module header is a [presets](../darkroom/interacting-with-modules/presets.md) menu. These are predominantly used in the processing modules, but many of the utility modules allow presets to be defined as well.
 
The processing modules will contain additional elements in their module header, and these are described in the [darkroom module header](../darkroom/interacting-with-modules/module-header.md) section.

# module sizing

Some modules contain lists of infomation which can grow as more entries are added. To help manage screen real-estate, it is possible to shrink down or expand the number of entries that are displayed at one time in the list of a module. Place the mouse over an etry in the list, and use `Ctrl-scroll` to increase or reduce the number of entries that are shown. If the list contains more entries that can be shown at one time, a scrollbar to the right of the list can be used to scroll through all the entries of the list.

