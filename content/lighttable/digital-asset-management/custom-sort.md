---
title: custom sort
id: custom-sort
weight: 80
author: "wbclay"
---

Setting _sort by_ > "custom sort" presents images in any sequence you define. Images are initally ordered by an image property (import order, image capture time, file name, etc.) but you can then incrementally alter any "custom sort" sequence by drag-and-drop as desired. Be careful: an erroneous drag-and-drop can easily ruin one or more painstakingly-created image sequences.

### cautions {#cautions}

- "Undo" __does not reverse__ drag-and-drop resequencing.

- Drag-and-drop resequencing is __always__ enabled in lighttable filemanager and in the filmstrip, but any resulting __changes are invisible__ if _sort by_ > "custom sort" is not in effect.

- Ensure any image you drag is __not selected__ unless you want to reposition the entire currently selected set.

- Aim your "drops" accurately: verify the correct target is __highlighted__ before dropping!

- "custom sort" positions are lost if images are removed from darktable or their tags are detached or deleted ([why?](../../../overview/sidecar-files/sidecar.md/#fn:1)). 

### _which_ custom sort sequence?

Collection type determines which [image sequence](../../lighttable/digital-asset-management/sequence.md) drag-and-drop changes. If the collection's primary selection criterion is _tag_, a __tag-based__ "custom sort" sequence is altered. Otherwise, the __global__ "custom sort" sequence is altered. Collection filters, if any, do not affect which sequence drag-and-drop changes.

When _sort by_ > "custom sort" is in effect, dragged-and-dropped images are immediately presented in their new tag-based or global "custom sort" sequence.

### what to drag, where to drop?

While viewing a collection in filemanager or the filmstrip, you may drag any hovered-over (highlighted) image to any other image in the displayed collection. Empty space before, between, or after images is not a recognized drop target.

- You may relocate a single image (unselected or sole selection) or a selected set of images by dragging one of them to desired position as follows:

- Drop on the image you want a dragged image or selected set to __precede__ when _sort order_  is __"ascending"__.

- Drop on the image you want a dragged image or selected set to __follow__ when _sort order_  is __"descending"__.

### who's last? (or, in descending sort, first?)

- An image dropped after the last image on lighttable is regarded as dropped __on the last image__, thus positioned before it. 
- To change the last image in an "ascending" "custom sort" display, drop it on the existing last image, then drag-and-drop that last image on its intended replacement. 
- If you expect to use a "descending" sort, do the opposite to change the first image.

### suggested process

1. If you intend to present a collection in more than one "custom sort" sequence or if some images in a collection are included in other collections to be displayed with a different "custom sort", then it is probably preferable define tag-based collections.

2. For tag-based "custom sort" only: 
- Set _sort by_ to the image attribute and _sort order_ (ascending or descending) you want as your tag's initial sequence, 
- Select the images to be sequenced, and
- in the right-hand panel at _tagging_, bottom half, add a new tag or click on an existing tag.
- The tag is now attached to the selected images in the displayed sequence. Note the tag's increased image count.
- Change _collections_ selection crierion to "tag" and choose the newly-applied tag. Note that the newly-tagged images are shown.
3. Long-distance drags are difficult because neither _filemanager_ nor _filmstrip_ scroll while you drag. Try to fit drag sources and targets onto the same screen by maximizing the the window and scrolling the display. If that's not sufficient: 
- increase the number of images displayed (thus shrinking thumbnails) or
- hide images between drag source and drop target using _collection filters_ (e.g., by ranges of "datetime captured" or "image id").
4. Rearrange the images as you desire:
- __Clear any active selection__: _selection_ > _select none_.
- Set _sort by_ > "custom sort" so you can verify your changes immediately.
- Remember the __[cautions](#cautions)__ above as you drag-and-drop.

### corner cases

drop-target moves or vanishes
: Resequencing, filtering out, or even deleting a "dropped-on" image does _not_ resequence images that were dropped on it earlier. They remain where the "dropped on" image was previously located.

mixed-up tags
: As of this writing, resequencing behavior of collections based on multiple tags or on a mix of tagged and untagged images is not clear. Use "custom sort" on such collections with caution pending further research.

tag editing considered harmful
: A change request laments that editing tags regenerates the related "tagged image" database table in an unspecified order, possibly losing any previous "custom sort."
