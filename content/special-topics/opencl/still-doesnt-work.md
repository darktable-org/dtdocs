---
title: opencl still does not run for me
id: still-doesnt-work
weight: 100
draft: false
author: "people"
---

As has been mentioned, OpenCL systems come with a huge variety of setups: different GPU manufacturers and models, varying amounts of GPU memory, different drivers, different distributions etc. Many of the potential problems will only appear with very specific combinations of these factors.

As the darktable developers only have access to a small fraction of those variations, please understand that we might not be able to fix your specific problem. There is not much we can do if we are unable to reproduce your issue.

If nothing else helps, the best option is probably to start darktable with

`darktable --disable-opencl`

In the end there is nothing in darktable which only runs on GPU. Don't let the lack of OpenCL discourage you - darktable's CPU code is also highly optimized for performance!
