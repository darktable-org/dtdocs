---
title: Formats de fichier supprotés
id: supported-file-formats
draft: false
weight: 20
author: "people"
---

Darktable supporte un grand nombre de formats de fichiers de divers fabricants de caméras. En outre, darktable peut lire des images spécifiques à faible plage dynamique et à haute plage dynamique – principalement pour l’échange de données entre darktable et d’autres logiciel.

Pour que Darktable puisse considérer un fichier brut pour l’importation, celui-ci doit avoir l’une des extensions suivantes (case independent): `3FR, ARI, ARW, BAY, BMQ, CAP, CINE, CR2, CRW, CS1, DC2, DCR, DNG, GPR, ERF, FFF, EXR, IA, IIQ, JPEG, JPG, K25, KC2, KDC, MDC, MEF, MOS, MRW, NEF, NRW, ORF, PEF, PFM, PNG, PXN, QTK, RAF, RAW, RDC, RW1, RW2, SR2, SRF, SRW, STI, TIF, TIFF, X3F`

Si Darktable a été compilé avec le support JPEG2000, les extensions suivantes sont également reconnues: `J2C, J2K, JP2, JPC`.

Si Darktable a été compilé avec le support GraphicsMagick, les extensions suivantes sont reconnues en plus des extensions standard: `BMP, DCM, GIF, JNG, JPC, JP2, MIFF, MNG, PBM, PGM, PNM, PPM`.

# Fichiers bruts de boitier

darktable lit les fichiers bruts en utilisant la bibliothèque open source [RawSpeed](https://github.com/darktable-org/rawspeed), initialement développé par Klaus Post. Maintenant maintenu dans le cadre du projet darktable. Le nombre de boitiers et de formats de fichiers pris en charge est en constante augmentation. La plupart des modèles d'appareils photo modernes sont pris en charge et les nouveaux ont tendance à être ajoutés très rapidement. Il est cependant impossible dans ce manuel de donner une liste exhaustive.

À l'exception des appareils photo Fujifilm X-Trans, darktable ne décode pas les images de boitiers dotés de capteurs non Bayer (par exemple, les appareils photo Sigma dotés du capteur Foveon X3).

# Autres fichiers images

darktable lit nativement les images «ordinaires» au format JPEG, PNG 8 bits / 16 bits et TIFF 8 bits / 16 bits, ainsi que les formats TIFF flottant 16 bits / 23 bits. Le format JPEG2000 est également pris en charge si les bibliothèques requises sont présentes au moment de la compilation. De même, si darktable a été compilé avec la prise en charge de GraphicsMagick, il existe d'autres formats pris en charge, tels que GIF, Dicom DCM, des formats TIFF "exotiques" supplémentaires et une partie de la famille de "xyz-map" de Sun.

darktable lit également les images à plage dynamique élevée (HDR) aux formats OpenEXR, RGBE et PFM.
