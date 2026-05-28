---
title: neural restore
id: neural-restore
---

Apply AI-powered restoration to selected images: raw denoise, RGB denoise, and 2x / 4x upscaling. Available in both the lighttable and darkroom views as a panel with a tabbed task picker, an interactive before/after preview, and a process button that runs the chosen task on every selected image. Outputs go to a new file – the original image is never modified.

The AI features this module drives are configured in [AI preferences](../../../preferences-settings/ai.md); see the [AI features overview](../../../special-topics/ai/overview.md) for what these tasks do and don't do.

Neural restore can be significantly sped up with [GPU acceleration](../../../special-topics/ai/gpu-acceleration.md).

# prerequisites

Before you can use this module:

1. **Enable AI features** in [AI preferences](../../../preferences-settings/ai.md). The master switch is off in a fresh install.
2. **Activate a model for each task you want to use.** In the same preferences tab, tick the _enabled_ column for one model per task – `rawdenoise` for the raw denoise tab, `denoise` for the denoise tab, `upscale` for the upscale tab. If no model is enabled for the current tab, the preview area shows _model not available_ and the process button refuses to run.

Switching tabs without an active model for the new task is harmless – the module just disables itself for that tab until you enable one.

# tabs

The notebook at the top of the module selects the task to run.

raw denoise
: AI denoise applied early in the raw pipeline. The exact stage depends on the sensor:

