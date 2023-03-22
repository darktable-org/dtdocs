---
title: setting up opencl
id: setting-up
weight: 40
draft: false
author: "people"
---

Diversity of systems and differences between OpenCL vendors and driver versions make it impossible to give an comprehensive overview of how to setup OpenCL. Here we only describe a general OpenCL function flow in **Linux** and then, as an example, show steps for setting up OpenCL on **Ubuntu 22.10** for three GPU makers. Hopefully this will help you understand your specific setup.

## general

OpenCL function flow in Linux:

`darktable > libOpenCL.so > vendor-specific-opencl.so.1 > vendor-specific kernel module(s) > GPU`

- darktable dynamically loads `libOpenCL.so` — a system library that must be accessible to the system's dynamic loader (`ld.so`).

- `libOpenCL.so` reads the vendor-specific information file `/etc/OpenCL/vendors/<vendor>.icd`, which points to a vendor-specific OpenCL library.

- The vendor-specific OpenCL library needs to talk to the vendor-specific kernel module via device special file in `/dev` virtual filesystem, created at system startup. A user account that needs to make use of OpenCL must have read/write access to these device special files. On some systems these files allow world read-write access by default, which avoids permission issues, but might be debatable in terms of system security. Other systems restrict the access to a user group, e.g. ‘render’ or ‘video’. In this case your user account has to be a member of that group.

System library `libOpenCL.so` is provided by the standard distribution package `ocl-icd-libopencl1` (Ubuntu 22.10).

As for GPU-vendor-specific part of OpenCL, setting it can be as simple as installing a package from standard distribution repositories, or it may require adding vendor's repositories and/or compiling kernel modules. Here is a summary for AMD, Intel and Nvidia on Ubuntu 22.10:

|| AMD | Intel | Nvidia |
|--------|:---------:|:---------:|:-----:|
| Vendor-specific OpenCL packages<br> in standard repositories | no | yes | yes |
| Adding vendor's repositories |&emsp;mandatory&emsp;| optional | optional |
| Vendor-specific kernel module<br> in standard Linux kernel | yes | yes | no |
| Compiling kernel modules<br> from vendor's source code  | optional | optional |&emsp;mandatory&emsp;|


## AMD

As of Ubuntu 22.10, enabling OpenCL for AMD GPUs requires software from ROCm repositories. There are two ways to add these repositories as described in <https://docs.amd.com> > *ROCm Release Documentation* > *Installation guide*:

1. Installer Script. Download and install the latest `amdgpu-install.x.y.z.deb` from the above web site. This will configure repositories and will also add `amdgpu-install` script to the system. 

2. Package Manager. Add repositories and keys manually by following *Installation Guide* to *Package Manager Method*.

If using the script, install OpenCL support by:

```amdgpu-install --no-dkms --usecase=opencl```

When using package manager, add OpenCL support by: 

```apt install rocm-opencl-runtime```

In both cases the following packages will be installed:
```
amdgpu-core                   Core meta package for unified amdgpu driver.
libdrm-amdgpu-amdgpu1         Userspace interface to amdgpu-specific kernel DRM services -- runtime
libdrm-amdgpu-common          List of AMD/ATI cards' device IDs, revision IDs and marketing names
libdrm-amdgpu1                Userspace interface to amdgpu-specific kernel DRM services -- runtime
libdrm2-amdgpu                Userspace interface to kernel DRM services -- runtime
rocm-core                     Radeon Open Compute (ROCm) Runtime software stack
rocm-language-runtime         Radeon Open Compute (ROCm) Runtime software stack
rocm-ocl-icd                  opencl built using CMake
rocm-opencl                   opencl built using CMake
rocm-opencl-runtime           Radeon Open Compute (ROCm) Runtime software stack

```
This will use kernel module `amdgpu.ko` from Linux kernel is use. 

Optionally `amdgpu.ko` can be compiled from sources in ROCm repository. This may bring in more/newer features and/or increase efficiency, but may only work with “official” kernels from Ubuntu LTS release. To attemp kernel module compile either install `amdgpu-dkms` package or do not use `--no-dkms` option for the installer script.

## Intel
**Note**: Intel Arc GPUs require *Resizable BAR* capability in system BIOS. It may also be called *Smart Access Memory* on AMD systems.

All necessary software for OpenCL with Intel GPUs is already in standard Ubuntu 22.10 repositories. To install run:

`apt install intel-opencl-icd`

This will install the following:

```
intel-gpu-tools                tools for debugging the Intel graphics driver
intel-media-va-driver          VAAPI driver for the Intel GEN8+ Graphics family
intel-microcode                Processor microcode firmware for Intel CPUs
intel-opencl-icd               Intel graphics compute runtime for OpenCL
libdrm-intel1                  Userspace interface to intel-specific kernel DRM services -- runtime
```
Linux kernel module used will be `i915.ko`.

Optionally, `i915.ko` can be recompiled using sources from Intel repositories. 
See [Installation Guides](https://dgpu-docs.intel.com/installation-guides/) on dgpu-docs.intel.com. For selected kernels only.

## Nvidia 

All necessary software is available in standard Ubuntu repositories. Installing `nvidia-driver-<version>` will also pull some other packages and then will attempt to compile several kernel modules. As of March 2023 the latest Nvidia driver version is 525:

`apt install nvidia-driver-525`

As a result the following will be installed:

```
libnvidia-cfg1-525             NVIDIA binary OpenGL/GLX configuration library
libnvidia-common-525           Shared files used by the NVIDIA libraries
libnvidia-compute-525          NVIDIA libcompute package
libnvidia-decode-525           NVIDIA Video Decoding runtime libraries
libnvidia-egl-wayland1         Wayland EGL External Platform library -- shared library
libnvidia-encode-525           NVENC Video Encoding runtime library
libnvidia-extra-525            Extra libraries for the NVIDIA driver
libnvidia-fbc1-525             NVIDIA OpenGL-based Framebuffer Capture runtime library
libnvidia-gl-525               NVIDIA OpenGL/GLX/EGL/GLES GLVND libraries and Vulkan ICD
nvidia-compute-utils-525       NVIDIA compute utilities
nvidia-dkms-525                NVIDIA DKMS package
nvidia-driver-525              NVIDIA driver metapackage
nvidia-kernel-common-525       Shared files used with the kernel module
nvidia-kernel-source-525       NVIDIA kernel source package
nvidia-prime                   Tools to enable NVIDIA's Prime
nvidia-settings                Tool for configuring the NVIDIA graphics driver
nvidia-utils-525               NVIDIA driver support binaries

```
Nvidia's OpenCL library `libnvidia-opencl.so.525.85.05` is in `libnvidia-compute-525` package.

The following kernel modules will be compiled:

```
nvidia.ko
nvidia-drm.ko
nvidia-modeset.ko
nvidia-peermem.ko
nvidia-uvm.ko
```
In addition there is `nvidia-modprobe`, installing which should help when device files are not created automatically or Nvidia kernel modules are not loaded during system start.

