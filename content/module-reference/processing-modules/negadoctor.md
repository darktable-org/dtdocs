---
title: negadoctor
id: negadoctor
applicable-verison: 3.2.1
tags: 
working-color-space:  
view: darkroom
masking: 
---

Negadoctor allows you to process a scanned film negative. An image of the negative can be obtained using a film scanner, by being held up to a white light source like a computer screen and photographed, or by being back-lit with an off-camera flash while being photographed.

# Preparation

If the image of the film negative was obtained by photographing the negative with a digital camera, then in order to a reliable result in terms of color accuracy in the final image, you will need to take the following point into consideration:

- Ensure the white balance is correctly set up to compensate for the light source used to illuminate the negative. You can take a profiling picture of the light source with no film negative in front of it, and then use the "spot" feature in the darktable [_white balance_](white-balance.md) module obtain a reference white-balance setting. This reference white balance setting can then be made into a style or simply copy-pasted onto the images of your film nagatives.

- Apply the standard or enhanced camera matrix in the input color profile,

- Ensure the exposure is set to fully utilise the dynamic range of your camera sensor (ie. "expose-to-the-right", so that the histogram in your camera touches the right hand side without clipping the image)

When scanning or photographing your film negative, make sure you include within the captured image some unexposed part of the film. You will need this so that you can set the _Dmin_ parameter in _negadoctor_. If this is not possible (eg. your film holder completed obscures the unexposed parts of the film), you can take a separate profiling picture of an unexposed part of the film, measure the Dmin parameter on that separate profiling image, and then copy-paste that setting to the rest of the images of the film negative that you scanned/photographed.

When working with scanned/photographed film negatives, it is recommended to disable any tone mapping modules such as [_filmic / filmic rgb_](filmic-rgb.md), [_base curve_](base-curve.md) and the like.

The _working profile_ parameter in darktable's [_input color profile_](input-color-profile.md) module should be set to either _linear Rec2020 RGB_, or to an ICC profile that represents the actual color space of your film emulsion. Some examples of such ICC profiles may be found in the following forum posts:

- [https://discuss.pixls.us/t/any-interest-in-a-film-negative-feature-in-rt/12569/177](https://discuss.pixls.us/t/any-interest-in-a-film-negative-feature-in-rt/12569/177)

- [https://discuss.pixls.us/t/input-color-profile-to-use-for-negatives/20271/13](https://discuss.pixls.us/t/input-color-profile-to-use-for-negatives/20271/13)

# module controls

First, select either _color_ or _black and white_ in the dropdown menu labeled _film stock_. If you select _black and white_, any sliders relating to color only will be hidden from view, which keeps the interface simple.

Next, it is strongly recommended that you set the parameters following the order in which the GUI presents them. Start on the _film properties_ tab, working from top to bottom, then move on to the _corrections_ tab and finally the _print properties tab. The following sections describe these tabs in more detail.

## film properties

This tab contains the following basic settings. After adjusting them, you should end up with an image fairly close to the final image you would expect to see. If this is not the case, you can continue on the the _corrections_ tab afterwards.

color of the film base
: Allows you to sample an area from your scan which comprises the base film stock. This is the area just outside of the image (ie. an unexposed part of the film). When working with black and white negatives, you can leave this at its default value of white. If working on color film, click the eye dropper to the right of the color bar. This will create a bounding box which covers about 98% of your image. Then, left-click and drag across an area of your negative which only has unexposed film stock in it. This will automatically calculate values for the _D min_ slider(s). It is likely at this point that your image will still look too dark, but that's ok.

D min
: If the _film stock_ menu is set to _black and white_, this slider indicates minimum value that corresponds to your unexposed film stock. If you set _film stock_ to be _color_, then this will consist of 3 separate sliders, one for each of the red, green and blue channels.

D max
: This slider represents the dynamic range of your film, and it effectively sets our white point. Dragging this to the left will make the negative brighter. Dragging to the right will make the negative darker. If adjusting this slider manually, it's a good idea to closely watch your histogram to ensure that you don't clip the highlights (where the histogram has been pushed over too far off the right hand side of the graph). You can use the eye dropper (on the right) to allow Negadoctor to automatically calculate this value to ensure maximal use of the histogram without clipping. If using the eye dropper, left-click and drag to draw a rectangle across only the exposed parts of the neg. Don't include the unexposed film stock in the selected region, as this will skew the result.

scan exposure bias
: This slider under in the _Scanner exposure settings_ section allows us to set a black point. Dragging this to the left will make the neg brighter. Dragging to the right will make the neg darker. If adjusting this slider manually, it's a good idea to closely watch your histogram and ensure that you don't clip the shadows (where the histogram is pushed too far off the left hand side of the graph). You can use the eye dropper to allow Negadoctor to automatically calculate any needed offset.

## corrections

This tab contains sliders which allow us to make color cast corrections within both the shadow and highlight regions.

The settings on this tab should not be needed for most well-preserved negatives and will mostly be useful for old and poorly-preserved negatives having a decayed film base that introduces undesirable color casts. Note that that the shadows color cast setting will have no effect if the _scan exposure bias_ setting in the _film properties_ tab is set to a non-zero value.

The other case where these color cast corrections may be needed is if the white balance properties of the light used to scan the film negative and significantly different to the light source under which the original film camera took the shot. For example, if you illuminate the film with an LED light, but the original shot was taken under daylight, then you could require some additional color cast corrections.

shadows color cast
: these three sliders allow you to correct for color casts in the shadows by adjusting the _red_, _green_ and _blue_ channels individually. Use the eye dropper to set the sliders automatically by selecting a shadow region within the image. requiring color cast correction. Because the shadow sliders can affect color casts in the highlights, it is import to finish setting the shadows sliders first before moving on to the highlights sliders.

highlights white balance
: these three sliders allow you to correct for white balance in the highlights by adjusting the _red_, _green_ and _blue_ channels individually. Use the eye dropper to set the sliders automatically based on selecting a region in the highlights that is not properly balanced.

## print properties

This tab contains settings that will mimic the tonal effect of photochemical papers that would have been used to create the hard copy image if we were not developing the photo digitally.

paper black (density correction)
: For this slider, select the eye dropper and `Drag` to select a region that encompasses only the exposed part of the film negative. If you can see unexposed film stock around the edges of your image, ensure that these areas are excluded from the drawn rectangle when calculating the _paper black_ slider setting. Paper black represents the density of the blackest silver-halide cristal available on the virtual paper. In the analog developemnt process, this black density always results in non-zero luminance, but the digital pipeline usually expects that black should be encoded with a zero RGB value. This slider setting lets you remap paper black to pipeline black via an offset.

paper grade (gamma)
: This slider is your gamma (contrast) control, and it defaults to a value of 4. If all has gone well, this value (4) minus the value of D max (from the “Film Properties” tab) should normally leave you with a value between 2 and 3.

paper gloss (specular highlights)
: This slider is essentially a highlights compression tool. As you drag this slider to the left, you will see in the histogram that the highlight values are being compressed (pushed to the left). Adjust this accordingly, so that your highlights are not clipped in the histogram. You can also do this to simulate a matte photo print with low-contrast highlights.

print exposure adjustment
: This slider offers one final opportunity to correct any clipping of the highlights. If you have followed all the previous instructions carefully, you shouldn't need to adjust this setting. Note that you can increase the print exposure while at the same time decreasing the paper gloss, which lets you brighten the midtones without losing any highlights.

