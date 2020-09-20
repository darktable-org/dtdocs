---
title: selected images
id: selected-image 
applicable-verison: 3.2.1
tags: 
view: lighttable
---

Perform actions on images that have been selected in the lighttable view.

# module controls

remove
: Remove the selected images from the darktable database. Removed images will not be shown in the lighttable view any more, but remain on the filesystem along with any XMP sidecar file. As darktable stores XMP files with your development parameters on disk, you can later fully reconstruct your work by re-importing the images.

delete/trash
: Eliminate the selected images from the darktable database and remove any associated XMP sidecar files. If no duplicates of the selected image remain in the darktable database, the image file itself is also deleted. You can control whether this action irrevocably deletes the images or puts them into your system's trash bin with a configuration item in [`preferences` -> `security`](../../../preferences-settings/security.md). A second configuration item in the same tab allows you to control whether or not to be prompted before deleting images.

move
: Physically move selected images (the image file plus all associated XMP sidecar files) to another filesystem folder. If an image with the given filename already exists in the target folder the source image is not moved.

copy
: Physically copy selected images (the image file plus all associated XMP sidecar file) to another filesystem folder. If an image with the given filename already exists in the target folder it is not overwritten – instead a new duplicate is generated with the same history stack as the source image.

create hdr
: Create a high dynamic range image from the selected images, and store it as a new source file in DNG format. Images need to be properly aligned, which implies that they have been taken on a sturdy tripod. You can also generate HDRs with programs like Luminance HDR, and later import them into darktable for further processing. Note that darktable will only create HDR images from raw files.

duplicate
: Create a virtual copy of the selected images within darktable. This allows you to test different edits on the same image, for example. Duplicate images share the same parent input file, but each have their own XMP sidecar file and entries in darktable's database.

rotation
: Perform a clockwise or counter-clockwise rotation on the selected images. The third button resets the image rotation to the value stored in the image's Exif data. This feature is directly linked to the darkroom [_orientation_](../../../module-reference/processing-modules/orientation.md) module – adjustments are automatically converted into a history stack item for that module.

copy locally
: This action will create local copies of the selected images into the local drive. These copies will then be used when the original images are not accessible (see [local copies](../../../overview/sidecar-files/local-copies.md)).

resync local copy
: This action will synchronize the XMP sidecar of the local copy of each selected image with the copy in external storage, if needed, and will remove the local copies. Note that if a local copy has been modified and the external storage is not accessible the local copy won't be deleted (see [local copies](../../../overview/sidecar-files/local-copies.md)).

group
: Create a new group from selected images (see [image grouping](../../../lighttable/digital-asset-management/grouping.md)).

ungroup
: Remove selected images from a group (see [image grouping](../../../lighttable/digital-asset-management/grouping.md)).
