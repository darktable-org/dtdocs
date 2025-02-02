---
title: image seqence
id: sequence
weight: 70
author: "wbclay"
---

A collection's images are always presented in a specific _sort by_ sequence that determines the order of their display, processing, and export, which it is often convenient to control  (_e.g._, for a slideshow or document).

You may choose an [image attribute](../../module-reference/utility-modules/shared/collections/#filtering-attributes) (filename, capture time, rating, title, etc.) as the sort criterion in the _sort by_ pull-down menu and icon at the left-hand-side of darktable's [top panel](../../../overview/user-interface/top-panel/) or combine multiple sort criteria by clicking on _new sort_ in the left panel at the bottom of the  [collection filters](../../module-reference/utility-modules/shared/collection-filters/#sorting).

Whatever _sort by_ criterion is chosen, a collection may contain some images you need to present in a different order. In such cases, darktable's [custom sort](../../lighttable/digital-asset-management/custom-sort.md) allows you to alter image sequence directly by dragging and dropping thumbnails in lighttable filemangager or the filmstrip.

There are two distinct "custom sort" sequencing regimes:

- One __global sequence__ over every image in a darktable repository.

- Multiple __tag-based__ sequences, one for each tag associated with one or more images.

When an image is imported into your darktable library, it is automatically positioned in the global sequence after all previously-imported images. A duplicated image is initially positioned in the global sequence immediately after its original, regardless of intervening image imports.

Tagged images are sequenced within each attached tag in the order that the tag is attached. Selected sets of images are tagged in order of the _sort by_ setting in effect at the moment the tag is attached. Newly-tagged images are initially positioned after all images previously associated with that tag. A duplicated image inherits all of its original's tags and is positioned within each as a newly-tagged image.

A collection's __selection criterion__ determines which sequence drag-and-drop alters while working in lighttable filemanager or the filmstrip. Drag-and-drop withn a tag-based collection alters a designated tag's sequence. Otherwise, drag-and-drop alters the global sequence of all images in the library.

The next section, [custom sort](../../lighttable/digital-asset-management/custom-sort.md), suggests how to efficiently and safely use drag-and-drop image resequencing. __Note its [cautions](./custom-sort.md#cautions).__
