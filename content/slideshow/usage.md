---
title: usage
id: usage
weight: 20
draft: false
author: "people"
---

The slideshow view is in an early stage of development with only a basic set of features.

```
F11                  toggle full-screen mode.

+ or                 increase delay between each image.
up arrow 

- or                 decrease delay between each image.
down arrow

left-click or        
right arrow or       switch to the next image of the collection.
shift+right arrow

right-click or       
left arrow or        switch to the previous image of the collection.
shift+left arrow

spacebar             start and stop auto-advance mode which automatically switches
                     to the next images every five seconds by default.

ESC                  leave slideshow mode and return to lighttable view.
```

Depending on the complexity of the history stack and the power of your hardware, processing an image with high resolution can take a significant amount of time. In order to minimise latencies, darktable prefetches the next image in the background. If you still experience long delays when switching between images or if you intend to quickly advance in your collection, consider disabling the option [`preferences` -> `other views` -> `slideshow` -> `do high quality processing for slideshow`](../preferences-settings/other-views.md). This allows the slideshow to proceed at a higher speed, at the expense of a slight loss in quality.

