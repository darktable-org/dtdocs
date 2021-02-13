---
title: contrast equalizer
id: contrast-equalizer
applicable-version: 3.2.1
tags: 
working-color-space:  
view: darkroom
masking: 
---

This versatile module can be used to achieve a variety of effects, for example, bloom, denoising, clarity, and local contrast enhancement. It works in the [wavelet](../../darkroom/processing-modules/wavelets.md) domain and parameters can be tuned independently for each wavelet detail scale. It operates in CIE LCh color space, which means that it is able to treat luminosity and chromaticity separately.

A number of presets are provided, which should give you a better understanding the full power of this module.

# module controls

Each scale of detail can be tweaked independently. In particular, you can adjust the contrast boost and denoise threshold splines for both lightness ("luma') and chromaticity (“chroma”, or color saturation), as well as tune the edge-awareness parameters (“edges”) of the wavelet transform on each detail scale. The luma, chroma and edge-awareness splines are available on separate tabs, and some examples of their use are given in the following sections.

Below the spline graphs on each tab is a _mix_ slider. This can be used to adjust how strong or weak you want the effect of the module to be. This is a not a separate setting stored within the module within it's own right -- it merely provides a convenient way to shift the control points in a coordinated way. If you leave and re-enter the module, the effect of the _mix_ setting will have been integrated into the control point positions, and the _mix_ slider will once again be at the 1.00 position.

In the background of the curve you will see a number of alternating light and dark stripes. These represent the levels of detail that are visible at your current zoom scale -- any details without these stripes are too small to be seen your current view. Adjustments to control points within the striped section _may_ produce a visible effect (depending on the strength of the adjustment). Adjustments outside of the striped region _will not_. Zoom in to see higher levels of detail and make adjustments to the detailed areas of the image visible.

---

**Tip:** if you are having trouble visualising which parts of the curve will affect which details in the image, you can set the blending mode for the module to "difference". This will make the image go black except for those areas where the output of the module differs from the input. By pushing up the curve at one of the control points, you will be able to see which details in the image are represented by that point.

---

## luma tab

The luma tab allows you to adjust the local contrast in the luminance or brightness in the image. It is represented by a white spline that starts off running across the centre of the graph (indicating that no change will be made). Raise or lower the white spline at the left end of the graph to increase or decrease the local contrast of coarse detail in the image. Perform similar adjustments towards the right side of the graph to adjust the local contrast of the fine details in the image. 

When you hover the mouse pointer over the graph, a white circle indicates the radius of influence of the mouse pointer, and this circle can be made larger or smaller with the mouse wheel. When you adjust a control point, the larger the circle, the more the control points either side will be affected by the adjustment. You will see in the background a highlighted region which shows what the spline would look like if you pushed the currently-hovered control point all the way to the top or bottom on the graph. See the screenshot below for examples of these features. For more information see the [wavelets](../../darkroom/processing-modules/wavelets.md) section.

Let's look at an example. The following image shows the default state of the contrast equalizer module before any adjustments have been made:

![contrast-equalizer-luma-orig](./contrast-equalizer/contrast-equalizer-luma-orig.png#w66)

By pushing up the two control points at the right hand end of the graph, you will make the fine details in the eye and feathers of the bird much sharper, but the contrast in the rocks in the background remains largely unaffected. The example below has been purposely exaggerated to better illustrate the effect.

![contrast-equalizer-luma-high](./contrast-equalizer/contrast-equalizer-luma-high.png#w66)

Increasing the local contrast can also amplify the luma noise in the image. A second spline located at the bottom of the graph can be used used for denoising at selected detail scales. Raise this spline (by clicking just above one of the triangles at the bottom of the graph and dragging the line upwards) to reduce noise at the given wavelet scale. On the example above the dark denoising spline has been pushed up at the fine detail end of the graph.

## chroma tab

The chroma tab allows the color contrast or saturation to be adjusted at the selected wavelet scales. In the example below are some pink flowers:

![contrast-equalizer-chroma-orig](./contrast-equalizer/contrast-equalizer-chroma-orig.png#w66)

Say you wanted to bring out the green color of the anthers at the end of the stamen in the flowers. The pink petals of the flowers are already quite saturated, but using contrast equalizer you can selectively boost the saturation on the small scale of the anthers without impacting the saturation of the petals. By pushing up the third control point from the right, you can target the saturation of the anthers only:

![contrast-equalizer-chroma-high](./contrast-equalizer/contrast-equalizer-chroma-high.png#w66)

Just like on the luma tab, the chroma tab also has a denoising spline at the bottom of the graph. This can be used to deal with chroma noise at different scales within the image. Chroma denoising can generally be more agressive on larger wavelet scales and has less effect on a smaller scale.

## edge tab

The basic wavelet _à trous_ transform has been enhanced in contrast equalizer to be "edge-aware", which can help reduce the gradient reversals and halo artifacts that the basic algorithm can produce. The _edge_ tab does not directly act on edges in an image; rather it adjusts the level of the edge awareness feature of the wavelet transform. If you have not adjusted the luma or chroma splines, adjusting the edge awareness spline will have no effect.

To see the sorts of artifacts that the edge awareness tries to combat, here is an example taken from the paper "Edge-Optimized À-Trous Wavelets for Local Contrast Enhancement with Robust Denoising" (Hanika, Damertz and Lensch 2011). In the image on the left, the edge curve was reduced to a minimum, effectively disabling the edge awareness. You can see that this results in halos. In the middle image, the edge spline was increased too much, and you can see that we get gradient reversals. The image on the right shows an image where the edge spline was placed somewhere in between the two extremes, which results in nice clean edges in the image.

![contrast-equalizer-edge](./contrast-equalizer/contrast-equalizer-edge.png#w75)

Usually the default central position of the spline is a good starting point, but if there are objectionable artifacts around the edges, this control can be helpful in mitigating them.

