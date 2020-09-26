---
title: print settings
id: print-settings
applicable-verison: 3.2.1
tags: 
view: print
---

Manage settings for the [print view](../../../print/_index.md).

# module controls

profile
: The export profile to use. This profile is the entry point used for the next transformation using the printer's ICC profile. Usually it is better to prefer a large gamut (e.g. AdobeRGB) rather than a smaller one (e.g. sRGB).

intent
: The rendering intent to use when exporting the image. For more information see [rendering intent](../../../special-topics/color-management/rendering-intent.md).

style
: Defines a style to apply when exporting the image and defaults to “none”. See the [export selected](../lighttable/export-selected.md) module for a more detailed discussion of applying a style during export.

mode
: Whether the style is appended to the existing history stack or replaces it completely. See the [export selected](../lighttable/export-selected.md) module for more details.
