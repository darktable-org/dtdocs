---
title: display profile
id: display-profile
weight: 20
draft: false
author: "people"
---

 For darktable to faithfully render colors on screen it needs to find the correct display profile for your monitor. In general this requires your monitor to be properly calibrated and profiled, and it needs the profile to be correctly installed on your system. darktable queries your X display server's xatom as well as the system service colord (if available) for the right profile. If required you can enforce a specific method in [preferences > miscellaneous](../../preferences-settings/miscellaneous.md).

To investigate your display profile configuration you can run the [darktable-cmstest](../program-invocation/darktable-cmstest.md) binary (Linux only) which prints out useful information (e.g. profile name per-monitor) and tells you if the system is correctly configured.

In rare cases you may need to manually select the display profile. This is possible from the [soft proof](../../module-reference/utility-modules/darkroom/soft-proof.md) and [gamut check](../../module-reference/utility-modules/darkroom/gamut.md) option dialogs in the darkroom view and the display profile dialog in the lighttable view.

Bear in mind that high-tier consumer-grade screens do not need a user-made display profile unless you need to perform soft-proofing with professional expectations, since they are properly calibrated to sRGB in the factory.

A poorly made display profile will be more harmful than sticking to the default sRGB profile, since the default might be slightly inaccurate but will at least be reliable. Advanced and professional users are advised to proceed with the production of custom display profiles only if they have the training to assess the quality of the resulting profile and understanding of the profiling options.
