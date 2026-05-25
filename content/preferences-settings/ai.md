---
title: AI
id: ai
weight: 135
---

Control darktable's AI features: enable or disable them, choose a hardware accelerator for model inference, point darktable at an ONNX Runtime library, and manage the AI models available on disk.

AI features are powered by [ONNX Runtime](https://onnxruntime.ai/). darktable ships with a CPU-only ONNX Runtime on Linux, a DirectML-enabled build on Windows, and a CoreML-enabled build on macOS. To enable NVIDIA, AMD or Intel GPU acceleration on Linux or Windows, install a GPU-enabled ONNX Runtime using the install scripts described below.

For a deeper explanation of how AI features work – the inference runtime, execution providers, model layout, GPU acceleration, and troubleshooting – see the [AI features](../special-topics/ai/) special topic.

# general

enable AI features
: Master switch for all AI features. When disabled, no ONNX Runtime is loaded, no model directories are scanned, and AI-dependent modules hide themselves. Turn this off to eliminate AI-related memory and startup cost when you don't need it (default off).

AI acceleration
: The hardware accelerator used for model inference. The list is filtered to show only the providers the currently-loaded ONNX Runtime actually supports – installing a different ONNX Runtime updates the list.

: - _auto_ picks the best available provider for the loaded library, falling back to CPU if no accelerator initialises.
: - _CPU_ runs inference on the processor. Always available.
: - _NVIDIA CUDA_ uses NVIDIA GPUs via cuDNN (Linux, Windows; requires a CUDA-enabled ONNX Runtime).
: - _AMD MIGraphX_ uses AMD GPUs via ROCm (Linux only; requires a MIGraphX-enabled ONNX Runtime).
: - _Intel OpenVINO_ uses Intel GPUs and iGPUs via OpenVINO (Linux, Windows; requires an OpenVINO-enabled ONNX Runtime).
: - _Windows DirectML_ uses any DirectX 12 capable GPU (Windows; bundled by default).
: - _Apple CoreML_ uses the Apple Neural Engine and integrated GPU (macOS; bundled by default).

: Double-click the label to reset to the default. If the selected provider cannot be initialised with the currently-loaded ONNX Runtime (for example, if the library was built without that provider) a _not available, will fall back to CPU_ notice appears next to the combo box. After swapping the ONNX Runtime library, the notice becomes _restart to apply_ until darktable is restarted.

ONNX Runtime library
: Path to a shared library (`libonnxruntime.so*` on Linux, `onnxruntime.dll` on Windows) that darktable should load in place of the bundled one. Leave empty to use the bundled library (CPU-only on Linux, DirectML on Windows). Double-click the label to reset to empty. Changes take effect after restarting darktable. _Hidden on macOS_, where ONNX Runtime is statically linked with CoreML support.

: To the right of the path field are two buttons:

: - _browse_ (folder icon) – open a file chooser to pick a custom ONNX Runtime library. Selection is validated by loading the library and probing its version and available execution providers; if the file is not a valid ONNX Runtime build it is rejected and the previous path is restored.

: - _detect_ – scan standard system locations for an ONNX Runtime library (package-manager installs, `/usr/lib`, `/usr/local/lib`, `~/.local/lib`). If multiple candidates are found you will be asked to choose; if exactly one is found it is applied automatically. Useful when you have installed ONNX Runtime via your distribution's package manager or via the install script described below.

# installing a GPU ONNX Runtime

GPU acceleration on Linux and Windows (NVIDIA CUDA, AMD MIGraphX, Intel OpenVINO) requires a GPU-enabled ONNX Runtime build, which darktable does not ship in-app. Install scripts handle this end-to-end – detecting your GPU, downloading the matching runtime, verifying it, and installing under your user account.

See [GPU acceleration](../special-topics/ai/gpu-acceleration.md) for the full instructions: one-line installers for Linux and Windows, prerequisites, GPU and driver requirements, alternative manual installation, building AMD ONNX Runtime from source, and troubleshooting.

After installation, restart darktable, then use the _detect_ button above to point darktable at the newly-installed library (or pick the file manually with the browse button).

# models

The lower half of the tab lists AI models known to darktable – both already-downloaded ones and those available from the [darktable-ai](https://github.com/darktable-org/darktable-ai) model repository.

model list
: Each row has the following columns:

: - _select_ (leftmost checkbox) – include the model in bulk operations (_download selected_, _delete selected_). Independent of the enabled state. The header checkbox toggles all rows at once.
: - _name_ – model name.
: - info button (_i_ icon) – click to open the model card with full metadata: scope, author, source, paper, license, training data, data license, notes.
: - _version_ – model version string from the repository manifest.
: - _task_ – which task this model serves: _mask_, _denoise_, _rawdenoise_, _upscale_.
: - _enabled_ – marks the model as the active model for its task. Only one model can be active per task at a time: ticking it on a second model of the same task automatically un-ticks the previously active one, like a radio button. Un-ticking the active model leaves the task with no active model until another is picked. AI-dependent modules use whichever model is currently active for their task.
: - _status_ – _downloaded_, _not downloaded_, _update available_, or _update required_.
: - _default_ – _yes_ if the model is in the developer-recommended default set (selected by _download default_), _no_ otherwise.

download / update default
: Download or update the subset of models the darktable developers recommend as defaults for each task. Useful to get going quickly with a fresh install, and to pull in any newer versions of those models that the repository has published since.

download / update selected
: Download or update the models whose _select_ checkbox is ticked. Use this when you've ticked one or a few specific models in the list and only want to operate on those.

import from file…
: Install a model from a local `.dtmodel` archive. The file chooser is filtered to `*.dtmodel`; once imported, the model immediately becomes available. Use this for models you've been given by hand, models you've built yourself, or extra per-task alternatives from the [darktable-ai](https://github.com/darktable-org/darktable-ai) repository – the in-app list shows only one or two models per task, but the repository may publish additional alternatives for the same task (different denoise model trained on a different dataset, alternative segmentation backbone, etc.). Download the `.dtmodel` from the repository's GitHub releases and import it here.

delete selected
: Remove the models whose _select_ checkbox is ticked from disk. Models that were bundled with darktable cannot be deleted.

Downloads run in the background with a progress dialog and can be cancelled. Failed downloads are reported and the affected models remain in their previous state.
