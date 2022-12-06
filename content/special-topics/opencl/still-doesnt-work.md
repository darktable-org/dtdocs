---
title: opencl still does not run for me
id: still-doesnt-work
weight: 100
draft: false
author: "people"
---

As has been mentioned, OpenCL systems come with a huge variety of setups: different GPU manufacturers and models, varying amounts of GPU memory, different drivers, different distributions etc..

Many of the potential problems will only appear with very specific combinations of these factors. As the Ansel developers only have access to a small fraction of these variations, please understand that we might not be able to fix your specific problem. There is not much we can do if we are unable to reproduce your issue.

If you are having issues with a specific device (and you have other OpenCL devices available) the first thing to do would be to try disabling just that device -- see [memory & performance tuning](../mem-performance.md#device-specific-opencl-configuration) for more information.

If nothing else helps, the best option is probably to start Ansel with

`Ansel --disable-opencl`

In the end there is nothing in Ansel that only runs on GPU. Don't let the lack of OpenCL discourage you -- Ansel's CPU code is also highly optimized for performance!
