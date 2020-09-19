---
title: Editing an Image - Scene Referred Workflow
id: edit-scene-referred
draft: false
weight: 30
author: "people"
---

The *scene-referred* workflow places emphasis on doing image processing in the linear scene-referred part of the pixel pipe. This helps to reduce artifacts and colour shifts that can result from working in non-linear display-referred spaces, and by decoupling the image processing from the characteristics of a specific display, it makes it easier to adapt your work in the future to new display types, such asd high dynamic range displays.

Basic image processing in the scene-referred workflow requires you to consider the following modules:

0. **Use your camera** to take a properly exposed image. Normally you can rely on the camera's metering and automatic exposure features. However, for some scenes you may need to use the camera's exposure compensation dial to get an optimal exposure. In general, you want to make the exposure in camera as bright as possible without clipping the highlights. This is known as "exposing to the right" (ETTR), and it ensures you take best advantage of the sensor's dynamic range. Many cameras have features like "zebras" or "blinkies" to warn you when you are in danger of clipping.
1. **Exposure**: this module is enabled by default, and it will have an initial value of +0.5EV. The metering systems in cameras vary, and for some camera models you might want a bit more initial exposure (eg. +0.8EV ~ 1.5EV) -- you can create an auto-apply preset as required. The exposure module will detect if the camera's exposure compensation dial was used (see above remarks about ETTR), and will re-adjust the exposure accordingly. Use the exposure slider to adjust the midtones in the image to an appropriate brightness level. At this stage, don't worry about highlights and shadows, this will be dealt with later. 
2. **White Balance**: it is important that white balance is set correctly to form a solid basis for further processing. The camera will normally propose some white balance setting inside the raw file's metadata, and darktable will use this as a starting point. To get a more accurate white balance, you can either use the colour picker to select a neutral grey tone in the image, or you can use the white balance presets for your camera where available. FIne adjustments can also be made using the sliders.
3. **Filmic**: you already set the mid-grey tone level using the exposure module. Filmic will propose on its *scene* tab a white point and black point for the image, but you may need to adjust these for a particular scene. On the *look* tab you can adjust the midtone contrast and saturation settings if required.


Those are the most basic modules required to render a reasonable image on your display. In addition, you may want to consider the use of the following modules:

{{< table >}}
|Module|Purpose|
|------|-------|
|color balance|This is a versatile module that can be used to further adjust the contrast and saturation of an image, and can also be used to do colour grading (eg. emulate "orange and teal" grading used in hollywood films, remve redness in skin tones, adjust for uneven colour balance in shadows/midtones/highlights, etc.).|
|tone equalizer|Use this to bring up shadows/adjust highlights. You need to check the mask is set up appropriately, then you can use your mouse wheel to adjust the tone levels as you mouse over different parts of the image.|
|local contrast|Use this in *local lapacian* mode to improve general sharpness to the image.  |
|denoise (profiled)|Use this in *non-local means* mode to reduce noise in an image. You should use a 1:1 zoom on the image when doing denoising. The wavelet feature of this module is also quite effective against colour noise. |
|haze removal|Does what is says on the tin.|
|channel mixer|This offers a range of presets for making black and white images. It can also be used to tweak your colour profile matrices eg. to deal with colour gamut issues|
|lens correction|If your camera/lens combo is supported, and the corrections were not already done in-camera|
{{< /table >}}

There are also a number of modules in darktable which are not really recommended for which a linear scene-referred workflow. It doesn't mean these modules can't be used, it's just that they can produce undesirable effects when pushed too far, and there are better alternatives in a linear workflow.

{{< table >}}
|Instead of|Use this|Remarks|
|----------|--------|-------|
|local tone mapping|tone equalizer|has non-linear characteristics that can provoke halos and fringing|
|global tone mapping|filmic|Filmic can scale over a wide range of scene-referred input values and map a high dynamic range scene to fit within a display's narrower dynamic range.|
|shadows and highlights|tone equalizer|problems can include halos, high local contrast in highlights, hue shifts towards blue in shadows.|
|low-pass filter|contrast equalizer or tone equalizer|use contrast equaliser for blurring, use tone equasliser if local dynamic range compression is needed|
|high-pass filter|contrast equalizer or local contrast|use contrast equalizer for fine sharpness, or local contrast for general sharpness|
|sharpen|contrast equalizer or local contrast|sharpen's USM algorithm is a little archaic; use contrast equaliser presets for de-blurring, or local contrast for general sharpness|
|monochrome|channel mixer (or color balance)|monochrome module can be fiddly; channel mixer presets better emulate what physically happens with film, or you can set the output saturation in color balance module to 0% for a more perceptual approach|
|fill light|tone equalizer|can also use exposure module with a mask|
|bloom|tone equalizer|can also use exposure module with a mask|
|zone system|tone equalizer|can also use exposure modules with a masks|
|color correction|color balance|color balance wirks in RGB and allows easy adjustment of white balance in shadows (lift/offset), midtones (gamma/power) and highlights (gain/slope)|
|velvia|color balance|use the output saturation slider|
|levels/ rgb levels|color balance|these are basically a subset of the color balance module, which makes them redundant|
|curves/rgb curves|color balance|normally used to adjust contrast. These assume midgrey level of 50%, but in linear scene-referred space midgrey is at 18%. Better to adjust the contrast in color balance module reference point can be set with the fulcrum slider|
|contrast/ brightness/ saturation|color balance|works in Lab space, with the associated problems that implies|
{{< /table >}}

Finally, there are some modules where there is not yet an alternative well suited to the scene-referred workflow. If they are required, they should be used sparingly and with care.

{{< table >}}
|Module|Remark|
|------|------|
|vibrance|tends to darken colours. Consider using using color zones with a saturation parametric mask to give more control|
|color zones|transitions may not be graceful. An alternative can be to use color balance with parameteric mask|
|vignetting|this can look unnatural with too strong a fall-off, may be better off using exposure with an elliptical mask with large transition area, and maybe add color balance with the same mask to reduce saturation at the edges.|
|blending modes (on all modules)|the default blending modes are optimised for the display-referred space, so for linear scene-referred space stick with blend modes based on arithmetic operations (addition, multiplication, division, subtraction, average), on maximum/minimum comparisons (screen) or on channel separations (hue, color, chroma, etc.).|
{{< /table >}}
