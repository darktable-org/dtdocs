---
title: output color profile
id: output-color-profile
weight: 10
---

{{< details summary="Technical information" class="technical-info" >}}

description
: convert pipeline reference RGB to any display RGB using color profiles to remap RGB values.

purpose
: mandatory.

input
: linear or non-linear, Lab, display-referred.

processing
: defined by profile.

output
: non-linear, RGB or Lab, display-referred.

{{< /details >}}

Manage the output profile for export and the rendering intent to be used when mapping between color spaces.

darktable comes with pre-defined profiles _sRGB_, _Adobe RGB_, _XYZ_ and _linear RGB_. You can provide additional profiles by placing them in `$DARKTABLE/share/darktable/color/out` (where `$DARKTABLE` is the darktable installation directory) or `color/out` in the darktable [configuration directory](../../preferences-settings/config-directory.md). Note that these `color/out` directories are not created by the darktable install; if you need to use one, you must create it yourself.

The output color profile may also be defined within the [export](../utility-modules/shared/export.md) module.

# module controls

output intent
: The rendering intent for output/export. Rendering intent can only be selected when using LittleCMS2 to apply the output color profile (this can be changed in [preferences > processing](../../preferences-settings/processing.md)). If darktable's internal rendering routines are used, this option is hidden. For more details see [rendering intent](../../special-topics/color-management/rendering-intent.md).

output profile
: The profile used to render colors for output/export. The profile data will be embedded into the output file (if supported by the file format) allowing other applications to correctly interpret its colors. As not all applications are aware of color profiles, the general recommendation is to stick to sRGB unless you know what you are doing and have a good reason to do otherwise.

# HDR output

The _PQ Rec2020_, _PQ P3_, _HLG Rec2020_ and _HLG P3_ profiles produce HDR images, for display on HDR screens. They use the PQ (SMPTE ST 2084) and HLG (ARIB STD-B67) transfer functions of Rec. ITU-R BT.2100, together with Rec2020 or Display P3 primaries. To keep their brightness and color, export them in a format that can carry them with enough precision, such as 10-bit or higher AVIF, HEIF, JPEG XL or 16-bit PNG.

darktable maps a pipeline value of 1.0 (display white for SDR output) to the HDR "reference white" of 203 nits, as recommended by Rec. ITU-R BT.2408, so mid-tones look as bright as in an SDR export. Values above 1.0 are highlights brighter than reference white:

-   PQ can encode up to 10000 nits. The brightest highlights reach the _PQ peak_ set in the [_export_](../utility-modules/shared/export.md) module (default 1000 nits).
-   HLG is converted for a nominal 1000 nit display, so highlights reach at most 1000 nits, about 4.9 times reference white.

The ratio between the peak of the output and reference white is the _headroom_ of the output. The [_AgX_](./agx.md#hdr-output) and [_sigmoid_](./sigmoid.md) tone mappers follow it, so that a single edit can be exported to SDR, HLG and PQ without changes.
