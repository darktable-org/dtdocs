---
title: bloom
id: bloom
weight: 10
---

{{< details summary="Technical information" class="technical-info" >}}

description
: apply Orton effect for a dreamy ethereal look.

purpose
: creative.

input
: non-linear, Lab, display-referred.

processing
: non-linear, Lab.

output
: non-linear, Lab, display-referred.

{{< /details >}}

Create a soft bloom effect. 

This module works by blurring the highlights and then blending the result with the original image.

---

_**Note:** This module performs blurs in Lab color space, and is no longer recommended. Instead, use the scene referred alternatives [diffuse or sharpen](./diffuse.md) module or the [blurs](./blurs.md) module, if needed fine tuned with a mask._

---

# module controls

size
: The spatial extent of the bloom effect.

threshold
: The threshold for the brightness increase.

strength
: The strength of the overlighting.
