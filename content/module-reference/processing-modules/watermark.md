---
title: watermark
id: watermark
weight: 10
applicable-version: 4.4
tags:
working-color-space: RGB
view: darkroom
masking: true
---

Render a vector-based overlay onto your image. Watermarks are standard SVG documents and can be designed using [Inkscape](http://www.inkscape.org/).

You can also use bitmap (PNG) images.

The SVG processor in darktable can also substitute strings within an SVG document, allowing image-dependent information to be included in the watermark.

User-designed watermarks should be placed into the directory `$HOME/.config/darktable/watermarks`. Once in place, use the reload button update the list of available watermarks.

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

font
: The font to use (default "DejaVu Sans Book"). Click on the field to open a dialog box showing the fonts available on your system. Fonts can be searched by name and a preview is shown next to the font name. You may specify your own sample text.

color
: The color of the text. Click on the colored field to open a color selector dialog which offers you a choice of commonly used colors, or allows you to define a color in RGB color space.

opacity
: The opacity of the watermark's rendering.

rotation
: The rotation angle of the watermark.

scale
: The scale of the watermark (in per cent), with respect to the option selected in the "scale on" parameter.

scale on
: The reference for the scale parameter -- how the watermark is scaled relative to the image:
: - "image" (default): Scale the watermark relative to the whole image,
: - "larger border": Scale the larger border of the watermark relative to the larger border of the image,
: - "smaller border": Scale the smaller border of the watermark relative to the smaller border of the image,
: - "height": Scale the height of the watermark relative to the height of the image (useful for text with a constant font height),
: - "advanced options": activate additional options (below) to allow you to choose which image dimension to scale to which watermark dimension. For example, you can choose to scale the watermark's height relative to the image's width.

scale marker to ("advanced options" only)
: The image reference against which the watermark should be scaled -- "image width", "image height", "larger image border" or "smaller image border".

scale marker reference ("advanced options" only)
: The dimension of the unrotated watermark ("marker width" or "marker height") to use as a scaling reference.

alignment
: Use these controls to align the watermark to any edge or the center of the image.

x offset
: Pixel-independent offset relative to the choice of alignment on the x-axis.

y offset
: Pixel-independent offset relative to the choice of alignment on the y-axis.
