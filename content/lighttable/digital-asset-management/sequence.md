---
title: image seqence
id: sequence
weight: 25
author: "wbclay"
---

A collection of images is always presented in a specific _sort by_ sequence that determines the order of their display, processing, and export. It is often convenient to be able to control this sequence (e.g. for a slideshow or document).

You may choose to sort by an [image attribute](../../module-reference/utility-modules/shared/collections/#filtering-attributes) (filename, capture time, rating, title, etc.) using the _sort by_ drop-down menu at the left-hand-side of darktable's [top panel](../../../overview/user-interface/top-panel/) or combine multiple sort criteria by clicking on _new sort_ in the left panel at the bottom of the [collection filters](../../module-reference/utility-modules/shared/collection-filters/#sorting) module.

Whatever _sort by_ criterion is chosen, a collection may contain some images you need to present in a different order. In such cases, darktable's [custom sort](../../module-reference/utility-modules/shared/collection-filters.md#custom-sort) allows you to alter image sequence directly by dragging and dropping thumbnails in lighttable's [filemangager](../lighttable-modes/filemanager.md) mode or the [filmstrip](../../module-reference/utility-modules/shared/filmstrip.md) panel.

There are two distinct "custom sort" sequencing regimes:

-   One _global sequence_ over every image in a darktable library.

-   Multiple _tag-based_ sequences, one for each tag associated with one or more images.

When an image is imported into your darktable library, it is automatically positioned in the global sequence after all previously-imported images. A duplicated image is initially positioned in the global sequence immediately after its original, regardless of intervening image imports.

Tagged images are sequenced within each attached tag in the order that the tag is attached. Selected sets of images are tagged in order of the _sort by_ setting in effect at the moment the tag is attached. Newly-tagged images are initially positioned after all images previously associated with that tag. A duplicated image inherits all of its original's tags and is positioned within each as a newly-tagged image.

A collection's selection criteria determines which sequence drag-and-drop alters while working in lighttable filemanager or the filmstrip. Dragging-and-dropping within a tag-based collection alters a designated tag's sequence. Otherwise, drag-and-drop alters the global sequence of all images in the library.

See the [custom sort](../../module-reference//utility-modules/shared/collection-filters.md#custom-sort) section for information on how to efficiently and safely use drag-and-drop image resequencing.
