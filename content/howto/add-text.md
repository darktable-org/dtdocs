---
title: add text to an image
id: add-text
weight: 80
draft: false
author: "people"
---

Use the [_watermark_](../module-reference/processing-modules/watermark.md)
module with one of the text markers, i.e. "simple-text",
"simple-text-shadow", or "fixed-size-text".

You can add multi-line text with a single instance of the module by
inserting "$(NL)" where the text should wrap to the next line.  Other
[variables](../special-topics/variables.md) can also be inserted and
will be replaced by their current values whenever the image is
processed.
