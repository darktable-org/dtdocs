---
title: watermark
id: watermark
applicable-version: 4.0
tags:
working-color-space: RGB
view: darkroom
masking: true
---

Render a vector-based overlay onto your image. Watermarks are standard SVG documents and can be designed using [Inkscape](http://www.inkscape.org/).

You can also use bitmap (PNG) images.

The SVG processor in Ansel can also substitute strings within an SVG document, allowing image-dependent information to be included in the watermark.

User-designed watermarks should be placed into the directory `$HOME/.config/Ansel/watermarks`. Once in place, use the reload button update the list of available watermarks.

The following is a list of variable strings that are supported for substitution within an SVG document.

In addition to this list you can also use the variable strings defined in the [variables](../../special-topics/variables.md) section.

```
$(WATERMARK_TEXT)             A short free text (max. 63 characters)
$(WATERMARK_COLOR)            The color to use for $WATERMARK_TEXT
$(WATERMARK_FONT_FAMILY)      The font family to use for $WATERMARK_TEXT
$(WATERMARK_FONT_STYLE)       The font style (normal, oblique, italic)
$(WATERMARK_FONT_WEIGHT)      The font weight (boldness)
```

# module controls

marker
: Choose the watermark to apply. Use the reload button to update the list to include any newly-added watermarks. The extension of the file (png/svg) is shown in brackets.

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
