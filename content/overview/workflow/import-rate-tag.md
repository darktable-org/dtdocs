---
title: import, rate & tag images
id: import-rate-tag
draft: false
weight: 10
author: "people"
---

When you want to edit some new images in darktable, the first step is to add them to the darktable library with the lighttable [import](../../module-reference/utility-modules/lighttable/import.md) module. This will create entries for the imported images in darktable's library database so that it can keep track of the changes you make. There are three main methods for importing images:

add images to the library
: You can add images to the library without copying them or moving them within your file system using the "add to library" button in the import module. When adding images, darktable will read the image's internal metadata and any accompanying [XMP sidecar file](../../overview/sidecar-files/_index.md). If an image has already been added to the database, it will be ignored (though any updates to the sidecar file will be loaded). The location of each image is recorded in the library database, but darktable will not copy or move the files anywhere. 

copy & import
: This is the same as the above option but it also allows you to first take a copy of those images to a new location (following the file naming pattern defined in [preferences > import](../../preferences-settings/import.md)), before loading the copied images into the library.

copy & import from camera
: To import images from a camera, first connect the camera to your system with a USB cable. If your system tries to automatically mount the camera's files, you should abort the mount operation, otherwise the camera cannot be accessed from within darktable. If you don't see your camera listed in the import module, press the "scan for devices" button. Once your camera is detected the import module should offer the ability to _copy & import_ images from the camera or _tether_ your camera while shooting. As with the "copy & import" button, darktable will physically copy files imported from the camera into a specified directory following the file naming pattern defined in [preferences > import](../../preferences-settings/import.md).

Once images have been added to the library, they will appear in the lighttable view. By default, new images will all be given a one-star rating.

There are many different ways to manage a set of newly imported photos, such as giving them tags and adjusting their ratings. Please refer to the [digital asset management](../../lighttable/digital-asset-management/_index.md) section for more information.

One example workflow might be:
1. Set the lighttable view to show photos with exactly a 1 star rating.
2. Perform a quick first-level screening of your photos. If any photos are badly out-of-focus or otherwise unwanted, _reject_ them with the R key, or give them a 0-star rating. If a photo looks reasonable and should pass to the next phase, press 2 to give it a 2 star rating. Any photos that no longer have a 1 star rating will automatically disappear from view. Continue in this manner until you have completed the first level of assessment.
3. Set the lighttable view to show only photos with exactly a 2 star rating. Go through your previously-selected photos more carefully, and decide whether to promote them to a 3 star rating, or put them back down to a 1 star or rejected rating.
4. Spend some time performing a quick edit on your 3 star photos, to see if they are worth keeping. If you are happy with the results, you can create a tag for the photo, and promote it to a 4 or even 5 star rating.
5. Go through your 4 and 5 star photos, perform any final edits on them, print them out, publish on your portfolio site, etc. and bask in the copious amounts of critical acclaim you will receive! 
6. If space is at a premium you might want to consider permanently deleting your rejected or 0-star images. Select these images in the lighttable and use the 'trash' option in the [selected images](../../module-reference/utility-modules/lighttable/selected-image.md) module. You should probably only do this on photos you are certain you will never need again.

