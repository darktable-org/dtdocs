---
title: memory & performance tuning
id: mem-performance
weight: 35
---

# memory requirements

Processing a Raw image in darktable requires a great deal of system memory. A simple calculation makes this clear: For a 20 megapixel image, darktable requires a 4x32-bit floating point cell to store each pixel, meaning that each full image of this size will require approximately 300MB of memory just to store the image data. In order to actually process this image through a given module, darktable needs at least two buffers (input and output) of this size, with more complex modules potentially requiring several additional buffers for intermediate data. Without further optimization, anything between 600MB and 3GB of memory might be required to store and process image data as the pixelpipe executes. On top of this is darktable's code segment, the code and data of any dynamically-linked system libraries, as well as further buffers that darktable uses to store intermediate states (cache) for quick access during interactive work.

All in all, darktable requires _at least_ 4GB of physical RAM plus 4 to 8GB of additional swap space to run but it will perform better the more memory you have.

As well as executing on your CPU, many darktable modules also have OpenCL implementations that can take full advantage of the parallel processing offered by your graphics card (GPU). Similarly, the more GPU memory you have, the better darktable will perform.

## tiling

If darktable does not have sufficient memory to process the entire image in one go, modules may choose to use a "tiling strategy", wherein the image is split into smaller parts (tiles) which are processed independently, and then stitched back together at the end. While this allows images to be processed with a much smaller memory footprint, it does also come with some down-sides:

- tiling is always slower -- sometimes up to 10x slower, though for some modules the difference is negligible,
- tiling is not technically possible for some modules because of the nature of the underlying algorithms

For most systems, tiling will probably only be used for full-sized image exports, with interactive work in the darkroom being processed more efficiently. For best performance (and avoidance of tiling modes) you should run darktable alongside as few other applications as possible and configure darktable to use as much of your system and GPU memory as you can.

# performance tuning

There are a number of configuration parameters that can help you to fine-tune your system's performance. Some of these parameters are available in [preferences > processing > CPU / memory](../preferences-settings/processing.md#cpu--memory) and others need to be modified directly in darktable's configuration file (found in `$HOME/.config/darktable/darktablerc`).

This section provides some guidance on how to adjust these settings.

## how to test

In order to determine how much your modifications improve (or not) darktable's performance, you will need one or more sample images to test with, and a method of assessing the speed of the pixelpipe.

For sample images, you are advised to use some of the more intensive modules, such as [diffuse or sharpen](../module-reference/processing-modules/diffuse.md) or [denoise (profiled)](../module-reference/processing-modules/denoise-profiled.md). Exports are likely to have more consistent and comparable timings between pipe runs than interactive work (and will also push your hardware more).

In order to obtain profiling information you need to start darktable from a terminal with `darktable -d opencl -d perf`. If you want more information about tiling you should use `darktable -d opencl -d tiling -d perf`.

Each time the pixelpipe is processed (when you change module parameters, zoom, pan, export etc.) you will see (in your terminal session) the total time spent in the pixelpipe and the time spent in each of the OpenCL kernels. The most reliable value is the total time spent in the pixelpipe and you should use this to assess your changes.

---

**Note**: The timings given for each individual module are unreliable when running the OpenCL pixelpipe asynchronously (see _asyncronous mode_ below).

---

To allow for efficient processing with OpenCL it is essential that the GPU is kept busy. Any interrupts or a stalled data flow will add to the total processing time. This is especially important for the small image buffers used during interactive work, which can be processed quickly by a fast GPU. However, even short-term stalls of the pixelpipe can easily become a bottleneck.

On the other hand darktable's performance during file exports is more or less only governed by the speed of the algorithms and the horse-power of your GPU. Short-term stalls will not have a noticeable effect on the total time of an export.

## darktable resources

