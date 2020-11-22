---
title: locations
id: locations
applicable-verison: 3.4
tags: 
view: map
---

Create areas or locations and organize them as hierarchical tags. The pipe “|” character can be used to insert a new level (a group of locations).

A location is shown as a shape on the map when selected. Initially each location will be represented as a square or circle and can be changed to a rectangle or ellipse by adjusting the shape's width and/or height. Each location is stored as tag entry under the geotagging collection.

# module controls

shape
: Select the circle or rectangle symbol to choose the default shape for new locations.

new location / new sub-location
: When no location is selected the _new location_ button lets you create a location at root level. When a location is selected the _new sub-location_ button lets you create a sub-location within the selected location.


## actions on the locations list

`click`
: Select (or de-select) a location. If the location is not visible on the map, the map is automatically centred on that location.

`Ctrl+click`
: Edit the name of the location. Press `Enter` to save changes or `Esc` to close the editing window without saving.

`right-click`
: Call up a sub-menu which allows you to:
: - Edit the name of the location.
: - Delete the location.
: - Update the filmstrip -- the filmstrip will be populated all images within the selected location.
: - Switch to the lighttable view and show a collection that contains all the images within the selected location.

## actions on locations in the map

`click` and drag
: Move the location shape to a new position on the map.

`Ctrl+click` or `Ctrl+Shift+click`
: Move an image or a group of images to place them inside a location shape.

`scroll`
: When inside a location shape (but not over an image), increase or decrease the size of that shape.
: When hovering over an image, display the different thumbnails of images located at that position on the map.
: When outside a location shape (and not over an image) zoom the map in or out.

`Shift+scroll`
: Increase or decrease the width of the location shape.

`Ctrl+scroll`
: Increase or decrease the height of the location shape.

`click` on a location shape
: Select a different location when the _show all_ checkbox is selected.

