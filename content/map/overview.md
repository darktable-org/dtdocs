---
title: overview
id: overview
weight: 10
draft: false
author: "people"
---

The map view is where you geo-tag your images.

Map view shows a world map with the currently open image or film roll of images, pinned to their geo-tagged location. This requires that the image was geo-tagged by a camera with that feature. Some newer cameras, including smartphones, are already equipped with GPS receivers. Other cameras may need additional GPS hardware to do this.

Even if your camera doesn't support this feature, there is an alternative method -- darktable can match the Exif time and date data in your image(s) to a separate GPX data tracking file created by a GPS tracker recording your movements. These can be handheld devices or a GPS tracker app on your smartphone. This is all done in the [geotagging](../module-reference/utility-modules/lighttable/geotagging.md) module in the lighttable view.

# center map view

In the center of the map view you will see a map.

Map data is taken from open map sources on the internet. New map data is only available if you are connected to the internet -- darktable keeps a disk cache of previously loaded map data.

You can navigate within the map using your mouse. Left-click and drag to move the map. Use the scroll-wheel to zoom in and out.

There are on-screen controls and displays that assist you to find your way. A navigation area is located on top left of the map. Use it as an alternative to mouse-dragging and scrolling. The scale of your map is displayed on bottom left. On bottom right you see the geographical coordinates for the center of the map.

Images that already have geo-location attributes in their metadata are displayed as small icons on the map. Images close to each other are grouped and a count of grouped images is displayed on the bottom-left corner.

In order to assign geo coordinates to an image, activate the [filmstrip](../module-reference/utility-modules/shared/filmstrip.md) on the lower panel (press Ctrl+F). You can assign a geo location to an image by dragging the image icon from the film-strip and positioning it on the map. darktable will record the new location (longitude and latitude) as part of the image metadata. This data will be included in exported images.

In order to remove location data from an image simply drag it from the map and drop it onto the filmstrip.

Images close to each other are grouped under a single image group. You can use the  [map settings](../module-reference/utility-modules/map/map-settings.md) module to control the grouping as needed. The number displayed on the bottom left of the thumbnail gives the number of images inside the group. A white number means that all images of the group are exactly at the same location. A yellow number means that the locations of images within the group are not all the same. Use the mouse scroll wheel while hovering over a group of images to scroll through the thumbnails of the images in that group.

Normally images in the center map view have black borders. If an image is selected in the filmstrip, then the corresponding image on the map will be highlighted with a white border.

Click+drag to adjust the position of an image. Shift+click to move a complete group of images.

On the left and right of the central map are panels that provide additional controls (see [map view layout](./map-view-layout.md)).

# undo/redo

All image movements in the map view are recorded by darktable. It is possible to undo or redo such changes to recover a previous state. Note that this undo/redo facility is unlimited while moving images but it is reset each time you leave the map view.

Press Ctrl+Z to undo the last modification and Ctrl+Y to redo the last undone modification (if any).
