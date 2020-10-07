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

# offset

To fix the offset of the camera time setting you can either enter it manually into the offset input field or let darktable calculate it. All you need is to take a photograph of a reliable time source. This can be any precise clock or, even better, the time displayed on your GPS device (bear in mind that GPS devices also normally _show_ the local time, even though they _store_ universal time). 

When you have this image selected simply click on the magnifying glass button and darktable will present you with an entry box. Enter the time that is shown on the image and you will obtain the difference (offset) between the time entered and the time stored in the image's Exif data.

Now you can select all the images you want to geotag and click the apply button (currently represented by a check mark). This will alter the time in darktable's internal database for these pictures – you will see this change in the [image information](../shared/image-information.md) module on the left. 

# time zone

Finally you can apply a GPX track. Click the corresponding button and navigate to the GPX file. Before confirming the dialog that appears you should first select the corresponding time zone for your camera in the drop-down-menu. 

Should you choose an incorrect time zone you can reapply the GPX file with a different time zone.
