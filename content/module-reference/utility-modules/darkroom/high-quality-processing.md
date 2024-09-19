---
title: high quality processing
id: hq-processing
applicable-version: 4.8
tags:
view: darkroom
---

Click the ![high quality processing icon](./high-quality-processing/high-quality-processing-icon.png#icon) icon to activate high quality processing in the pixelpipe.

Darktable pixelpipes process the modules in slightly different ways, the thumbnail pipe as an example is optimized for speed.

The darkroom pixelpipes for the main canvas and the second monitor try to keep resources within limits by downscaling and by
restricting the processed data to what is actually displayed - in darktable speak this is the "region of interest" (ROI).

Yet - for exports we have to process the whole image - likely without downscaling - resulting in much larger processing times
and possibly visible differences compared to what you have seen in darkroom.

These differences are mostly very subtle but in some cases they are likely to be observed.
Modules like "diffuse or sharpen" using large radii, "profiled denoise" or "local contrast" are more prone to this problem.

For the user this usually means: there will be visible and unexpected differences between "what you see in darkroom" and the exported image.
Also there might be visible differences if you zoom in or out.

To avoid these problems you might activate the high quality processing mode. If toggled on, the darkroom pixelpipes are processed
with all available data so the results are as while exporting in high quality mode.

Please note, this takes large resources and requires a good OpenCL card and CPU for a responsive user interface especially if you keep changing
any module parameters.
