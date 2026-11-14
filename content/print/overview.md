---
title: overview
id: overview
weight: 10
---

This view allows you to print your images. Because printing is not easy, there are many technical aspects to be taken into account.

After selecting an image in the [lighttable view](../lighttable/_index.md) you can enter the [print settings](../module-reference/utility-modules/print/print-settings.md) module to adjust printer settings and initiate printing.

This module supports the printer's ICC profile, which is somewhat mandatory if you want to obtain a high quality print close to the image displayed on the screen.

It is important to note that ICC profiles provided by the paper and/or printer manufacturers cannot be used on GNU/Linux as they are printer-driver dependent. On Linux and macOS, the darktable print module uses CUPS and there are no ready-to-use ICC profiles available for this driver.

On Windows, paper specific ICC profiles from paper manufacturers should work as expected. Always run a test print to confirm output is as desired.
