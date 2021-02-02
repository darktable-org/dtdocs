---
title: geotagging
id: geotagging
applicable-verison: 3.2.1
tags:
view: lighttable
---

Import and apply GPX track data to a selection of images.

A GPS receiver calculates its current position based on the information it receives from satellites and records it in a GPX file, together with the current date and time. The Exif data of the images also contains a time stamp defined by the camera settings. The _geotagging_ module takes the time stamp of the image, looks up the position in the GPX file at that time, and stores the appropriate coordinates (latitude/longitude/elevation) in its database and the image's XMP sidecar file.

Two problems may occur during this process:
- In contrast to GPS devices, most cameras don't record the time accurately.
- The time stored in the Exif data does not include the time zone. Most people set their camera to local time, while the GPS devices store the time in the UTC (Universal Time, Coordinated, i.e. Greenwich (London)) time zone. If the time zones of camera and GPX file differs, than the related location will be wrong.

If your image already carries the UTC time stamp you can directly apply the GPX track without further adjustments.

Otherwise follow the following process to correlate the time of camera and GPS tracker

# overview

To fix the camera time setting you enter it manually into the date time input field. A good way is to take a photograph of a reliable time source. This can be any precise clock or, even better, the time displayed on your GPS device (bear in mind that GPS devices also normally _show_ the local time, even though they _store_ universal time).

Enter the date time that is shown on the image and you will obtain the difference (offset) between the time entered and the time stored in the image's Exif data.

The lock button allows to lock the calculated offset. You can select all the images you want to geotag and apply the offset.

# date time

The field is initialized with the date time read on the first selected image (format: yyyy:mm:dd hh:mm:ss).

You enter the correct date time for the image there. You can also the mouse scroll over every field to change the value. Bumping a field limit neighboring are updated.

# original date time

The original image date time is shown for reference.

# offset

The difference between original date time and newly entered date time.

If the calculated difference is greater than plus or minus 99 days 23 hours 59 minutes and 59 seconds the offset is invalidated.

# lock button

If activated, the offset value is frozen. Then if you change the selected image(s) the new image date time is updated using the locked offset.
This allows you to apply the same offset on different images selections.

# apply offset

Apply the offset on selected images.

# apply date time

Sometimes it is useful to be able to set the image date time, for example when this information is missing.

This button applies the new date time value to selected images, without considering the previous value.

In case of unwanted change you can use ctrl-Z to undo the action.

# camera time zone

Select here the camera time zone. Digit key letters to make appear the list of choices and down size it.

# apply GPX track file

Finally you can apply a GPX track. Click the corresponding button and navigate to the GPX file.

As above ctrl-Z can be used to undo any mistake.
