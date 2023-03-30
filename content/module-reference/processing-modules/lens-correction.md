---
title: lens correction
id: lens-correction
applicable-version: 4.2
tags: 
working-color-space: RGB
view: darkroom
masking: false
---

Automatically correct for (or simulate) lens distortion, transverse chromatic aberrations (TCA) and vignetting.

You can choose to either use lens correction data embedded in your Raw file (where present/supported) or correction data provided by the external [lensfun library](https://lensfun.github.io/).

# lensfun correction data

If your system's lensfun library has no correction profile for the automatically identified camera/lens combination, the controls for the three photometric parameters (below) are replaced with a warning message. You may try to find the right profile yourself by searching for it in the menu. 

If your lens is present in the list but has not been correctly identified, this may require some adjustment within the exiv2 program (see [this post](https://dev.exiv2.org/boards/3/topics/2854) for details). Note that you may need to re-import the images once such adjustments have been made as the lens name is retrieved as part of the import process.

By default, only the lenses that are directly compatible with your camera's mount are listed and automatically identified. If you are using lenses for a different mount with an adapter (for example a Four Thirds lens adapted to a Micro Four Thirds body), then you must run the [`lensfun-add-adapter`](https://lensfun.github.io/manual/v0.3.2/lensfun-add-adapter.html) tool to enable those lenses.

If you can't find your lens, check if it is in the list of [currently supported lenses](https://lensfun.github.io/lenslist/), and try running the [`lensfun-update-data`](https://lensfun.github.io/manual/v0.3.2/lensfun-update-data.html) tool. If there is still no matching profile for your lens, a [lens calibration service](https://www.darktable.org/2013/07/have-your-lens-calibrated/) is offered by Torsten Bronger, one of darktable's users. Alternatively you may visit the [lensfun project](https://lensfun.github.io/lenslist/) to learn how to generate your own set of correction parameters. Don't forget to share your profile with the lensfun team!

# module controls

correction method
: Choose which method to use to correct distortions. Some cameras are able to embed lens correction data into the metadata of their Raw files. Where supported metadata is found, you can choose to use either the embedded correction data (choose "embedded metadata") or that provided by the lensfun project (choose "lensfun"). Additional controls will be provided depending on the option selected.

corrections
: Choose which corrections (distortion, TCA, vignetting) darktable should apply. Change this from its default "all", if your camera has already performed some internal corrections (e.g. vignetting), or if you plan to undertake some corrections with a separate program.

corrections done
: Occasionally, for a given camera/lens combination, only some of the possible corrections are supported. This message box appears at the bottom of the module to indicate which corrections have actually been applied to the image.

show guides
: Tick the box at the bottom of the module to show guide overlays whenever the module is activated. Click the icon on the right to control the properties of the guides. See [guides & overlays](../utility-modules/darkroom/guides-overlays.md) for details.

## lensfun controls

The following controls are provided for the "lensfun" correction method only:

camera
: The camera make and model as determined by the image's Exif data. You can override this manually and select your camera from a hierarchical menu. Only lenses with correction profiles matching the selected camera will be shown.

lens
: The lens make and model as determined by the image's Exif data. You can override this manually and select your lens from a hierarchical menu. This is mainly required for pure mechanical lenses, but may also be needed for off-brand / third party lenses. 

photometric parameters (focal length, aperture, focal distance)
: Lens corrections depend on certain photometric parameters that are read from the image's Exif data: focal length (for distortion, TCA, vignetting), aperture (for TCA, vignetting) and focal distance (for vignetting). Many cameras do not record focal distance in their Exif data, in which case you will need to set this manually.

: You can manually override all automatically selected parameters. Either take one of the predefined values from the drop-down menu or, with the drop-down menu still open, just type in your own value.

geometry
: In addition to correcting lens flaws, this module can change the projection type of your image. Set this combobox to the desired projection type (e.g. "rectilinear", "fish-eye", "panoramic", "equirectangular", "orthographic", "stereographic", "equisolid angle", "thoby fish-eye").  To correct the aspect ratio of an anamorphic lens, use the [_rotate and perspective_](./rotate-perspective.md) module.

scale
: Adjust the scaling factor of your image to avoid black corners. Press the auto scale button (to the right of the slider) for darktable to automatically find the best fit.

mode
: The default behavior of this module is to _correct_ lens flaws. Switch this combobox to "distort" in order to instead _simulate_ the flaws/distortions of a specific lens (inverted effect).

TCA overwrite
: Check this box to override the automatic correction parameters for TCA. This will expose the TCA red and TCA blue parameters below. Un-check the box to revert back to automatic corrections.

TCA red; TCA blue
: Override the correction parameters for TCA. You can also use these sliders to manually set the parameters if the lens profile does not include TCA correction. Look out for colored seams at features with high contrast edges and adjust the TCA parameters to minimize those seams.

---

**Note:** TCA corrections will not be applied to images that have been identified as monochrome (see [developing monochrome images](../../guides-tutorials/monochrome.md) for more information).

**Note:** The lens correction module will fill in missing data at the borders by repeating the borders' pixels. For strong corrections, this filling can be visible (especially on noisy images). Crop the image if necessary.

---

## embedded metadata controls

The following controls are provided for the "embedded metadata" correction method only:

distortion fine-tune
: Fine-tune the distortion correction.

vignetting fine-tune
: Fine-tune the vignetting correction.
