---
title: overview
id: overview
weight: 10
draft: false
author: "people"
---

The tethering view allows you to capture images directly into darktable from a connected camera.

To use the tethering feature you first need to connect your camera to your PC using a USB cable. Your computer might ask to mount or view the connected camera. _Do not mount or view the camera_. If your camera is mounted or viewed automatically, you will need to “unmount/eject” the camera before darktable can access it. This unlocks the camera so that darktable can take control of it -- darktable will then re-lock the camera so that it cannot be used by other applications.

After the USB cable is connected, go to the [import](../module-reference/utility-modules/lighttable/import.md) module in the [lighttable](../lighttable/_index.md) view. If your camera is available for use, a new section should appear in the import module containing the name of your camera and a "mount camera" button. Click this button to connect your camera and three additional buttons will appear: “copy & import from camera”, “tethered shoot” and "unmount camera". Click “tethered shoot” to enter the tethering view. When you are finished, press the "unmount camera" button before physically disconnecting it.

darktable uses [gphoto2](https://github.com/gphoto/gphoto2) to interface with your camera. If you have problems finding the connected camera as described above, check the [troubleshooting](./troubleshooting.md) section in this chapter to verify that your camera has tethering support.

In the center view, images are shown while you capture them. You can capture an image by either using darktable's user interface or by manually triggering a capture with your camera. If you are using Live View the image will be shown in darktable's center view.

When entering tethering view, a film roll will be created using the same structure as defined for camera import (see [preferences > import > session options](../preferences-settings/import.md)). The job code will be predefined as “capture”.

If you want to group your captures into different film rolls, you should use the [session](../module-reference/utility-modules/tethering/session.md) module in the right-hand panel to set a different job code. When entering a new name and pressing Enter, a new film roll will be created and newly-captured images will be added into this new film roll.

darktable provides some useful tools to set up an image capture in the user interface. You can set up timelapse captures, brackets for HDR and even sequential captures of bracketed images. For more information read the documentation on the [camera settings](../module-reference/utility-modules/tethering/camera-settings.md) module and the [examples](./examples.md) later in this chapter.
