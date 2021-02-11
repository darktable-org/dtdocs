---
title: geotagging
id: geotagging
applicable-verison: 3.6
tags:
view: map
---

The first part of this module, related to date time, offset and time zone, is common with the lighttable [geotagging](../lighttable/geotagging.md) module.

The difference comes at the time to apply the gpx file data. Instead of applying gpx file blindly, one can see the different tracks of the gpx file on the map and preview the position of the images along these tracks when adjusting the images' date time (offset) and time zone.

Here below are the specific map _geotagging_ controls.

# module controls

gpx files
: the path of the gpx file selected.

tracks list
: this table shows the start date time of each track, the corresponding numbers of track points and images to be geotagged. When a check button is activated the related track is displayed on the map. In the table headers a check button allows to select / unselect all the tracks at once. Hovering a track row displayed more date time details: start and end times, both in LT (local time) and UTC.

preview images
: if checked the images to be geotagged are displayed along the visible tracks.

select images
: if you don't want to apply the offset, if any, to all selected images but only on the images to be geotagged hit this button. Not to loose the current offset you may want to lock it before changing the selection.

counts
: on the right of the `select images` button are displayed the numbers of images to be geotagged versus selected images.

apply GPX file
: this button is disabled as long as offset is not null. So the offset must be applied first. As a reminder, `apply offset` button applies on all selected images. Once enabled, `apply GPX file` button applies on all images to be geotagged, even if some of them belong to unselected tracks, i.e. the full gpx file is always applied.

As usual you can use Ctrl+Z to undo any unwanted changes.
