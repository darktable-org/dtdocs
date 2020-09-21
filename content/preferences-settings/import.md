---
title: import
id: import
weight: 30
draft: false
---

This tab contains options related to importing images into darktable using the [import](../module-reference/utility-modules/lighttable/import.md) module.

### import

ignore JPEG images when importing film rolls
: When you have RAW+JPEG images together in one directory it usually doesn't make sense to import both. Set this flag to ignore all JPEGs when importing images (default off).

recursive directory traversal when importing film rolls
: When importing images from a folder, also recursively import images from its sub-folders. (default off).

creator to be applied when importing
: If provided, automatically add this string as a creator tag when importing images (default none).

publisher to be applied when importing
: If provided, automatically add this string as a publisher tag when importing images (default none).

rights to be applied when importing
: If provided, automatically add this string as a rights tag when importing images (default none).

comma separated tags to be applied when importing
: If you want to add further tags by default when importing images, you can provide them here as a comma separated list (default none).

initial import rating
: Initial star rating (from 0 to 5) for all images when importing a film roll (default 1). 

### session options

These options define a naming pattern to organize images on disk when importing from a connected camera and when taking photos in the [tethering](../tethering/_index.md) view.

The naming pattern consists of three parts: a base part defining the parent folder, a session part defining a sub directory (which is specific to the individual import session), and a file name part defining the filename structure for each imported image.

Several pre-defined variables can be used in the pattern as placeholders:

```
$(HOME)              the home folder as defined by the system
$(PICTURES_FOLDER)   the pictures folder as defined by the system (usually “$HOME/Pictures”)
$(DESKTOP)           the desktop folder as defined by the system (usually “$HOME/Desktop”)
$(USERNAME)          your user account name on the system
$(FILE_NAME)         basename of the imported image
$(FILE_EXTENSION)    extension of the imported image
$(JOBCODE)           unique identifier of the import job
$(SEQUENCE)          a sequence number within the import job
$(MAX_WIDTH)         maximum image width to limit within export session
$(MAX_HEIGHT)        maximum image height to limit within export session
$(ID)                unique identification number of the image in darktable's database
$(YEAR)              year at the date of import
$(MONTH)             month at the date of import
$(DAY)               day at the date of import
$(HOUR)              hour at the time of import
$(MINUTE)            minute at the time of import
$(SECOND)            second at the time of import
$(EXIF_YEAR)         year the photo was taken (from Exif data)
$(EXIF_MONTH)        month the photo was taken (from Exif data)
$(EXIF_DAY)          day the photo was taken (from Exif data)
$(EXIF_HOUR)         hour the photo was taken (from Exif data)
$(EXIF_MINUTE)       minute the photo was taken (from Exif data)
$(EXIF_SECOND)       seconds the photo was taken (from Exif data)
$(EXIF_ISO)          ISO value of the photo (from Exif data)
```

base directory naming pattern
: The base directory part of the naming pattern (default `$(PICTURES_FOLDER)/Darktable`).

sub directory naming pattern
: The sub directory part of the naming pattern (default `$(YEAR)$(MONTH)$(DAY)_$(JOBCODE)`).

keep original filename
: Check this box to keep original the filename instead of using the pattern below when importing from a camera or card (default off).

file naming pattern
: The file name part of the naming pattern (default `$(YEAR)$(MONTH)$(DAY)_$(SEQUENCE).$(FILE_EXTENSION`). 
