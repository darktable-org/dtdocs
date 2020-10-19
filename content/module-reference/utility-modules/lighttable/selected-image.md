---
title: selected images
id: selected-image 
applicable-verison: 3.2.1
tags: 
view: lighttable
---

Perform actions on images that have been selected in the lighttable view.

# module controls

The module controls are spread over two tabs, one for manipulating the image files, and the other for manipulating the metadata related to the images.

## images tab

remove
: Remove the selected images from the darktable database. Removed images can no longer be viewed or edited within darktable but the image files remain on the filesystem along with any XMP sidecar files. As darktable keeps the XMP files up-to-date with your latest development history, you can later fully restore your work by re-importing the images.

delete/trash
: Eliminate the selected images from the darktable database and remove any associated XMP sidecar files. If no duplicates of the selected image remain in the darktable database, the image file itself is also deleted. You can control whether this action irrevocably deletes the images or puts them into your system's trash bin with a configuration item in [`preferences` -> `security`](../../../preferences-settings/security.md). A second configuration item in the same tab allows you to control whether or not to be prompted before deleting images.

move
: Physically move selected images (the image file plus all associated XMP sidecar files) to another filesystem folder. If an image with the given filename already exists in the target folder the source image will not be moved.

copy
: Physically copy selected images (the image file plus all associated XMP sidecar file) to another filesystem folder. If an image with the given filename already exists in the target folder it will not be overwritten – instead a new duplicate will be generated with the same history stack as the source image.

create hdr
: Create a high dynamic range image from the selected images, and store it as a new source file in DNG format. Images need to be properly aligned, which implies that they have been taken on a sturdy tripod. You can also generate HDRs with programs like Luminance HDR, and later import them into darktable for further processing. Note that darktable will only create HDR images from raw files.

duplicate
: Create a virtual copy of the selected images within darktable. This allows you to test different edits on the same image, for example. Duplicate images share the same parent input file, but each have their own XMP sidecar file and separate entry in darktable's database.

rotation
: Perform a clockwise or counter-clockwise rotation on the selected images. The third button resets the image rotation to the value stored in the image's Exif data. This feature is directly linked to the [_orientation_](../../../module-reference/processing-modules/orientation.md) processing module -- adjustments made here are automatically converted into a history stack item for that module.

copy locally
: This action will create local copies of the selected images on the local drive. These copies will then be used when the original images are not accessible (see [local copies](../../../overview/sidecar-files/local-copies.md)).

resync local copy
: This action will synchronize the XMP sidecar of the local copy of each selected image with the copy in external storage, if needed, and will remove the local copies. Note that if a local copy has been modified and the external storage is not accessible the local copy won't be deleted (see [local copies](../../../overview/sidecar-files/local-copies.md)).

group
: Create a new group from selected images (see [image grouping](../../../lighttable/digital-asset-management/grouping.md)).

ungroup
: Remove selected images from a group (see [image grouping](../../../lighttable/digital-asset-management/grouping.md)).

## metadata tab

checkboxes
: Use the checkboxes to select which types metadata (ratings, tags, metadata, colors, geo tags) you want to operate on. 

copy
: Use this button to copy the metadata of the selected image onto the clipboard. If you have more than one image selected, or no images selected, then this button is unavailable.

paste
: Use this button to paste any metadata in the clipboard onto the selected images.

clear
: Use this button to clear from the image any metadata of the types selected in the checkboxes. 

mode
: when pasting metadata onto images, this menu controls whether the existing metadata should be merged with the metadata on the clipboard (_merge_), or whether the metadata types selected in the checkboxes should be completely replaced by the metadata from the clipboard (_overwrite_).

monochrome
: this button flags in the image metadata that the image is intended to be developed as a monochrome image, and should receive any monochrome-specific workflow treatment that is offered by the processing modules. Refer to the [developing monochrome images](../../../guides-tutorials/monochrome.md) section for more details.

color
: this button removes the monochrome workflow flags from the image metadata so that the image will receive the default workflow treatment that is normally used in darktable when developing photos.

