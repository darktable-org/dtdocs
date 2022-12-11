---
title: multiple devices
date: 2022-12-04T02:19:02+01:00
id: multiple-devices
weight: 90
draft: false
author: "people"
---

The scheduling of OpenCL devices can be optimized on most systems using the “OpenCL scheduling profile” settings. However, if your system is equipped with more than one GPU, you might want to set the relative device priority manually. To do this you need to select the “default” scheduling profile and change the settings in the “opencl\_device\_priority” configuration parameter.

It is important to understand how Ansel uses OpenCL devices. Each processing sequence of an image -- to convert an input to the final output using a history stack -- is run in a pixelpipe. There are four different types of pixelpipe in Ansel. One type is responsible for processing the center image view (or full view) in darkroom mode, another pixelpipe processes the preview image (navigation window). There can be one of each of these two pixelpipes running at any time, with the full and preview pixelpipes running in parallel. In addition there can be multiple parallel pixelpipes performing file exports as well as multiple parallel pixelpipes generating thumbnails. If an OpenCL device is available, Ansel dynamically allocates it to one specific pixelpipe for one run and releases it afterwards.

The computational demand varies significantly depending on the type of pixelpipe being executed. The preview image and thumbnails are low resolution and can be processed quickly, whereas processing the center image view is more demanding. A full export pixelpipe is more demanding still.

The configuration parameter “opencl\_device\_priority” holds a string with the following structure: `a,b,c.../k,l,m.../o,p,q.../x,y,z...`. Each letter represents one specific OpenCL device. There are four fields in the parameter string separated by a slash, each representing one type of pixelpipe. `a,b,c...` defines the devices that are allowed to process the center image (full) pixelpipe. Likewise devices `k,l,m...` can process the preview pixelpipe, devices `o,p,q...` the export pixelpipes and finally devices `x,y,z...` the thumbnail pixelpipes. An empty field means that no OpenCL device may serve this type of pixelpipe.

Ansel has an internal numbering system, whereby the first available OpenCL device receives the number 0. All further devices are numbered consecutively. This number, together with the device name, is displayed when you start Ansel with `Ansel -d opencl`. You can specify a device either by number or by name (upper/lower case and whitespace do not matter). If you have more than one device with the same name you need to use the device numbers in order to differentiate them.

A device specifier can be prefixed with an exclamation mark `!`, in which case the device is excluded from processing a given pixelpipe. You can also use an asterisk `*` as a wildcard, representing all devices not previously explicitly mentioned in that group.

Sequence order within a group matters -- Ansel will read the list from left to right and whenever it tries to allocate an OpenCL device to a pixelpipe it will scan the devices in that order, taking the first free device it finds.

If a pixelpipe process is about to be started and all GPUs in the corresponding group are busy, Ansel automatically processes the image on the CPU by default. You can enforce GPU processing by prefixing the list of allowed GPUs with a plus sign `+`. In this case Ansel will not use the CPU but rather suspend processing until the next permitted OpenCL device is available.

Ansel's default setting for “opencl\_device\_priority” is `*/!0,*/*/*`.

Any detected OpenCL device is permitted to process the center view image. The first OpenCL device (0) is not permitted to process the preview pixelpipe. As a consequence, if there is only one GPU available on your system, the preview pixelpipe will always be processed on the CPU, keeping your single GPU exclusively for the more demanding center image view. This is a reasonable setting for most systems. No such restrictions apply to export and thumbnail pixelpipes.

The default is a good choice if you have only one device. If you have several devices it forms a reasonable starting point. However, as your devices might have quite different levels of processing power, it makes sense to invest some time optimizing your priority list.

Here is an example. Let's assume we have a system with two devices, a fast Radeon HD7950 and an older and slower GeForce GTS450. Ansel (started with `Ansel -d opencl`) will report the following devices:

```
[opencl_init] successfully initialized.
[opencl_init] here are the internal numbers and names of
                          OpenCL devices available to Ansel:
[opencl_init]           0       'GeForce GTS 450'
[opencl_init]           1       'Tahiti'
[opencl_init] FINALLY: opencl is AVAILABLE on this system.
```

Here, the GeForce GTS 450 is detected as the first device and the Radeon HD7950 ('Tahiti') as the second. This order will normally not change unless the hardware or driver configuration is modified, but it's better to use device names rather than numbers to be on the safe side.

As the GTS450 is slower than the HD7950, an optimized "opencl\_device\_priority" could look like: `!GeForce GTS450,*/!Tahiti,*/Tahiti,*/Tahiti,*`.

The GTS450 is explicitly excluded from processing the center image pixelpipe; this is reserved to “all” other devices (i.e. the HD7950/Tahiti). Conversely, for the preview pixelpipe, the Tahiti is excluded, so that only the GTS450 is permitted to do the work.

For file export and thumbnail generation we want all hands on deck. However, Ansel should first check whether the Tahiti device is free, because it's faster. If it is not free, then all other devices -- in fact only the GTS450 -- are checked.
