---
title: remove an object from an image
id: remove-object
weight: 70
draft: false
author: "people"
---

darktable does not provide any AI-based object removal or inpainting
methods, but you can replace an area in your image using either the
[_retouch_](../module-reference/processing-modules/retouch.md)
or [_composite_](../module-reference/processing-modules/composite.md)
modules.  With _retouch_, you can replace the area with content from
elsewhere in the same image using the "heal" or "clone" modes, while
_composite_ lets you insert an arbitrary image from your library.
