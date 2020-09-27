---
title: overview
id: overview
weight: 10
draft: false
author: "people"
---

The Map view is where you geo-tag your images.

Map view will show you a world map with the currently open image, or film roll of images, pinned to their geo-tagged location. This requires that the image was geo-tagged by a camera with that feature. Some newer cameras, including smartphones, are already equipped with GPS receivers. Other cameras may need additional GPS hardware to do this.

Even if your camera doesn't support this feature, there is an alternative method. darktable can match the Exif time and date data in your image(s) to a separate GPX data tracking file created by a GPS tracker recording your movements. These can be handheld devices or a GPS tracker app on your smartphone. This is all done in the lighttable view (see Section 2.3.11, “Geotagging”).

# centre map view

In the center of the map view you will see a map.

Map data are taken from open map sources on the internet. New map data are only available if you are connected to the internet. darktable keeps a disk cache of previously loaded map data.

Your mouse will allow navigation in the map. `Left-click` will drag the map; using the `scroll-wheel` will zoom in or out.

There are on-screen controls and displays that assist you to find your way. A navigation area is located on top left of the map. Use it as an alternative to mouse-dragging and scrolling. The scale of your map is displayed on bottom left. On bottom right you see the geographical coordinates for the center of the map.

Images that already have geo location attributes in their metadata are displayed as small icons on the map. Images close to each other are grouped and a count of grouped images is displayed on the bottom-left corner.

In order to assign geo coordinates to an image, activate the film-strip on the lower panel (press `ctrl+f`). You can simply assign a geo location to an image by dragging the image icon from the film-strip and position it onto the map. darktable will record the new geo location (longitude and latitude) as part of the image metadata. Exported images will include this data.

In order to remove geo coordinates from an image just `drag` it from the map and drop it onto the filmstrip.

Left and right to the central map there are panels for additional control.

# undo/redo

All image moves in the map view are recorded by darktable. It is then possible to undo or redo such changes to recover a previous state. Note that this undo/redo facility is unlimited while moving images but it is reset each time the map view is left.

The default key shortcuts are:

```
ctrl+z:  undo last move
ctrl+y:  redo last move (does nothing if undo has not been used yet)
```

