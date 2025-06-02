---
title: troubleshooting
id: troubleshooting
weight: 40
draft: false
author: "people"
---

This troubleshooting guide can be used to verify whether or not your camera can be used with tethering. This is done using the same ([gphoto2](https://github.com/gphoto/gphoto2)) tool that darktable uses to interface with your camera.

Before you start, you first need to find your camera port name. Usually the port "`usb:`" is sufficient and is therefore used in the following guide.

# is your camera detected?

The following command will verify that your camera is connected to the computer and detected by gphoto2. 

```
env LANG=C gphoto2 --auto-detect
```

# check the camera's driver abilities

Execute the following command and ensure that the "capture choices" ability supports “Image” and configuration support is “yes” -- darktable will check these two abilities to decide whether to show the “tethered shoot” button.

```
env LANG=C gphoto2 --port usb: --abilities
```

# remote capture

This step will verify that your camera can be remotely controlled -- i.e. that it can capture an image, download it to your computer and display it within darktable.

```
env LANG=C gphoto2 --port usb: --capture-image-and-download
```

# tethered capture

This last step tests if your camera supports "events", are heavily used by darktable. Running this command will make the gphoto2 process wait for an image capture event which you must manually trigger on your camera. If successful, the image will be downloaded to your computer.

```
env LANG=C gphoto2 --port usb: --capture-tethered
```

# now what?

If any of the above steps failed, there are problems with your specific camera and driver. Please file an issue on the [gphoto2 github page](https://github.com/gphoto/gphoto2/issues). Add the following flags to the failed command for better support and attach the log output to your issue:

```
--debug --debug-file gphoto2_debug.log
```

If you successfully completed all of the above tests, your camera is probably supported by darktable. If these tests were successful but you nevertheless stumble upon a problem in darktable, please file an issue on the [darktable github page](https://github.com/darktable-org/darktable/issues). Please attach the log output from the commands above and the log file output produced by starting darktable with the following command:

```
darktable -d camctl 2>&1 >camctl.log
```

