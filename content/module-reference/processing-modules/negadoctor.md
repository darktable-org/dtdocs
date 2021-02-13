---
title: negadoctor
id: negadoctor
applicable-version: 3.2.1
tags: 
working-color-space:  
view: darkroom
masking: 
---

Negadoctor allows you to process a scanned film negative. 

You can obtain an image of a negative using a film scanner, or by photographing it against a white light (e.g. a light table or computer monitor) or off-camera flash.

# preparation

If the image of the negative was obtained using a digital camera, then in order to obtain accurate colors in the final image, you will need to take the following points into consideration:

- When taking the photograph, adjust the exposure to fully utilise the entire dynamic range of your camera sensor -- i.e. "expose-to-the-right", so that the histogram in your camera touches the right hand side without clipping the image.

- Ensure the white balance is correctly set up to compensate for the light source used to illuminate the negative. You can take a profiling picture of the light source with no film negative in front of it, and then use the "spot" feature in the [_white balance_](./white-balance.md) module to obtain a reference white-balance setting. This reference white balance setting can then be made into a style or simply pasted onto the images taken from your film negatives.

- Apply the standard or enhanced camera matrix in the [_input color profile_](./input-color-profile.md) module.

When scanning or photographing your film negative, make sure you include some unexposed part of the film within the captured image. This is required to set the _Dmin_ parameter (see below). If this is not possible (e.g. your film holder completely obscures the unexposed parts of the film), you can take a separate image of an unexposed part of the film, measure the _Dmin_ parameter from that image, and then paste that setting to the rest of the images from that film.

When developing the scanned/photographed film negatives, it is recommended that you disable any tone mapping modules such as [_filmic rgb_](filmic-rgb.md), [_base curve_](base-curve.md) and the like.

The _working profile_ parameter in darktable's [_input color profile_](input-color-profile.md) module should be set to either _linear Rec2020 RGB_, or to an ICC profile representing the actual color space of your film emulsion. Some examples of such ICC profiles may be found in the following forum posts:

