---
title: examples
id: examples
weight: 30
draft: false
author: "people"
---

The following sections show two typical use cases for the tethering view.

# studio setup with screening

This is a pretty common use case. You have your studio and subject set up, the camera is connected to your computer and tethering view is active in Ansel. You work at the camera and take images. Whenever you like, you can review the images directly on your computer monitor instead of using the camera LCD.

This workflow is efficient and effective, since you can immediately review your captures instead of waiting until after the shoot when everyone is gone. If you're shooting with a model this is a nice way to preview the captures with the client instead of fumbling around with your camera.

Working in the tethering view can save you time and aggravation. Set a [session](../module-reference/utility-modules/tethering/session.md) name, shoot your images, and they will be saved to the correct film roll for the session, for easy on-site review.

# capturing a timelapse

A timelapse is a video clip composed of images taken in a timed sequence. A typical example is to take a timelapse of a cityscape to capture the movement of the clouds and traffic etc.

To set up a timelapse capture, create a new [session](../module-reference/utility-modules/tethering/session.md). Now decide whether you want to shoot in manual or auto mode. It is recommended that you only use auto mode in situations where the ambient light will change significantly during the time of the shoot, for example, when shooting a timelapse over 24 hours.

The [camera settings](../module-reference/utility-modules/tethering/camera-settings.md) module can be used to define the delay (the number of seconds between capture) and sequence (the number of images to capture) of your timelapse.

To start the timelapse click the capture button in the same panel and watch the [filmstrip](../module-reference/utility-modules/shared/filmstrip.md) fill up with images. The last captured image is always displayed in the center view.

# storing images on the camera and computer

By default, the gphoto2 framework (used by Ansel's tethering feature) will only download images to your computer, and will not store them on the camera's memory card. This setting can be changed outside of Ansel by using the `gphoto2` command line interface. However, there are cases where this method fails, as it requires that Ansel use the same configuration file as the gphoto2 command line tool. In particular, if Ansel or gphoto2 are installed within a sandbox or container that hides user account settings, you may face this issue (for example, with `snap` packages and similar).

To allow captured images to be retained on the camera's memory card, connect the camera to your computer for a tethering session, but close Ansel. Enter `gphoto2 --set-config capturetarget=1` on the command line. If this command is successful, start Ansel again. Thereafter, images should be stored (duplicated) on the camera's memory card during a tethered capture.
