---
title: amd/ati devices
id: amd-ati
weight: 60
draft: false
author: "people"
---

While NVIDIA devices and most modern AMD/ATI devices will often run out of the box, there is more to do for older AMD/ATI graphics cards, namely those prior to the HD7xxx series. This starts with the fact that those devices will only report part of their total GPU memory to darktable. For a 1GB device this typically amounts to only 512MB, a value which darktable in its standard configuration will refuse as insufficient. In consequence the device will not be used.

On the web you might find as a tip to set environment variable `GPU_MAX_HEAP_SIZE` to 100 if this happens. Indeed this will cause the AMD/ATI driver to report the full installed memory to darktable. However, there is a problem. On many (most?) cards this will cause buffers to be allocated on your computer (host) and not on the video card! In this case all memory accesses will need to go through the slow PCIe bus. This will cost you a factor of 10x or more in performance and will render OpenCL useless for you, especially when exporting files.

Another environment variable which changes driver behavior is `GPU_MAX_ALLOC_PERCENT`. You could set this to 100 in order to allow memory allocations as high as 1GB on your AMD/ATI card. The problem is that this tends to cause darktable to crash sooner or later.

Our recommendation is therefore to leave these settings untouched. Often your card will be recognized with 512MB memory and a maximum allocation size of 128MB. There are three configuration parameters which you can set in `$HOME/.config/darktable/darktablerc` to get things running. Here are the details:

opencl\_memory\_requirement
: Set this parameter to 500 so that darktable will accept your 512MB graphics memory as having sufficient memory.

opencl\_memory\_headroom
: This parameter controls how much graphics memory (from that reported by your card) darktable should leave untouched for driver and display use. Since for AMD/ATI devices we can only get half of the available RAM anyway, it's safe to set this to zero so that all of the 512MB can be used by darktable.

opencl\_avoid\_atomics
: Atomic operations in OpenCL are a special method of data synchronization. They are only used in a few kernels. Unfortunately, some (most?) AMD/ATI devices are extremely slow in processing atomics. It's better to process the affected modules on the CPU rather than accepting an ultra-slow GPU codepath. Therefore, set this parameter to TRUE if you experience slow processing of modules like [_shadows and highlights_](../../module-reference/processing-modules/shadows-and-highlights.md), [_monochrome_](../../module-reference/processing-modules/monochrome.md), [_local contrast_](../../module-reference/processing-modules/local-contrast), or [_global tonemap (deprecated)_](../../module-reference/processing-modules/global-tonemap) or if you get intermittent system freezes.

These recommendations do not apply to the more recent Radeon HD7xxx series with GCN architecture. Besides being very fast in terms of GPU computing they normally run out of the box, though you might consider trying some of the performance optimization options described in the following section.
