---
title: supported file formats
id: supported-file-formats
draft: false
weight: 20
author: "people"
---

darktable supports a huge number of file formats from various camera manufacturers. In addition darktable can read a wide range of low- and high-dynamic-range images -- mainly for data exchange between darktable and other software.

In order for darktable to consider a file for import, it must have one of the following extensions (case independent): `3FR, ARI, ARW, BAY, BMQ, CAP, CINE, CR2, CR3, CRW, CS1, DC2, DCR, DNG, GPR, ERF, FFF, EXR, IA, IIQ, JPEG, JPG, JXL, K25, KC2, KDC, MDC, MEF, MOS, MRW, NEF, NRW, ORF, PEF, PFM, PNG, PXN, QTK, RAF, RAW, RDC, RW1, RW2, SR2, SRF, SRW, STI, TIF, TIFF, X3F`

If darktable was compiled with JPEG2000 support, the following extensions are also recognized: `J2C, J2K, JP2, JPC`.

If darktable was compiled with GraphicsMagick support, the following extensions are also recognized: `BMP, DCM, GIF, JNG, JPC, JP2, MIFF, MNG, PBM, PGM, PNM, PPM, WEBP`.

# camera raw files

darktable reads raw files using the open source library [RawSpeed](https://github.com/darktable-org/rawspeed), originally developed by Klaus Post and now maintained as part of the darktable project. The number of supported cameras and file formats is constantly increasing. Most modern camera models are supported, and new ones tend to get added very quickly. It is beyond the scope of this manual to give an exhaustive list.

With the exception of Fujifilm X-Trans cameras, darktable does not decode images from cameras with non-Bayer sensors (e.g. Sigma cameras with the Foveon X3 sensor).

# other image files

darktable natively reads “ordinary” images in JPEG, 8-bit/16-bit PNG and 8-bit/16-bit TIFF format, as well as 16-bit/32-bit floating point TIFF formats.

darktable also reads high dynamic range images in OpenEXR, RGBE and PFM formats.
