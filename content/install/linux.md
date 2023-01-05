---
title: Install on Linux
date: 2022-12-11
draft: false
weight: 10
---

## Recommended way

The Ansel project provides an official AppImage package, built for the stable, pre-release and experimental channels. This is the recommended way of installing Ansel, since it is fresh from the repository, always up-to-date and ships updated lens databases for Lensfun (note that, on many Linux distributions, you will need to run `lensfun-update-data` manually after installing it.)

### Prerequisites

- Install [Fuse2](https://docs.appimage.org/user-guide/troubleshooting/fuse.html),
- Install your GPU OpenCL drivers :
	- for Nvidia GPUs, you need the proprietary driver, as Nouveau doesn't support OpenCL
	- for AMD GPUs, ?
	- for Intel embedded GPUs, ?

### Downloads

[Link to latest release here]

## Building manually

Building manually ensures that the software uses all available optimizations for your particular hardware, while using the pre-built package uses generic optimizations that fit all modern 64 bits architectures. When built manually, the software will be slightly faster, although the speed-ups to expect are generally limited to 0-5 %, and may not be worth the trouble for people without compilation experience.

{{< note >}}
The OpenCL kernels for the modules supporting them are always built for your particular hardware and drivers, when you start the software, no matter if you use a manual build or a pre-packaged version.
{{</ note >}}