The "darktable resources" preference (in [preferences > processing > CPU / memory](../preferences-settings/processing.md#cpu--memory)) allows you to choose between four different approaches to allocating your system's resources to darktable. Each of these options controls multiple individual parameters, which are defined independently in `$HOME/.config/darktable/darktablerc`. You can amend any of these directly within your darktablerc file to tweak values for your selected resource level, though you cannot add your own custom resource level to the preferences drop-down.

Each of the four "darktable resources" options are defined as follows:

```
resource_default=512 8 128 700
resource_large=700 16 128 900
resource_small=128 4 64 400
```

More generally, these can be represented as `resource_level=a b c d` where `a` - `d` are defined as follows:

a. system memory for module processing
: The maximum amount of system memory made available for module processing. Lower values force memory-hungry modules to process images with an increasing number of tiles. This number is a fraction of the total amount of system memory, divided by 1024. For example, on a system with 16GB of total system memory the amount assigned by `resource_default` (in GB) is `16 * 512 / 1024`, or 8GB of system RAM.

b. minimum tiling buffer size
: The minimum size of a single tiling buffer, similarly expressed as a fraction of total system memory. For example, on a system with 16GB of total system memory the amount assigned by `resource_default` (in GB) is `16 * 8 / 1024`, or 0.125GB of system RAM. Note that this setting is largely historic and is no longer of much practical use -- you are advised to leave it at its default value.

c. thumbnail cache memory
: The amount of memory to use for the thumbnail cache. Again, this is expressed as a fraction of total system memory and, on a 16GB system, the amount assigned by `resource_default` is `16 * 128 / 1024`, or 2GB of system RAM.

d. OpenCL (GPU) memory
: The maximum amount of GPU memory made available for module processing. As with system memory, lower values will force memory-hungry modules to process images with an increasing number of tiles. Your GPU memory will likely also be used by other applications on your system. However, in contrast to system memory, your GPU is not able to take advantage of swap files and it is impossible for darktable to know how much memory is available at a given time. If this parameter is set too high, darktable could be forced to fall back to CPU processing (which will be significantly slower but stable and with correctly processed data) or darktable might crash and even make your system unusable. For this reason, the GPU memory parameter fraction also includes an extra 600MB of headroom in an attempt to avoid over-allocation of memory. For example, on a GPU with 6GB of memory, darktable will use approximately `(6 - 0.6) * 700 / 1024`, or 3.5GB of GPU RAM when using the `resource_default` level.

In addition to the resource levels presented in the UI the following options can be set via the command-line (e.g. `darktable --conf resourcelevel="notebook"`). These modes are designed for debugging tiling issues and testing performance of common systems on larger development machines. The following options are provided:

- "mini" (1GB ram, 2MB single buffer, 128MB thumbnail cache, 200MB OpenCL memory)
- "notebook" (4GB ram, 32MB  single buffer, 512MB thumbnail cache, 1GB OpenCL memory)
- "reference" (8GB ram, 32MB single buffer, 512MB thumbnail cache, 2GB OpenCL memory)

## tuning GPU memory usage

If you want to make maximal use of your GPU memory for OpenCL, you have three options:

- Choose the "large" resource level. For a 6GB card, this will use approximately 5GB of GPU memory, leaving 1GB for the rest of your system. (recommended)
- Alter darktablerc to increase the last number (the OpenCL memory fraction) for your selected resource level. For example, increasing the OpenCL memory fraction to 950 would increase the available memory on a 6GB GPU to approximately 5.3GB. (absolutely not recommended)
- Set [preferences > processing > OpenCL > use all device memory](../preferences-settings/processing.md#opencl) to "on", which will use all of your device's memory, less a 600MB headroom. Please see the [section below](#id-specific-opencl-configuration) for "per device setting" of headroom.

## balanced OpenCL versus CPU tiling

In most cases, running a processing module on a high-powered GPU (the OpenCL codepath) is significantly faster than running the same module using the CPU codepath. However, many users have fast multi-core CPUs with a large amount of system RAM, but a GPU with significantly lower capabilities (typically, integrated graphics with small amounts of dedicated memory). Use of OpenCL code in these cases can lead to excessive tiling, and it is often better to run a module without tiling using the CPU codepath than to attempt to use OpenCL with heavy tiling.

While processing the pipeline, darktable attempts to determine which mode will be best for a given module by estimating the expected workloads for both OpenCL and CPU codepaths. In most cases it will prefer the OpenCL codepath even if that would mean tiling the image, since OpenCL is typically much faster than running the CPU code (often as much as 10 times faster if it is a dedicated card).

If the ratio of estimated workloads (CPU vs GPU) is larger than the **advantage hint** (see below), darktable will use the CPU for processing that module, else it will use the GPU.

## device-specific OpenCL configuration

The default darktable settings deliver a reasonable GPU performance on most systems. However, if you want to try to optimize things further, this section describes the relevant configuration parameters (all of which are set in your darktablerc file).

Most of the OpenCL-related options are managed with a "per device" strategy. The configuration parameter for each device looks like:

`cldevice_v5_nvidiacudaquadrortx4000=0 250 0 16 16 128 0 0 0.000 0.000 0.500`

or, more generally

`cldevice_version_canonicalname=a b c d e f g h i j k`

An entry will be automatically created in darktablerc for each newly-detected device when you launch darktable for the first time, with the correct canonical device name and version number. The parameters `a` - `k` are defined as follows and can be manually edited:

a. avoid atomics
: _1 = avoid atomics; 0 = use atomics_ (default)
: Atomic operations in OpenCL are a special method of data synchronization and are only used in a few modules. Unfortunately, some old AMD/ATI devices are extremely slow in processing atomics and, on these cards, it is better to process the affected modules on the CPU rather than accepting an ultra-slow GPU codepath. Set this parameter to 1 if you experience slow processing within modules like [_shadows and highlights_](../../module-reference/processing-modules/shadows-and-highlights.md), [_monochrome_](../../module-reference/processing-modules/monochrome.md), [_local contrast_](../../module-reference/processing-modules/local-contrast), or [_global tonemap (deprecated)_](../../module-reference/processing-modules/global-tonemap) or if you get intermittent system freezes. Please note that this should not affect any card manufactured since 2015.

b. micro nap
: _default 250_
: In an ideal case you will keep your GPU busy at 100% when processing the pixelpipe. However, if your GPU is also required to update your screen, and darktable is using it at 100%, there may not be sufficient time left for this task. This will usually manifest as jerky GUI updates on panning, zooming or when moving sliders. To resolve this issue darktable can add small pauses into its pixelpipe processing so that the GPU can catch its breath and perform GUI related activities. The "micro nap" parameter controls the duration of these pauses in microseconds.

: On all current systems you are safe with the default value. If you are using multiple devices or you are not using your discrete GPU for drawing on your screen, this value can be set to 0 for all non-desktop devices leading to improved performance.

c. pinned memory
: _0 = disable pinned transfer (default); 1 = enforce pinned transfer_
: During tiling huge amounts of memory need to be transferred between host and device. On some devices direct memory transfers to and from an arbitrary host memory region may give a large performance penalty. This is especially noticeable when exporting large images on smaller graphics cards or while using newer modules like [_diffuse or sharpen_](../module-reference/processing-modules/diffuse.md) or the _guided laplacians_ mode in the [_highlight reconstruction_](../module-reference/processing-modules/highlight-reconstruction.md) module.

: There is no safe method or general rule to predict whether or not this parameter will provide a performance benefit, so you will have to experiment for yourself. However, the chance of pinned transfer leading to an improvement is pretty low if your card was manufactured after 2015.

d. clroundup wh / e. clroundup ht
: These parameters should be left at this default value -- testing has not shown any benefit to using other values.

f. number of event handles
: _default 128_
: Event handles are used by darktable to monitor the success/failure of kernels and provide profiling info even if the pixelpipe is executed asynchronously. The number of event handles is a limited resource of your OpenCL driver -- while they can be recycled, there is a limited number that can be used at the same time. Unfortunately, there is no way to find out what the resource limits are for a given device (this is due to darktable using the OpenCL V.1.2 API to support all platforms), so darktable uses a conservative guess of 128 by default. On most current devices and drivers you can expect a number of up to 1024 to be safe (for sure if your driver / card reports OpenCL V.2.0 or larger) leading to a slightly better OpenCL performance. If your driver runs out of free handles you will experience failing OpenCL kernels with error message `CL_OUT_OF_RESOURCES` or even crashes or system freezes. (If you are running into this problem, please open a github issue)

: A value of 0 will block darktable from using any event handles. This will prevent darktable from properly monitoring the success of your OpenCL kernels but saves some driver overhead leading to a slightly better performance (less than 5%). The consequence is that all failures will lead to garbled output without darktable noticing. This is only recommended if you know for sure that your system runs rock-solid.

g. asynchronous mode
: _1 = use asynchronous mode; 0 = don't use (default)_
: This flag controls how often darktable blocks the OpenCL pixelpipe to get a status on success/failure of the kernels that have been run. For optimum latency set this to 1, so that darktable runs the pixelpipe asynchronously and tries to use as few interrupts/events as possible. If you experience OpenCL errors like failing kernels, reset the parameter to 0. This will cause darktable to interrupt after each module so that you can more easily isolate any problems. Issues have been reported with some older AMD/ATI cards (like the HD57xx) which can produce garbled output if this parameter is set to 1. If in doubt, leave it at its default of 0.

h. disable device
: _0 = enable device; 1 = disable device_
: If darktable detects a malfunctioning device it will automatically mark it as such by setting this parameter to 1. If you have a device that reports a lot of errors you can manually disable it by setting this field to 1. If darktable has disabled the device but you are sure it should be used you can re-enable it by setting this field to 0.

i. reserved

j. advantage hint
: This defines the advantage hint described in the [balanced OpenCL versus CPU tiling](#balanced-opencl-versus-cpu-tiling) section. If you have a fast graphics card with plenty of memory you can safely leave this at its default value of 0.000. However, if you want to adapt this number to your own system, you should use the following process:
1. Start darktable with the tiling debug option (`darktable -d tiling`) and start editing an image in the darkroom. Open the [_highlight reconstruction_](../module-reference/processing-modules/highlight-reconstruction.md) module and use the "guided laplacians" method, setting the "diameter of reconstruction" to a high value, while ensuring that tiling does not occur (check the debug information in your terminal session while adjusting the slider).
1. Check the execution times of this module with OpenCL on and off (by running `darktable -d perf` to examine the performance).
1. Set the "advantage hint option" to approximately (CPU execution time / GPU execution time).

k. shared memory fraction
: Some OpenCL devices don't have dedicated memory but share it with the CPU -- Apple ARM silicon is one example but also onboard devices from Intel, AMD or ARM SOCs. As we want to keep system memory available for caching or CPU codepaths we restrict the amount of all memory used to the given fraction. So with the default of 0.5 and an Apple computer with 16GB of system RAM, OpenCL would be able to make use of 8GB.

---

**Note**: if darktable detects a "buggy" device configuration key it will be rewritten back to default values.

---

## id-specific OpenCL configuration

A second device-specific configuration key is also provided, which takes into account both the device name **and** the device id (in case you have two identical devices). In this case, the usual key name `cldevice_version_canonicalname` is followed by `_idX` with X being the device id. For example, if the above example device was referred to as device 0, the second configuration setting would (by default) be `cldevice_v5_quadrortx4000_id0=600`.

This configuration key currently only has a single parameter defined:

forced headroom (default 600)
: The amount of memory (in MB) that will **not** be used by darktable during OpenCL processing. This setting is only valid if you set [preferences > processing > OpenCL > use all device memory](../preferences-settings/processing/#opencl) to "on".

: If you are certain that no apps (or your OS) make use of the specific device you can set this parameter to 0 for the otherwise-unused device so that darktable will use all of that device's memory.

: The default of 600MB should be fine for most systems. If you find you run into performance problems due to darktable falling back to CPU, try changing it to 800 or larger.


## other configuration keys

The following additional configuration keys are also available in darktablerc:

cldevice\_version\_canonicalname\_building
: This option is used when compiling OpenCL kernels and may be provided for performance tuning or to work around bugs. You must remove any existing kernels in order to recompile them with the new options. Provide an empty string to recompile without any options. Remove the setting entirely to recompile with default options, default is `-cl-fast-relaxed-math` for nvidia drivers, all other cards don't have this compiler option set.
: The `-cl-fast-relaxed-math` option significantly improves performance but changes maths in the module's processing code possibly leading to different results. For current Intel implementations this compiler flag leads to visibly wrong results, on AMD cards the results are non-conclusive. Some card/driver combinations are fine, some are not. As the AMD drivers constantly change we don't recommend to use it on AMD cards.

opencl\_mandatory\_timeout
: _default 400_
: If darktable wants to make use of any OpenCL device it has to reserve it for further usage. If that device is current used darktable will wait up to _opencl\_mandatory\_timeout * 5ms_ before it does a fallback to CPU. Increase this value if you would prefer to use OpenCL (because your card is really fast and your CPU is not).
