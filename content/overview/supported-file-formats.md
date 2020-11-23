---
title: supported file formats
id: supported-file-formats
draft: false
weight: 20
author: "people"
---

darktable supports a huge number of file formats from various camera manufacturers. In addition darktable can read specific low dynamic range and high dynamic range images – mainly for data exchange between darktable and other software.

In order for darktable to consider a file for import, it must have one of the following extensions (case independent): `3FR, ARI, ARW, BAY, BMQ, CAP, CINE, CR2, CRW, CS1, DC2, DCR, DNG, GPR, ERF, FFF, EXR, IA, IIQ, JPEG, JPG, K25, KC2, KDC, MDC, MEF, MOS, MRW, NEF, NRW, ORF, PEF, PFM, PNG, PXN, QTK, RAF, RAW, RDC, RW1, RW2, SR2, SRF, SRW, STI, TIF, TIFF, X3F`

If darktable was compiled with JPEG2000 support, these extensions are also recognized: `J2C, J2K, JP2, JPC`.

If darktable was compiled with GraphicsMagick support, the following extensions are recognized in addition to the standard ones: `BMP, DCM, GIF, JNG, JPC, JP2, MIFF, MNG, PBM, PGM, PNM, PPM`.

# camera raw files

darktable reads raw files using the open source library [RawSpeed](https://github.com/darktable-org/rawspeed), originally developed by Klaus Post and now maintained as part of the darktable project. The number of supported cameras and file formats is constantly increasing. Most modern camera models are supported, and new ones tend to get added very quickly. It is beyond the scope of this manual to give an exhaustive list.

With the exception of Fujifilm X-Trans cameras, darktable does not decode images from cameras with non-Bayer sensors (e.g. Sigma cameras with the Foveon X3 sensor).

# other image files

darktable natively reads “ordinary” images in JPEG, 8-bit/16-bit PNG and 8-bit/16-bit TIFF format, as well as 16-bit/23-bit floating poing TIFF formats. JPEG2000 is also supported if the required libraries are present at compile time. Similarly, if darktable was compiled with GraphicsMagick support, there are further supported formats, such as GIF, Dicom DCM, additional "exotic" TIFF formats, and some of Sun's “portable xyz-map” family.

darktable also reads high dynamic range images in OpenEXR, RGBE and PFM formats.

