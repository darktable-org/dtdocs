---
title: import
id: import
weight: 30
draft: false
---

This tab contains a number of default settings for the lighttable [import](../module-reference/utility-modules/lighttable/import.md) module.

# session options

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
