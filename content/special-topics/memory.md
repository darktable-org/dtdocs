---
title: memory
id: memory
weight: 20
draft: false
author: "people"
---

darktable's memory requirements are high. A simple calculation makes this clear. If you have a 20MPx image then, for precision reasons, darktable will store this internally as a 4 x 32-bit floating point cell for each pixel. Each full image of this size will therefore need about 300MB of memory. As we want to process the image, we will at least need two buffers for each module  – one for input and one for output. If we have a more complex module, its algorithm might additionally require several intermediate buffers of the same size. Without further optimization, anything between 600MB and 3GB would be needed merely to store and process image data. On top of that we have darktable's code segment, the code and data of all dynamically linked system libraries, and not to forget, further buffers where darktable stores intermediate images for quick access during interactive work (mip map cache). 

All in all, darktable needs a minimum of about 4GB of memory to run happily.

# total system memory

From the above analysis, it is evident that your computer needs a sane memory setup to properly run darktable. We suggest that you have a least 4GB of physical RAM plus 4 to 8GB of additional swap space installed. 

Theoretically, you could run darktable with lower amounts of physical RAM and balance this with enough swap space. However, you this could cause your system to “thrash”, as it reads or writes data pages to and from the hard disk. We have positive reports that this functions well for several users, but it still might get extremely slow for others. A solid-state drive can ease the pain slightly.

# available address space

Besides the total amount of system memory there is another limiting factor: the available address space of your hardware architecture. How much memory can be addressed by a process depends on the number of address bits your CPU offers. For a CPU with 32-bit address registers, this is 2^32 bytes, which makes a total of 4GB. This is the absolute upper limit of memory that can be used by a process and it constitutes a tight situation for darktable as we have seen above.

darktable's escape route is called tiling. Instead of processing an image in one big chunk, darktable splits the image into smaller parts for every processing module. This still requires one full input and output buffer, but intermediate buffers can be made small enough to fit everything into the hardware's limits.

# memory fragmentation

Unfortunately this is not yet the full story. An effect called memory fragmentation can and will hit software that needs to perform extensive memory management. If such a program allocates 5 times 300MB at a time and frees it again, that memory should normally be available for one big 1.5GB allocation afterwards. However this is often not the case. The system's memory allocator may no longer see this area as one contiguous 1.5GB block but as a row of separate 300MB areas. If there is no other free area of 1.5GB available, a subsequent allocation would fail. During a program run this mechanism will take away more and more of the larger memory blocks in favor of smaller ones. darktable's mip map cache allocates several small memory blocks per thumbnail, so this problem is even bigger. For this reason, as of darktable 2.0, 32-bit support is soft-deprecated.

# further limitations

As if this were not challenging enough, there are further things that might limit darktable's access to memory. On some older boards you need to activate the "memory mapping" BIOS option in order to have all physically installed memory enabled. In addition if you are on a 32-bit OS you will probably need a kernel version that has “Physical Address Extension” (PAE) enabled. This is often but not always the case for Linux. Many distributions deliver different kernels, some with and some without PAE activated; you need to choose the right one. To check if the system is setup correctly, use the command “free” in a terminal and examine the output. If the output reports less RAM than you have installed, you have an issue needing correction; for example you have 4GB on your board, but your kernel is only seeing 3GB or less. You should consult your BIOS manual and the information about your Linux variant for further help.

# setting up darktable on 32-bit systems

As we've seen, 32-bit systems are difficult environments for darktable. Still some users are running darktable on them, if the basic requirements in terms of total system memory and the topics mentioned in the paragraphs above are addressed properly.

There are several parameters that require adjustment in order to get it running. If you install fresh, darktable will detect your system and set conservative values by default. However, if you upgrade darktable from an older version, chances are you have unfavorable settings in your preferences. The consequences might be darktable aborting due to allocation failures or – very typically – darktable not being able to properly import a new film roll. As a frequent symptom you get skulls displayed instead of thumbnails for many of your pictures.

If this is the case, take a minute to optimize your preference settings. You will find them in [`preferences` -> `cpu/gpu/memory`](../preferences-settings/cpu-gpu-memory.md). 

Here is a short explanation of the relevant parameters and their proposed settings:

number of background threads
: This parameter defines the maximum number of threads that are allowed to run in parallel when importing film rolls or doing other background stuff. For obvious reasons on 32-bit systems you can only have one thread consuming resources at a time. So you need set this parameter to 1; anything higher will kill you.

host memory limit (in MB) for tiling
: This parameter tells darktable how much memory (in MB) it should assume is available to store image buffers during module operations. If an image can not be processed within these limits in one chunk, tiling will take over and process the image in several parts, one after the other. Set this to the lowest possible value of 500 as a starting point. You might experiment later whether you can increase it a bit in order to reduce the overhead of tiling.

minimum amount of memory (in MB) for a single buffer in tiling
: This is a second parameter that controls tiling. It sets a lower limit for the size of intermediate image buffers in megabytes. The parameter is needed to avoid excessive tiling in some cases (for some modules). Set this parameter to a low value of 8. You might tentatively increase it to 16 later.

memory in megabytes to use for thumbnail cache
: This controls how many thumbnails (or mip maps) can be stored in memory at a time. As a starting point set this to something like 256MB. Since darktable 2.0, the cache does allocate a few small buffers per thumbnail in cache, thus causing significant memory fragmentation. As explained before, this poses a problem for 32-bit systems. For this reason, as of darktable 2.0, 32-bit support is soft-deprecated.

# darktable on 64-bit systems

There's not much to be said here. Of course 64-bit systems also require a sufficient amount of main memory, so the 4GB plus swap recommendation holds true. On the other hand, 64-bit architectures do not suffer from the specific 32-bit limitations like small address space and fragmentation madness.

Most modern Intel or AMD 64-bit CPUs will have available address space in the range of several Terabytes. The word “modern” is relative in this context: all AMD and Intel CPUs introduced since 2003 and 2004, respectively, offer a 64-bit mode. Linux 64-bit has been available for many years.

All relevant Linux distributions give you the choice to install a 32-bit or a 64-bit version with no added cost. You can even run old 32-bit binaries on a 64-bit Linux. The only thing you need to do is invest some time into the migration. In the end we strongly recommend moving to a 64-bit version of Linux. There really is no reason not to.

On a 64-bit system you can safely leave the tiling related configuration parameters at their defaults: “host memory limit (in MB) for tiling” should have a value of 1500 and “minimum amount of memory (in MB) for a single buffer in tiling” should be set to 16. If you are migrating from a 32-bit to a 64-bit system you will need to check these settings and manually change them if needed in darktable's preference dialog.

Typically there is no need to restrict oneself in the number of background threads on a 64-bit system. On a multi-processor system a number of two to eight threads can speed up thumbnail generation considerably versus only one thread. The reason is not so much taking maximum advantage of all your CPU cores – darktable's pixelpipe uses all of them in parallel anyway – but hiding I/O latency.

One exception is worth mentioning. If you use darktable to process stitched panoramas (e.g. TIFFs as generated by Hugin) these images can reach considerable sizes. Each background thread needs to allocate enough memory to keep one full image plus intermediates and output in its buffers. This may quickly cause even a well equipped 64-bit system to run out of memory. In that case lower the number of background threads to only one.

