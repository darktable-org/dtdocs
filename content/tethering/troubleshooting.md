---
title: troubleshooting
id: troubleshooting
weight: 40
draft: false
author: "people"
---

 This troubleshooting guide will provide you with some steps to verify whether your camera can be used with tethering. This is done using the [gphoto2](https://github.com/gphoto/gphoto2) command-line tools. This is what darktable uses to interface with your camera.

 Find your camera port name to use it in the following tests. Usually the port "`usb:`" will be enough and therefore is used in these examples.

# is your camera detected?

The following command will verify that your camera is connected to the computer and detected by gphoto2. 

```
env LANG=C gphoto2 --auto-detect
```

# check the camera's driver abilities

Execute the following command and ensure that the capture choices ability supports “Image” and configuration support is “yes”. darktable will check these two abilities to decide if the “tethered shoot” button should be shown or not.

```
env LANG=C gphoto2 --port usb: --abilities
```

# remote capture

This step will verify that your camera can be remotely controlled -- i.e. that it can capture an image, download it to your computer and display it within darktable.

```
env LANG=C gphoto2 --port usb: --capture-image-and-download
```

# tethered capture

This last step tests if your camera supports events, which darktable heavily relies on. Running this command will make the gphoto2 process wait for an image capture event which you must manually trigger on your camera. If successful, the image will be downloaded to your computer.

```
env LANG=C gphoto2 --port usb: --capture-tethered
```

# now what?

If any of the above steps failed, there are problems with your specific camera and driver. Please report the issues to the gphoto2 mailing list for further help. You can find the mailing list at www.gphoto.org. Add the following flags to the failed command above for better support and attach the log output to your mail:

```
--debug --debug-file gphoto2_debug.log
```

If you successfully went through all the tests above, your camera will most likely be supported by darktable. Even if successful, if you stumble upon a problem in darktable, please file a bug on the bugtracker. Please attach the log outputs from the steps above and the log file output generated after starting darktable with the following command.

```
darktable -d camctl 2>1 >camctl.log
```

