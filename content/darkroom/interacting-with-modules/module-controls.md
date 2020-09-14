---
title: Module Controls
id: module-controls
date: 2020-09-13
draft: false
---

# Sliders

Sliders offer five different ways of interaction, depending on the level of control you need.

Left-click
: Click anywhere in the slider area to set the value. You can also click and drag to change it. You don't have to aim for the small triangle or even the line, the whole height including the label works as the active area.

Mouse wheel
: Hover over any place on the slider with your mouse, then use your mouse wheel to adjust the value step by step.

Keyboard arrow keys
: When the slider has keyboard focus you can hover over any place on the slider with your mouse, then use your keyboard's arrow keys (←/↓ and →/↑) to adjust the value stepwise. In order to give focus to the widget without changing the current value you can right-click, then right-click again.

Right-click

: When your mouse is over a slider right-click gives you a multi-functional pop-up below the slider for fine control with your mouse or numerical entry using the keyboard.

: A bent line extending from the triangular marker moves as you move your mouse. The closer your mouse pointer is to the triangular marker the coarser the control; the further away from the triangular marker the finer is your control. Left-click with your mouse to accept the new value and go back to normal control.

: Alternatively you can type in a new value using your keyboard and commit by hitting the enter key. You may even supply the new value in the form of an arithmetic expressions which darktable will calculate for you – the old value is referenced as “x”.

Double-click
: You can double-click on a slider or its label to revert to the default value.

Additionally, mouse wheel and keyboard arrow key adjustments support two ways to modify the precision of the input:

 - hold down the _Shift_ key while adjusting to increase the step size by a factor of 10. 
 - hold down the _Ctrl_ key while adjusting to decrease the step size by a factor of 10.

Both of these multipliers can be amended in the `$HOME/.config/darktablerc` file:

```
darkroom/ui/scale_rough_step_multiplier=10.0
darkroom/ui/scale_precise_step_multiplier=0.1
```

# Comboboxes

Clicking on a combobox will open a list of available options. Click on the item you want to select. Sometimes the selection list opens close to the bottom or top of the screen and only some of the items are visible; scroll with your mouse wheel to bring up the full list. Alternatively, you can also use the mouse wheel and keyboard arrow keys to select an option.

# Color Pickers

A number of modules allow parameters to be set using color pickers. These use a standard interface and most can operate in either point or area mode. Point mode can be activated by clicking on the color picker icon. Area mode can be activated by _Ctrl+clicking_ on the icon.

# Other Controls

A number of other module-specific controls are also provided. See the individual module documentation for more details.
