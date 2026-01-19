---
title: image grouping
id: grouping
weight: 50
---

Grouping images helps to improve the structure and clarity of your image collection when displayed in the lighttable view.

You can combine images into a group by selecting them and clicking the “group” button in the [actions on selection](../../../module-reference/utility-modules/lighttable/selected-image.md) module, or by pressing Ctrl+G. Likewise, you can remove selected images from a group by clicking the “ungroup” button, or pressing Ctrl+Shift+G. 

Duplicated images are automatically grouped together. Similarly, if you import multiple images from the same directory, having the same base name, but different extensions (eg. `IMG_1234.CR2` and `IMG_1234.JPG`), those images automatically form a group.

Images that are members of a group are denoted by a group icon ![top panel_grouping icon](./grouping/top-panel_grouping.png#icon) in their thumbnails. Note that this icon is only shown when "overlays" are displayed on image thumbnails. Thumbnail overlays can be enabled by selecting the star icon in the [top panel](../../overview/user-interface/top-panel.md).

This icon also appears as a button, in the top panel of the lighttable view, that can be used to toggle grouping on and off. If grouping is off, all images are displayed as individual thumbnails. If grouping is on, the images in a group are represented by a single thumbnail image (the group leader). If you press the group icon in the group leader's thumbnail, that group is expanded (click a second time to collapse). If you then expand another group, the first group collapses. 

An expanded group in the filemanager mode of lighttable view is indicated by an orange frame that appears as soon as your mouse pointer hovers over one of the images. This frame surrounds all images in the group.

You can define which image is considered to be the group leader by clicking on the group icon of the desired image while that group is expanded. The group icon is shown only if grouping mode is enabled, so to change the group leader, you need to first enable grouping, expand the appropriate group and finally click the group icon of the desired "group leader" image. The current group leader is shown in a tooltip when you hover over the group icon of an image.

If you collapse an image group and then enter darkroom mode (e.g. by double-clicking on the thumbnail), the group leader image will be opened for developing.

Image groups are also a convenient way to protect an existing history stack against unintentional changes. If you have just finalized an image and want to protect its current version, simply select the image, click “duplicate” in the actions on selection panel, and make sure that grouping is switched on and that the group is collapsed. Now, whenever you open the image group again in the darkroom, only the group leader will be altered. The underlying duplicate will remain unchanged.

---

**Note:** “duplicating images” only generates a copy of an image's history stack, stored in another small XMP file. There is still only one raw file.

---
