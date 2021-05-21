---
title: examples
id: examples
weight: 30
draft: false
author: "people"
---

The following sections show two typical use cases for the tethering view.

# studio setup with screening

This is a pretty common use case. You have your studio and subject set up, the camera is connected to your computer and tethering view is active in darktable. You work at the camera and take images. Whenever you like, you can review the images directly on your computer monitor instead of using the camera LCD.

This workflow is efficient and effective, since you can immediately review your captures instead of waiting until after the shoot when everyone is gone. If you're shooting with a model this is a nice way to preview the captures with the client instead of fumbling around with your camera.

Working in the tethering view can save you time and aggravation. Set a [session](../module-reference/utility-modules/tethering/session.md) name, shoot your images, and they will be saved to the correct film roll for the session, for easy on-site review. 

# capturing a timelapse

A timelapse is a video clip composed of images taken in a timed sequence. A typical example is to take a timelapse of a cityscape to capture the movement of the clouds and traffic etc.

To set up a timelapse capture, create a new [session](../module-reference/utility-modules/tethering/session.md). Now decide whether you want to shoot in manual or auto mode. It is recommended that you only use auto mode in situations where the ambient light will change significantly during the time of the shoot, for example, when shooting a timelapse over 24 hours.

The [camera settings](../module-reference/utility-modules/tethering/camera-settings.md) module can be used to define the delay (the number of seconds between capture) and sequence (the number of images to capture) of your timelapse.

To start the timelapse click the capture button in the same panel and watch the [filmstrip](../module-reference/utility-modules/shared/filmstrip.md) fill up with images. The last captured image is always displayed in the center view. 
