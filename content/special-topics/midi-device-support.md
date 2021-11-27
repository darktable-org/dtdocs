---
title: midi device support
id: midi-device-support
weight: 85
draft: false
author: "people"
---

The shortcut mapping system has been most extensively tested with the Behringer X-Touch Mini and contains custom code to deal with the specific features of this device. All other devices are treated as "generic midi" and may or may not work (well) or need some manual setup each time. A configuration framework (possibly in lua) to support additional device-specific features is on the to do list.

# Behringer X-touch Mini

The device should be in Standard Mode (not MC). Layers A & B are somewhat supported, however, since the device does not send a notification when switching between layers, and since the updates to "hidden" rotors and lights (both under buttons and the pattern used around the rotors) are ignored, everything will only be updated completely after you press or turn something in the "new" layer.

The light rings around the rotors show a different pattern depending on whether the associated slider has a symmetrical +/- range centered around 0, 0-100 (or 0-1) or anything else. If linked to a drop-down (or star rating) the rotor will step one light at the time. If the drop-down has many (more than 13) items (like the blending mode drop-down), the rotor will go around twice; the first time with one light on, and the second time with two adjacent lights.

# Arturia Beatstep

Individual rotors can be configured to send absolute (0-127) values or changes (+/- 1,2,3,... in different encodings). The recommended setting is Relative #1 for all knobs with Knob Acceleration set to Slow (Off) or Medium. This can be configured with [Midi Control Center](https://www.arturia.com/support/downloads&manuals), available for Windows or MacOS. By default the darktable midi module assumes, for unknown devices, that rotors use absolute encodings. After startup it therefore needs to be told that the device is sending relative movements. You can do this by turning one of the encoders slowly left (down) 5 times. This allows the module to determine which of the several relative encodings is used. If you don't succeed switching encodings on the first attempt, you can reinitialise the input modules by pressing Ctrl+Shift+Alt+I and try again. If you still have problems, you could try [this](https://wd40.co.uk/product/fast-drying-contact-cleaner/).

If you map the Beatstep's buttons to ratings, color labels or toggle buttons, they should light up when the corresponding element is switched on.

# Behringer BCR2000 

(and possibly BCF2000)

These machines are highly configurable so there are many settings that could complicate the interaction with darktable's midi module. The [BC Manager tool](https://mountainutilities.eu/bcmanager) (available for Windows and MacOS) can be used to configure them. The easiest thing to do is to reset all encoders and buttons to their simplest settings, which can be done (for the BCR2000) using [this file](https://github.com/dterrahe/darktable/files/6539400/bcr2000.all.buttons.and.encoders.zip). You can send it to the machine with BC Manager or (under Linux) with amidi. There's also a global setting called "Deadtime" that determines how long the BCR ignores arriving messages after sending out updates. This is to avoid feedback loops, but for darktable it means that it blocks the adjustments sent back immediately after each rotor move. So Deadtime needs to be set to 0.

Once configured in this way, button and rotor lights should all work. The top row of rotors (or the only row for the BCF2000) support different light patterns (like the X-Touch Midi, with some extra options and it has 15 instead of 13 leds). However, configuring these is more complicated, and not yet implemented. It also seems to be slower, so may not be doable in real-time for each update (like it is done for the X-touch). So at the moment only the 12-dot pattern is used. For rotors linked to drop-down lists, just like on the X-touch the rotor, the light goes round twice; for the first 15 options only one light goes on, for the second 15 options, two adjacent lights will be on.

# Loupedeck 

(and Loupedeck+ but not the later non-midi devices) 

Going by the information provided [here](https://discuss.pixls.us/t/midi-controller-for-darktable/2582/92), most of the functionality of the first two loupedeck models (both midi based) should be supported, with the following exceptions and caveats:

- the Hue/Sat/Lum buttons can be mapped to the notebook tabs in the color zones module but the little lights next to them may not respond to update messages sent when the user switches tabs using the mouse, so they might get out of sync
- the 8 sliders/wheels can be individually mapped to the elements of the graph in color zones

Other than that, since the loupedeck uses Relative encoding (so is similar to the Beatstep) it will need to tell the midi module at each startup (until a configuration system has been implemented). You do this by turning any of the knobs (or wheels) slowly down/left 5 times. Re-initialise the input layer with Ctrl+Shift+Alt+I if it didn't work the first time so you can try again.

# Korg nanoKONTROL2

The device should be configured first using the Korg Kontrol Editor application to be in the CC mode and every button should be set to the Note type and Momentary button behavior. To control the lights in the buttons the LED mode should be set to External. It is important to note that the Track and the Marker buttons do not have leds in them.

There is an Kontrol Editor profile available [here](https://github.com/darktable-org/darktable/files/7603658/note_buttons.zip) which can be loaded using the Windows application to directly configure all these settings to correctly work with darktable.
