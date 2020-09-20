---
title: import, rate & tag images
id: import-rate-tag
draft: false
weight: 10
author: "people"
---

When you want to edit some new images in darktable, the first step is to [import](../../module-reference/utility-modules/lighttable/import.md) the images. This will create entries for the photos in darktable's library database so it can keep track of those photos and the changes you make to them. There are two main methods for importing photos:

import images from the filesystem
: You can import from the filesystem a single image, all images in a directory, or recursively import all images in a directory tree. When importing images, darktable will read the metadata in the images, and any [XMP sidecar file](../../overview/sidecar-files/_index.md) accompanying the image. If an image has already been imported, it will be ignored (though any updates to the sidecar file will be loaded). The location of the images is recorded in the darktable database, but darktable will not copy of move the files anywhere. If you want a program that will copy files into a specific directory, you can use a separate program like [rapid photo downloader](https://damonlynch.net/rapid/) for this.

import images from a camera
: To import images from a camera, connect the camera to your system. If your system tries to automount the camera's files, select the option to abort the mount operation, otherwise the camera cannot be accessed from within darktable. If you don't see your camera listed in the import module, hit the "scan for devices" button, and the import module should then offer the addition choices _import_ and _tethering_. Unlike the importing of images from the filesystem, darktable will copy files imported from the camera into a specified directory.

Once the images are imported, they will appear in the lighttable view. By default, the images will all be given a one-star rating. There are many different ways to manage a set of newly imported photos, such as giving them tags and adjusting their ratings. Please refer to the [lighttable](../../lighttable/_index.md) section of this guide for a list of management features.

One example workflow might be:
1. Set your lighttable to show photos with exactly a one star rating.
2. Do a quick first-level screening of your photos. Any photos that are badly out-of-focus or otherwise useless, _reject_ them with the `R` key, or give them a 0-star rating. If a photo looks reasonable and should pass to the next phase, press `2` to give them a 2 star rating. Any photos that no longer have a 1 star rating will disappear from view. Continue like this until you have completed the first level of assessment.
3. Set your lighttable to show only photos with exactly a 2-star rating. Go through those photos more carefully, and decide whether to promote them to a 3 star rating, or put them back down to a 0-star or rejected rating.
4. With your 3-star photos, you can now spend some time doing a quick edit to see if they are worth keeping. If you are happy with the editing results, you can create a tag for the photo, and promote it to a 4 or even 5-star rating.
5. Go through your 4 and 5-star photos, and print them out, publish on your portfolio site, etc. and bask in the copious amounts of critical acclaim you will receive! 
6. If space is at a premium you might want to consider permanently deleting your rejected or 0-star images. Select these images in the lighttable and use the 'trash' option in the [selected images](../../module-reference/utility-modules/lighttable/selected-image.md) module. You should probably only do this on photos you know you will never need again (badly focussed, significantly overexposed etc.).

