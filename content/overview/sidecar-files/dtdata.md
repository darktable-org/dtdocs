---
title: DTDATA sidecar files
id: dtdata
weight: 15
---

If the creation of sidecars files is enabled in [preferences > storage > XMP sidecar files](../../preferences-settings/storage.md#xmp-sidecar-files) then, in addition to [XMP sidecar files](sidecar.md), darktable will store additional data in DTDATA sidecar files. These follow the same naming convention as XMP sidecars with _.xmp_ replaced by _.dtdata_.

The DTDATA sidecar holds per-pixel edit data such as raster masks. It is only created for images that use such data, and only when sidecar writing is enabled; most images never get one. It follows the image when it is moved, duplicated or deleted using darktable.

For instance, the [external raster masks module](../../module-reference/processing-modules/external-raster.md) imports its mask into the image's `.dtdata` sidecar instead of referencing a file in a root folder. Each instance holds one imported mask. 
