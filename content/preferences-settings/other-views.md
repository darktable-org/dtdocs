---
title: other views
id: other-views
weight: 60
draft: false
---

The following options control functionality in the [map](../map/_index.md) and [slideshow](../slideshow/_index.md) views.

# map / geolocalisation

maximum number of images drawn on map
: The maximum number of geotagged images drawn on the map. Increasing this number can slow down the drawing of the map. Needs a restart if changed (default 100).

pretty print the image location
: Show a more readable representation of the geo-location in the [image information](../module-reference/utility-modules/shared/image-information.md) module (default on). 

# slideshow

waiting time before each picture in slideshow
: The number of seconds before displaying the next image (default 5). 

do high quality processing for slideshow
: Controls how images are processed for the slideshow view. It this option is enabled, the image will be processed in full resolution and downscaled at the very end. This can sometimes result in better quality, but will always be slower (default on). 
