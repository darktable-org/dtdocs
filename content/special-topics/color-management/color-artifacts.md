---
title: possible color artifacts
id: color-artifacts
weight: 70
draft: false
author: "people"
---

There are some infrequent situations that still can lead to problematic results unless the user takes some action. Some modules in Lab color space, like [_levels_](../../module-reference/processing-modules/levels.md) and [_monochrome_](../../module-reference/processing-modules/monochrome.md), rely on the fact that the L channels carries all lightness information, with the a and b channels purely representing chroma and hue. Unbounded colors with negative L values are especially problematic to these modules and can lead to black pixel artifacts.

It has been found that highly saturated blue light sources in the image frame are likely candidates for pixels with negative L values. If you are engaged in stage photography you should pay close attention to such lights appearing in images.

In order to mitigate this issue the [_input color profile_](../../module-reference/processing-modules/input-color-profile.md) module has a gamut clipping option. This option is switched off by default but can be activated if artifacts are observed. Depending on the settings, colors will be confined to one of the available RGB gamuts. In effect black pixel artifacts are prevented at the costs of losing some color dynamics.
