---
title: how opencl works
id: how-opencl-works
weight: 20
draft: false
author: "people"
---

As you can imagine, hardware architectures of GPUs can vary significantly. There are different manufacturers, and even different generations of GPUs from the same manufacturer may differ. At the same time GPU manufacturers don't normally disclose all hardware details of their products to the public. One of the known consequences is the need to use proprietary drivers under Linux, if you want to take full advantage of your graphics card.

Fortunately an industry consortium lead by The Khronos Group has developed an open, standardized interface called OpenCL. It allows the use of your GPU as a numerical processing device. OpenCL offers a C99-like programming language with a strong focus on parallel computing. An application that wants to use OpenCL will need OpenCL source code that it hands over to a hardware specific OpenCL compiler at run-time. This way the application can use OpenCL on different GPU architectures (even at the same time). All hardware “secrets” are hidden in this compiler and are normally not visible to the user (or the application). The compiled OpenCL code is loaded onto your GPU and – with certain API calls – it is ready to do calculations for you. 
