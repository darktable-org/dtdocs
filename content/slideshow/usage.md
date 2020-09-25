---
title: Usage
id: usage
weight: 20
draft: false
author: "people"
---

The slideshow view is in an early stage of development with a basic set of features.

_+_ or _Up_
: increase delay between each image.

_-_ or _Down_
: decrease delay between each image.

_left-click_ or _right arrow_ or _shift+right arrow_
: switch to the next image of the collection.

_right-click_ or _left arrow_ or _shift+left arrow_
: switch to the previous image of the collection.

_spacebar_
: start and stop auto-advance mode which automatically switches to the next images every five seconds by default.

_ESC_
: leave slideshow mode and return to lighttable view.

Depending on the complexity of the history stack and the power of your hardware, processing an image with high resolution can take a significant amount of time. In order to minimise latencies, darktable prefetches the next image in the background. If you still experience long delays when switching between images or if you intend to quickly advance in your collection, consider disabling the option “do high quality processing for slideshow”. This allows processing to proceed at a higher speed, at the expense of a slight loss in quality.

