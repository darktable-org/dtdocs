---
title: import
id: import
applicable-verison: 3.2.1
tags: 
view: lighttable
---

Import images into film rolls. 

Images can be imported from the local filesystem or from a connected camera. See [supported file formats](../../../overview/supported-file-formats.md) for information about the file formats currently supported by darktable.

# import from filesystem

You can import either a single image or a folder of images from the filesystem by clicking the relevant button. The imported image(s) will be automatically added to a film roll with the same name as the filesystem folder they are imported from.

Clicking on “image” or “folder” opens a file selector dialog. Navigate through the filesystem, and select the item(s) to import. 

On the lower part of the dialog, are some additional _import options_. These options can be set by default within [`preferences` -> `import`](../../../preferences-settings/import.md).

import folders recursively (folder import only)
: Check this option to import images in the currently selected folder and all subfolders. It is not recommended to use this option to import a large number of images at the same time. The import process causes darktable to generate thumbnails for all of the imported images, but in the end it will only be able to keep the recent ones in its cache. It is better to import images in smaller chunks.

ignore JPEG files
: Check this option if there are JPEG images in the same folder that you do not want to import. This option is usually used where the camera stores RAW+JPEG and you only want to work on the raw files, leaving the JPEG images alone.

apply metadata on import
: This option allows you to automatically set some metadata fields on your images at import time.

_Note: When importing images, darktable does not create duplicates of your image files in a separate folder structure but processes them in-situ. The import process simply adds details of those images to darktable's database (and creates an XMP sidecar file if applicable) allowing the images to be viewed and developed._

_This means that if you delete images from disk after having imported them, darktable cannot access them any more: Importing an image or folder in darktable is not a backup of your filesystem! Moreover, darktable does not watch for changes in the filesystem. Any new images will not be shown until they are explicitly imported._

# import from a connected camera

When a camera is detected, it will show up in the device panel after pressing “scan for devices”. If you hover your mouse over the camera tab label, a tooltip will pop up with information about the camera (model, firmware version etc.). Depending on the capabilities of the camera, the following options may be displayed:

import from camera
: This will bring up an import dialog, showing any images on camera that can be selected for import into a film roll in darktable.

: The base folder for storing imported images and the naming pattern of subfolders and individual images can be set in the [`preferences` -> `import`](../../../preferences-settings/import.md).

tethered shoot
: Tethering is used to integrate darktable with your camera. When you take images with your camera, they are automatically imported into darktable, so you can review the result of the shoot. You can also setup remote capture jobs, controlling the number of images and time between captures, along with camera settings such as exposure time, aperture etc.

: If supported by your camera, selecting _tethered shoot_ will take you into the [tethering](../../../tethering/_index.md) view.
