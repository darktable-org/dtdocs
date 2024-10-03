---
title: import & review
id: import-review
draft: false
weight: 20
author: "people"
---

Before you can do anything in darktable you must first add some images files to the library using the [import](../../module-reference/utility-modules/lighttable/import.md) module in the [lighttable view](../../lighttable/_index.md). This will create entries for your images in darktable's library database so that it can keep track of the changes you make. There are three ways to import images, each accessible through buttons in the import module:

add to library
: This option adds images to the library without copying or moving -- your original files will stay in their current location and will not be altered. On import, darktable will read the metadata from the image files and any accompanying [XMP sidecar file](../../overview/sidecar-files/_index.md). If an image has already been added to the database, any updates you have made to the sidecar file will be loaded.

copy & import
: Copies the images to the storage location (following the file naming pattern defined in [preferences > import](../../preferences-settings/import.md)), then adds the _copied_ images to the library -- the original images are not changed or moved. Only the images are copied and if an existing XMP sidecar file is available for the image, it will *not* be read, copied or used.

copy & import from camera
: Connect the camera to your system with a USB cable (if your camera is auto-mounted by your system, you will need to un-mount it before it can be accessed by darktable). If you don't see your camera listed in the import module, press the "scan for devices" button. Once your camera is detected the import module should offer the ability to _copy & import_ images from the camera. Clicking the "copy & import" button physically copies the selected images from the camera into a specified directory (following the file naming pattern defined in [preferences > import](../../preferences-settings/import.md)) and then adds the copied images to the library.

Once images have been imported, their thumbnails are displayed in the lighttable view, within which you can organize and catalog your imported images -- please refer to the [digital asset management](../../lighttable/digital-asset-management/_index.md) section for more information.

The primary use for the lighttable view is to review your images and decide which you would like to edit further and which to discard. The following is a possible culling process to choose which images to edit/delete:
1. Set the lighttable view to only show images that are not rated with a star using the _view_ setting on the [top panel](../user-interface/top-panel.md). This will show all of the images you have just imported. You can use the [collections](../../module-reference/utility-modules/shared/collections.md) module to further refine your selection if needed.
2. Perform a quick first-level screening of your images: If any images are badly out-of-focus or otherwise unwanted, _reject_ them or give them a 1-star rating (by pressing the "R" or "1" keys, respectively, while hovering over the image with your mouse). If you would like an image to pass to the next review phase, press 2 to give it a 2 star rating. Any images that you rated will automatically disappear from view. Continue in this manner until no more images remain visible in the lighttable view.
3. Alter the lighttable view to only show images with 2 stars. Go through these images more carefully, and decide whether to promote them to a 3 star rating, or put them back down to a lower rating. Again, proceed until no more images remain in the lighttable view.
4. Alter the lighttable view to only show images with 3 stars. Perform quick edits and experiments on those images in the [darkroom view](../../darkroom/_index.md) to decide if they are worthy of further effort. If you are happy with the results of those edits, promote that image to a 4 star rating for final editing.
5. Go through your 4 star images, perform any final edits on them and then [export](../../module-reference/utility-modules/shared/export.md) to see the final result. Increase the rating a final time to 5 stars to indicate that processing is complete.

_If space is at a premium you might consider permanently deleting your rejected or 1-star images. Select these images in the lighttable view and use the 'trash/delete' option in the [actions on selection](../../module-reference/utility-modules/lighttable/selected-image.md) module. You should only do this for images you are certain you will never need again._
