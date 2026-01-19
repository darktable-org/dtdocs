---
title: hot pixels
id: hot-pixels
weight: 10
---

Automatically detect and eliminate hot pixels. 

Hot pixels are pixels which have failed to record a light level correctly. Detected hot pixels are replaced by an average of their neighbors.

# module controls

threshold
: The minimum brightness for a pixel to be considered a hot pixel candidate.

strength
: The sensitivity of detection; higher values will fix more pixels by requiring less deviation from their neighbors.

detect by 3 neighbours
: Extend the detection of hot pixels -- regard a pixel as hot if a minimum of only three (instead of four) neighbor pixels deviate by more than the threshold level.

mark fixed pixels
: Visually mark the corrected pixels on the image and display a count of hot pixels that have been fixed.
