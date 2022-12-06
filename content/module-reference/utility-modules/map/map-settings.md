---
title: map settings
id: map-settings
applicable-version: 3.6
tags:
view: map
---

Select preferred map data from various providers. Some will provide additional layers (satellite view etc.) which you can toggle.

## module controls

map source
: Choose the provider to source map information from.

max polygon points
: The [find location](./find-location.md) module doesn't display polygons with more points than this for performance reasons. Usually a country polygon has between 50,000 and 150,000 points.

show OSD
: Choose whether to display the OSD controls at the top-left of the center view.

filtered images
: Check this box to display only the images from the current collection (those shown in the filmstrip) in the center view. Un-check the box to display all images in the current library, where those images have associated GPS data. You can also toggle this option by pressing Ctrl+S.

max images
: The maximum number of thumbnails to display on the map.

group size factor
: Increase or decrease the size of area that causes images to be grouped.

min images per group
: The minimum number of images that need to be placed in the same position in order to automatically create an image group for them.

thumbnail display
: Define what information to show on the map display
: - _thumbnails_: Display image thumbnails along with a counter.
: - _count_: Just display the number of images (to free space on the map). Hover over the number of images to show the corresponding thumbnail(s). A count-only marker behaves the same way as a normal image thumbnail, in terms of color coding, scrolling, drag and drop etc.
: - _none_: Show nothing.
: You can also cycle through these options by pressing Shift+S.
