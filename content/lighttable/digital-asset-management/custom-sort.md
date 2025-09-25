---
title: custom sort
id: custom-sort
weight: 80
author: "wbclay"
---

Setting _sort by_ > "custom sort" presents images in any sequence you define. Images are initally ordered by an image property (import order, image capture time, file name, etc.) but you can then incrementally alter "custom sort" sequences by drag-and-drop. Be careful: an erroneous drag-and-drop can easily ruin one or more painstakingly-created image sequences.

### cautions {#cautions}

- "Undo" __does not reverse__ drag-and-drop resequencing.

- Drag-and-drop resequencing is __always__ enabled in lighttable filemanager and in the filmstrip, but any resulting __changes are invisible__ if _sort by_ > "custom sort" is not in effect.

- Do not use "custom sort" for tag-based collections that specify a wild-card ("*" or "%") expression.[^1]

[^1]: When a wild-card tag expression does not resolve to a __single__ tag, then drag-and-drop operates on only the first matching tag's sequence. If that tag is attached to a source image, the image is resequenced. If the same tag is also attached to the target image, the drop occurs there; if not, resequenced images appear at the collection's "custom sort" tail or head. If the first matching tag is not attached to a source image, the image is not repositioned. Collections preference "tag case sensitivity" is relevant beyond case: "insensitive" treats "%" (but not "*") as a string-match wild card. The global sequence is not affected in any of these cases.

- Ensure any image you drag is __not selected__ unless you want to reposition the entire currently selected set.

- Aim your "drops" accurately: verify the correct target is __highlighted__ before dropping!

- "custom sort" positions are lost if images are removed from darktable or their tags are detached or deleted ([why?](../../../overview/sidecar-files/sidecar.md/#fn:1)). 

### _which_ custom sort sequence?

Collection type determines which [image sequence](../../lighttable/digital-asset-management/sequence.md) drag-and-drop changes. If the collection's selection criterion is _tag_, a __tag-based__ "custom sort" sequence is altered. Otherwise, the __global__ "custom sort" sequence is altered. Collection filters (even if tag-based) do not influence which sequence drag-and-drop changes.

When _sort by_ > "custom sort" is in effect, dragged-and-dropped images are immediately presented in their new tag-based or global "custom sort" sequence.

### what to drag, where to drop?

While viewing a collection in filemanager or the filmstrip, you may drag any hovered-over (highlighted) image to any other image in the displayed collection. Empty space before, between, or after images is not a recognized drop target.

You may relocate a single image (unselected or sole selection) or a selected set of images by dragging one of them to the desired position as follows:

- Drop on the image you want a dragged image or selected set to __precede__ when _sort order_  is __"ascending"__.

- Drop on the image you want a dragged image or selected set to __follow__ when _sort order_  is __"descending"__.

- Abort an accidental drag by dropping the dragged image _outside_ of the thumbnail display. If all peripheral panels are hidden, then drop the dragged image on __itself__. If multiple images were selected, the entire selected set will be relocated to that spot.

- If the "dropped on" image is subsequently resequenced, filtered out, or even deleted, the dropped image(s) remain where the "dropped on" image was located.

### who's last? (or, in descending sort, first?)

- An image dropped after the last image on lighttable is regarded as dropped __on the last image__, thus positioned before it. 

- To change the last image in an "ascending" "custom sort" display, drop it on the existing last image, then drag-and-drop that last image on its intended replacement. 

- If you expect to use a "descending" sort, do the opposite to change the first image.

### suggested process

1. If you intend to present a collection in more than one "custom sort" sequence or if some images in a collection are included in other collections to be displayed with a different global "custom sort", then tag-based collections should be used.

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
