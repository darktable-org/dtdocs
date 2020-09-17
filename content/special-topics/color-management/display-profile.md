---
title: display profile
id: display-profile
weight: 20
draft: false
author: "people"
---

 In order for darktable to accurately render colors on screen it needs to find the correct display profile of your monitor. In general this requires your monitor to be properly calibrated and profiled, and it needs the profile to be correctly installed on your system. darktable queries your X display server's xatom as well as the system service colord (if available) for the right profile. If needed you can enforce a specific method in the [_miscellaneous_ tab of the _preferences_](../../preferences-settings/miscellaneous.md) dialog.

To investigate your display profile configuration you can call the `darktable-cmstest` binary (Linux only) which prints out useful information (e.g. profile name per-monitor) and tells you if the system is correctly configured (see **LINK TBC** “darktable-cmstest binary”).

In rare cases you may need to manually select the display profile. This is possible from the softproof and gamut check option dialogs in the darkroom view (see **LINK TBC** “Soft proof” and **LINK TBC** “Gamut check”), and the display profile dialog in the lighttable view (see **LINK TBC**).
