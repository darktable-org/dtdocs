---
title: grain
id: grain
weight: 10
---

{{< details summary="Technical information" class="technical-info" >}}

description
: simulate silver grains from film.

purpose
: creative.

input
: non-linear, Lab, display-referred.

processing
: non-linear, Lab.

output
: non-linear, Lab, display-referred.

{{< /details >}}

Simulate the grain of analog film. The grain is processed on the L channel of Lab color space.

# module controls

coarseness
: The grain size, scaled to simulate an ISO number.

strength
: The strength of the effect.

mid-tone bias
: The bias toward the mid-tones. As the bias increases, the grain becomes less visible in the shadows and highlights.
