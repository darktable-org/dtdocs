---
title: raster masks
id: raster
weight: 60
draft: false
---

As described in the previous sections, the final output of a module's mask (the combined effect of any drawn and parameteric masks) is a greyscale raster image representing the extent to which the module should be applied to each pixel. This raster image is stored internally for active modules and can be subsequently reused within other modules.

As with normal masks, if the value for a pixel in a raster mask is zero the input of the module is left unchanged. If the value is 1.0 the module has full effect and for each value in-between 0 and 1.0 the module's effect is applied proportionally at that location.

Choose a raster mask from the drop-down. Raster masks can be identified by the name of the module against which they were originally generated. Raster masks can only be selected from modules that are currently active in the pixelpipe.
