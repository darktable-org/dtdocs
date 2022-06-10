---
title: performance optimization
id: performance
weight: 55
draft: false
author: "people"
---

There are a number of configuration parameters in `$HOME/.config/darktable/darktablerc` that can help to finetune your system's OpenCL performance.

In order to obtain profiling information you need to start darktable from a terminal with `darktable -d opencl -d perf`, if you are concerned about tiling you should do `darktable -d opencl -d tiling -d perf`.

After each reprocessing of the pixelpipe -- caused by module parameter changes, zooming, panning, etc. -- you will see the total time spent in the pixelpipe and the time spent in each of the OpenCL kernels. The most reliable value is the total time spent the in pixelpipe. Please note that the timings given for each individual module are unreliable when running the OpenCL pixelpipe asynchronously (see opencl\_async\_pixelpipe below).

To allow for fast pixelpipe processing with OpenCL it is essential that we keep the GPU busy. Any interrupts or a stalled data flow will add to the total processing time. This is especially important for the small image buffers we need to handle during interactive work. These can be processed quickly by a fast GPU. However, even short-term stalls of the pixelpipe can easily become a bottleneck.

On the other hand darktable's performance during file exports is more or less only governed by the speed of our algorithms and the horse-power of your GPU. Short-term stalls will not have a noticeable effect on the total time of an export.

darktable comes with default settings that should deliver a decent GPU performance on most systems. However, if you want to fiddle around a bit by yourself and try to optimize things further, here is a description of the relevant configuration parameters.

Since darktable 4.0 most relevant OpenCL related options are handled by a "per device" strategy. The configure parameter for each device (can be edited) looks like:

cldevice_v4_quadrortx4000=0 250 0 16 16 1024 0 0 0.017853 or in general

cldevice_version_canonicalname=a b c d e f g h x.xxxx

 a) avoid atomics:  (1) avoiding or (0) use atomics (Only very old devices require an avoid.
 b) micro_nap:      default 250. If using multiple devices the non-desktop device could be set to 0
 c) pinned memory:  (0) select mode by gui. (1) enforce pinned transfer. (2) disable pinned transfer
 d) clroundup wd:   both roundups have 16 as default.
 e) clroundup ht:
 f) event_handles:  safe up to 1024, (0) to disable CL events (might not report errors but faster)
 g) async mode:     if (1) device uses asnchronous dt mode, this uses more events and might be
                    unstable on old&small devices with heavy tiling and pinned transfer.
 h) disabled:       (0) enable or (1) disable device. Bad devices are marked as disabled by dt
 i) benchmark:      DO NOT edit except maybe set to 0 to enfore a CL re-benchmarking

avoid atomics
: Atomic operations in OpenCL are a special method of data synchronization. They are only used in a few kernels. Unfortunately, some old AMD/ATI devices are extremely slow in processing atomics, on these cards it's better to process the affected modules on the CPU rather than accepting an ultra-slow GPU codepath. Therefore, set this parameter to 1 if you experience slow processing of modules like [_shadows and highlights_](../../module-reference/processing-modules/shadows-and-highlights.md), [_monochrome_](../../module-reference/processing-modules/monochrome.md), [_local contrast_](../../module-reference/processing-modules/local-contrast), or [_global tonemap (deprecated)_](../../module-reference/processing-modules/global-tonemap) or if you get intermittent system freezes. Please note that this should not affect any card since 2015.

opencl\_micro\_nap
: In an ideal case you will keep your GPU busy at 100% when reprocessing the pixelpipe. That's good. On the other hand your GPU may also be needed to do regular GUI updates. It might happen that there is no sufficient time left for this task. The consequence would by a jerky reaction of your GUI on panning, zooming or when moving sliders. To resolve this issue darktable can add small naps into its pixelpipe processing to have the GPU catch some breath and perform GUI related activities. The opencl\_micro\_nap parameter controls the duration of these naps in microseconds. On current systems you are pretty safe with default even for integrated graphics cards, using multiple devices the non-desktop device could be set to 0. The default is 250.

opencl\_use\_pinned\_memory
: During tiling huge amounts of memory need to be transferred between host and device. On some devices direct memory transfers to and from an arbitrary host memory region may give a huge performance penalty. This is especially noticeable when exporting large images on smaller graphics cards or while using new modulkes like diffuse&sharpen or the laplacian highlights reconstruction. 

Overall, there is no safe way or general rule to predict a performance benefit, so you have to find out what mode is faster on yout system. (We used to suggest pinned transfer might be better for AMD and not better for NVIDIA cards, this general rule is certainly not true any more.) You may set to 0 if mode is selected via the preferences interface (valid for all devices), 1 enforced pinned transfer and 2 forced it to be disabled for the device.

clroundup\_wh and clroundup\_ht
: Should be left at this default, so far tests don't show benefits for using other values like 32.

opencl\_number\_event\_handles
: Event handles are used so that darktable can monitor the success/failure of kernels and profiling info even if the pixelpipe is executed asynchronously. The number of event handles is a limited resource of your OpenCL driver. For sure they can be recycled but there is a limited number that can be used at the same time. Unfortunately, there is no way to find out what the resource limits are, so darktable uses a very conservative guess of 128 per default. On most current devices and drivers you can expect a number of up to 1024 as safe leading to a slightly better OpenCL performance. If your driver runs out of free handles you will experience failing OpenCL kernels with error message `CL_OUT_OF_RESOURCES` or even crashes or system freezes.

A value of 0 will block darktable from using any event handles. This will prevent darktable from properly monitoring the success of your OpenCL kernels but saves some driver overhead leading to a better performance. The consequence is that any failures will likely lead to garbled output without darktable noticing. This is only recommended if you know for sure that your system runs rock-solid.

opencl\_async\_mode
: This flag controls how often darktable blocks the OpenCL pixelpipe to get a status on success/failure of the kernels that have been run. For optimum latency set this to 1, so that darktable runs the pixelpipe asynchronously and tries to use as few interrupts/events as possible. If you experience OpenCL errors like failing kernels, reset the parameter to 0 (default). darktable will then interrupt after each module so that you can more easily isolate the problem. Problems have been reported with some older AMD/ATI cards, like the HD57xx, which can produce garbled output if this parameter is set to 1. If in doubt, leave it at its default of 0.

opencl_device_disabled
: If darktable detects a malfunctioning device it will automatically mark it by setting this value to 1. If you have a device reporting a lot of errors you might also disable it be setting the conf field to 0.

benchmark
: When darktable detects a new device in your system it will do a small benchmark and will keep the result here. DO NOT EDIT

Please note: if darktable detects a "buggy" device conf key it will be rewritten to default values.

For the adventurous people, you can also define OpenCL compiler options for each device, the conf key is named
cldevive_version_canonicalname_building
: This option is used when compiling OpenCL kernels and may be provided for performance tuning or to work around bugs. You must remove any existing kernels in order to recompile them with the new options. Provide an empty string to recompile without any options. Remove the setting entirely to recompile with default options, default is `-cl-fast-relaxed-math`


opencl\_synch\_cache
: This parameter, if set to "true", will force darktable to fetch image buffers from your GPU after each module and store them in its pixelpipe cache. This is a resource consuming operation, but can make sense depending on your GPU (including if the GPU is rather slow). In this case darktable might in fact save some time when module parameters have changed, as it can go back to some cached intermediate state and reprocess only part of the pixelpipe. In many cases this parameter should be set to "active module" (the default), which will only cache the input of the currently focused module.

