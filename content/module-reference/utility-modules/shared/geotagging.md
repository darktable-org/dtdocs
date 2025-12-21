---
title: geotagging
id: geotagging
applicable-version: 4.0
tags:
view: lighttable
---

Import and apply GPX track data to a selection of images.

This module is common to the [lighttable](../../../lighttable/_index.md) and [map](../../../map/_index.md) views. The map view provides an enhanced mode that allows you to preview the position of the images along the GPS tracks while adjusting the images' date/time offset and time zone.

# workflow overview

A GPS receiver calculates its current position based on information it receives from satellites, and records it in a GPX file together with the current date and time. The Exif data of the images also contains a time stamp defined by the camera settings. The _geotagging_ module takes the time stamp of the image, looks up the position in the GPX file at that time, and stores the appropriate coordinates (latitude/longitude/elevation) in its database and the image's XMP sidecar file.

Two problems may occur during this process:

-   In contrast to GPS devices, most cameras don't record the time accurately.
-   The time stored in the Exif data does not include the time zone. Most people set their camera to local time, whereas GPS devices store the time in the UTC (Universal Time, Coordinated, i.e. Greenwich (London)) time zone. If the time zones of the camera and GPX file differ, than the related location will be wrong.

If your image already shows the correct date/time and carries the UTC time stamp, you can directly apply the GPX track file without further adjustments.

Otherwise follow the following process to correlate the time of the images and GPS track files

1. Fix the camera time setting for a single image by manually entering the correct date/time for that image into the _date/time_ field. A good way to do this accurately is to take a photograph of a reliable time source. This can be any precise clock or, even better, the time displayed on your GPS device (bearing in mind that GPS devices normally _show_ the local time, even though they _store_ universal time). The difference (offset) between the time entered and the time stored in the image's Exif data will be shown in the _date/time offset_ field.

2. Press the _lock_ button to lock the calculated offset in the module.

3. Select all of the images you wish to adjust and click _apply offset_ to apply the calculated offset to those images.

4. If the camera time zone is not UTC, set the time zone in the _camera time zone_ field.

With the time setting corrected, you can now apply GPX tracking data using the _apply GPX track file_ button.

# module controls (common)

date/time
: This field is initialized with the date/time read from the first selected image (format `yyyy:mm:dd hh:mm:ss`) and can be modified to correct the date/time for that image. The individual date/time fields can be altered by scrolling over them with your mouse. If any field reaches its limit, the neighboring fields are automatically updated. For example, if you go over 60 on the minute field, the hour field will automatically be incremented. It is also possible to use milliseconds in this module if you enable [preferences > lighttable > show image time with milliseconds](../../../preferences-settings/lighttable.md).

original date/time
: The original date/time of the image is shown here for reference.

date/time offset
: The calculated difference between the original date/time and that keyed in the _date/time_ field. If the calculated difference is greater than 99 days 23 hours 59 minutes and 59 seconds, the offset is invalidated.

lock button
: If the lock button is activated, the offset value is frozen. If you subsequently change the selected image(s), the new image date/time is updated using the locked offset. This allows you to apply the same offset to multiple groups of images.

apply offset button
: Apply the offset to selected images.

apply date/time button
: It is sometimes useful to be able to set the absolute date/time for an image, for example where this information is missing. This button allows you to apply the date/time entered in the _date/time_ field to the selected images, without considering the previous value. You can use Ctrl+Z to undo any unwanted changes.

camera time zone
: Select the camera's time zone. Start typing to show a list of permitted values.

apply GPX track file (lighttable view only)
: Apply a GPX track file. Click the corresponding button and navigate to the GPX file. You can use Ctrl+Z to undo any unwanted changes. Within the file chooser window, the preview button lists the tracks of the selected GPX file along with the following information: track name, start and end date/time (local time), number of track points and number of selected images that will be geotagged.

# module controls (map view)

GPX file
: The path of the GPX file selected.

track list
: This table shows the start date/time of each track, along with the number of track points and the number of matching images. When a check button is activated, the related track is displayed on the map. A check button in the table header allows you to select or de-select all of the tracks at once. Hover over a row with your mouse to display the start and end times both in local time (LT) and UTC. To reset the map zoom and show the complete set of tracks, double-click on a track in the list, or single-click on the track list header. You can also assign a keyboard shortcut ([preferences > shortcuts > utility modules > geotagging > view entire track](../../../preferences-settings/shortcuts.md)).

preview images
: If checked, the matching images are displayed on the map along the visible tracks.

select images
: If you don't wish to apply an offset to all of the selected images, but only to the matching images, use this button to select images. If you don't want to lose the current offset you may want to lock it before changing the selection.

counts
: A count of the number of matching images and the number selected is displayed to the right of the _select images_ button.

apply geo-location
: This button is displayed when the offset is null. The _apply geo-location_ button applies the GPX data to matching images on selected tracks.

apply offset and geo-location
: This button is displayed once an offset has been entered. As a reminder, the _apply offset_ button applies the offset to all selected images. Unlike _apply offset_, the _apply offset and geo-location_ button applies the offset _and the GPX data_ to matching images on selected tracks.

You can use Ctrl+Z to undo any unwanted changes (twice in case of _apply offset and geo-location_).
