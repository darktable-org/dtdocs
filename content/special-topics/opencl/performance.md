---
title: performance optimization
id: performance
weight: 70
draft: false
author: "people"
---

There are a number of configuration parameters in `$HOME/.config/darktable/darktablerc` that can help to finetune your system's OpenCL performance. Performance in this context mostly means the latency of darktable during interactive work (i.e. how long it takes to reprocess the pixelpipe). For a comfortable workflow it is essential to keep latency low.

In order to obtain profiling information you need to start darktable from a terminal with `darktable -d opencl -d perf`.

After each reprocessing of the pixelpipe -- caused by module parameter changes, zooming, panning, etc. -- you will see the total time spent in the pixelpipe and the time spent in each of the OpenCL kernels. The most reliable value is the total time spent the in pixelpipe. Please note that the timings given for each individual module are unreliable when running the OpenCL pixelpipe asynchronously (see opencl\_async\_pixelpipe below).

To allow for fast pixelpipe processing with OpenCL it is essential that we keep the GPU busy. Any interrupts or a stalled data flow will add to the total processing time. This is especially important for the small image buffers we need to handle during interactive work. These can be processed quickly by a fast GPU. However, even short-term stalls of the pixelpipe can easily become a bottleneck.

On the other hand darktable's performance during file exports is more or less only governed by the speed of our algorithms and the horse-power of your GPU. Short-term stalls will not have a noticeable effect on the total time of an export.

darktable comes with default settings that should deliver a decent GPU performance on most systems. However, if you want to fiddle around a bit by yourself and try to optimize things further, here is a description of the relevant configuration parameters.

opencl\_async\_pixelpipe
: This flag controls how often darktable blocks the OpenCL pixelpipe to get a status on success/failure of the kernels that have been run. For optimum latency set this to TRUE, so that darktable runs the pixelpipe asynchronously and tries to use as few interrupts as possible. If you experience OpenCL errors like failing kernels, set the parameter to FALSE. darktable will then interrupt after each module so that you can more easily isolate the problem. Problems have been reported with some older AMD/ATI cards, like the HD57xx, which can produce garbled output if this parameter is set to TRUE. If in doubt, leave it at its default of FALSE.

opencl\_number\_event\_handles
: Event handles are used so that darktable can monitor the success/failure of kernels and profiling info even if the pixelpipe is executed asynchronously. The number of event handles is a limited resource of your OpenCL driver. For sure they can be recycled but there is a limited number that can be used at the same time. Unfortunately, there is no way to find out what the resource limits are, so darktable needs to guess. The default value of 25 is quite conservative. You might want to see if higher values like 100 give better OpenCL performance. If your driver runs out of free handles you will experience failing OpenCL kernels with error code `-5 (CL_OUT_OF_RESOURCES)` or even crashes or system freezes. Reduce the number again if that happens. A value of 0 will block darktable from using any event handles. This will prevent darktable from properly monitoring the success of your OpenCL kernels but saves some driver overhead. The consequence is that any failures will likely lead to garbled output without darktable noticing. This is only recommended if you know for sure that your system runs rock-solid. You can also set this parameter to -1, which means that darktable assumes no restriction in the number of event handles. This is not recommended.

opencl\_synch\_cache
: This parameter, if set to "true", will force darktable to fetch image buffers from your GPU after each module and store them in its pixelpipe cache. This is a resource consuming operation, but can make sense depending on your GPU (including if the GPU is rather slow). In this case darktable might in fact save some time when module parameters have changed, as it can go back to some cached intermediate state and reprocess only part of the pixelpipe. In many cases this parameter should be set to "active module" (the default), which will only cache the input of the currently focused module.

opencl\_micro\_nap
: In an ideal case you will keep your GPU busy at 100% when reprocessing the pixelpipe. That's good. On the other hand your GPU may also be needed to do regular GUI updates. It might happen that there is no sufficient time left for this task. The consequence would by a jerky reaction of your GUI on panning, zooming or when moving sliders. To resolve this issue darktable can add small naps into its pixelpipe processing to have the GPU catch some breath and perform GUI related activities. The opencl\_micro\_nap parameter controls the duration of these naps in microseconds. You will need to experiment in order to find an optimum value for your system. Values of 0, 100, 500 and 1000 are good starting points to try. The default is 1000.

opencl\_use\_pinned\_memory
: During tiling huge amounts of memory need to be transferred between host and device. On some devices (namely AMD) direct memory transfers to and from an arbitrary host memory region may give a huge performance penalty. This is especially noticeable when exporting large images. Setting this configuration parameter to TRUE tells darktable to use a special kind of intermediate buffer for host-device data transfers. On some devices this can speed up exporting of large files by a factor of 2 to 3. NVIDIA devices and drivers seem to have a more efficient memory transfer technique even for arbitrary memory regions. As they may not show any performance gain and even may produce garbled output, opencl\_use\_pinned\_memory should be left at its default FALSE for those devices.
