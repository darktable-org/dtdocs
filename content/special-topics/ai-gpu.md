---
title: AI - enabling GPU acceleration
id: ai-gpu
weight: 6
---

# Overview

GPU acceleration significantly speeds up AI inference but depending on your OS requires installing a GPU-enabled build of [ONNX Runtime](https://onnxruntime.ai/) separately (see below). 

Note that AI features have to have been [included upon compilation](../special-topics/ai-in-dt.md). 

darktable ships with a CPU-only ONNX Runtime that works out of the box – no extra install needed. On macOS (Apple Silicon), CoreML GPU-acceleration is also bundled by default. On Windows, DirectML GPU acceleration is bundled and works with any DirectX 12 GPU.

Linux users who want GPU acceleration currently need to manually download the right ONNX Runtime build and point darktable to it via preferences. 

To enable GPU acceleration for AI features (denoise, upscale, segmentation), install a GPU-enabled ONNX Runtime build using one of the install scripts in this directory.

macOS users don't need to install anything – CoreML acceleration is bundled with darktable.

## What's bundled by default

| Platform | Bundled ONNX Runtime | GPU support |
|----------|------------|-------------|
| Linux | CPU only | None – install GPU ONNX Runtime below |
| Windows | DirectML | AMD, NVIDIA, Intel via DirectX 12 |
| macOS | CoreML | Apple Neural Engine |

## System requirements and options

* **NVIDIA (CUDA):** Linux and Windows.
  * Supported NVIDIA GPU with up-to-date drivers (Maxwell or newer)
  * [CUDA Toolkit 12](https://developer.nvidia.com/cuda-12-0-0-download-archive) or [CUDA Toolkit 13](https://developer.nvidia.com/cuda-13-0-0-download-archive)
  * [cuDNN 9.x](https://developer.nvidia.com/cudnn-downloads)
* **AMD (ROCm):** Linux only.
  * Supported AMD GPU with up-to-date drivers (RDNA2/CDNA or newer), see [compatibility matrix](https://rocm.docs.amd.com/en/latest/compatibility/compatibility-matrix.html)
  * [ROCm 6+](https://rocm.docs.amd.com/projects/install-on-linux/en/latest/) 
  * [MIGraphX](https://rocm.docs.amd.com/projects/AMDMIGraphX/en/latest/install/install-migraphx.html) (may require separate install, e.g. `apt install migraphx migraphx-dev` on Ubuntu)
* **Intel (OpenVINO):** Linux and Windows.
  * Supported Intel GPU with up-to-date drivers (integrated Gen9+, discrete Arc, or NPU Meteor Lake+)
  * [Intel OpenCL](https://www.intel.com/content/www/us/en/developer/articles/tool/opencl-drivers.html) or/and [Level Zero runtime](https://www.intel.com/content/www/us/en/docs/dpcpp-cpp-compiler/developer-guide-reference/2025-2/intel-oneapi-level-zero.html) (included with drivers on Windows; on Linux may need `intel-opencl-icd` or `level-zero`)
  * On Windows, requires [OpenVINO Toolkit](https://docs.openvino.ai/2026/get-started/install-openvino/install-openvino-windows.html) installation
* **Windows (DirectML):** bundled, works with any DirectX 12 compatible GPU (NVIDIA, AMD, Intel).
  No extra install needed.
  * Windows 10 1903+ (DirectML is a system component)
* **macOS (CoreML):** bundled, uses Apple Neural Engine automatically.
  No extra install needed.
  * macOS 11+ (Big Sur)
  * Apple Silicon (M1+)

**GPU memory:** 4 GB VRAM minimum. Models ship with fixed input
dimensions sized to fit this budget; if GPU inference fails (out of
memory, unsupported op), darktable automatically falls back to CPU.
**GPU memory:** 4 GB VRAM minimum. If GPU inference fails (out of
memory, unsupported op, EP crash), darktable automatically retries
on CPU and continues.

## Installing the ONNX Runtime

To enable GPU acceleration if not bundled by default, run one of the install scripts:

Linux:
```bash
# Linux
curl -fsSL https://raw.githubusercontent.com/darktable-org/darktable/refs/heads/master/tools/ai/install-ort-gpu.sh | bash
```
The Runtime will be installed to `~.local/lib/onnxruntime-cuda/`.

Windows (PowerShell):
```powershell
# Windows (PowerShell)
irm https://raw.githubusercontent.com/darktable-org/darktable/refs/heads/master/tools/ai/install-ort-gpu.ps1 | iex
```

The Runtime will be installed to `C:\Users\<YourUsername>\AppData\Local\darktable\ort`

Then point darktable at the installed library via the **AI** tab in preferences
(click **detect**). See [tools/ai/README.md](tools/ai/README.md) for flags,
prerequisites, manual install, and troubleshooting. Verify the active provider
with `darktable -d ai`.

### Script prerequisites

**Linux** – `bash`, `curl`, `jq`.

**Windows** – PowerShell 5.1+.

### GPU / driver requirements

**NVIDIA (CUDA)** – Pascal-or-newer GPU (compute 6.0+), driver 525+,
CUDA Toolkit 12.x or 13.x, cuDNN 9.x.

**AMD (MIGraphX)** – ROCm-supported GPU (Radeon RX 7700+ / Instinct
MI100+), ROCm 6.x+ with MIGraphX.

**Intel (OpenVINO)** – Intel iGPU (HD/UHD/Iris Xe) or Arc discrete,
GPU driver with OpenCL (`intel-opencl-icd`) and/or Level Zero. The
OpenVINO runtime ships in the package.

### AMD: building from source

If the prebuilt package doesn't work (ABI mismatch, unsupported ROCm
version), build ONNX Runtime against your installed ROCm:

```bash
./tools/ai/install-ort-amd-build.sh
```

Requires cmake 3.26+, gcc/g++, python3, git. Takes 10–20 minutes.

## Enabling the custom ONNX Runtime in darktable

After running the script or built-in installer:

1. Open darktable preferences (Ctrl+,)
2. Go to the **AI** tab
3. Click **detect**, or use the browse button to select the library
   manually
4. Restart darktable

Or set `DT_ORT_LIBRARY` in the environment:

Linux:
```bash
DT_ORT_LIBRARY=~/.local/lib/onnxruntime-cuda/libonnxruntime.so.1.24.4 darktable
```

Windows (PowerShell):
```powershell
$env:DT_ORT_LIBRARY="$env:LOCALAPPDATA\onnxruntime-cuda\onnxruntime.dll"; darktable
```

If neither preference nor env var is set, darktable uses the bundled
ONNX Runtime (CPU on Linux, DirectML on Windows, CoreML on macOS).

## Verifying

```bash
darktable -d ai
```

Look for:
```
[darktable_ai] loaded ORT 1.24.4 from '/home/user/.local/lib/onnxruntime-cuda/libonnxruntime.so.1.24.4'
[darktable_ai] execution provider: CUDA
[darktable_ai] NVIDIA CUDA enabled successfully on device 0: NVIDIA GeForce RTX 4090
```

## Maintaining the GPU package registry

`data/ort_gpu.json` lists the upstream ONNX Runtime URLs the install scripts and
preferences UI pull from. It needs to be refreshed whenever Microsoft
ships a new ONNX Runtime release or AMD ships a new ROCm patch. Use the
script in this directory:

```bash
# show what would change (no writes); exits non-zero if updates exist
python3 tools/ai/refresh-ort-gpu.py --check

# apply the updates in place
python3 tools/ai/refresh-ort-gpu.py --update

# apply and open a PR via gh CLI (CI mode; needs GITHUB_TOKEN)
python3 tools/ai/refresh-ort-gpu.py --update --pr

# verbose progress (otherwise quiet by default in --update mode)
python3 tools/ai/refresh-ort-gpu.py --check -v
```

What it does:

- Queries `api.github.com/repos/microsoft/onnxruntime/releases` for the
  latest non-prerelease that has all four expected GPU assets
  (linux/windows × CUDA 12/13). Updates the four NVIDIA entries.
- Scrapes `https://repo.radeon.com/rocm/manylinux/`, finds the cp312
  ONNX Runtime wheel in each `rocm-rel-X.Y.Z/` directory, and keeps the
  latest patch per ROCm minor. Updates the AMD entries with
  range-based matching (`rocm_min: "7.2"`, `rocm_max: "7.3"` covers
  every 7.2.x patch).
- Computes SHA256 only for wheels whose URL changed since the last
  refresh – a no-op run does no downloads.
- Preserves vendors it doesn't manage (e.g. Intel/OpenVINO) and any
  manual fields (`required_libs`, `lib_pattern`, `install_subdir`).

Stdlib only – no extra Python deps. Network access required.

A monthly CI job (`.github/workflows/refresh-ort-gpu.yml`) runs the
script in `--update --pr` mode on the 1st of each month and opens a
PR if anything upstream moved. Maintainer reviews and merges; nothing
is auto-merged.

