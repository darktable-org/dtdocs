---
title: Map
id: map
weight: 50
draft: false
author: "people"
---

The map view allows you to see where your geo-tagged images were taken, and to add location information to non-geo-tagged images.

The map view shows a world map with the images in the current [collection](../lighttable/digital-asset-management/collections.md) pinned to their geo-tagged location (if available). This requires that images are tagged with location information. Some newer cameras, including smartphones, are already equipped with GPS receivers. Other cameras may need additional GPS hardware to do this.

Even if your camera doesn't support this feature, there is an alternative method -- Ansel can match the Exif date/time in your image(s) to a separate GPX data tracking file created by a GPS tracker, that has recorded your movements. GPS trackers can be purchased as standalone handheld devices or you can install a GPS tracker app on your smartphone. Location tagging with GPS tracking data can be done using the [geotagging](../module-reference/utility-modules/shared/geotagging.md) module, in the lighttable and map views.

# center map view

In the center of the map view you will see a world map.

Map data is taken from open map sources on the internet. As such, new map data is only available if you are connected to the internet -- Ansel keeps a disk cache of previously loaded map data.

You can navigate within the map using your mouse. Left-click and drag to move the map. Use the scroll-wheel to zoom in and out.

On-screen controls and displays are available to help you find your way. A navigation area is located on top left of the map -- use this as an alternative to mouse-dragging and scrolling. The scale of the map is displayed at the bottom-left. At the bottom-right you can see the geographical coordinates for the center of the map.

Images that already have geo-location attributes in their metadata are displayed as small icons on the map. Images close to each other are grouped and a count of grouped images is displayed on the bottom-left corner.

In order to assign geo coordinates to an image, activate the [filmstrip](../module-reference/utility-modules/shared/filmstrip.md) on the lower panel (press Ctrl+F). You can assign a geo location to an image by dragging the image icon from the film-strip and positioning it on the map -- Ansel will record the new location (latitude and longitude ) as part of the image metadata. This data will be included in exported images.

In order to remove location data from an image simply drag it from the map and drop it onto the filmstrip.

Images close to each other are grouped under a single image group. You can use the  [map settings](../module-reference/utility-modules/map/map-settings.md) module to control the grouping as needed. The number displayed on the bottom left of the thumbnail is the number of images inside the group. A white number means that all images in the group are at exactly the same location, whereas a yellow number means they are not. Use the mouse scroll wheel while hovering over a group of images to scroll through the thumbnails of the images in that group.

Normally, images in the center map view have black borders. If an image is selected in the filmstrip, then the corresponding image on the map will be highlighted with a white border.

Click+drag to adjust the location of an image. Shift+click to move a complete group of images.

The left and right panels provide additional controls (see [map view layout](./map-view-layout.md)).

# undo/redo

All image movements in the map view are recorded by Ansel. It is possible to undo or redo such changes to recover a previous state. Note that this undo/redo facility is unlimited while moving images but it is reset each time you leave the map view.

Press Ctrl+Z to undo the last modification and Ctrl+Y to redo the last undone modification (if any).
