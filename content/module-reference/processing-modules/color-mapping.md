---
title: color mapping
id: color-mapping
applicable-version: 3.2.1
tags: 
working-color-space: Lab 
view: darkroom
masking: true
---

Transfer the look and feel of one image to another. 

This module statistically analyses the color characteristics of a source and target image. The colors of the source image are then mapped to corresponding colors on the target image.

Two steps are required to use this module:

1. Open the source image in the darkroom view and acquire its color characteristics by pressing the “acquire as source” button. A set of color clusters is generated and displayed in the “source clusters” area. Each cluster is represented by a set of color swatches with the mean value in the center surrounded by swatches indicating the variance within that cluster. The clusters are sorted in ascending order by their weight (the number of pixels that contribute to each of them).
1. Open the target image in the darkroom view. The previously collected source clusters should be stored; if they are not yet displayed, press the reset button. Now press the “acquire as target” button to generate a corresponding set of color clusters for your target image, which are then displayed in the “target clusters” area.

When both source and target clusters are collected an automatic color mapping is applied to the target image. In its default settings the overall effect is quite exaggerated. A set of sliders gives you control of the effect's strength. You can also use the _normal_ [blend mode](../../darkroom/masking-and-blending/blend-modes.md) along with the _opacity_ slider to tame the effect. As the color mapping module comes early in the pixelpipe, you can also finetune the colors with later modules.

# module controls

acquire as source/target
: Press these buttons to generate color clusters for the source and target image, respectively. The processing takes a few seconds during which the GUI will be unresponsive.

number of clusters
: The number of color clusters to use. This should roughly correlate to the number of dominant colors in the image. The clusters are acquired through a statistical sampling process to represent the colors that occur most commonly throughout the image. The random nature of the sampling process means that you might get different results each time you acquire the clusters, especially if you have a larger number of clusters and/or a complex color palette in the image. If you change this parameter all the collected color clusters are reset and must be re-acquired.

color dominance
: This parameter controls the mapping between source and target clusters. At the minimum value, the mapping is based on color proximity. This typically leads to very subtle effects on the target image. At the maximum value, the mapping is based on the relative weight of the color clusters – dominant colors of the source image are mapped to dominant colors of the target image. This typically leads to a very strong effect. Intermediate values incrementally shift between these extremes.

histogram equalization
: Modify the target image's contrast by matching its histogram with the histogram of the source image. This slider controls the extent of this effect.
