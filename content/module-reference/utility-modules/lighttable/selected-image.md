---
title: selected images
id: selected-image 
applicable-verison: 3.2.1
tags: 
view: lighttable
---

Perform actions on images that have been selected in the lighttable view.

# Module Controls

remove
: Remove the selected images from the darktable database. Removed images will not be shown in the lighttable view any more, but remain on the filesystem alongside any XMP sidecar file. As darktable stores XMP files with your development parameters on disk, you can later fully reconstruct your work by just re-importing the images.

delete/trash
: Eliminate the selected images from the darktable database and remove any associated XMP sidecar files. If no duplicates of the selected image remain in the darktable database, the image file itself is also deleted. You can control whether this action irrevocably deletes the images or puts them into your system's trash bin with a configuration item in the _security_ tab of the _preferences_ dialog. A second configuration item in the same tab allows you to control whether or not to be prompted before deleting images.

move
: Physically move selected images (image file plus all associated XMP sidecar files) to another filesystem folder. If an image with the given filename already exists in the target folder the source image is not moved but kept where it is.

copy
: Physically copy selected images (image file plus all associated XMP sidecar file) to another filesystem folder. If an image with the given filename already exists in the target folder it does not get overwritten – instead a new duplicate is generated with the same history stack as the source image.

create hdr
: Create a high dynamic range image from the selected images, and store it as a new source file in DNG format. Images need to be properly aligned, which implies that they have been taken on a sturdy tripod. You can also generate HDRs with programs like Luminance HDR, and later import them into darktable for further processing. Note that darktable will only create HDR images from raw files.

duplicate
: Create a virtual copy of the selected images within darktable. This allows you to test different edits on the same image, for example. Duplicate images share the same parent input file, but each have their own XMP sidecar file and entries in darktable's database.

rotation
: Perform a clockwise or counter-clockwise rotation on the selected images. The third button resets the image rotation to the value stored in the Exif data. This feature is directly linked to the darkroom _orientation_ module – adjustments are converted into history stack items of that module.

copy locally
: This action will create local copies of the selected images into the local drive. These copies will then be used when the original images are not accessible (see Section **LINK TBC** “Local copies”).

resync local copy
: This action will synchronize the XMP sidecars of the temporary local copy and the copy in external storage, if needed, and will remove the local copies. Note that if a local copy has been modified and the external storage is not accessible the local copy won't be deleted (see Section **LINK TBC**, “Local copies”).

group
: Create a new group from selected images (see Section **LINK TBC** “Image grouping”).

ungroup
: Remove selected images from a group (see Section **LINK TBC** “Image grouping”).
