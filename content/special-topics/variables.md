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
$(ROLL.NAME)               film roll of the input image
$(FILE.FOLDER)             folder containing the input image
$(FILE.NAME)               basename of the input image
$(FILE.EXTENSION)          extension of the input image
$(ID)                      the image id
$(VERSION)                 the duplicate version number
$(VERSION.IF_MULTI)        same as $(VERSION) but null string if only one version exists
$(VERSION.NAME)            version name from metadata
$(DARKTABLE.VERSION)       the version of the running darktable instance
$(DARKTABLE.NAME)          name of darktable
$(SEQUENCE)                a sequence number within an export job
$(WIDTH.SENSOR)            width of RAW data in pixels before RAW crop
$(HEIGHT.SENSOR)           height of RAW data in pixels before RAW crop
$(WIDTH.RAW)               width of RAW data in pixels after RAW crop
$(HEIGHT.RAW)              height of RAW data in pixels after RAW crop
$(WIDTH.CROP)              image width in pixels at the end of the pixelpipe, but before export resize
$(HEIGHT.CROP)             image height in pixels at the end of the pixelpipe, but before export resize
$(WIDTH.EXPORT)            image width in pixels at the end of the pixelpipe and after export resize
$(HEIGHT.EXPORT)           image height in pixels at the end of the pixelpipe and after export resize
$(WIDTH.MAX)               maximum width entered in export module
$(HEIGHT.MAX)              maximum height entered in export module
$(YEAR)                    year at date of import/export
$(MONTH)                   month at date of import/export
$(DAY)                     day at date of import/export
$(HOUR)                    hour at time of import/export
$(MINUTE)                  minute at time of import/export
$(SECOND)                  second at time of import/export
$(MSEC)                    millisecond at time of import/export
$(EXIF.YEAR)               Exif year
$(EXIF.MONTH)              Exif month
$(EXIF.DAY)                Exif day
$(EXIF.HOUR)               Exif hour
$(EXIF.MINUTE)             Exif minute
$(EXIF.SECOND)             Exif second
$(EXIF.MSEC)               Exif millisecond
$(EXIF.ISO)                Exif ISO value
$(EXIF.EXPOSURE)           Exif exposure
$(EXIF.EXPOSURE.BIAS)      Exif exposure bias
$(EXIF.APERTURE)           Exif aperture
$(EXIF.FOCAL.LENGTH)       Exif focal length
$(EXIF.FOCUS.DISTANCE)     Exif focus distance
$(LONGITUDE)               longitude
$(LATITUDE)                latitude
$(ELEVATION)               elevation
$(STARS)                   star rating (text only)
$(RATING.ICONS)            star rating (using star characters)
$(LABELS)                  colorlabels (color labels as text)
$(LABELS.ICONS)            colorlabels (color labels as icons)
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
$(FOLDER.PICTURES)         pictures folder
$(FOLDER.HOME)             home folder
$(FOLDER.DESKTOP)          desktop folder
$(OPENCL.ACTIVATED)        whether OpenCL is activated
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
The image information patterns support [markup](https://docs.gtk.org/Pango/pango_markup.html), so adding the following to the start will give a clear warning when OpenCL has failed to initialise:

`<span alpha='1%'>$(OPENCL_ACTIVATED/no/<span foreground='red' weight='heavy' size='xx-large' alpha='100%'>OPENCL ACTIVATION FAILED</span>$(NL))</span>`
