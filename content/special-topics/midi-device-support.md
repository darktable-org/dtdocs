---
title: midi device support
date: 2022-12-04T02:19:02+01:00
id: midi-device-support
weight: 85
draft: false
author: "people"
---

The shortcut mapping system has been most extensively tested with the Behringer X-Touch Mini and contains custom code to deal with the specific features of this device. All other devices are treated as "generic midi" and may or may not work (well) or need some manual setup each time. A configuration framework (possibly in lua) to support additional device-specific features is on the to do list.

If you succeed in getting a midi device up and running that hasn't been mentioned below, it would be greatly appreciated if you would provide feedback in order to assist others, if any special steps are required. You could do this either by submitting a documentation [pull request](https://github.com/darktable-org/dtdocs/pulls) to amend this page or by [filing an issue](https://github.com/darktable-org/dtdocs/issues) containing the necessary information. Alternatively you could read or respond to any of the (closed) midi or "inputng" [issues](https://github.com/darktable-org/darktable/issues) or [pull requests](https://github.com/darktable-org/darktable/pulls) in the main darktable repository if you need additional help or guidance yourself.

## Behringer X-touch Mini

The device should be in Standard Mode (not MC). Layers A & B are somewhat supported, however, since the device does not send a notification when switching between layers, and since the updates to "hidden" rotors and lights (both under buttons and the pattern used around the rotors) are ignored, everything will only be updated completely after you press or turn something in the "new" layer.

The light rings around the rotors show a different pattern depending on whether the associated slider has a symmetrical +/- range centered around 0, 0-100 (or 0-1) or anything else. If linked to a drop-down (or star rating) the rotor will step one light at the time. If the drop-down has many (more than 13) items (like the blending mode drop-down), the rotor will go around twice; the first time with one light on, and the second time with two adjacent lights.

## Arturia Beatstep

Individual rotors can be configured to send absolute (0-127) values or changes (+/- 1,2,3,... in different encodings). The recommended setting is Relative #1 for all knobs with Knob Acceleration set to Slow (Off) or Medium. This can be configured with [Midi Control Center](https://www.arturia.com/support/downloads&manuals), available for Windows or MacOS. By default the darktable midi module assumes, for unknown devices, that rotors use absolute encodings. After startup it therefore needs to be told that the device is sending relative movements. You can do this by turning one of the encoders slowly left (down) 5 times. This allows the module to determine which of the several relative encodings is used. If you don't succeed switching encodings on the first attempt, you can reinitialise the input modules by pressing Ctrl+Shift+Alt+I and try again. If you still have problems, you could try [this](https://wd40.co.uk/product/fast-drying-contact-cleaner/).

If you map the Beatstep's buttons to ratings, color labels or toggle buttons, they should light up when the corresponding element is switched on.

## Behringer BCR2000

(and possibly BCF2000)

These machines are highly configurable so there are many settings that could complicate the interaction with darktable's midi module. The [BC Manager tool](https://mountainutilities.eu/bcmanager) (available for Windows and MacOS) can be used to configure them. The easiest thing to do is to reset all encoders and buttons to their simplest settings, which can be done (for the BCR2000) using [this file](https://github.com/dterrahe/darktable/files/6539400/bcr2000.all.buttons.and.encoders.zip). You can send it to the machine with BC Manager or (under Linux) with amidi. There's also a global setting called "Deadtime" that determines how long the BCR ignores arriving messages after sending out updates. This is to avoid feedback loops, but for darktable it means that it blocks the adjustments sent back immediately after each rotor move. So Deadtime needs to be set to 0.

Once configured in this way, button and rotor lights should all work. The top row of rotors (or the only row for the BCF2000) support different light patterns (like the X-Touch Midi, with some extra options and it has 15 instead of 13 leds). However, configuring these is more complicated, and not yet implemented. It also seems to be slower, so may not be doable in real-time for each update (like it is done for the X-touch). So at the moment only the 12-dot pattern is used. For rotors linked to drop-down lists, just like on the X-touch the rotor, the light goes round twice; for the first 15 options only one light goes on, for the second 15 options, two adjacent lights will be on.

## Loupedeck

(and Loupedeck+ but not the later non-midi devices)

