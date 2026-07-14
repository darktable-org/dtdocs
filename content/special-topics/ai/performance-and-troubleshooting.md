---
title: performance & troubleshooting
id: ai-performance-troubleshooting
weight: 40
---

# performance notes

- CPU inference is acceptable for object masks (small one-shot evaluations) but much slower for denoise and upscale. A CUDA / MIGraphX / OpenVINO / DirectML / CoreML runtime is strongly recommended if you use those regularly.
- Upscale at 4x on a large image is memory-hungry regardless of provider. Tiling is enabled automatically to keep memory in check, at a cost of some extra processing time.
- Loading ONNX Runtime lazily on first use means the very first AI operation after startup takes an extra moment. This is normal.
- When switching between execution providers (e.g. auto → CUDA), the new provider's first inference incurs a graph-compilation delay. After that, runtime is steady for the rest of the session.
- **AMD (MIGraphX) has a multi-minute first-run cost per model.** ROCm/MIGraphX compiles the model graph for your specific GPU the first time it sees it, which can take 1–3 minutes for large models (denoise, upscale); mask models are smaller and compile faster. The compiled graph is cached on disk under `~/.cache/darktable/ai_v*_migraphx_*` and reused across darktable restarts, so subsequent runs of the same model are fast.
- Model discovery is cached at startup. If you drop a new `.dtmodel` file into the models directory manually while darktable is running, open AI preferences and toggle any control to force a rescan.

# troubleshooting

Most AI problems fall into one of three buckets.

## the feature doesn't appear at all

Check that AI features are enabled in [AI preferences](../../../preferences-settings/ai.md) – the master toggle is off by default.

If the AI tab itself is missing from preferences, darktable was built without AI support. The official darktable builds (Linux AppImage, Windows installer, macOS dmg) all include it, but third-party packagers may ship a build without it. Ask your distribution's package maintainer to enable AI support, or switch to an official build.

If enabled and the feature is still missing, the required model may not be installed or active. Open AI preferences and confirm a model is ticked in the _enabled_ column for the relevant task. Only one model per task can be active at a time.

## inference fails or falls back to CPU unexpectedly

Run darktable from a terminal with `darktable -d ai` to see ONNX Runtime load messages and provider probe results. Typical causes:

- **`ort_library_path` points at a missing or corrupt file.** Reset the path in preferences (double-click the label) to fall back to the bundled runtime, or re-run _detect_ after re-installing via the [GPU install scripts](./gpu-acceleration/).
- **The selected execution provider is missing a system dependency.** cuDNN for CUDA; MIGraphX and rocm-smi-lib for AMD; matching ROCm SONAMEs on Fedora-style distros that rebuild ROCm with their own sonames. The install scripts flag these before download; the `darktable -d ai` log will show the exact `dlopen` error at runtime.
- **The provider was initialised but failed to compile the model graph.** This sometimes happens on first-generation GPUs with outdated drivers. Update your driver, or fall back to a different provider (e.g. DirectML instead of CUDA on Windows).

## results look off

AI denoise and upscale are restoration tasks – the model is inferring plausible output from a training prior. Slight color or contrast shifts are possible, especially for images outside the training distribution (extreme ISO, synthetic captures, very wide-gamut scenes).

If fidelity matters more than aggressive cleanup, in e.g. denoising an image, stick with the classical [denoise (profiled)](../../../module-reference/processing-modules/denoise-profiled.md) module.

# further reading

- [AI preferences](../../../preferences-settings/ai.md) – every control on the AI preferences tab.
- [GPU acceleration](./gpu-acceleration/) – installing a GPU-capable ONNX Runtime (scripts, manual, per-vendor recipes).
- [darktable-ai](https://github.com/darktable-org/darktable-ai) – the model repository, conversion scripts, and development notes.
- [ONNX Runtime docs](https://onnxruntime.ai/docs/) – upstream reference for execution providers, troubleshooting, and performance tuning.
