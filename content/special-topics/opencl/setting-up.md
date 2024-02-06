---
title: setting up OpenCL
id: setting-up
weight: 40
draft: false
author: "people"
---

The huge diversity of systems and the marked differences between OpenCL vendors and driver versions makes it impossible to give an comprehensive overview of how to setup OpenCL. We only can give you an example, in this case for NVIDIA driver version 542.29.06 on Fedora 39. We hope that this will serve as a basic introduction and will help you to solve any problems specific to your setup.

The principle OpenCL function flow is like this:

`darktable > libOpenCL.so > libnvidia-opencl.so.1 > kernel driver module(s) > GPU`

- darktable dynamically loads `libOpenCL.so` -- a system library that must be accessible to the system's dynamic loader (`ld.so`).

- `libOpenCL.so` reads the vendor-specific information file (`/etc/OpenCL/vendors/nvidia.icd`) to find the library that contains the vendor-specific OpenCL implementation.

- The vendor-specific OpenCL implementation comes as a library `libnvidia-opencl.so.1` (which in our case is a symbolic link to `libnvidia-opencl.so.545.29.06`).

- `libnvidia-opencl.so.1` needs to talk to the vendor-specific kernel modules `nvidia` and `nvidia_uvm` via device special files `/dev/nvidia0`, `/dev/nvidiactl`, and `/dev/nvidia-uvm`.

At system startup the required device special files (`/dev/nvidia*`) need to be created. If this does not happen on your system by default, the easiest way to set them up and make sure all modules are loaded is by installing the `nvidia-modprobe` package.

A user account that needs to make use of OpenCL from within darktable must have read/write access to NVIDIA's device special files. On some systems these files allow world read-write access by default, which avoids permission issues but might be debatable in terms of system security. Other systems restrict the access to a user group, e.g. “video”. In this case your user account has to be member of that group.

To summarise, the packages that needed to be installed in this specific case were:

```
xorg-x11-drv-nvidia
xorg-x11-drv-nvidia-libs
xorg-x11-drv-nvidia-cuda
xorg-x11-drv-nvidia-cuda-libs
xorg-x11-drv-nvidia-power
akmod-nvidia
nvidia-settings
nvidia-modprobe
nvidia-persistenced
opencl-headers
opencl-filesystem
ocl-icd
ocd-icd-devel
```

On Linux systems you might also want the `clinfo` package giving you a lot of information about your OpenCL system and settings.
