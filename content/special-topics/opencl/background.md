---
title: the background
id: background
weight: 10
draft: false
author: "people"
---

Processing high resolution images is a demanding task needing a modern computer. Both in terms of memory requirements and CPU power, getting the best out of a typical 15, 20 or 25 Megapixel image can quickly take your computer to its limits.

darktable's requirements are no exception. All calculations are performed on 4 x 32bit floating point numbers. This is slower than “ordinary” 8 or 16 bit integer algebra, but eliminates all problems of tonal breaks or loss of information.

A great deal of optimization has been undertaken to make darktable as fast as possible. If you run a current version of darktable on a modern computer, you might not notice any “slowness”. However, there are conditions and certain modules where you will feel (or hear from the howling of your CPU fan) how much your poor multi-core processor has to struggle.

That's where OpenCL comes in. OpenCL allows darktable to take advantage of the enormous power of modern graphics cards. Gamer's demand for highly detailed 3D worlds in modern shooters has fostered GPU development. ATI, NVIDIA and Co had to put enormous processing power into their GPUs to meet these demands. The result is modern graphics cards with highly parallelized GPUs that can quickly calculate surfaces and textures at high frame rates.

You are not a gamer and you don't take advantage of that power? Well, then you should at least use it in darktable! For the task of highly parallel floating point calculations modern GPUs are much faster than CPUs. This is especially true when you want to repeat the same few processing steps millions of items. Typical use case: processing of high megapixel images.
