---
title: Install OpenCL drivers
date: 2022-12-27
draft: false
weight: 40
---

OpenCL is a vendor-agnostic and cross-platform way of offloading computations to the GPU. GPUs are designed specifically to handle pixel operations, with an optimized memory layout and a massively multi-core architecture[^2] allowing for fast and energy-efficient image processing.

[^2]:  At least 720 cores for cheap GPUs, to almost 10.000 cores for the beasts

But OpenCL can only be used for background computational (offline rendering) tasks and cannot be used to render the GUI in real-time, which is the realm of OpenGL.

The architecture of Ansel and darktable pixel pipeline is flawed in that regard, because the output of (fast) OpenCL computations has to be sent back to the (slow) Gtk 3 thread, which paints the processed image within the GUI (along with the rest of GUI controls) using only a single CPU core. This is the biggest performance bottleneck in darktable and Ansel, and the reason why it is a rather slow application.

Nevertheless, OpenCL will bring a substantial speed-up to your image processing and exporting.

## Scope of OpenCL

OpenCL is used only by the [image processing modules](../modules/processing-modules/_index.md) that have an OpenCL kernel available as an alternative to the CPU (plain C) code. This is optional, and not all modules have an OpenCL kernel, depending on the skills, willingness and available hardware of the developer who programmed them. [^1]

[^1]: Plain C code can rarely be translated directly to OpenCL kernels and needs extra effort to adapt it to the different memory layout.

OpenCL kernels are compiled at runtime by [LLVM](https://llvm.org/), when the application is first executed, which may take some time and delay the startup. They are then cached in `~/.config/ansel`, and recomputed every time the OpenCL driver version changes (on upgrades and downgrades).

Apart from some (_most_) image processing modules, the rest of Ansel does not make use of the GPU at all, being through OpenCL or OpenGL.

## Requirements

OpenCL will be available when a GPU and its driver are detected and compatible with OpenCL 1.2 at least. A GPU with at least 2 GB of memory is recommended. LLVM v4 to v15 is needed to build the kernels at runtime (it is included in the official packages – _the drivers are not_).

## Expected benefits

It is impossible to say how much faster a particular GPU will make image rendering, compared to a particular CPU, without actually benchmarking them, especially because image processing is more bound by the speed of I/Os (transfers between hardware memories) than by the raw clock speed of the computing chip (the infamous GHz × number of cores).

It has been found that crazy-expensive CPUs still perform better than cheap GPUs. However, at similar performance, GPUs will typically drain less electric power and produce less heat than CPUs, which will also prevent [thermal throttling](https://pcguide101.com/cpu/what-is-cpu-throttling/) to some extent.

The overall performance of OpenCL depends on :
- the GPU raw performance,
- how well the driver uses the GPU (beware the power-saving modes),
- how well the OS integrates the driver (noticeably, support in the Linux Kernel),
- how many applications use the GPU simultaneously,
- how cleverly the LLVM compiler was able to optimize the OpenCL kernels for your hardware and driver,
- how well your computer cooling system is able to maintain the casing at a low-enough temperature,
- how fast your motherboard bus is able to copy pixels from the RAM to the GPU memory, and the other way around.

Anyone pretending to guess the overall performance by just looking at a GPU specifications sheet is a fraud.

## Vendors

### Intel

Ansel can use the Intel GPU embedded on the CPU chip, provided you use recent [Intel Graphics Compute Runtime drivers](https://www.intel.com/content/www/us/en/developer/articles/tool/opencl-drivers.html) (dubbed [_Intel Neo_](https://github.com/intel/compute-runtime)). These seem to work fairly on Linux and Windows at least.

The previous generation of Intel OpenCL drivers, dubbed _Intel Beignet_, has never worked reliably. Fortunately, it has gradually disappeared from repositories and distributions since 2018.

Using the embedded GPU will be typically slightly faster than using the CPU. If getting the Intel Graphics Compute Runtime on your system is not too much of a hassle, the boost is definitely worth it.

### Optimus

[Optimus](https://en.wikipedia.org/wiki/Nvidia_Optimus) is an Intel + Nvidia hardware setting used on laptops since 2011, which consists in a low-power/low-performance Intel embedded GPU (_eGPU_) used for lightweight tasks, coupled with a discrete high-performance/power-hungry Nvidia GPU (_dGPU_) for games and rendering, but turned on only on demand.

On Linux, this technology has been properly supported only since circa 2020 (_though HDMI still does not work on eGPU for most laptops if the HDMI port is soldered on the dGPU_), but only for the mainstream distributions, and Gnome even allows to start applications explicitly on the eGPU or the dGPU without having to use command line or restart the graphical session.

However, "starting an application on dGPU" only means that the GUI rendering (aka OpenGL) is piped to the dGPU. Since Ansel renders all the GUI on CPU and doesn't use OpenGL at all, it doesn't need to be explicitly started on dGPU. OpenCL will be able to work in background on all detected GPUs no matter which one renders the GUI.

Ansel is able to use both the eGPU and the dGPU at the same time to render image pipelines concurrently.

### AMD

Only the proprietary [amdgpu-pro driver](https://amdgpu-install.readthedocs.io/en/latest/install-installing.html) supports OpenCL.

On Linux, AMD has been known for several years to be very slow to update their drivers when distributions are updated. Don't upgrade your distribution before you know AMD has working drivers for it, and stick to LTS versions if using Ubuntu.

### Nvidia

Only the proprietary driver supports OpenCL.

On Linux, Nvidia OpenCL depends on the CUDA libraries. There are known issues of kernel panic or system crash when the computer goes in hibernate or suspend mode, because the allocated memory buffers are not preserved. If that happens to you, Linux distributions typically have packages called `nvidia-modprobe`, `nvidia-persistenced` and `nvidia-power(save)d` which should take care or that (or worsen it). In any case, avoid letting your computer go in suspend or hibernate mode while any application using OpenCL is running, and save any work in progress before.

## Caveats

OpenCL and graphics drivers have the worst track-records and are known to break every next upgrade, mostly because vendors consider them low-priority, compared to their proprietary equivalent (CUDA for Nvidia, Metal for Apple) or the more recent Vulkan.

### Stay on the production/LTS branches

If you have an AMD card, you may have no choice : the latest driver will generally be the only one working on your system.

For Nvidia and Intel cards, there are production branches that ship the yesteryear driver version. It may not support the brand new hardware nor the latest cool upgrades, but will generally show improved stability and fewer bad surprises.

Keep away from the hot new drivers for as long as you can. Linux distributions typically ship a couple of legacy drivers alongside the most recent.

### Memory use

All applications using the GPU, through CUDA, Vulkan, Metal, OpenCL and OpenGL will share the GPU memory, which is typically much smaller than the system RAM. The GPU memory allocation is not as predictable as the RAM allocation, and is mostly vendor/driver-dependent.

That is to say that running concurrently several applications all using the GPU may result in crashes if they temporarily try to use more memory than available. Try to avoid playing 4K videos in your web browser, playing games or running GPU-accelerated video encoders (Nvenc, VDPAU, etc.) when Ansel is processing 36-52 Mpx pictures.
