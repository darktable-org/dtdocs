---
title: variables
id: variables
weight: 60
draft: false
author: "people"
---

darktable supports variable substitution in a number of modules and preference settings. For example:

- Defining file names in the [export](../module-reference/utility-modules/shared/export.md) module
- Displaying image information in the darkroom's [image information line](../module-reference/utility-modules/darkroom/image-info-line.md)
- Displaying image information in the lighttable's overlays and tooltips (see [preferences > lighttable](../preferences-settings/lighttable.md))
- Placing text on an image in the [_watermark_](../module-reference/processing-modules/watermark.md) processing module

# available variables

The following variables are available, though they may not all be applicable in every context:

```
$(ROLL_NAME)               film roll of the input image
$(FILE_FOLDER)             folder containing the input image
$(FILE_NAME)               basename of the input image
$(FILE_EXTENSION)          extension of the input image
$(ID)                      the image id
$(VERSION)                 the duplicate version number
$(VERSION_IF_MULTI)        same as $(VERSION) but null string if only one version exists
$(VERSION_NAME)            version name from metadata
$(SEQUENCE)                a sequence number within an export job
$(SENSOR_WIDTH)            width of RAW data in pixels (shown in parentheses in the image information module)
$(SENSOR_HEIGHT)           height of RAW data in pixels (shown in parentheses in the image information module)
$(MAX_WIDTH)               processable image width at the start of the pixelpipe
$(MAX_HEIGHT)              image height at the start of the pixelpipe (shown as Width in the image information module)
$(EXPORT_WIDTH)            image width in pixels after cropping, perspective correction, and other distortions
$(EXPORT_HEIGHT)           image height in pixels after cropping, perspective correction, and other distortions
$(YEAR)                    year at date of export
$(MONTH)                   month at date of export
$(DAY)                     day at date of export
$(HOUR)                    hour at time of export
$(MINUTE)                  minute at time of export
$(SECOND)                  second at time of export
$(EXIF_YEAR)               Exif year
$(EXIF_MONTH)              Exif month
$(EXIF_DAY)                Exif day
$(EXIF_HOUR)               Exif hour
$(EXIF_MINUTE)             Exif minute
$(EXIF_SECOND)             Exif second
$(EXIF_ISO)                ISO value
$(EXIF_EXPOSURE)           Exif exposure
$(EXIF_EXPOSURE_BIAS)      Exif exposure bias
$(EXIF_APERTURE)           Exif aperture
$(EXIF_FOCAL_LENGTH)       Exif focal length
$(EXIF_FOCUS_DISTANCE)     Exif focus distance
$(LONGITUDE)               longitude
$(LATITUDE)                latitude
$(ELEVATION)               elevation
$(STARS)                   star rating (text only)
$(RATING_ICONS)            star rating (using star characters)
$(LABELS)                  colorlabels (text only)
$(LABELS_ICONS)            colorlabels (using colored bullet characters)
$(LABELS_COLORICONS)       colorlabels (using colored icons)
$(MAKER)                   camera maker
$(MODEL)                   camera model
$(LENS)                    lens
$(TITLE)                   title from metadata
$(DESCRIPTION)             description from metadata
$(CREATOR)                 creator from metadata
$(PUBLISHER)               publisher from metadata
$(RIGHTS)                  rights from metadata
$(TAGS)                    tags list (Xmp.dc.Subject)
$(CATEGORYn(category))     tag name of level n [0,9] of selected category (or tag)
$(SIDECAR_TXT)             content of the text sidecar file (if any)
$(PICTURES_FOLDER)         pictures folder
$(HOME)                    home folder
$(DESKTOP)                 desktop folder
$(OPENCL_ACTIVATED)        whether OpenCL is activated
$(USERNAME)                user name defined by OS
$(NL)                      newline character
$(JOBCODE)                 internal jobcode of current job
```

# string substitution

All of the variables support basic string substitution inspired by bash though some of the details differ. 

All patterns are treated as simple string comparisons. There is no regex support. 

The following string replacement functions are provided, where `var` is one of the variables listed above:

```
$(var-default)                   If var is empty, return "default"

$(var+alt_value)                 If var is set, return "alt_value" else return empty string

$(var:offset)                    Return var starting from offset 
                                 If offset is negative count from the end of the string

$(var:offset:length)             Starting from offset, return at most length characters of var
                                 If offset is negative the length is counted from the end of var
                                 If length is negative this indicates the end of the result, 
                                  counted from the end of var, and not an actual length

$(var#pattern)                   Remove "pattern" from the start of var 

$(var%pattern)                   Remove "pattern" from the end of var 

$(var/pattern/replacement)       Replace the first occurrence of "pattern" in var with "replacement"
                                 If "replacement" is empty then "pattern" will be removed

$(var//pattern/replacement)      Replace all occurrences of "pattern" in var with "replacement"
                                 If "replacement" is empty then "pattern" will be removed

$(var/#pattern/replacement)      If var starts with "pattern then "pattern" is replaced with "replacement" 

$(var/%pattern/replacement)      If var ends with "pattern" then "pattern" is replaced with "replacement" 

$(var^)                          Make the first character of var uppercase

$(var^^)                         Make all characters of var uppercase

$(var,)                          Make the first character of var lowercase

$(var,,)                         Make all characters of var lowercase
```
