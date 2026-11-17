---
title: AI masking
id: ai-masking
weight: 55
---

AI masking requires AI features to be enabled in [AI preferences](../../../preferences-settings/ai.md), with a model active for the _mask_ task. See the [AI features overview](../../../special-topics/ai/overview.md) for what runs where.

# AI object

![drawn-mask-object](./ai-masking/ai-object.png#icon) The _AI object_ tool selects an object for you: instead of drawing its outline by hand, click on the subject and a segmentation model produces the mask. An AI object is an element like any other: it can be combined with other elements in [groups](./groups-and-operators.md), inverted, refined, and given its own opacity.

Click the AI object button in the [toolbar](./mask-panel.md#toolbar) of the mask panel, then:

- **click** on the subject to add a foreground (positive) point -- the model produces a mask around the clicked region;
- **Shift+click** to add a background (negative) point, telling the model to exclude this area from the mask. This is useful when the mask spills onto a neighboring object;
- **Ctrl+Shift+click** to clear all points and start over;
- **Ctrl+scroll** to change the opacity of the object;
- **right-click** to apply the mask, or press Escape to cancel.

Every object you click on is kept in the selection, including one that does not touch the others, with models that return separate objects (such as SAM). Other models (such as SegNext) select one region at a time.

While the tool is active, the [controls](./mask-panel.md#controls) section of the mask panel shows its settings:

refine mask boundary
: Snap the boundary of the mask to nearby image edges after each click. This recovers details that the model missed, but the extra processing makes each click take a little longer.

apply as paths
: Trace the object into path shapes, which can then be edited node by node, instead of storing it as pixels (see below). When enabled, two more settings are shown, which can also be changed by scrolling on the image: _smoothing_ (scroll) sets how closely the traced outline follows the edge of the selection -- higher values give smoother, more rounded corners; _cleanup_ (Shift+scroll) discards small, stray fragments below the given size.

---

**Tips for better results:** The model selects one visually distinct object at a time. If the first click picks only part of the subject (an arm rather than the whole person, a wheel rather than the whole car), add more clicks on _adjacent_ parts to extend the mask. Clicking on a visually separate area usually switches the model to a new selection rather than extending the current one -- when that happens, reset with Ctrl+Shift+click and start over instead of trying to repair the mask with corrections.

---

## how AI objects are stored

By default, an AI object is stored _as pixels_, exactly as selected, in the image's [DTDATA sidecar](../../../overview/sidecar-files/sidecar.md#dtdata-sidecar-files). The pixels are kept only in that sidecar -- the library database holds just a reference to them. An object stored as pixels is shown on the image as an icon, along with the other shapes of the mask. To refine the object later, click its icon: the tool reopens on the stored mask, so that you can add or remove points and apply again. Refining a stored object requires the AI model to be available and sidecar writing to be enabled in [preferences > storage](../../../preferences-settings/storage.md#xmp-sidecar-files); without them, the stored object still renders.

If the stored pixels of an object are missing (for example because the sidecar was deleted), the module that uses it is not applied anywhere and darktable reports the problem. The sidecar is not recreated, but if the AI model is available you can regenerate the object's pixels by clicking its icon.

With _apply as paths_, the object is instead traced into Bézier paths once and stored in that form, as a group of path shapes (with holes cut out using _difference_ groups). The paths can then be edited like any other [drawn shape](./drawn.md), and the AI model is not involved any more. _Apply as paths_ is always used when sidecar writing is set to "never".

An AI object can be [linked or copied](./drawn.md#reusing-shapes) into the mask of another module, in the same way as a drawn shape. An object stored as pixels belongs to its own image: it is left out of [presets and styles](../../processing-modules/presets.md#presets-and-masks), and cannot be used on another image. Use _apply as paths_ for objects that you want to keep in presets and styles.

## performance

The first click on a new image runs the model's encoder once and caches the result on disk. Later clicks reuse the cache (even across restarts), so that only a lightweight decoder runs for each new point. Changing any module that distorts or crops the image (crop, rotate and perspective, lens correction, etc.) invalidates the cache and forces a new encoding on the next click.
