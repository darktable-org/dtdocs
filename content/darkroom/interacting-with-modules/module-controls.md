---
title: module controls
id: module-controls
weight: 40
draft: false
---

# sliders

Sliders offer five different methods of interaction, depending on the level of control you require.

left-click
: Click anywhere in the slider area to set the value. You can also click and drag to change it. You don't have to aim for the triangle or even the line - you can click anywhere in the entire height of the slider including the label.

mouse wheel
: Hover over the slider with your mouse, then use your mouse wheel to adjust the value.

keyboard arrow keys
: When the slider has focus you can hover over the slider with your mouse, then use your keyboard's arrow keys (←/↓ and →/↑) to adjust the value. In order to give focus to the widget without changing the current value you can right-click, then right-click again.

right-click
: When your mouse is over a slider right-clicking enables a multi-functional pop-up below the slider for fine control with your mouse or numerical entry using the keyboard.

: ![bauhaus](./module-controls/bauhaus.png)

: A bent line extending from the triangular marker moves with your mouse. The closer your mouse pointer is to the triangular marker the coarser the control you have over the value; the further away from the triangular marker the finer your control. Left-click with your mouse to accept the new value and and hide the pop-up.

: Alternatively you can type in a new value using your keyboard and commit by hitting the enter key. You may even supply the new value in the form of an arithmetic expression which darktable will calculate for you – the previous value is referenced as “x”.

double-click
: You can double-click on a slider or its label to reset to the default value.

In addition, the precision of mouse-wheel and arrow key-adjustments can be altered:

 - hold down the `Shift` key while adjusting to _increase_ the step size by a factor of 10. 
 - hold down the `Ctrl` key while adjusting to _decrease_ the step size by a factor of 10.

Both of these multipliers can be amended in the `$HOME/.config/darktablerc` file:

```
darkroom/ui/scale_rough_step_multiplier=10.0
darkroom/ui/scale_precise_step_multiplier=0.1
```

# comboboxes

Click on a combobox to open a list of available options which you can click to select. Occasionally the selection list will open close to the bottom or top of the screen meaning that only some of the items are visible -- simply scroll with your mouse wheel to bring up the full list. Alternatively, you can also use the mouse wheel and keyboard arrow keys to select an option.

# color pickers

A number of modules allow parameters to be set using color pickers (identified by the ![color-picker](./module-controls/color-picker.png) icon). These use a standard interface and most can operate in either point or area mode. Point mode can be activated by `clicking` on the color picker icon. Area mode can be activated by `Ctrl+clicking` on the icon.

# keyboard shortcuts

Module parameters can also be amended with keyboard shortcuts. See [`preferences` -> `shortcuts`](../../preferences-settings/shortcuts.md) for more information.
