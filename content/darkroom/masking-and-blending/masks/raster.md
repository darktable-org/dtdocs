---
title: raster masks
id: raster
weight: 60
draft: false
---

As described in the previous sections, the final output of a module's mask (the combined effect of any drawn and parameteric masks) is a greyscale raster image representing the extent to which the module should be applied to each pixel. This raster image is stored internally for active modules and can be subsequently reused within other modules in the pixelpipe.

As with any mask, if the value for a pixel in a raster mask is zero the input to the module is passed in the module's output unchanged. If the value is 1.0 the module has full effect. For each value between 0 and 1.0 the module's effect is applied proportionally at that location.

You can choose a raster mask from the combobox. Raster masks can be identified by the name of the module against which they were originally generated. Raster masks can only be selected from modules that are currently active in the pixelpipe. If a module is subsequently deactivated its raster mask can no longer be used.
