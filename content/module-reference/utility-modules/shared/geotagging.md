---
title: geotagging
id: geotagging
applicable-verison: 3.6
tags:
view: lighttable
---

Import and apply GPX track data to a selection of images.

This module is common to the [lighttable](../../../lighttable/_index.md) and [map](../../../map/_index.md) views. However, an enhanced mode is provided in the map view that allows you to preview the position of the images along the GPS tracks while adjusting the images' date/time (offset) and time zone.

# workflow overview

A GPS receiver calculates its current position based on the information it receives from satellites and records it in a GPX file, together with the current date and time. The Exif data of the images also contains a time stamp defined by the camera settings. The _geotagging_ module takes the time stamp of the image, looks up the position in the GPX file at that time, and stores the appropriate coordinates (latitude/longitude/elevation) in its database and the image's XMP sidecar file.

Two problems may occur during this process:
- In contrast to GPS devices, most cameras don't record the time accurately.
- The time stored in the Exif data does not include the time zone. Most people set their camera to local time, while the GPS devices store the time in the UTC (Universal Time, Coordinated, i.e. Greenwich (London)) time zone. If the time zones of camera and GPX file differs, than the related location will be wrong.

If your image already shows the correct date/time and carries the UTC time stamp, you can directly apply the GPX track file without further adjustments.

Otherwise follow the following process to correlate the time of the camera and GPS tracker

1. Fix the camera time setting for an individual image by manually entering the correct date/time for that image into the _date time_ field. A good way is to do this is to take a photograph of a reliable time source. This can be any precise clock or, even better, the time displayed on your GPS device, bearing in mind that GPS devices normally _show_ the local time, even though they _store_ universal time. The difference (offset) between the time entered and the time stored in the image's Exif data will be shown in the _date time offset_ field.

2. Press the _lock_ button to lock the calculated offset.

3. Select all of the images you wish to adjust and apply the calculated offset to those images.

4. If the camera time zone is not UTC, set the time zone in the _camera time zone_ field.

With the time setting corrected, you can now apply GPX tracking data using the _apply GPX track file_ button.

# module controls (common)

date time
: This field is initialized with the date time read from the first selected image (format `yyyy:mm:dd hh:mm:ss`) and can be modified to correct the date time for that image. The individual date/time fields can be altered by scrolling over them with your mouse. If any field reaches its limit, the neighboring fields are automatically updated. For example, if you go over 60 on the minute field, the hour field will automatically be incremented.

original date time
: The original date time of the image is shown here for reference.

date time offset
: The calculated difference between the original date time that keyed in the _date time_ field. If the calculated difference is greater than plus or minus 99 days 23 hours 59 minutes and 59 seconds, the offset is invalidated.

lock button
: If the lock button is activated, the offset value is frozen. If you subsequently change the selected image(s), the new image date time is updated using the locked offset. This allows you to apply the same offset to different images selections.

apply offset button
: Apply the offset on selected images.

apply date time button
: It is sometimes useful to be able to set the absolute image date/time for an image, for example where this information is missing. This button allows you to apply the date/time entered in the _date time_ field to the selected images, without considering the previous value. You can use Ctrl+Z to undo any unwanted changes.

camera time zone
: Select the camera's time zone. Start typing to show a list of permitted values.

apply GPX track file (lighttable view only)
: Apply a GPX track file. Click the corresponding button and navigate to the GPX file. As above you can use Ctrl+Z to undo any unwanted changes. Within the file chooser window, the preview button lists the tracks of the selected GPX file along with the following information: track name, start and end date/time (local time), number of track points and number of selected images that will be geotagged.

# module controls (map view)

gpx files
: The path of the gpx file selected.

track list
: This table shows the start date/time of each track, along with the number of track points and images to be geotagged. When a check button is activated, the related track is displayed on the map. A check button in the table headers allows you to select or de-select all of the tracks at once. Hovering over a row with your mouse displays the start and end times both in local time (LT) and UTC.

preview images
: If checked, the images to be geotagged are displayed along the visible tracks.

select images
: If you don't wish to apply an offset to all of the selected images, but only to the images to be geotagged, use this button to select images. If you don't want to lose the current offset you may want to lock it before changing the selection.

counts
: A count of the number of images to be geotagged and the number selected is displayed to the right of the _select images_ button.

apply GPX file
: This button is only enabled once the offset has been entered - the offset must be applied first. As a reminder, the _apply offset_ button applies the offset to all selected images. Once enabled, the _apply GPX file_ button applies the GPX data to all images to be geotagged, even if some of them belong to unselected tracks -- the full gpx file is always applied.

As usual you can use Ctrl+Z to undo any unwanted changes.
