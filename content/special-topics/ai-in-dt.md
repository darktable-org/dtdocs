---
title: AI in darktable
id: ai-in-dt
weight: 5
---

With Version 5.5 AI-powered features such as object masks, denoise and upscale were added to darktable. Whether AI features are available depends on how you installed darktable: The Windows, macOS and Linux AppImages available on [GitHub](https://github.com/darktable-org/darktable/releases) and [darktable.org](https://www.darktable.org/install/)) respectively have support for AI. 

For the binaries supplied by the various distributions (Debian, CentOS, Ubuntu, Fedora etc.) it remains the decision of the packagers whether AI support will be enabled or not. These require building with `-DUSE_AI=ON` (off by default), or `--enable-ai` when building with the build helper script `build.sh`.

In any case AI support has to be enabled and the models have do be downloaded and activated in the [preferences](../preferences-settings/ai.md). 

**CPU inference** is bundled and works out of the box - no additional software is needed (aside from [downloading the models](../preferences-settings/ai.md)). On macOS (Apple Silicon), CoreML acceleration and on Windows, DirectML GPU acceleration are also bundled by default. 

**GPU acceleration** significantly speeds up AI inference but requires installing a GPU-enabled build of ONNX Runtime separately, see [here](./special-topics/ai-gpu.md). 
