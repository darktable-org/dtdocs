---
title: full preview
date: 2022-12-04T02:19:02+01:00
id: full-preview
draft: false
weight: 40
author: "people"
---

From any of the lighttable modes, you can display a fully-zoomed preview of the image that is currently under the mouse pointer by pressing and holding down W. This is useful to more closely inspect an image while rating and selecting images.

Pressing and holding Ctrl+W fully zooms into the image and also identifies any regions of sharpness in the image that may indicate image focus. For this tool to work the input image needs to hold an embedded JPEG thumbnail, which is the case for most raw files.

Regions in the image with a high level of sharpness are indicated with red borders. If no such regions are found, any regions of moderate sharpness are identified with a blue border. Note that this is not the same as the [focus peaking](../../modules/utility-modules/shared/focus-peaking.md) indicator, which is another way to identifying areas of sharpness within an image.

Sometimes pressing W or Ctrl+W may not appear to have any effect -- in such cases, click on the image thumbnail and press the corresponding key again.

If you want the full preview to stay in place without having to hold the W key, you can enable sticky preview mode by pressing F. In sticky preview mode, you can zoom and pan within the image in a similar way to the [culling](./culling.md) mode. Press F or ESC to return to the original view.
