---
title: darktable's color spaces
id: color-spaces
weight: 50
draft: false
author: "people"
---

darktable's input images are either RGB files (like JPEGs or TIFFs) or camera raws. Both represent colors by a combination of red, green and blue. For the most part darktable's modules act in the CIELAB color space (often just called “Lab”) which describes color as a combination of lightness data (L) and a point in the a-b color plane. The final output of the image processing pipeline is once again in RGB, either shaped for the monitor display or for the output file.

This process implies that the pixelpipe has two color conversion steps: input color profile and output color profile. In addition there is the demosaic step for raw images, where the colors of each pixel are reconstructed by interpolation.

Each module has a fixed position in the pixelpipe which tells you which color space the module lives in:

up to [_demosaic_](../../module-reference/processing-modules/demosaic.md)
: Image is in raw data format with only latent colors. Each pixel carries lightness and color information for only one base color. Bear in mind that some of the modules in this part of the pipe can also act on non-raw input images in RGB format with full information on all three color channels.

between [_demosaic_](../../module-reference/processing-modules/demosaic.md) and [_input color profile_](../../module-reference/processing-modules/input-color-profile.md) 	  	
: Image is in RGB format within the color space of the specific camera or input file.

between [_input color profile_](../../module-reference/processing-modules/input-color-profile.md) and [_output color profile_](../../module-reference/processing-modules/output-color-profile.md) 	  	
: Image is in Lab format. This is a very large universal color space which covers all colors visible to the human eye (and even more). As darktable processes images in 4x32-bit floating point buffers, it can handle the Lab color space without risking banding or tonal breaks.

after [_output color profile_](../../module-reference/processing-modules/output-color-profile.md) 	  	
: Image is in RGB format as defined by the selected display or output ICC profile.
