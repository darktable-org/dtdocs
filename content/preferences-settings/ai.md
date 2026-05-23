---
title: AI
id: ai-preferences
weight: 135
---

This tab provides options to manage AI features and necessary models within darktable. The AI-tab of the preferences is only available if AI features have been included upon compilation see [AI in darktable](../special-topics/ai-in-dt.md). 

enable AI features
: serves as the main switch for darktables AI features such as masking, denoising and upscaling. Default: Off. 

AI acceleration
: Allows you to choose whether darktable should automatically select between CPU or GPU acceleration, or manually specify which one to use.

ONNX Runtime library 
: Allows for auto-detection or manual specification of the ONNX runtime. 

models
: manages downloading and enabling the available models for the various tasks. The models are downloaded from a [bespoke repository](https://github.com/andriiryzhkov/darktable-ai). 
