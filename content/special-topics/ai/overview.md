---
title: overview
id: ai-overview
weight: 10
---

darktable uses machine learning models for a handful of image-processing tasks: interactive object masking, denoising, upscaling, etc. This section explains how those features work end-to-end – what runs where, which models exist, how inference is accelerated, and what the user's choices in the [AI preferences](../../../preferences-settings/ai.md) actually control.

AI features are opt-in. They are off by default in a fresh install and can be toggled with a single preference at any time.

AI features also have to be present in the darktable binary. The official builds (Linux AppImage, Windows installer, macOS dmg) all include them. Third-party packagers may ship a build without AI support – in that case the _AI_ tab is absent from preferences entirely. Ask your distribution's package maintainer to enable AI support, or use an official build.

# what the AI features do

## tasks

A _task_ is a capability slot inside darktable – "produce a mask around the clicked subject", "denoise an RGB image", and so on. Tasks are decoupled from the model that implements them: multiple competing models can live on disk for the same task (the NIND denoiser, the NAFNet denoiser, an experimental third…), but only one of them is _active_ for that task at any given time, and that's the one darktable's modules consume. Switching active model is a one-click toggle in [AI preferences](../../../preferences-settings/ai.md) and requires no changes to any module – the consumer just asks for "the active denoise model" and gets whichever you chose.

This setup allows for flexibility so the model repository can publish alternative or improved models without darktable needing to know about them ahead of time: pick the model in preferences and every consumer of that task picks it up automatically.

darktable currently exposes four tasks:

mask
: Interactive object segmentation. Click on a subject in the darkroom and the model produces a mask around it. Used by the parametric mask machinery to select regions without drawing by hand. Powered by models such as SAM 2.1 and SegNext.

denoise
: Machine-learning RGB denoise as an alternative to the classical denoise modules. Operates on already demosaiced RGB image data, trained on pairs of noisy and clean images. Removes sensor noise without the blocky or smoothed look that can come from traditional filters.

rawdenoise
: Machine-learning denoise applied directly to the raw CFA mosaic before demosaic, with denoise and demosaic combined into a single inference pass. Saved out as a LinearRaw DNG and re-imported, so downstream darkroom processing is unchanged. Useful when sensor noise needs to be addressed before the demosaic algorithm runs.

upscale
: 2x and 4x super-resolution, producing plausible detail from low-resolution inputs. Useful for small or cropped images where classical interpolation would blur.

Tasks run only when a user triggers them – there is no continuous AI activity in the background, no telemetry, and no cloud component. Everything runs locally on your machine.

## a note on accuracy

Like any machine-learning system, the AI features in darktable are not perfect. Every model has edge cases where its output will look worse than the classical alternative – unusual subjects, extreme exposures, or content far from what the model was trained on. This is intrinsic to how ML works, not a bug: 100% accuracy across all possible inputs is not something any model – ours or anyone else's – can offer.

What the models _can_ offer is consistently good results in the common cases they were designed for. The right mindset is to treat AI features as a tool that's usually better than the classical alternative, and to keep the classical modules available as a fallback on the few images where AI output is not. If you find a case where an AI model produces a noticeably poor result, please consider reporting it so the model can be improved over time.

# what darktable does _not_ do

darktable uses _narrow AI_ – small, task-specific models that run on your laptop and do one well-defined job (denoise, mask, upscale). It does **not** use the large generative models that can rewrite photographs – no sky replacement, no inserted objects, no style transfer, no synthesised content of any kind. The full scope is set out in the project's [AI Model Integration Policy](https://github.com/darktable-org/darktable/wiki/AI-Model-Integration-Policy); the governing principle is **scene integrity**: AI may correct technical defects of the capture, but it may not change what was in front of the camera.

Beyond scope, the technical guarantees:

- **No cloud inference:** Every model runs locally on your CPU or GPU. Nothing about your image is sent off-device.
- **No autonomous edits:** Every AI feature is user-triggered; there's no background AI activity on your library.
- **No training:** darktable ships pre-trained models and runs inference only. The [darktable-ai](https://github.com/darktable-org/darktable-ai) repository holds the conversion scripts and training notes for anyone who wants to retrain or export a new model.
- **No automatic updates:** Models are downloaded when you ask for them in preferences; nothing happens in the background.
- **No analytics:** darktable does not report model use, provider selection, or inference performance anywhere.
