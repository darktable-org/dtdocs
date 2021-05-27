---
title: setting up opencl
id: setting-up
weight: 40
draft: false
author: "people"
---

The huge diversity of systems and the marked differences between OpenCL vendors and driver versions makes it impossible to give an comprehensive overview of how to setup OpenCL. We only can give you an example, in this case for NVIDIA driver version 331.89 on Ubuntu 14.04. We hope that this will serve as a basic introduction and will help you to solve any problems specific to your setup.

The principle OpenCL function flow is like this:

`darktable > libOpenCL.so > libnvidia-opencl.so.1 > kernel driver module(s) > GPU`

- darktable dynamically loads `libOpenCL.so` -- a system library that must be accessible to the system's dynamic loader (`ld.so`).

- `libOpenCL.so` reads the vendor-specific information file (`/etc/OpenCL/vendors/nvidia.icd`) to find the library that contains the vendor-specific OpenCL implementation.

- The vendor-specific OpenCL implementation comes as a library `libnvidia-opencl.so.1` (which in our case is a symbolic link to `libnvidia-opencl.so.331.89`).

- `libnvidia-opencl.so.1` needs to talk to the vendor-specific kernel modules `nvidia` and `nvidia_uvm` via device special files `/dev/nvidia0`, `/dev/nvidiactl`, and `/dev/nvidia-uvm`.

At system startup the required device special files (`/dev/nvidia*`) need to be created. If this does not happen on your system by default, the easiest way to set them up and make sure all modules are loaded is by installing the `nvidia-modprobe` package.

A user account that needs to make use of OpenCL from within darktable must have read/write access to NVIDIA's device special files. On some systems these files allow world read-write access by default, which avoids permission issues but might be debatable in terms of system security. Other systems restrict the access to a user group, e.g. “video”. In this case your user account has to be member of that group.

To summarise, the packages that needed to be installed in this specific case were:

```
nvidia-331 (331.89-0ubuntu1~xedgers14.04.2)
nvidia-331-dev (331.89-0ubuntu1~xedgers14.04.2)
nvidia-331-uvm (331.89-0ubuntu1~xedgers14.04.2)
nvidia-libopencl1-331 (331.89-0ubuntu1~xedgers14.04.2)
nvidia-modprobe (340.24-1)
nvidia-opencl-dev:amd64 (5.5.22-3ubuntu1)
nvidia-opencl-icd-331 (331.89-0ubuntu1~xedgers14.04.2)
nvidia-settings (340.24-0ubuntu1~xedgers14.04.1)
nvidia-settings-304 (340.24-0ubuntu1~xedgers14.04.1)
nvidia-libopencl1-331 (331.89-0ubuntu1~xedgers14.04.2)
nvidia-opencl-dev:amd64 (5.5.22-3ubuntu1)
nvidia-opencl-icd-331 (331.89-0ubuntu1~xedgers14.04.2)
opencl-headers (1.2-2013.10.23-1)
```

The list of NVIDIA related kernel modules as reported by lsmod was:

```
nvidia
nvidia_uvm
```

The list of NVIDIA related device special files (`ls -l /dev/nvidia*`) should read like:

```
crw-rw-rw- 1 root root 195,   0 Jul 28 21:13 /dev/nvidia0
crw-rw-rw- 1 root root 195, 255 Jul 28 21:13 /dev/nvidiactl
crw-rw-rw- 1 root root 250,   0 Jul 28 21:13 /dev/nvidia-uvm
```

Beware that the major/minor numbers (e.g. `250/0` for `/dev/nvidia-uvm` in this example) may vary depending on your system. 
