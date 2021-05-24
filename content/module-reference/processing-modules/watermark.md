---
title: watermark
id: watermark
applicable-version: 3.2.1
tags: 
working-color-space: RGB
view: darkroom
masking: true
---

Render a vector-based overlay onto your image. Watermarks are standard SVG documents and can be designed using [Inkscape](http://www.inkscape.org/).

The SVG processor in darktable can also substitute strings within the SVG document, allowing image-dependent information to be included in the watermark.

User-designed watermarks should be placed into the directory `$HOME/.config/darktable/watermarks`. Once in place, use the reload button update the list of available watermarks.

The following is a list of variable strings that are supported for substitution within the SVG document. 

In addition to this list you can also use the variable strings defined in the [variables](../../special-topics/variables.md) section.

```
$(DARKTABLE.NAME)             The application name
$(DARKTABLE.VERSION)          The version of darktable
$(WATERMARK_TEXT)             A short free text (max. 63 characters)
$(WATERMARK_COLOR)            The color to use for $WATERMARK_TEXT
$(WATERMARK_FONT_FAMILY)      The font family to use for $WATERMARK_TEXT
$(WATERMARK_FONT_STYLE)       The font style (normal, oblique, italic)
$(WATERMARK_FONT_WEIGHT)      The font weight (boldness)
$(IMAGE.ID)                   The unique image id within current library
$(IMAGE.FILENAME)             The image filename
$(IMAGE.BASENAME)             The image file basename
$(IMAGE.EXIF)                 The image Exif string
$(EXIF.DATE)                  The image date
$(EXIF.DATE.SECOND)           Seconds from the image Exif data
$(EXIF.DATE.MINUTE)           Minutes from the image Exif data
$(EXIF.DATE.HOUR)             Hours from the image Exif data (24h)
$(EXIF.DATE.HOUR_AMPM)        Hours from the image Exif data (12h, AM/PM)
$(EXIF.DATE.DAY)              Day of month from the image Exif data (01 .. 31)
$(EXIF.DATE.MONTH)            Month from the image Exif data (01 .. 12)
$(EXIF.DATE.SHORT_MONTH)      Month from the image Exif data localized (Jan, Feb, .. Dec)
$(EXIF.DATE.LONG_MONTH)       Month from the image Exif data localized (January, February, .. December)
$(EXIF.DATE.SHORT_YEAR)       Abbreviated year from the image Exif data (2013 is "13")
$(EXIF.DATE.LONG_YEAR)        Full year from the image Exif data
$(DATE)                       Current system date
$(DATE.SECOND)                Current system time seconds
$(DATE.MINUTE)                Current system time minutes
$(DATE.HOUR)                  Current system time hours (24h)
$(DATE.HOUR_AMPM)             Current system time hours (12, AP/PM)
$(DATE.DAY)                   Current system time day of month (01 .. 31)
$(DATE.MONTH)                 Current system time month (01 .. 12)
$(DATE.SHORT_MONTH)           Current system time month localized (Jan, Feb, .. Dec)
$(DATE.LONG_MONTH)            Current system time month localized (January, February, .. December)
$(DATE.SHORT_YEAR)            Current system time year (abbreviated)
$(DATE.LONG_YEAR)             Current system time year
$(EXIF.MAKER)                 The maker of the camera
$(EXIF.MODEL)                 The camera model
$(EXIF.LENS)                  The specific lens used
$(Xmp.dc.creator)             The creator string
$(Xmp.dc.publisher)           The publisher string
$(Xmp.dc.title)               The title of the image
$(Xmp.dc.description)         The description of the image. 
                              Some cameras use this to store shoot-time user-specified text (also called “Exif.Photo.UserComment”).
$(Xmp.dc.rights)              The rights assigned to the image
$(GPS.LATITUDE)               The image latitude coordinate (N/S 0 .. 90)
$(GPS.LONGITUDE)              The image longitude coordinate (E/W 0 .. 180)
$(GPS.ELEVATION)              The image elevation level (meters)
$(GPS.LOCATION)               All three coordinates (latitude, longitude, elevation) 
```

# module controls

marker
: Choose the watermark to apply. Use the reload button to update the list to include any newly-added watermarks.

text
: A free text field in which you can enter up to 63 characters to be printed where referenced by the corresponding watermark. An example is supplied as `simple-text.svg`.

text color
: The color of the text. Click on the colored field to open a color selector dialog which offers you a choice of commonly used colors, or allows you to define a color in RGB color space.

text font
: The font to use (default "DejaVu Sans Book"). Click on the field to open a dialog box showing the fonts available on your system. Fonts can be searched by name and a preview is shown next to the font name. You may specify your own sample text.

opacity
: The opacity of the watermark's rendering.

scale
: The scale of the watermark, with respect to the option selected in the "scale on" parameter.

rotate
: The rotation angle of the watermark.

scale on
: The reference for the scale parameter. The default setting “image” scales the watermark relative to the horizontal image size. Alternatively you can scale the watermark relative to the “larger border” or “smaller border”.

alignment
: Use these controls to align the watermark to any edge or the center of the image.

x offset
: Pixel-independent offset relative to the choice of alignment on the x-axis.

y offset
: Pixel-independent offset relative to the choice of alignment on the y-axis.
