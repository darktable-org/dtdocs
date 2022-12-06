---
title: rendering method
id: rendering-method
weight: 30
draft: false
author: "people"
---

Ansel can render colors either with its own internal algorithms or by using the external library LittleCMS2. Ansel's internal method is, by an order of magnitude, faster than the external one. The external option gives you a choice of the rendering intent and might offer a slightly higher accuracy in some cases.

You can change the default method in [preferences > processing > always use LittleCMS 2 to apply output color profile](../../preferences-settings/processing.md)

---

**Note:** If the given ICC is LUT-based or contains both, a LUT and a matrix, Ansel will use LittleCMS2 to render the colors regardless of the configuration parameter's value.

---
