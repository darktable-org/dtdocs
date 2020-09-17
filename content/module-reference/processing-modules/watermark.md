---
title: watermark
id: watermark
applicable-verison: 3.2.1
tags: 
working-color-space: RGB
view: darkroom
masking: true
---

Render a vector-based overlay onto your image. Watermarks are standard SVG documents and can be designed using [Inkscape](http://www.inkscape.org/).

The SVG processor of darktable also substitutes strings within the SVG document, which allows you to include image dependent information in the watermark.

User-designed watermarks are placed into the directory `$HOME/.config/darktable/watermarks`. Once in place, use the reload button update the list of available watermarks.

The following is a list of variable strings that are supported for substitution within the svg document. 

Besides this list you can also use the variable strings defined in the [variables](../../special-topics/variables.md) section.

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
$(EXIF.MAKER)                 The maker of camera model
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
: Choose the watermark of interest. You can use the reload button to update the list with all newly added watermarks.

text
: A free text field with up to 63 characters which can be printed if the corresponding watermark references it. An example is supplied as `simple-text.svg`.

text color
: The text color. Clicking on the colored field will open a color selector dialog which offers you a choice of commonly used colors, or allows you to define a color in RGB color space.

text font
: The text font (default "DejaVu Sans Book"). Clicking on the field opens a dialog box which shows the fonts available to your system. Fonts can be searched by name and a preview of each available font is shown next to the font name; you may specify your own sample text.

opacity
: The opacity of the watermark's rendering.

scale
: Scale the watermark pixel-independently.

rotate
: The rotation angle of the watermark.

scale on
: Defines the reference for the scale parameter. The default setting “image” scales the watermark relative to the horizontal image size. Alternatively you can scale the watermark relative to the “larger border” or “smaller border”.

alignment
: Use these controls to align the watermark to any edge or center of the image.

x offset
: Pixel-independent offset relative to the choice of alignment on the x-axis.

y offset
: Pixel-independent offset relative to the choice of alignment on the y-axis.
