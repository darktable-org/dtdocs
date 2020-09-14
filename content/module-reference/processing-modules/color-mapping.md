---
title: color mapping
id: color-mapping
applicable-verison: 3.2.1
tags: 
working-color-space: Lab 
view: darkroom
masking: true
---

Transfer the look and feel of one image to another. This module statistically analyses the color characteristics of a source and target image. The colors of the source image are then mapped to corresponding colors on the target image.

Two steps are required to use this module:

1. Open the source image in darkroom mode and acquire its color characteristics by pressing the “acquire as source” button. A set of color clusters is generated and displayed in the “source clusters” area. Each cluster is represented by a set of color swatches with the mean value in the center surrounded by swatches indicating the variance within that cluster. The clusters are sorted in ascending order by their weight, i.e. the number of pixels that contribute to the clusters.
1. Open the target image in darkroom mode. The previously collected source clusters should be stored; if they are not yet displayed, press the button. Now press the “acquire as target” button to generate a corresponding set of color clusters for your target image, which gets displayed in the “target clusters” area.

When both source and target clusters are collected an automatic color mapping is applied to the target image. In its default settings the overall effect is quite exaggerated. A set of sliders gives you control of the effect's strength. You can also use blending operator _normal_ along with the _opacity_ slider to tame the effect. As the color mapping module comes early in the pixelpipe, you can finetune the colors with later modules.

## Module Controls

acquire as source/target
: Press these buttons to generate color clusters for the source and target image, respectively. The processing takes a few seconds during which the GUI remains unresponsive.

number of clusters
: The number of color clusters to use. If you change this parameter all collected color clusters are reset and need to be acquired anew.

color dominance
: This parameter controls the mapping between source and target clusters. At the lowest value mapping is based on color proximity. This typically leads to very subtle effects on the target image. At the maximum value mapping is based on the relative weight of the color clusters – dominant colors of the source image are mapped to dominant colors of the target image. This typically leads to a very bold effect. Intermediate values incrementally shift between these extremes.

histogram equalization
: Modify the target image's contrast by matching its histogram with the histogram of the source image. This slider controls the extent of this effect.