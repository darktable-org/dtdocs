---
title: selected images
id: selected-image 
applicable-version: 3.6
tags: 
view: lighttable
---

Perform actions on images that have been selected in the lighttable view.

# module controls

The module controls are spread over two tabs for manipulating the image files and the related metadata.

## images tab

remove
: Remove the selected images from the darktable library without deleting them. Removed images can no longer be viewed or edited within darktable but the image files remain on the filesystem along with any XMP sidecar files. As darktable keeps the XMP files up-to-date with your latest development history, you can fully restore your work later by re-importing the images.

delete / delete (trash)
: Remove the selected images from the darktable library and remove any associated XMP sidecar files from the filesystem. If no duplicates of a removed image remain in the darktable library, the image file itself is also deleted. You can control whether this action irrevocably deletes the files or attempts to put them into your system's trash bin with a configuration item in [preferences > security](../../../preferences-settings/security.md). A second configuration item in the same tab allows you to control whether or not to be prompted before deleting images.

move
: Physically move selected images (the image files plus all associated XMP sidecars) to another folder on the filesystem. If an image with the given filename already exists in the target folder the source image will not be moved.

copy
: Physically copy selected images (the image file plus all associated XMP sidecars) to another folder on the filesystem. If an image with the given filename already exists in the target folder it will not be overwritten – instead a new duplicate will be generated with the same history stack as the source image.

create hdr
: Create a high dynamic range image from the selected images, and add the result to the library as a new image in DNG format. Images need to be properly aligned, which implies that they have been taken on a sturdy tripod. You can also generate HDRs with programs like Luminance HDR, and later import them into darktable for further processing. Note that darktable can only create HDR images from raw files.

duplicate
: Create duplicates of the selected images within darktable. Duplicate images share the same image file, but each duplicate has its own XMP sidecar file and a separate entry in darktable's library database. This allows you to test different edits on the same image.

rotation
: Perform a clockwise or counter-clockwise rotation on the selected images. A third button can be used to reset the image rotation to the value stored in the image's Exif data. This feature is directly linked to the [_orientation_](../../../module-reference/processing-modules/orientation.md) processing module -- adjustments made here are automatically converted into a history stack item for that module.

copy locally
: Create local copies of the selected images on the local drive. These copies will then be used when the original images are not accessible (see [local copies](../../../overview/sidecar-files/local-copies.md)).

resync local copy
: Synchronize the XMP sidecar of the local copy of each selected image with the copy in external storage, and remove the local copies. Note that if a local copy has been modified and the external storage is not accessible the local copy will not be deleted (see [local copies](../../../overview/sidecar-files/local-copies.md)).

group
: Create a new group from the selected images (see [image grouping](../../../lighttable/digital-asset-management/grouping.md)).

ungroup
: Remove the selected images from their group (see [image grouping](../../../lighttable/digital-asset-management/grouping.md)).

## metadata tab

metadata type checkboxes
: Choose the types of metadata (ratings, tags, metadata, colors, geo tags) that you want to operate on. 

copy
: Copy the chosen types of metadata from the selected image onto the clipboard. If you have more than one image selected, or no images selected, then this button is unavailable.

paste
: Paste any metadata in the clipboard onto the selected images.

clear
: Clear the chosen types of metadata from the selected images.

mode
: When pasting metadata onto images, this option controls whether the metadata on the clipboard should be merged with the existing metadata (_merge_), or should replace it entirely (_overwrite_).

refresh exif
: Refresh the Exif data from the source file. Warning: this may overwrite some tags and metadata that you have altered in darktable (such as star ratings).

monochrome
: Flag the image as monochrome, meaning that it will receive any monochrome-specific workflow treatment that is offered by the processing modules. Refer to the [developing monochrome images](../../../guides-tutorials/monochrome.md) section for more details.

color
: Remove the monochrome flag from the image so that it will receive the default workflow treatment that is normally used when developing color photos.

