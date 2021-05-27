---
title: rendering intent
id: rendering-intent
weight: 40
draft: false
author: "people"
---

If rendering with LittleCMS2 is activated (see [rendering method](./rendering-method.md)) you can define how to handle out-of-gamut colors when converting between color spaces. A selection box in the [export](../../module-reference/utility-modules/shared/export.md), [_output color profile_](../../module-reference/processing-modules/output-color-profile.md), and [soft proof](../../module-reference/utility-modules/darkroom/soft-proof.md) modules gives you a choice of the following rendering intents:

perceptual 	
: Best suited to photographs as it maintains the relative position of colors. This is usually the best choice.

relative colorimetric 	
: Out-of-gamut colors are converted to colors having the same lightness, but different saturation. Other colors remain unmodified.

saturation 	
: Saturation is retained but lightness is slightly changed.

absolute colorimetric 	
: Keep the white point. 
