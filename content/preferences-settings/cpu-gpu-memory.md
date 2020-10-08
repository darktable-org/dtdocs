---
title: cpu/gpu/memory
id: cpu-gpu-memory
weight: 90
draft: false
---

This preference tab contains mostly performance-related settings:

memory in megabytes to use for thumbnail cache
: In order to speed-up the display of film rolls, darktable stores image thumbnails in a cache file on disk (primary cache) and loads it into memory at startup. This setting controls the size of the cache in megabytes. It needs a restart if changed (default 256MB).

enable disk backend for thumbnail cache
: If activated, darktable stores all thumbnails on disk as a secondary cache, and thereby keeps thumbnails accessible if they get dropped from the primary cache. This needs more disk space but speeds up the [lighttable](../lighttable/_index.md) view as it avoids reprocessing of thumbnails (default on).

enable disk backend for full preview cache
: If enabled, darktable writes full preview images to disk (`.cache/darktable/`) when evicted from the memory cache. Note that this can take a lot of storage (several gigabytes for 20k images) and darktable will never delete cached images. It's safe to delete these manually if you want. Enabling this option will greatly improve lighttable performance when zooming an image in full preview mode (default off).

number of background threads
: This controls how many parallel threads are used to create thumbnails during import. Needs a restart if changed (default 2).

host memory limit (in MB) for tiling
: In order to manage large images on systems with limited memory darktable does tile-wise processing. This variable controls the maximum amount of memory (in MB) a module may use during image processing. Lower values will force memory-hungry modules to process an image with increasing number of tiles. Setting this to 0 will omit any limits. Values below 500 will be treated as 500. Needs a restart if changed (default 1500).

minimum amount of memory (in MB) for a single buffer in tiling
: If set to a positive, non-zero value, this variable defines the minimum amount of memory (in MB) that darktable should take for a single tile. Needs a restart if changed (default 16).

activate [OpenCL](../special-topics/opencl/_index.md) support
: _darktable_ can use your GPU to significantly speed up processing. The OpenCL interface requires suitable hardware and matching OpenCL drivers on your system. If one of those is not found the option is greyed out. Can be switched on and off at any time and takes immediate effect (default on).

OpenCL scheduling profile
: Defines how preview and full pixelpipe tasks are scheduled on OpenCL enabled systems: 
: - _default_: the GPU processes the center view pixelpipe; the CPU processes the preview pipe; 
: - _multiple GPUs_: both pixelpipes are processed in parallel on two different GPUs; 
: - _very fast GPU_: both pixelpipes are processed sequentially on the GPU. 