- [https://discuss.pixls.us/t/any-interest-in-a-film-negative-feature-in-rt/12569/177](https://discuss.pixls.us/t/any-interest-in-a-film-negative-feature-in-rt/12569/177)

- [https://discuss.pixls.us/t/input-color-profile-to-use-for-negatives/20271/13](https://discuss.pixls.us/t/input-color-profile-to-use-for-negatives/20271/13)

---

**Note:** if you want to use [_tone equalizer_](tone-equalizer.md) with _negadoctor_, you'll need to move the _tone equalizer_ **after** _negadoctor_ in the [pixelpipe](../../darkroom/pixelpipe/the-pixelpipe-and-module-order.md), since the _tone equalizer_ is not designed to work with negatives.

---

# module controls

It is strongly recommended that you set the parameters following the order in which they are presented in the GUI. Start by setting the _film stock_, then work through each of the tabs (_film properties_, _corrections_, _print properties_) in order, working from top to bottom.

When using color pickers, be careful to avoid including dust and scratches, which can skew the results of the sampled region.

film stock
: The first step is to choose "color" or "black and white" in the _film stock_ drop-down. If you select "black and white", any sliders that are only used for color will be hidden from view.

## film properties

This tab contains a number of basic settings. If, after adjusting these settings, your image is still not quite as you would like it, you can make further adjustments on the the _corrections_ tab. These are technical settings, and serve a somewhat similar purpose to the _scene_ tab in the [_filmic rgb_](filmic-rgb.md) module, in that they adjust the black and white points and hence define the dynamic range of the negative.

color of the film base
: Sample an area of the base film stock from your scan. This is the area just outside of the image (i.e. an unexposed part of the film). When working with black and white negatives, you can leave this at its default (white). If working on color film, click the color picker to the right of the color bar. This will create a bounding box which covers about 98% of your image. Then, click and drag across an area of your negative which contains only unexposed film stock. This will automatically calculate values for the _D min_ slider(s). It is likely at this point that your image will still look too dark, but you can correct this later.

D min
: If the _film stock_ is set to "black and white", this slider indicates the minimum value corresponding to the unexposed film stock. If you set _film stock_ to "color", this control will consist of 3 separate sliders, one for each of the red, green and blue channels.

D max
: This slider represents the dynamic range of your film, and it effectively sets its white point. Dragging this to the left will make the negative brighter. Dragging to the right will make the negative darker. When adjusting this slider manually, it's a good idea to closely watch your histogram to ensure that you don't clip the highlights (i.e. where the histogram has been pushed over too far off the right hand side of the graph). If you click the color picker icon (on the right) negadoctor will automatically calculate this value to ensure maximal use of the histogram without clipping. To use the color picker, click and drag to draw a rectangle across only the exposed parts of the negative. Don't include the unexposed film stock, as this will skew the result.

scan exposure bias
: This slider allows you to set the black point. It is a technical adjustment that ensures a proper zeroing of the RGB values and a spreading of the histogram between [0, 1] values for robustness in the operations that follow. Dragging this to the left will make the negative brighter. Dragging to the right will make the negative darker. When adjusting this slider manually, it's a good idea to closely watch your histogram and ensure that you don't clip the shadows (where the histogram is pushed too far off the left hand side of the graph). You can use the color picker to allow negadoctor to automatically calculate any required offset. To use the color picker, select a region in the darkest lowlights, or select the entire image without including any unexposed film stock. Double-check the histogram to ensure the left part of it doesn't clip.

## corrections

This tab contains sliders which allow you to make color cast corrections within both the shadow and highlight regions.

The settings on this tab should not be needed for most well-preserved negatives and will mostly be useful for old and poorly-preserved negatives having a decayed film base that introduces undesirable color casts. Note that the shadows color cast setting will have no effect if the _scan exposure bias_ setting in the _film properties_ tab is set to a non-zero value.

The other case where these color cast corrections may be needed is if the white balance properties of the light used to scan the film negative are significantly different to the light source under which the original film camera took the shot. For example, if you illuminate the film with an LED light, but the original shot was taken under daylight, this may require some additional color cast corrections.

shadows color cast
: These three sliders allow you to correct for color casts in the shadows by adjusting the _red_, _green_ and _blue_ channels individually. Use the color picker to set the sliders automatically by selecting a neutral grey shadow region requiring correction. Because the shadows sliders can also affect highlights color casts, it is import to finish setting the shadows sliders before moving on to the highlights sliders.

highlights white balance
: These three sliders allow you to correct the white balance in the highlights by adjusting the _red_, _green_ and _blue_ channels individually. Use the color picker to set the sliders automatically by selecting a neutral grey region in the highlights that is not properly balanced.

## print properties

This tab contains settings that mimic the tonal effect of the photochemical papers that would have been used to create the hard copy image if you were not developing the photo digitally. These are creative settings, and serve a similar overall purpose to the creative tone curve settings on the _look_ tab of the [_filmic rgb_](filmic-rgb.md) module.

The _print exposure_, _paper black_, _paper grade_ and _print exposure_ are analogous to the _slope_, _offset_ and _power_ controls in the [_color balance_](color-balance.md) module (which in turn is based on the ASC CDL standard). These settings define a creative tone curve to enforce your contrast intent after the inversion, at the end of the module. The equation governing this slope/offset/power behaviour is:

_RGB_out_ = ( _RGB_in_ × _exposure_ + _black_ ) ᵍʳᵃᵈᵉ


paper black (density correction)
: For this slider, select the color picker and click and drag to select a region that encompasses only the exposed part of the film negative. If you can see unexposed film stock around the edges of your image, ensure that these areas are excluded from the drawn rectangle when calculating the _paper black_ slider setting. Paper black represents the density of the blackest silver-halide crystal available on the virtual paper. In the analog development process, this black density always results in non-zero luminance, but the digital pipeline usually expects that black should be encoded with a zero RGB value. This slider setting lets you remap paper black to pipeline black via an offset. You can use the color picker to select a region of the image that should be mapped to black in the final image.

paper grade (gamma)
: This slider is your gamma (contrast) control, and it defaults to a value of 4. If all has gone well, this value (4) minus the value of D max (from the “film properties” tab) should normally leave you with a value between 2 and 3.

paper gloss (specular highlights)
: This slider is essentially a highlights compression tool. As you drag this slider to the left, you will see in the histogram that the highlight values are being compressed (pushed to the left). Adjust this accordingly, so that your highlights are not clipped in the histogram. You can also use this to simulate a matte photo print with low-contrast highlights.

print exposure adjustment
: This slider offers one final opportunity to correct any clipping of the highlights. If you have followed all the previous instructions carefully, you shouldn't need to adjust this setting. Note that you can increase the print exposure while at the same time decreasing the paper gloss, which allows you to brighten the midtones without losing any highlights. You can use the color picker to select the brightest highlights, or select the entire image without including any unexposed film stock. This will set the exposure so that the brightest part of the selected region is not clipped. Double-check the histogram to make sure the right part of the histogram doesn't clip.

