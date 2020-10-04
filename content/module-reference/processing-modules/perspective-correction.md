---
title: perspective correction
id: perspective-correction
applicable-verison: 3.2.1
tags: 
working-color-space:  
view: darkroom
masking: 
---

This module is designed to automatically correct for converging lines, a form of perspective distortions frequently seen in architectural photographs. The underlying mechanism is inspired by Markus Hebel's [_ShiftN_](http://www.shiftn.de/) program.

Perspective distortions are a natural effect when projecting a three dimensional scene onto a two dimensional plane and cause objects close to the viewer to appear larger than objects further away. Converging lines are a special case of perspective distortions frequently seen in architectural photographs. Parallel lines when photographed at an angle get transformed into converging lines that meet at some vantage point within or outside the image frame.

This module is able to correct converging lines by warping the image in such a way that the lines in question become parallel to the image frame. Corrections can be applied in vertical and horizontal direction, either separately or in combination. In order to perform an automatic correction the module analyzes the image for suitable structural features consisting of line segments. Based on these line segments a fitting procedure is started that determines the best values of the module parameters.

# Analysing edges in an image

Clicking the “get structure” icon causes darktable to analyze the image for structural elements. Line segments are detected and evaluated. Only lines that form a set of either vertical or horizontal lines are used for further processing steps. The line segments are displayed as overlays on the image base. A color code describes what type of line darktable has found:

green
: lines that are selected as relevant vertical converging lines

red
: lines that are vertical but are not part of the set of converging lines

blue
: lines that are selected as relevant horizontal converging lines

yellow
: lines that are horizontal but are not part of the set of converging lines

grey
: other lines identified but not of interest to this module

Lines marked in red or yellow are regarded as outliers and are not taken into account for the automatic fitting step. This outlier elimination involves a statistical process with random sampling so that each time you press the “get structure” button the color pattern of the lines will look a bit different. You can manually change the status of line segments: `Left-Click` on a line selects it (turns the color to green or blue) while `Right-click` deselects it (turns the color to red or yellow). Keeping the mouse button pressed allows for a sweeping action to select/deselect multiple lines in a row; the size of the select/deselect brush can be changed with the mouse wheel. Holding down the `Shift` key and keeping the left or right mouse button pressed while `Drag` selects or deselects all lines in the chosen rectangular area.

Clicking one of the “automatic fit” icons (see below) starts an optimization process which finds the best suited parameters. The image and the overlaid lines are then displayed with perspective corrections applied.

# module controls

Once the initial image analysis is done, the following controls get be used to preform the prespective corrections.

rotation
: This parameter controls a rotation of the image around its center and can correct for a skewed horizon.

lens shift (horizontal)
: This parameter corrects converging lines horizontally (ie. to make the _blue_ lines parallel).

lens shift (vertical)
: This parameter corrects converging lines vertically. (ie. to make the _green_ lines parallel). In some cases you get a more natural looking image if you correct vertical distortions to an 80 ~ 90% level rather than to the maximum extend. To do this, reduce the correction slider after having performed the automatic correction.

shear
: This parameter shears the image along one of its diagonals and is needed when correcting vertical and horizontal perspective distortions simultaneously.

guides
: When activated, a grid is laid over the image to help you judge the quality of the correction.

automatic cropping
: When activated, the automatic cropping feature crops the image to get rid of any black areas at the edges of the image that arise from having applied a distortion correction. You can either crop to the “largest area”, or to the largest rectangle that maintains the original aspect ratio (“original format”). In the latter case you can manually adjust the automatic cropping result: left click into to clip region and move it around. The size of the region is modified automatically to exclude any black corners.

lens model
: This parameter controls the lens focal length and camera crop factor & aspect ratio that will be used by the algorithm when calculating the distortion corrections. If set to “generic” a lens focal length of 28mm on a 35mm full-frame camera is assumed. If set to “specific”, focal length and crop factor can be set manually using the sliders provided.

focal length
: If the _lens model_ parameter is set to _specific_, then this slider set the lens focal length to be assumed by the correction algorithm. The default value is taken from the Exif data of your image, and this can be overridden by adjustign the slider.

crop factor
: If the _lens model_ is set to "specific", then this slider is used to set the camera's crop factor used to do the correction calculations. You will normally  need to set this value manually.

aspect ratio
: If the _lens model_ is set to "specific", this parameter allows for a free manual adjustment of the image's aspect ratio.

automatic fit
: Clicking on one of the _automatic fit_ icons causes the distortion correction sliders to be set automatically based on the image edge detection analysis. You can choose to automatically apply just the vertical corrections, just the horizontal correction, or both the vertical and horizsontal corrections together. A `Ctrl+click` on any of the icons auto-applies just a rotation without the lens shift. A `Shift+click` on any of the icons applies just the lens shift without any rotation.

get structure
: A `Left-click` on the _analyse structure_ icon causes the image to be (re-)analyzed for suitable line segments. A `Shift+click` will first apply a contrast enhancement step before doing further analysis. A `Ctrl+click` will first apply an edge enhancment step before doing further analysis. Both variations can be used alone or in combination if the default analysis is not able to detect a sufficient number of lines.

: A `Click` on the `X` icon discards any structural information collected during previous analysis steps.

: A `Click` in the _eye_ icon toggles the display of the line segments identified by any previous structural analysis.

# Examples

Here is an image with a skewed horizon and converging lines caused by directing the camera upwards:

![prespective-correction-example-before](./prespective-correction/perspective-correction-example-before.png)

Here is the image after having corrected for vertical and horizontal perspective distortions. Note the framing by the automatic cropping feature and the still visible overlay of structural lines:

![prespective-correction-example-after](./prespective-correction/perspective-correction-example-after.png)