Going by the information provided [here](https://discuss.pixls.us/t/midi-controller-for-darktable/2582/92), most of the functionality of the first two loupedeck models (both midi based) should be supported, with the following exceptions and caveats:

- the Hue/Sat/Lum buttons can be mapped to the notebook tabs in the color zones module but the little lights next to them may not respond to update messages sent when the user switches tabs using the mouse, so they might get out of sync
- the 8 sliders/wheels can be individually mapped to the elements of the graph in color zones

Other than that, since the loupedeck uses Relative encoding (so is similar to the Beatstep) it will need to tell the midi module at each startup (until a configuration system has been implemented). You do this by turning any of the knobs (or wheels) slowly down/left 5 times. Re-initialise the input layer with Ctrl+Shift+Alt+I if it didn't work the first time so you can try again.

## Korg nanoKONTROL2

The device should be configured first using the Korg Kontrol Editor application to be in the CC mode and every button should be set to the Note type and Momentary button behavior. To control the lights in the buttons the LED mode should be set to External. It is important to note that the Track and the Marker buttons do not have leds in them.

There is an Kontrol Editor profile available [here](https://github.com/darktable-org/darktable/files/7603658/note_buttons.zip) which can be loaded using the Windows application to directly configure all these settings to correctly work with darktable.

## additional midi configuration

If darktable is compiled with portmidi it will at startup try to open up to 10 midi devices in the order it finds them. On the command line you might see something like this:

```
[midi_open_devices] opened midi device 'Arturia BeatStep' via 'MMSystem' as midi0
[midi_open_devices] opened midi device 'BCR2000' via 'MMSystem' as midi1
[midi_open_devices] opened midi device 'X-TOUCH MINI' via 'MMSystem' as midi2
```

Two issues can arise:

- a device you don't want to use might be opened anyway (and potentially cause inappropriate behavior, like starting a fireworks show prematurely (see [this document](http://webcache.googleusercontent.com/search?q=cache:6EcEOjfjiAkJ:gmbh.pyropak.com/docs/downloads/surefire-prologic-digital-controller_rev2010.pdf+&cd=1&hl=en&ct=clnk&gl=us)), or
- devices might appear in a different order at the next startup (for example because they are plugged into a different usb port). Since configurations are stored with the device number only, reordering would cause an incorrect layout to be picked up.

You can specify which devices to explicitly load in a specific location and which ones to skip using the configuration parameter [preferences > miscellaneous > interface > order or exclude midi devices](../preferences-settings/miscellaneous.md#interface). To skip loading the BCR2000 in the above example and to fix the other two devices into the number 0 and 2 slots, you could set this config parameter to "`BeatStep;dontuse;X-TOUCH;-BCR2000`". This would leave the BeatStep as device midi0, always leave midi1 unused and would not load the BCR2000 at all, but if any other devices are connected, they would appear as midi3, midi4 and so on. Adding "`;-`" at the end would prevent any further devices loading. Or, if you just specify the configuration parameter as a single minus sign "`-`", no devices will be loaded at all.

Midi controller knobs can use several different "encodings". The default, absolute, sends a value from 0 (all the way left) to 127 (all the way right) -- sliders can also use absolute encoding. Relative encoders send a "down" value if you turn them left and an "up" value if you turn them right. So slowly turning one of those "up" would send "1, 1, 1, 1," for example. But depending on how many bits are used and what encoding, a slow left turn might be 127 (8 bits -1) or 63, 31 or 15. Or even 65. If nothing is specified in this preference option, midi devices are assumed to use absolute encoding. But if the first five messages received are identical, it is assumed that the user has slowly turned a knob left/down and the encoding is deduced from that and displayed in a toast. The encoding is not remembered for each device, so this maneuver needs to be repeated at each startup. To define the deduced encoding for the next startup you can add this parameter to the "order or exclude midi devices" setting. For example "`Loupedeck:127`".

Some midi controllers have keys with a light beneath them. These can be used to toggle settings and show the current position by having the light on or off. In this case, darktable checks periodically (a few times a second) whether, say, the position of an on-screen toggle button has been changed, and sends messages to any linked midi device buttons to switch their light on or off. But if an unknown device has unintentionally been connected, this could be undesirable. So by default darktable waits until a "note" message is received from a midi button before sending any "note" light on/off messages back for that button. That way also no more buttons are addressed than exist on the device. If you immediately want all button lights to be used (rather than having to press the highest note once for each session) you can specify the number of buttons in the "order or exclude midi devices" preference, for example, "`BeatStep:63:16`".
