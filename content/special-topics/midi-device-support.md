---
title: midi device support
id: midi-device-support
weight: 85
---

# introduction

MIDI is a communication protocol used by many electronic musical instruments ("pianos"), digital audio studio equipment ("control surfaces") and even dedicated "photo editing keyboards" like the Loupedeck/Loupedeck+ (but not their later products). Such devices commonly feature sets of keys/buttons and sometimes encoders (knobs/rotors) and faders (sliders). Buttons sometimes feature lights, which makes them ideal for toggling features in darktable, because the lights can reflect the current (on/off) status. Encoders and faders are ideal for use with on-screen sliders in processing modules. They can be "endless" (without a start/end point and without any markings on the knob) allowing greater than 360 degrees rotation, and they may be motorized. This is helpful when switching between images or points in the editing history since the "physical" position of the encoders/faders always corresponds to the on-screen position. You may also find a ring of LEDs around an encoder that indicates its current value.

# endless encoders; absolute / relative encoding

Besides their physical features, these devices are often highly configurable in how they send data. Encoders can send their "absolute" position when they are turned, as a value in the range 0-127. Darktable will send back the current position of the on-screen slider, which a ring of LEDs would show (if present) or a motorized fader would respond to (by moving the knob). If the encoder is endless, it can also be used at different speeds and higher resolution than just the 128 steps, with either many rotations or less than a full rotation required to move the on-screen slider between extremes.

Endless encoders without ring lights might send relative movements which can be accelerated when turning quickly. Different encoding modes can be used, and the device might come with software to configure these options. It is important that all encoders use the same settings and send on the same "channel" as the keys (ideally the first: 0 or 1). By default darktable tries to figure out which channel and encoding is used by listening to the first five messages. After starting a session you should slowly turn a knob left/down so that 5 identical one-step-down messages are sent. If this fails the input system can be reset (by pressing Ctrl+Alt+Shift+i) for another try. On success, a toast message will be shown in the middle of the screen displaying the discovered encoding mode -- 127 ("2s Complement") and 63 ("Relative Offset") are common.

# usage

