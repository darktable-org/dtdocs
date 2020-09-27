---
title: examples
id: examples
weight: 30
draft: false
author: "people"
---

This section contains examples of typical usages of tethering.

# studio setup with screening

This is a pretty common use case. You have your studio and subject set up, the camera is connected to your computer and tethering view is active in darktable. You work at the camera and take images. Whenever you like, you can screen the image directly on your computer monitor instead of using the camera LCD for validation.

This workflow is efficient and effective, since you can immediately review your captures instead of waiting until after the shoot when everyone is gone. If you're shooting a model this is a pretty nice way to preview the captures with the client instead of fumbling around with your camera.

Working in the tethering view can save you time and aggravation. Set a [session](../module-reference/utility-modules/tethering/session.md) name, shoot your images and they will save in the correct film roll for the session for easy on-site review. 

# capturing a timelapse

A timelapse is a video clip composed of images taken in a timed sequence. A typical example is to take a timelapse of cityscapes where you capture clouds and traffic etc.

To setup a timelapse capture, create a new [session](../module-reference/utility-modules/tethering/session.md). Now decide if you want to shoot in manual or auto mode. Only use auto in situations were the ambient light will change significantly during the time of the shoot. For example, shooting a timelapse over 24 hours might give you easier control of light in that kind of captured sequence.

The [camera settings](../module-reference/utility-modules/tethering/camera-settings.md) module is where you define delay and sequence. Sequence will give you the opportunity to choose how many images you want to capture and delay will set the time in seconds between captures.

To start the capture click the capture button in the same panel and watch the [filmstrip](../module-reference/utility-modules/shared/filmstrip.md) fill up with images. The latest captured image is always displayed in center view. 
