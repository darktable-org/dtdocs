---
title: Debugging
date: 2023-01-22
draft: false
weight: 100
---


Ansel is written in the C language. While C pretends to be portable (_runs the same on all operating systems_), many little things need to be contextually adapted to each OS using slightly different code. Also, depending on hardware and on the version of the dependencies, even on Linux, some discrepancies can occur between distributions.

That is to say that bugs are almost impossible to anticipate when programming, and the default state of a computer program is buggy. Reporting bugs properly is the only way to help cleaning up the unforseen pathological cases.

## What is needed to debug ?

Three things :

* the sequence of user operations that lead to the bug (doing this, clicking that, etc.),
* the nature of the bug (segmentation fault at line xxx, crash with no warning),
* the hardware and operating system used, OpenCL driver if any, Linux kernel version, etc.

## Unexpected crashes

When Ansel crashes unexpectectdly, an `ansel_bt_xxxxxx.txt` file (where `xxxxxx` is an hexadecimal identifier) is usually written in the `/tmp` directory on Linux, or in `$USER\appData\local\temp\` on Windows. When you are lucky, it will contain the exact line of the exact file of the sourcecode responsible for the crash. This needs to be reported to the developer.

## Forced crash

When you note a reproduceable crash and are lucky enough to be on Linux, you can run the program within `gdb` (it is typically already installed on most distributions, otherwise find the package providing it on yours and install it) and forcefully lead it to crash. `gdb` will usually provide more information that the backtrace file, and may also record backtraces in situations where the above method produces an empty backtrace file.

1. Start a `gdb` session, in terminal :
  * if using a self-built version, run `gdb /opt/ansel/bin/ansel`
  * if using an AppImage, run `gdb /path-to-appimage/Ansel-xxxxx-gxxxx-x86_64.AppImage`
2. Start the software with the `run` command, from the same terminal, and reproduce your faulty sequence of operations,
3. When it crashes, run `bt full > ansel_bt.log` (`bt` is for backtrace), and send the `ansel_bt.log` file just created in your home folder to the developer.

## Typical bugs

* When there is no space left on the hard drive hosting your home folder, Ansel will crash fair and square at startup with a segmentation fault.
* When your system is out-of-memory (RAM) or Ansel tries to reserve more memory than what is still available, the OS will kill Ansel fair and square, without backtrace or error message. This typically happens when processing heavy editings. It can be fixed to some extent by reducing the resources used by Ansel, in the [preferences](../preferences-settings/processing.md).

## Warnings

When starting the program in terminal, you will usually see a list of warnings linked to Gtk, like:

```bash
Gtk-WARNING **: 19:22:37.893: Theme parsing error: gtk.css:123:31: The :insensitive pseudo-class is deprecated. Use :disabled instead.
Gtk-Message: 17:18:35.117: Failed to load module  "canberra-gtk-module"
```

These can be ignored.
