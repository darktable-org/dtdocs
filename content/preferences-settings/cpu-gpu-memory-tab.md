---
title: Preferences - cpu/gpu/memory tab
date: 2020-09-09
draft: false
---

This preference tab contains mostly performance-related settings:

memory in megabytes to use for thumbnail cache
: In order to speed-up display of film rolls, darktable stores thumbnails in a cache file on disk (primary cache) and loads it into memory at startup. This setting controls the cache size in megabytes. It needs a restart if changed (default 256MB).

enable disk backend for thumbnail cache
: If activated, darktable stores all thumbnails on disk as a secondary cache, and thereby keeps thumbnails accessible if they get dropped from the primary cache. This needs more disk space but speeds up the _lighttable_ view as it avoids reprocessing of thumbnails (default on).

enable disk backend for full preview cache
: If enabled, darktable writes full preview images to disk (`.cache/darktable/`) when evicted from the memory cache. Note that this can take a lot of memory (several gigabytes for 20k images) and darktable will never delete cached images. It's safe to delete these manually if you want. _Lighttable_ performance will be increased greatly when zooming an image in full preview mode (default off).

number of background threads
: This controls how many parallel threads are used to create thumbnails during import. On 32bit systems it is strongly recommended to set this to 1. Needs a restart if changed (default 2).

host memory limit (in MB) for tiling
: In order to manage large images on systems with limited memory darktable does tile-wise processing. This variable controls the maximum amount of memory (in MB) a module may use during image processing. Lower values will force memory hungry modules to process an image with increasing number of tiles. Setting this to 0 will omit any limits. Values below 500 will be treated as 500. On a 32bit system you should set this to 500. Needs a restart if changed (default 1500).

minimum amount of memory (in MB) for a single buffer in tiling
: If set to a positive, non-zero value, this variable defines the minimum amount of memory (in MB) that darktable should take for a single tile. On a 32bit system you should set this to 8. 64bit systems can cope with higher values. Needs a restart if changed (default 16).

activate OpenCL support
: _darktable_ can use your GPU to significantly speed up processing. The OpenCL interface requires suitable hardware and matching OpenCL drivers on your system. If one of those is not found the option is greyed out. Can be switched on and off at any time and takes immediate effect (default on).

OpenCL scheduling profile
: Defines how preview and full pixelpipe tasks are scheduled on OpenCL enabled systems: 
: **default**: the GPU processes the center view pixelpipe; the CPU processes the preview pipe; 
: **multiple GPUs**: both pixelpipes are processed in parallel on two different GPUs; 
: **very fast GPU**: both pixelpipes are processed sequentially on the GPU. 