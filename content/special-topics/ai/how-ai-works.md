---
title: how AI features work
id: how-ai-works
weight: 20
---

This page covers what goes on under the hood: the inference library darktable loads, the execution providers available to it, and how models are stored and activated.

# the inference runtime

darktable loads models through [ONNX Runtime](https://onnxruntime.ai/) – a production-grade inference library originally developed at Microsoft and now governed by the [Linux Foundation](https://www.linuxfoundation.org/) – that accepts models in the [ONNX](https://onnx.ai/) open format. ONNX is the de-facto standard for interchanging machine-learning models across frameworks (PyTorch, TensorFlow, etc.) so we can take a model trained in any of them, export it to ONNX, and run it from darktable without carrying its training framework along.

Only one ONNX Runtime library is loaded per darktable process. It is picked in this order:

1. If the _ONNX Runtime library_ field in [AI preferences](../../../preferences-settings/ai.md) points at a file (or the `DT_ORT_LIBRARY` environment variable does), that library is loaded instead.
2. Otherwise, the bundled runtime that ships with darktable is loaded from the installation directory.

The bundled runtime is CPU-only on Linux, DirectML-enabled on Windows, and CoreML-enabled on macOS. That makes every install functional out of the box. If you want NVIDIA, AMD or Intel GPU acceleration on Linux or Windows, you replace the library with a GPU-enabled build – see [GPU acceleration](./gpu-acceleration/).

# execution providers

An _execution provider_ (EP) is an ONNX Runtime back-end for a specific hardware accelerator – darktable's _AI acceleration_ preference is this concept. A single ONNX Runtime library can ship with multiple providers; which ones actually work depends on which are compiled into the library and which are available on your system. The preference combo lists only those the currently-loaded library supports:

- **auto** – let ONNX Runtime pick the best provider at inference time, with CPU as the ultimate fallback. Recommended unless you have a reason to override.
- **CPU** – always available. Fine for object-mask and occasional denoise/upscale. Slow for interactive work and for upscale at 4x.
- **NVIDIA CUDA** – NVIDIA GPUs on Linux/Windows. Requires a CUDA-enabled ONNX Runtime and the matching CUDA toolkit + cuDNN 9.x on your system.
- **AMD MIGraphX** – AMD GPUs on Linux. Requires a MIGraphX-enabled ONNX Runtime and a ROCm 6.3+ install. Not supported on Windows.
- **Intel OpenVINO** – Intel integrated and discrete GPUs on Linux/Windows. The OpenVINO runtime is bundled with the installed package – no separate install needed beyond an up-to-date Intel GPU driver.
- **Windows DirectML** – any DirectX-12-capable GPU on Windows. Good fallback when a vendor-specific provider is impractical. Bundled.
- **Apple CoreML** – Apple Silicon (Neural Engine and GPU) and recent Intel Macs. Bundled.

The first time a GPU provider runs a given model, it compiles an optimised version of the model graph for your specific hardware. How long this takes varies a lot by provider: CUDA and DirectML are typically a few seconds; AMD MIGraphX can take **5 to 30 minutes** on the first run of each model, depending on the GPU and the model size. Subsequent uses reuse the compiled graph and run at full speed.

# models

Each AI feature is backed by one or more models per [task](./overview/#tasks). A model is a directory containing an ONNX file and a small `config.json` with metadata (name, task, description, licensing information). Models live under:

- Linux: `~/.local/share/darktable/models/`
- macOS: `~/Library/Application Support/darktable/models/`
- Windows: `%APPDATA%\darktable\models\`

darktable scans this directory at startup (and whenever you change models in preferences) to discover what is available. Multiple models can be installed for the same task – for denoise, for example, you might have both the NIND-trained and NAFNet-trained options on disk at once. Only one can be _active_ per task at any time; ticking the enabled checkbox on a second model of the same task automatically un-ticks the previously active one. Modules that consume that task load the model currently marked active.

Models are not bundled with darktable. They are distributed as `.dtmodel` packages from the [darktable-ai](https://github.com/darktable-org/darktable-ai/releases) companion repository. The [AI preferences](../../../preferences-settings/ai.md) tab includes buttons to download the default set directly; for additional per-task models (alternative denoisers, segmentation backbones, etc.), download the `.dtmodel` from the repository's releases page and install it via the _install model_ button in the same tab.
