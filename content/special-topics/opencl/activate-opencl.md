---
title: activating OpenCL in darktable
id: activate-opencl
weight: 30
---

Using OpenCL in darktable requires that your PC is equipped with a suitable graphics card and that it has the required libraries in place. Most modern graphics cards from NVIDIA, Intel or AMD come with full OpenCL support. The OpenCL compiler is normally shipped as part of the proprietary graphics driver and is used as a dynamic library called `libOpenCL.so`. This library must be in a folder where it can be found by your system's dynamic linker.

When darktable starts, it will first try to find and load `libOpenCL.so` and -- on success -- checks if the available graphics card comes with OpenCL support. A minimally-sufficient amount of graphics memory (1GB+) needs to be available for darktable to take advantage of the GPU. If that check passes, darktable tries to setup its OpenCL environment: a processing context needs to be initialized, a calculation pipeline to be started, OpenCL source code files (extension is `.cl`) needs to be read and compiled and the included routines (OpenCL kernels) need to be prepared for darktable's modules. If all of that completes successfully, the preparation is complete.

By default, OpenCL support is activated in darktable if all the above steps were successful. If you want to de-activate it you can do so in [preferences > processing > OpenCL](../../preferences-settings/processing/#opencl). This configuration parameter is grayed out if the OpenCL initialization failed.

You can switch OpenCL support off and on at any time without requiring a restart. Depending on the type of modules you are using, you will notice the effect as a general speed-up during interactive work and export. Most modules in darktable can take advantage of OpenCL but not all modules are demanding enough to make a noticeable difference. In order to feel a real difference, use modules like [_diffuse or sharpen_](../../module-reference/processing-modules/diffuse.md), and [_denoise (profiled)_](../../module-reference/processing-modules/denoise-profiled.md).

If you are interested in profiling statistics, you can start darktable with command line parameters `-d opencl -d perf`. After each run of the pixelpipe you will be shown details of processing time for each module plus an even more fine-grained profile for all used OpenCL kernels.

Apart from the speed-up you should not see any difference in the results between CPU and GPU processing. Except for some rounding errors, the results are designed to be identical. If, for some reason, darktable fails to properly finish a GPU calculation, it will normally detect the failure and automatically (and transparently) fall back to CPU processing.
