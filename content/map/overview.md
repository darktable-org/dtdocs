---
title: overview
id: overview
weight: 10
draft: false
author: "people"
---

The map view shows a world map with all geo-tagged images in the current [collection](../lighttable/digital-asset-management/collections.md) pinned to their geo-tagged location. 

Some newer cameras and smartphones, are already equipped with GPS receivers and can geo-tag each image as the shot is taken. Other cameras may need additional GPS hardware to do this.

Even if your camera doesn't support this feature, there is an alternative method -- darktable can match the Exif date/time in your image(s) to a separate GPX data tracking file created by a GPS tracker, that has recorded your movements. GPS trackers can be purchased as standalone handheld devices or you can install a GPS tracker app on your smartphone. Location tagging with GPS tracking data can be done using the [geotagging](../module-reference/utility-modules/shared/geotagging.md) module, in the lighttable and map views.

In addition, you can assign geo coordinates to an image, by activating the [filmstrip](../module-reference/utility-modules/shared/filmstrip.md) on the lower panel (press Ctrl+F)and dragging the image icon from the film-strip to a position on the map.  Darktable will record the new location (latitude and longitude ) as part of the image metadata and this data will be included in exported images.

# center map view

In the center panel you will see a world map sourced from an Internet provider.  Darktable keeps a disk cache of previously loaded map data so new/updated map data is only available when you are online.  
You can choose your provider from:
OpenStreetMap, Maps-For-Free, OpenCycleMap, Public Transport, Google Maps, Google Satellite, Google Hybrid, Virtual Earth, Virtual Earth Satellite, Virtual Earth Hybrid.

You can navigate within the map using either your mouse or using on screen controls. 

Left-click and drag to move the map; use the scroll-wheel to zoom in and out.  A navigation area is located on top left of the map. The scale of the map is displayed at the bottom-left. At the bottom-right you can see the geographical coordinates for the center of the displayed map.

Images that already have geo-location attributes in their metadata are displayed as small icons or thumbnails on the map. Images close to each other are grouped and a count of grouped images is displayed on the bottom-left corner.

To remove location data from an image simply drag it from the map and drop it onto the filmstrip.

Images close to each other are grouped under a single image group. You can use the  [map settings](../module-reference/utility-modules/map/map-settings.md) module to control the grouping as needed. The number displayed on the bottom left of the thumbnail is the number of images inside the group. A white number means that all images in the group are at exactly the same location, whereas a yellow number means they are not. Use the mouse scroll wheel while hovering over a group of images to scroll through the thumbnails of the images in that group.

Normally, images in the center map view have black borders. If an image is selected in the filmstrip, then the corresponding image on the map will be highlighted with a white border.

Click+drag to adjust the location of an image. Shift+click to move a complete group of images.

The left and right panels provide additional controls (see [map view layout](./map-view-layout.md)).

# undo/redo

All image movements in the map view are recorded by darktable. It is possible to undo or redo such changes to recover a previous state. Note that this undo/redo facility is unlimited while moving images but it is reset each time you leave the map view.

Press Ctrl+Z to undo the last modification and Ctrl+Y to redo the last undone modification (if any).
