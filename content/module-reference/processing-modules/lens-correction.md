---
title: lens correction
id: lens-correction
applicable-verison: 3.2.1
tags: 
working-color-space: RGB
view: darkroom
masking: false
---

Automatically correct for lens distortion, transversal chromatic aberrations (TCA) and vignetting.

This module identifies the camera/lens combination from the image's Exif data and uses the external [lensfun library](http://lensfun.sourceforge.net) to provide correction parameters for the image.

If your system's lensfun library has no correction profile for the automatically identified camera/lens combination the controls for the three photometric parameters (below) are replaced with a warning message. You may try to find the right profile yourself by searching for it in the menu. 

If you can't find your lens, check if it is in the list of [currently supported lenses](http://lensfun.sourceforge.net/lenslist/), and try running [the lensfun-update-data tool](http://lensfun.sourceforge.net/manual/lensfun-update-data.html). If there is still no matching profile for your lens, please visit this [lens calibration service](https://www.darktable.org/2013/07/have-your-lens-calibrated/) offered by Torsten Bronger, one of darktable's users. Alternatively you may go to [lensfun's home page](http://lensfun.sourceforge.net/) and learn how to generate your own set of correction parameters. Don't forget to share your profile with the lensfun team!

## Module Controls

camera
: The camera make and model as determined by Exif data. You can override this manually and select your camera from a hierarchical menu. Only lenses with correction profiles matching the selected camera will be shown.

lens
: The lens make and model as determined by Exif data. You can override this manually and select your lens from a hierarchical menu. This is mainly needed for pure mechanical lenses, but may also be needed for off-brand / third party lenses. If your lens is present in the list but not correctly identified, this may require some adjustment within the exiv2 program (see [this post](https://dev.exiv2.org/boards/3/topics/2854)).

photometric parameters: focal length, aperture, focal distance
: Lens corrections depend on certain photometric parameters that are read from Exif data: focal length (needed for distortion, TCA, vignetting), aperture (needed for TCA, vignetting) and focal distance (needed for vignetting). Many cameras do not record focal distance in their Exif data; in this case you will need to set this manually.

: You can manually override all automatically selected parameters. Either take one of the predefined values from the drop-down menu; or – with the drop-down menu still open – just type in your own value.

corrections
: Choose which corrections (distortion, TCA, vignetting) darktable should apply. Change this from its default “all”, if your camera has already done some internal corrections (e.g. vignetting), or if you plan to do some corrections with a separate program.

geometry
: In addition to the correction of lens flaws, this module can change the projection type of your image. Set this combobox to the aimed projection type, such as “rectilinear”, “fish- eye”, “panoramic”, “equirectangular”, “orthographic”, “stereographic”, “equisolid angle”, “thoby fish-eye”.

scale
: Adjust the scaling factor of your image. Press the auto scale button (to the right of the slider) for _darktable_ to find the best fit to avoid black corners.

mode
: The default behavior of this module is to correct lens flaws. Switch this combobox to “distort” in order to instead _simulate_ the behavior of a specific lens (inverted effect).

TCA red; TCA blue
: Override the correction parameters for TCA. You can also use this slider to manually set the parameter in case the lens profile does not contain TCA correction. Look out for colored seams at features with high contrast edges and adjust these parameters to minimize those seams.

corrections done
: Occasionally, for a given camera/lens combination, only some of the possible corrections are supported by lensfun's profiles. This message box will tell you what corrections have actually been applied to the image.
