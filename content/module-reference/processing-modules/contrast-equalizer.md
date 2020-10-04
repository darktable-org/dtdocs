---
title: contrast equalizer
id: contrast-equalizer
applicable-verison: 3.2.1
tags: 
working-color-space:  
view: darkroom
masking: 
---

This versatile module can be used to achieve a variety of effects, such as: bloom, denoising, clarity, and local contrast enhancement. It works in the [wavelet](../../darkroom/interacting-with-modules/wavelets.md) domain and parameters can be tuned for each scale of detail separately.

# module controls

Each scale of detail can be tweaked independently. In particular, you can adjust contrast boost and denoise threshold splines for both lightness ("luma') and chromaticity (“chroma”, or color saturation), as well as the acuteness (“edges”) of the wavelet basis on each detail scale.

![contrast-equalizer](./contrast-equalizer/contrast-equalizer-1.png)

Each spline can be dragged with a proportional edit approach; use the mouse wheel to adjust the radius in which moving one control point will affect the control points either side of it. The transparent area indicates where you would drag the spline with the current mouse position and radius.  The small triangles on the x-axis can be moved to alter the horizontal positioning of the spline control points.

![contrast-equalizer-1](./contrast-equalizer/contrast-equalizer-2.png)

Drag the upper line (bright circles, here for the lightness channel) to affect local contrast. Pulling it up, as shown here, will result in a contrast boost for that scale of detail, and pulling it down will smooth out the detail at that scale. Coarser levels of detail are to the left-hand end of the graph, whereas finer levels of detail are towards the right of the graph.

---

**Note:** if the preview is zoomed in to a scale less than 100%, you may not see the effect of adjusting sliders at the fine detail end of the curve. In the background of the curve there are alternating light and dark stripes -- adjusting the curve where the background is stripy will result in visible changes to the preview, and making changes to the right of that where there are no more dark stripe will affect detail in the image that is not visible at that particular zoom level.

---

![contrast-equalizer-2](./contrast-equalizer/contrast-equalizer-3.png)

The bottom spline (with the dark control points) is used to perform denoising. It adjusts the wavelet shrinkage threshold for each frequency band. If you `Click` just above one of the small triangles, you can `Drag` up one of the control points of the denoising spline and see the effect. In this example, the noise which has been amplified by local contrast enhancement is removed.

![contrast-equalizer-4](./contrast-equalizer/contrast-equalizer-4.png)

This screen shows the effect of the edge parameter. In this example it has been pulled down to zero for all detail bands. This effectively makes it become a regular _à trous_ wavelet transform with no edge detection, and this results in the characteristic halos around sharp edges in the image. To neutralise the halo effect, increase the control points of this edge spline. Note that the edge parameter only affects the wavelet basis, not the image directly, which means it will have zero effect unless you have already made some adjustments on the contrast or denoising splines. 

![contrast-equalizer-6](./contrast-equalizer/contrast-equalizer-5.png)

Underneath the spline controls, there is a _mix_ slider which will translate the splines up or down the vertical axis. This slider was added for convenience to help you modify the overall strength of the effect without having to adjust the control points individually. It is not an actual module parameter itself; rather, when you leave darkroom mode, all changes brought about by the _mix_ slider will be directly integrated into the spline curve control point settings.

The module comes with a number of pre-defined presets to perform tasks such as adding clarity, blooms, deblurring, sharpening and denoising in vaious combinations. By studying what the shape of the curves after applying these presets, you will gain some intuitive insight into the general shape of these curves needed to achieve these different types of effects.

---

**Tip:** if you are having trouble visualising which parts of the curve will affect which details in the image, you can set the blending mode for the module to "difference". This will make the image go black excet for areas where the output of the module differs from the input. By pushing up the curve at one point, you will be able to see which details in the image are being impacted by that particular control point.

---
