---
title: scale pixels
id: scale-pixels
weight: 10
applicable-version: 3.2.1
tags: 
working-color-space: RGB 
view: darkroom
masking: false
---

Some cameras (such as the Nikon D1X) have rectangular instead of the usual square sensor cells. Without correction this would lead to distorted images. This module applies the required scaling.

darktable detects images that need correction using their Exif data and automatically activates this module where required. For other images the module always remains disabled. 

The module can also be used for anamorphic desqueeze when using anamorphic lenses or simply to make small adaptions to the aspect ratio to match common paper aspect ratios, instead of the need to crop the image and lose valuable image contents.

---

# module controls

pixel aspect ratio
: Aspect ratio of the pixels, usually 1 but some cameras need scaling: <1 means the image needs to be stretched vertically, (0.5 means 2x), >1 means the image needs to be stretched horizontally (2 means 2x).
