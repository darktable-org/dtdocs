---
title: haze removal
id: haze-removal
applicable-version: 3.2.1
tags: 
working-color-space: RGB 
view: darkroom
masking: true
---

Automatically reduce the effect of dust and haze in the atmosphere, which often reduce the color contrast in landscape photographs. This module may also be employed more generally to give pictures a color boost specifically in low-contrast regions of the image.

Haze absorbs light from objects in the scene but it is also a source of diffuse background light. The haze removal module first estimates, for each image region, the amount of haze in the scene. It then removes the diffuse background light according to its local strength and recovers the original object light.

Setting both of the module's controls to unity maximizes the amount of haze removal but is also likely to produce some artifacts. Removing the atmospheric light entirely may render the image flat and result in an unnatural looking style. Optimal values are typically below unity and are rather image dependent but also a matter of personal aesthetic preferences.

# module controls

strength
: The amount of haze removal. At unity, the module removes 100 percent of the detected haze up to the specified distance. Negative values increase the amount of haze in the image.

distance
: Limit the distance up to which haze is removed. For small values, haze removal is restricted to the foreground of the image. Haze is removed from the entire image if the distance parameter is set to unity. If the _strength_ is negative the distance control has no effect.
