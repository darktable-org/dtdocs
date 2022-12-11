---
title: rotate pixels
date: 2022-12-04T02:19:02+01:00
id: rotate-pixels
applicable-version: 3.2.1
tags:
working-color-space: RGB
view: darkroom
masking: false
---

The sensors of some cameras (such as the Fujifilm FinePix S2Pro, F700, and E550) have a diagonally oriented Bayer pattern instead of the usual orthogonal layout.

Without correction this would lead to a tilted image with black corners. This module applies the required rotation.

Ansel detects images that need correction using their Exif data and automatically activates this module where required. For other images the module always remains disabled.

The module has no controls.