: - **Bayer sensors** are denoised directly on the CFA mosaic, with denoise and demosaic combined into a single inference pass. The result is saved as a Bayer CFA DNG.
: - **X-Trans sensors** (and any other non-Bayer colour CFA the Bayer model can't handle) are demosaicked first by darktable's pipeline, then the AI denoiser operates on the resulting linear Rec.2020 RGB image. The result is saved as a LinearRaw DNG.

: Either output can be re-imported into darktable as a regular raw – downstream darkroom processing is unchanged.

: **Limitations.** Monochrome sensors are not currently supported – the available raw-denoise models are trained on colour-CFA data and have no monochrome equivalent yet. Use _denoise_ in neural restore module on a monochrome image instead.

: - _strength_ – linear blend between the source raw (0%) and the AI-denoised output (100%) at the raw sensor level. Lower values let some of the original noise back in, in direct proportion.

denoise
: Machine-learning RGB denoise applied to the already-demosaicked and mostly-edited image; writes a TIFF.

: - _strength_ – at 100% the output is the full AI model result. Lower values do not just blend back the source – the difference between source and denoised is decomposed into wavelet (DWT) detail bands and the higher-frequency texture is brought back selectively, so you recover grain and surface detail without re-introducing the colour noise the model removed.

upscale
: Super-resolution to 2x or 4x the input pixel dimensions. Writes a TIFF at the upscaled size. 4x on a high-resolution image is memory-hungry; tile processing is enabled automatically to keep peak memory bounded, at the cost of some extra processing time.

: - _scale_ – output magnification factor (_2x_ or _4x_). Larger factors are slower and need more GPU memory.

# where the tasks sit in your workflow

_raw denoise_ and _denoise_ both remove sensor noise – the difference is **at which point in the workflow** you decide to apply them, and you normally use one _or_ the other, not both:

- reach for **raw denoise** when you already know the shot is noisy (high ISO, deep push, low light) and haven't started editing. It removes noise at the source, on the raw data, which is where a model can remove it most cleanly – so it gives the strongest result on difficult captures. You commit to it up front and then edit the cleaned DNG.
- reach for **denoise** when you have already developed an image and noise is bothering you in the _result_. It cleans the noise you can actually see in your finished edit, without making you redo that edit.

raw denoise – _before_ darkroom editing
: Operates on the source raw (Bayer CFA, or X-Trans / non-Bayer demosaicked to linear Rec.2020) and writes a DNG. The intended workflow is:

: 1. select the noisy raw in lighttable;
: 2. run _raw denoise_ – the output DNG is grouped with the source;
: 3. open the new DNG and edit it normally.

: As it works with the original sensor data it removes noise most cleanly, before demosaic spreads it across the colour channels. It is the AI counterpart to the classical [raw denoise](../../processing-modules/raw-denoise.md) module – both operate on the raw CFA data before demosaic. The original raw file stays untouched.

denoise – _late_ in the workflow, _after_ darkroom editing
: Exports your image through the full darkroom pipeline (every active module is applied) and then runs the AI denoiser on the result, writing a TIFF. The intended workflow is:

: 1. develop the image up to and including the step that switches the pipeline from _scene-referred_ to _display-referred_ space ([_filmic rgb_](../../processing-modules/filmic-rgb.md), [_sigmoid_](../../processing-modules/sigmoid.md) or [_AgX_](../../processing-modules/agx.md)) and any display-referred colour grading – the point where the noise visible to the viewer has emerged;
: 2. run _denoise_ – the output is a TIFF with the edit so far baked in, plus noise cleaned up;
: 3. continue editing the TIFF if you want to add sharpening, local adjustments, output sizing, etc., or deliver it directly.

: This cleans exactly the noise visible in your finished edit, without redoing any work – your edit is baked into the TIFF and you carry on from there. The trade-off: the noise is already shaped by the whole pipeline, so on a very noisy capture _raw denoise_ gives a cleaner result. The TIFF is fully editable – a clean midpoint, not necessarily the last stop.

upscale – _last step before delivery_
: Runs the full darkroom pipeline, then enlarges the result 2x or 4x and writes a TIFF. The intended workflow is:

: 1. finish your edit, including any sharpening and grading;
: 2. run _upscale_ at the chosen factor – the output is a TIFF at the upscaled size;
: 3. use the output for print or large-format display.

: Don't upscale early in the workflow: any subsequent denoise, sharpening or grading would then operate on the synthesised pixels rather than the originals, and the output quality suffers. Typical uses are enlarging a small crop for a large print, or pulling a low-resolution source up to web-deliverable size.

# preview

Below the tab controls is a split before/after preview of a small patch of the currently-displayed image. Drag the divider to wipe between the original (left) and the AI-restored output (right). The preview is generated on demand by clicking the preview area; it uses the same model and settings the process button would use, so it's a faithful guide to what the final output will look like.

To choose a different patch of the image, click the picker button (to the right of _process_) and then click within the preview widget – the preview re-generates centred on the point you clicked.

Hover over the preview to get a 2x magnified tooltip view, useful for evaluating per-pixel noise / detail behaviour.

# process

The _process_ button runs the active task on every currently-selected image, in turn. Progress is reported in the status bar; each finished image lands in the output folder and (if _add to the current collection_ is enabled) is imported into the database automatically.

If no model is active for the current task, the button refuses to run (the preview shows _model not available_). If the model is active but its execution provider fails to initialise – or fails on one specific image at runtime – the affected image is skipped with a message in the status bar, and the rest of the batch continues.

# output parameters

The collapsible _output parameters_ section controls how the result is written to disk. Settings apply to whichever task is currently active.

bit depth _(denoise and upscale only)_
: Bit depth of the output TIFF (_8 bit_, _16 bit_, _32 bit (float)_).
profile _(denoise and upscale only)_
: Colour profile embedded in the output TIFF. _image settings_ uses the working profile of the source image. The other entries match the standard export dialog.

preserve wide-gamut colors _(denoise only)_
: When on, pixels whose colour falls outside sRGB gamut pass through the model unchanged – wide-gamut colours are preserved exactly, but those specific pixels are not denoised. When off, every pixel is denoised but wide-gamut colours may be clipped to sRGB.

add to the current collection
: Import the output into darktable automatically when it's written. The new image is grouped with the source image so they appear together in darktable.

output folder
: Where the output file is written. Supports darktable variables – `$(FILE_FOLDER)` (the default) writes next to the source image. Use the folder-icon button to pick a directory.

# performance

Processing time depends on the AI acceleration backend, the image resolution, and the task. Raw denoise and 4x upscale are the most demanding. The first inference run after starting darktable also pays a one-time graph-compilation cost – see [GPU acceleration](../../../special-topics/ai/gpu-acceleration.md), [how AI works](../../../special-topics/ai/how-ai-works.md), and [performance notes](../../../special-topics/ai/performance-and-troubleshooting.md) for the details.
