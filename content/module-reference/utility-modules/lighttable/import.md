---
title: import
id: import
applicable-verison: 3.6
tags:
view: lighttable
---

Import images into one or more film rolls.

Images can be imported from the local filesystem or from a connected camera. See [supported file formats](../../../overview/supported-file-formats.md) for more information.

# import from filesystem

You can import either a single image or a folder of images from the filesystem by clicking the relevant button. The imported image(s) will be automatically added to a film roll with the same name as the filesystem folder that they are imported from.

Click on “image” or “folder” to open a file selector dialog. Navigate through the filesystem, and select the item(s) to import.

## parameters

Click on the "parameters" label or the expander button beside it to display the following additional options related to file import.

All parameters are saved from one session to the next and can be saved as module presets. Press the module reset button to revert all parameters to their default value.

recursive directory (folder import only)
: Check this option to import images in the selected folder _and all subfolders_. It is recommended that you not use this option to import a large number of images at the same time. The import process causes darktable to generate thumbnails for all of the imported images, but in the end it will only be able to keep the most recent in its cache. It is therefore better to import images in smaller chunks to avoid the performance penalty this imposes.

ignore JPEG images
: Check this option if there are `JPEG` images in the same folder that you do not want to import. This option is usually used where the camera stores `RAW+JPEG` and you only want to work on the `RAW` files, leaving the `JPEG` images untouched.

ignore exif rating
: Check this option to ignore any rating stored within the image's Exif data and instead use a hard-coded value (below).

initial rating
: Initial star rating (from 0 to 5) for all images when importing a film roll (default 1).

apply metadata
: Check this option to automatically set metadata fields and/or tags at import time (see below).

metadata
: If the "apply metadata" box is checked, a list of the _visible_ metadata fields is presented for completion (see [metadata editor](../shared/metadata-editor.md) for details). Any populated strings are automatically added to the imported images. You can also choose from any presets saved within the metadata editor module.

: Double-click on a label to reset the corresponding field. Double-click on the "metadata presets" label to reset all fields.

: When [preferences > storage > write sidecar file for each image](../../../preferences-settings/storage.md#xmp) is unchecked an additional column "from xmp" is presented so that you can choose to prevent the import of non-desired metadata from xmp files.

tags
: If you want to add further tags by default when importing images, you can provide them here as a comma separated list. As with metadata you can also choose from any presets saved within the [tagging](../shared/tagging.md) module.

---

**Note:** When importing images from the filesystem, darktable does not create duplicates of your image files in a separate folder structure but processes them in-situ. The import process simply adds details of those images to darktable's database (and creates an XMP sidecar file if applicable) allowing the images to be viewed and developed.

This means that if you delete images from disk after having imported them, darktable cannot access them any more: Importing an image or folder in darktable is not a backup of your filesystem! Moreover, darktable does not watch for changes in the filesystem. Any new images will not be shown until they are explicitly imported.

---

# import from a connected camera

When a camera is detected, it will show up in the device panel automatically. If you hover your mouse over the camera tab label, a tooltip will pop up with information about the camera (model, firmware version etc.). Depending on the capabilities of the camera, the following options may be displayed:

import from camera
: This will bring up an import dialog, showing any images on camera that can be selected for import into a film roll.

: The base folder for storing imported images and the naming pattern of subfolders and individual images can be set in [preferences > import](../../../preferences-settings/import.md).

tethered shoot
: Tethering is used to integrate darktable with your camera. When you take images with your camera, they are automatically imported into darktable, so you can review the result of the shoot. You can also setup remote capture jobs, controlling the number of images and time between captures, along with camera settings such as exposure time, aperture etc.

: If supported by your camera, selecting _tethered shoot_ will take you into the [tethering](../../../tethering/_index.md) view.
