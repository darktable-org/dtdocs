---
title: lens correction
id: lens-correction
applicable-version: 3.2.1
tags: 
working-color-space: RGB
view: darkroom
masking: false
---

Automatically correct for lens distortion, transversal chromatic aberrations (TCA) and vignetting.

This module identifies the camera/lens combination from the image's Exif data and uses the external [lensfun library](https://lensfun.github.io/) to provide correction parameters for the image.

If your system's lensfun library has no correction profile for the automatically identified camera/lens combination the controls for the three photometric parameters (below) are replaced with a warning message. You may try to find the right profile yourself by searching for it in the menu. 

If your lens is present in the list but has not been correctly identified, this may require some adjustment within the exiv2 program (see [this post](https://dev.exiv2.org/boards/3/topics/2854) for details). Note that you may need to re-import the images once such adjustments have been made.

If you can't find your lens, check if it is in the list of [currently supported lenses](https://lensfun.github.io/lenslist/), and try running [the lensfun-update-data tool](https://lensfun.github.io/manual/v0.3.2/lensfun-update-data.html). If there is still no matching profile for your lens, please visit this [lens calibration service](https://www.darktable.org/2013/07/have-your-lens-calibrated/) offered by Torsten Bronger, one of darktable's users. Alternatively you may go to [lensfun's home page](https://lensfun.github.io/lenslist/) and learn how to generate your own set of correction parameters. Don't forget to share your profile with the lensfun team!

# module controls

camera
: The camera make and model as determined by the image's Exif data. You can override this manually and select your camera from a hierarchical menu. Only lenses with correction profiles matching the selected camera will be shown.

lens
: The lens make and model as determined by the image's Exif data. You can override this manually and select your lens from a hierarchical menu. This is mainly required for pure mechanical lenses, but may also be needed for off-brand / third party lenses. 

photometric parameters: focal length, aperture, focal distance
: Lens corrections depend on certain photometric parameters that are read from the image's Exif data: focal length (for distortion, TCA, vignetting), aperture (for TCA, vignetting) and focal distance (for vignetting). Many cameras do not record focal distance in their Exif data, in which case you will need to set this manually.

: You can manually override all automatically selected parameters. Either take one of the predefined values from the drop-down menu or, with the drop-down menu still open, just type in your own value.

corrections
: Choose which corrections (distortion, TCA, vignetting) darktable should apply. Change this from its default “all”, if your camera has already performed some internal corrections (e.g. vignetting), or if you plan to undertake some corrections with a separate program.

geometry
: In addition to correcting lens flaws, this module can change the projection type of your image. Set this combobox to the aimed projection type, such as “rectilinear”, “fish-eye”, “panoramic”, “equirectangular”, “orthographic”, “stereographic”, “equisolid angle”, “thoby fish-eye”.  To correct the aspect ratio of an anamorphic lens, use the [_perspective correction_](./perspective-correction.md) module.

scale
: Adjust the scaling factor of your image to avoid black corners. Press the auto scale button (to the right of the slider) for darktable to automatically find the best fit.

mode
: The default behavior of this module is to _correct_ lens flaws. Switch this combobox to “distort” in order to instead _simulate_ the flaws/distortions of a specific lens (inverted effect).

TCA overwrite
: Check this box to override the automatic correction parameters for TCA. This will expose the TCA red and TCA blue parameters below. Un-check the box to revert back to automatic corrections.

TCA red; TCA blue
: Override the correction parameters for TCA. You can also use these sliders to manually set the parameters if the lens profile does not contain TCA correction. Look out for colored seams at features with high contrast edges and adjust these parameters to minimize those seams.

corrections done
: Occasionally, for a given camera/lens combination, only some of the possible corrections are supported by lensfun's profiles. This message box will tell you which corrections have actually been applied to the image.

---

**Note:** TCA corrections will not be applied to photos that have been identified as monochrome (see [developing monochrome images](../../guides-tutorials/monochrome.md) for more information).

---