If your device has been successfully configured and connected, you should see messages like "G#--1 (8) not assigned" when you press a button (the first is a musical notation code for the "tone", the second a numerical representation) or "CC1,up not assigned" when adjusting an encoder. You are now ready to assign buttons and encoders to actions. The easiest way to do this for a bunch of them in one go is to press the [visual shortcut mapping](../preferences-settings/shortcuts.md#visual-shortcut-mapping) button (to the left of the preferences button) to enter shortcut visual mapping mode. In this mode, when you hover the mouse over a button or slider, if you then press a key or turn an encoder on the MIDI device, it gets assigned as a shortcut to that widget. You can immediately test it (while staying in mapping mode) by moving the mouse to the middle of the screen (so you don’t accidentally assign it to a different widget) and then repeating the action. Right-click to switch off mapping mode.

You might also want to assign buttons to duplicate the Ctrl and Shift key functions. For this, you need the full shortcuts dialog (right-click on the shortcuts button or open [preferences](../preferences-settings/_index.md) and go to the [shortcuts](../preferences-settings/shortcuts.md) tab). In the top ("action") list, double-click on "global/modifiers". Now press the MIDI button you want to assign to Shift. Double click on "global/modifiers" again, but this time after assigning a button change the _element_ for the newly created shortcut in the bottom list from "shift" to "ctrl". Now you can use your MIDI device together with your mouse to access most of the functionality in darktable. After ticking "enable fallbacks" in the shortcuts dialog, holding Ctrl while turning an encoder will slow it down by a factor 10, whereas holding Shift speeds it up.

Several devices produced by Behringer have LEDs in a circle around their encoder knobs. These use different patterns depending on what slider or combobox they are assigned to:
- If the slider goes from -1 to +1, only the middle LED will be lit at zero. Moving negative will gradually light up the left side, moving positive will light the right side. 
- If the slider goes from 0-100%, you’ll see more LEDs coming on when moving right, until they are all lit at 100%.
- Other numeric values will use 1 or 2 LEDs to indicate intermediate values. 
- Dropdowns will use 1 LED for the options that fit on the first turn of the dial and 2 on the second turn.

# troubleshooting and configuration

If you don’t see any "not assigned" toast at the top of your screen when pressing keys or turning knobs, you’ll want to test if any other MIDI applications can see the device. Under Linux you’ll need to have Alsa installed. After plugging in the device, dmesg should show lines like these:

```
usb 1-1: new full-speed USB device number 2 using xhci_hcd
...
mc: Linux media interface: v0.10
usbcore: registered new interface driver snd-usb-audio
```

Darktable uses the simple cross-platform layer PortMidi to access the underlying OS API (Alsa, Core Midi, WinMM). If you are self-compiling, make sure you have included this library.

Starting darktable with the debug parameters `-d input` will give additional information. It should try to open up to 10 MIDI devices in the order it finds them. On the command line you might see something like this:

```
[midi_open_devices] opened midi device 'Arturia BeatStep' via 'MMSystem' as midi0
[midi_open_devices] opened midi device 'BCR2000' via 'MMSystem' as midi1
[midi_open_devices] opened midi device 'X-TOUCH MINI' via 'MMSystem' as midi2
```

Two issues can arise:

- a device you don't want to use might be opened anyway (and potentially cause inappropriate behavior, like starting a fireworks show prematurely -- see [this document](http://webcache.googleusercontent.com/search?q=cache:6EcEOjfjiAkJ:gmbh.pyropak.com/docs/downloads/surefire-prologic-digital-controller_rev2010.pdf+&cd=1&hl=en&ct=clnk&gl=us)); or
- devices might appear in a different order at the next startup (for example because they are plugged into a different usb port). Since configurations are stored with the device number only, reordering would cause an incorrect layout to be picked up.

You can fix which devices to load in a specific location and which ones to skip using the configuration parameter [preferences > miscellaneous > interface > order or exclude midi devices](../preferences-settings/miscellaneous.md#interface). To skip loading the BCR2000 in the above example and to fix the other two devices into the number 0 and 2 slots, you could set this config parameter to "`BeatStep,dontuse,X-TOUCH,-BCR2000`". This would leave the BeatStep as device midi0, always leave midi1 unused and would not load the BCR2000 at all, but if any other devices are connected, they would appear as midi3, midi4 and so on. Adding "`,-`" at the end would prevent any further devices loading.

If you just specify the configuration parameter as a single minus sign "`-`", no devices will be loaded at all.

For devices that use relative encoding as mentioned above, you’d have to perform the slow-turn-left procedure on every start-up, or add the found encoding to the configuration string. For example "`Loupedeck:127`".

Some MIDI controllers have keys with a light beneath them. These can be used to toggle settings and show the current position by having the light on or off. For this to work, darktable checks periodically (a few times a second) whether, say, the position of an on-screen toggle button has been changed, and sends messages to any linked MIDI device buttons to switch their light on or off. But if an unknown device has unintentionally been connected, this could be undesirable. So by default darktable waits until a "note" message is received _from_ a MIDI button before sending any "note" light on/off messages _back_ for that (and any lower numbered) button. That way no more buttons are addressed than exist on the device. If you immediately want all button lights to be used (rather than having to press the highest note once for each session) you can specify the number of buttons in the "order or exclude MIDI devices" preference, for example, "`BeatStep:63:16`".

# devices reported to be working

The shortcut mapping system has been most extensively tested with the Behringer devices and contains custom code to deal with their specific features. All other devices are treated as "generic midi" and may or may not work (well). If you succeed in getting a MIDI device up and running that hasn't been mentioned below, it would be greatly appreciated if you would provide feedback in order to assist others, if any special steps are required. You could do this either by submitting a documentation [pull request](https://github.com/darktable-org/dtdocs/pulls) to amend this page or by [filing an issue](https://github.com/darktable-org/dtdocs/issues) containing the necessary information.

## Behringer X-touch Mini / Compact

These devices should be in Standard Mode (not MC). Layers A & B are somewhat supported, however, since the device does not send a notification when switching between layers, and since lights (both under buttons and the pattern used around the rotors) are set based on which layer darktable believes is active, everything will only be updated completely after you press or turn something in the "new" layer. Default settings are assumed; if any have been changed they can be restored using this [X-Touch Editor](https://mediadl.musictribe.com/download/software/behringer/X-TOUCH/X-TOUCH-EDITORv1-21.zip)

## Behringer BCR2000 / BCF2000

These machines are highly configurable so there are many settings that could complicate the interaction with darktable's MIDI module. The [BC Manager tool](https://mountainutilities.eu/bcmanager) (available for Windows and MacOS) can be used to configure them. The easiest thing to do is to reset all encoders and buttons to their simplest settings, which can be done (for the BCR2000) using [this file](https://github.com/dterrahe/darktable/files/6539400/bcr2000.all.buttons.and.encoders.zip). You can send it to the machine with BC Manager or (under Linux) with amidi. There's also a global setting called "Deadtime" that determines how long the BCR ignores arriving messages after sending out updates. This is to avoid feedback loops, but for darktable it means that it blocks the adjustments sent back immediately after each rotor move. So Deadtime needs to be set to 0.

## Arturia Beatstep

Individual rotors can be configured to send absolute (0-127) values or changes (+/- 1,2,3,... in different encodings). The recommended setting is Relative #1 for all knobs with Knob Acceleration set to Slow (Off) or Medium. Then put the string `BeatStep:63:16` in [preferences > miscellaneous > interface > order or exclude midi devices](../preferences-settings/miscellaneous.md#interface). This can be configured with [Midi Control Center](https://www.arturia.com/support/downloads&manuals), available for Windows or MacOS.

## Loupedeck / Loupedeck+

Put the string `Loupedeck:127` in "preferences > miscellaneous > interface > order or exclude midi devices".

**@jenshannoschwalm** has provided a layout that can be imported in the shortcuts dialog/tab. It can be found, with documentation, here https://github.com/darktable-org/darktable/pull/12829#issuecomment-1320264833

## Korg nanoKONTROL2

The device should be configured first using the Korg Kontrol Editor application to be in the CC mode and every button should be set to the Note type and Momentary button behavior. To control the lights in the buttons the LED mode should be set to External. It is important to note that the Track and the Marker buttons do not have leds in them.

There is a Kontrol Editor profile available [here](https://github.com/darktable-org/darktable/files/7603658/note_buttons.zip), which can be loaded using the Windows application to directly configure all these settings to correctly work with darktable.
