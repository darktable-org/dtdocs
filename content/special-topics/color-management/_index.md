---
title: color management
id: color-management
weight: 10
draft: false
author: "people"
---


Ansel employs a fully color managed workflow:

- Input color specifications are taken from embedded or user-supplied ICC profiles or (in the case of raw files) from a library of camera-specific color matrices.

- Ansel automatically reads the display profile of your monitor (if properly configured) for accurate on-screen color rendition. Multiple-screen setups are fully supported as long as a system service like colord is in place and properly configured to inform darktable of the correct monitor profile.

- Output files can be encoded in one of Ansel's built-in profiles, including sRGB and Adobe RGB, or into a color space supplied by the user as an ICC profile.
