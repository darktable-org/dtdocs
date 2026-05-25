---
title: GPU acceleration
id: gpu-acceleration
weight: 30
---

Enabling GPU acceleration for darktable's AI features is a two-step process:

1. **Install a GPU-capable ONNX Runtime** for your hardware (this page).
2. **Point darktable at the new library** via [AI preferences](../../../preferences-settings/ai.md) – click **detect** to auto-scan standard install locations, or browse to the file by hand.

The runtime bundled with darktable is CPU-only on Linux, DirectML-enabled on Windows, and CoreML-enabled on macOS, so step 1 only applies if you want NVIDIA, AMD, or Intel GPU acceleration on Linux or Windows. Step 1 has three paths, covered below.

# requirements

The bundled providers on Windows (DirectML, any DirectX 12 GPU) and macOS (CoreML, Apple Silicon or recent Intel Mac) have no extra requirements. The Linux/Windows GPU providers below need supported hardware and a few system libraries already in place.

**NVIDIA (CUDA)**
: Pascal-or-newer GPU (compute capability 6.0+). [NVIDIA driver](https://www.nvidia.com/Download/index.aspx) 525 or later. Plus **one of** [CUDA Toolkit 12.x](https://developer.nvidia.com/cuda-12-9-0-download-archive) or [CUDA Toolkit 13.x](https://developer.nvidia.com/cuda-downloads) and [cuDNN](https://developer.nvidia.com/cudnn-downloads) 9.x installed on the system. The two CUDA branches have separate ONNX Runtime builds and you need the one that matches the toolkit version installed on your machine.

: To check what CUDA toolkit you have:

: - run `nvcc --version` in a terminal – the `release` line tells you the installed toolkit (e.g. `release 12.6` means CUDA 12 is installed).
: - `nvidia-smi` reports a `CUDA Version:` field at the top, but that is the **maximum** version the driver is capable of running, not what's installed. A machine with driver 580+ might show `CUDA Version: 13.2` while actually having only CUDA 12 installed via `nvcc`.

: If you have CUDA 12 installed and want to switch to 13, install the CUDA 13 toolkit (in parallel with 12 is fine) and then re-run the ONNX Runtime install script – it picks the build matching the toolkit it finds.

**AMD (MIGraphX)** _(Linux only)_
: ROCm-supported GPU (Radeon RX 7700-series or newer, Instinct MI100 or newer). [ROCm](https://rocm.docs.amd.com/projects/install-on-linux/en/latest/) 6.x or newer with MIGraphX installed on the system.

: Note: the first inference of each model on MIGraphX takes minutes because the model graph is compiled for your specific GPU and then cached on disk – see the [performance notes](../performance-and-troubleshooting/#performance-notes) for details. Once cached, subsequent runs are fast and survive across darktable restarts.

**Intel (OpenVINO)**
: Intel iGPU (HD / UHD / Iris Xe) or Arc discrete GPU. [Intel GPU driver](https://www.intel.com/content/www/us/en/download-center/home.html) with [OpenCL](https://github.com/intel/compute-runtime) (`intel-opencl-icd`) and/or [Level Zero](https://github.com/oneapi-src/level-zero). OpenVINO itself ships in the install package – nothing extra to install.

If a required system library is missing, the install script will tell you which one and point you at the vendor's install docs. The package still installs; acceleration only kicks in once the missing library is in place.

# use the install scripts (recommended)

The simplest path: paste one line into a terminal. The script figures out which GPU you have, downloads the matching ONNX Runtime build, verifies it, and installs it under your user account. No root, no source checkout.

Linux:
```bash
curl -fsSL https://raw.githubusercontent.com/darktable-org/darktable/HEAD/tools/ai/install-ort-gpu.sh | bash
```

Windows (PowerShell):
```powershell
irm https://raw.githubusercontent.com/darktable-org/darktable/HEAD/tools/ai/install-ort-gpu.ps1 | iex
```

The Linux script needs `bash`, `curl`, `jq`, `tar`, and `unzip` available on `PATH` – if any are missing it tells you which ones up front so the install doesn't fail halfway through. The Windows script needs PowerShell 5.1 or newer (preinstalled on Windows 10+).

If you have more than one GPU, the script asks which one to target. If your GPU needs system libraries that aren't installed (cuDNN on NVIDIA, MIGraphX on AMD), the script tells you what's missing and where to get it – the install still completes, but acceleration only kicks in once those system libraries are in place.

To force a specific execution provider instead of letting the script auto-detect, pass `--ep` (bash) or `-Ep` (PowerShell). Values: `cuda12`, `cuda13`, `rocm`, `migraphx`, `openvino`. Useful when both NVIDIA and Intel GPUs are present and you want a specific one, or when `nvcc` is not installed and the script can't tell whether you have CUDA 12 or CUDA 13 on the system.

When the script finishes, restart darktable, open [AI preferences](../../../preferences-settings/ai.md), and click **detect** so darktable picks up the newly-installed runtime. Then choose your provider (CUDA, MIGraphX, OpenVINO) under _AI acceleration_.

# detect a system-installed ONNX Runtime

If your distribution already ships a GPU-capable ONNX Runtime (common on Arch, occasionally on Ubuntu/Debian via third-party repos), just click **detect** in the AI preferences tab – darktable looks in standard system locations and configures itself.

# install manually

When the automatic options don't fit (locked-down environment, custom audit, GitHub API rate-limited – see below) you can fetch and place the files yourself. The goal is a `libonnxruntime.so.*` / `onnxruntime.dll` on disk that darktable can be pointed at via the _ONNX Runtime library_ field in AI preferences.

## where to download

| Vendor | Source |
|--------|--------|
| NVIDIA CUDA 12 | [GitHub Releases](https://github.com/microsoft/onnxruntime/releases/latest) – `onnxruntime-{linux\|win}-x64-gpu-X.Y.Z.{tgz\|zip}` |
| NVIDIA CUDA 13 | [GitHub Releases](https://github.com/microsoft/onnxruntime/releases/latest) – `onnxruntime-{linux\|win}-x64-gpu_cuda13-X.Y.Z.{tgz\|zip}` |
| AMD ROCm 6.x | [PyPI `onnxruntime-rocm`](https://pypi.org/project/onnxruntime-rocm/#files) – `cp312` `manylinux` wheel |
| AMD ROCm 7.x | [PyPI `onnxruntime-migraphx`](https://pypi.org/project/onnxruntime-migraphx/#files) – `cp312` `manylinux` wheel |
| Intel OpenVINO (Linux) | [PyPI `onnxruntime-openvino`](https://pypi.org/project/onnxruntime-openvino/#files) – `cp312` `manylinux_2_28_x86_64` wheel |
| Intel OpenVINO (Windows) | [PyPI `onnxruntime-openvino`](https://pypi.org/project/onnxruntime-openvino/#files) + [PyPI `openvino`](https://pypi.org/project/openvino/#files) – both `cp312` `win_amd64` |

NVIDIA tarballs/zips are simplest to extract: the library sits under `lib/`. PyPI wheels (`.whl` files are renamed zips) carry the library under `<package>/capi/` along with the `LICENSE` and `ThirdPartyNotices.txt` you should keep next to it. AMD wheels may additionally ship a sibling `<package>.libs/` directory of auditwheel-bundled ROCm libs – when present, that directory must stay alongside `libonnxruntime.so.*` after copying, because the providers' RPATH resolves through a relative `$ORIGIN` reference. Intel on Windows needs DLLs from a second wheel (`openvino`) copied next to `onnxruntime.dll`.

By convention, place the extracted files under `~/.local/lib/onnxruntime-<ep>/` on Linux or `%LOCALAPPDATA%\onnxruntime-<ep>\` on Windows (`<ep>` = `cuda`, `rocm`, `migraphx`, or `openvino`). The **detect** button in AI preferences scans for any `onnxruntime-*` directory under those roots.

## AMD: alternative source when PyPI's GPU coverage isn't enough

PyPI's `onnxruntime-rocm` / `onnxruntime-migraphx` wheels ship HIP kernel binaries for a fixed set of GPU architectures. If your card's `gfx*` ID isn't covered, ONNX Runtime loads but model compilation fails at runtime:

```
migraphx_program_compile: Error: ... no kernel image is available
for execution on the device
```

This commonly hits some RDNA 3 iGPUs (e.g. Radeon 780M / gfx1103). Two cheaper workarounds before reinstalling:

- **hide the unsupported GPU** from MIGraphX so it binds to a supported card (find indices with `rocminfo | grep -E "Marketing Name|gfx"`):
  ```bash
  HIP_VISIBLE_DEVICES=0 darktable
  ```
- **override the gfx version** – RDNA 3 is mostly binary-compatible with gfx1100, so the bundled kernels often work:
  ```bash
  HSA_OVERRIDE_GFX_VERSION=11.0.0 darktable
  ```

If neither helps, AMD's own ROCm repository ships builds with broader per-architecture coverage. Browse https://repo.radeon.com/rocm/manylinux/, find the `rocm-rel-X.Y.Z/` directory matching your installed ROCm version, download the `cp312` `onnxruntime_rocm-*.whl`, and extract it the same way as the PyPI wheel.

## building AMD from source

When even the AMD repository binaries don't match your system (custom-built ROCm, an unusual distro), build ONNX Runtime against your installed ROCm. From a darktable source checkout:

```bash
./tools/ai/install-ort-amd-build.sh
```

Needs `cmake` 3.26+, a C++ compiler, `python3`, and `git`. Takes 10–20 minutes.

## GitHub API rate limit

For CUDA 13, the install script asks `api.github.com` which release is latest. GitHub limits unauthenticated callers to **60 requests per hour per source IP**. On shared NAT (corporate networks, VPNs, cloud VMs) that limit gets exhausted quickly by other users on the same IP, and the script fails with a clear message pointing here.

Two ways out:

- **set `GITHUB_TOKEN`** to any personal access token (no scopes required for public repos) before re-running – raises the limit to 5000 requests/hour authenticated.
- **install manually** – for the CUDA 13 tarball this is `tar xzf` plus a copy. The install script prints the same instructions on failure.

PyPI sources (AMD, Intel, NVIDIA CUDA 12) have no published rate limit and are unaffected.

# after installing a new ONNX Runtime

When darktable starts up with a new ONNX Runtime library, the _AI acceleration_ dropdown in AI preferences re-populates with only the providers that library actually advertises. Older selections that are no longer supported are switched to another available GPU provider automatically, or to _auto_ if no GPU is left.

Between the install and the restart, the dropdown shows a _restart to apply_ hint next to the provider name – a reminder that the currently-loaded runtime is stale.
