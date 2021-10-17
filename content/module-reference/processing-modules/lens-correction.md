---
title: lens correction
id: lens-correction
applicable-version: 3.8
tags: 
working-color-space: RGB
view: darkroom
masking: false
---

Automatically correct for (and simulate) lens distortion, transversal chromatic aberrations (TCA) and vignetting.

This module identifies the camera/lens combination from the image's Exif data and uses the external [lensfun library](https://lensfun.github.io/) to provide correction parameters.

If your system's lensfun library has no correction profile for the automatically identified camera/lens combination, the controls for the three photometric parameters (below) are replaced with a warning message. You may try to find the right profile yourself by searching for it in the menu. 

If your lens is present in the list but has not been correctly identified, this may require some adjustment within the exiv2 program (see [this post](https://dev.exiv2.org/boards/3/topics/2854) for details). Note that you may need to re-import the images once such adjustments have been made as the lens name is retrieved as part of the import process.

If you can't find your lens, check if it is in the list of [currently supported lenses](https://lensfun.github.io/lenslist/), and try running the [`lensfun-update-data`](https://lensfun.github.io/manual/v0.3.2/lensfun-update-data.html) tool. If there is still no matching profile for your lens, a [lens calibration service](https://www.darktable.org/2013/07/have-your-lens-calibrated/) is offered by Torsten Bronger, one of darktable's users. Alternatively you may visit the [lensfun project](https://lensfun.github.io/lenslist/) to learn how to generate your own set of correction parameters. Don't forget to share your profile with the lensfun team!

# module controls

camera
: The camera make and model as determined by the image's Exif data. You can override this manually and select your camera from a hierarchical menu. Only lenses with correction profiles matching the selected camera will be shown.

lens
: The lens make and model as determined by the image's Exif data. You can override this manually and select your lens from a hierarchical menu. This is mainly required for pure mechanical lenses, but may also be needed for off-brand / third party lenses. 

photometric parameters (focal length, aperture, focal distance)
: Lens corrections depend on certain photometric parameters that are read from the image's Exif data: focal length (for distortion, TCA, vignetting), aperture (for TCA, vignetting) and focal distance (for vignetting). Many cameras do not record focal distance in their Exif data, in which case you will need to set this manually.

: You can manually override all automatically selected parameters. Either take one of the predefined values from the drop-down menu or, with the drop-down menu still open, just type in your own value.

corrections
: Choose which corrections (distortion, TCA, vignetting) darktable should apply. Change this from its default "all", if your camera has already performed some internal corrections (e.g. vignetting), or if you plan to undertake some corrections with a separate program.

geometry
: In addition to correcting lens flaws, this module can change the projection type of your image. Set this combobox to the desired projection type (e.g. "rectilinear", "fish-eye", "panoramic", "equirectangular", "orthographic", "stereographic", "equisolid angle", "thoby fish-eye").  To correct the aspect ratio of an anamorphic lens, use the [_perspective correction_](./perspective-correction.md) module.

scale
: Adjust the scaling factor of your image to avoid black corners. Press the auto scale button (to the right of the slider) for darktable to automatically find the best fit.

mode
: The default behavior of this module is to _correct_ lens flaws. Switch this combobox to "distort" in order to instead _simulate_ the flaws/distortions of a specific lens (inverted effect).

TCA overwrite
: Check this box to override the automatic correction parameters for TCA. This will expose the TCA red and TCA blue parameters below. Un-check the box to revert back to automatic corrections.

TCA red; TCA blue
: Override the correction parameters for TCA. You can also use these sliders to manually set the parameters if the lens profile does not include TCA correction. Look out for colored seams at features with high contrast edges and adjust the TCA parameters to minimize those seams.

corrections done
: Occasionally, for a given camera/lens combination, only some of the possible corrections are supported by lensfun's profiles. This message box will tell you which corrections have actually been applied to the image.

---

**Note:** TCA corrections will not be applied to images that have been identified as monochrome (see [developing monochrome images](../../guides-tutorials/monochrome.md) for more information).

**Note:** The lens correction module will fill in missing data at the borders by repeating the borders' pixels. For strong corrections, this filling can be visible (especially on noisy images). Crop the image if necessary.

---

show guides
: Tick the box to show guide overlays whenever the module is activated. Click the icon on the right to control the properties of the guides. See [guides & overlays](../utility-modules/darkroom/guides-overlays.md) for details.

