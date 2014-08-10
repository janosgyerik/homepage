---
layout: post
title: "Find your OS X version using the command line"
categories:
- hacks
tags: []
---
{% include JB/setup %}

Using the command line is always faster than going through graphical menus and windows with mouse clicks.

To find my OS X version using graphical tools,
I have to move the mouse to the top left corner to the apple menu,
which is not an ergonomic movement with a touchpad.
Then click on the apple,
select **About This Mac**, and click.

So much easier using the command line,
especially when my hand is already on the keyboard:

    $ sw_vers
    ProductName:	Mac OS X
    ProductVersion:	10.9.4
    BuildVersion:	13E28

To get even more details:

    $ system_profiler SPSoftwareDataType
    Software:

        System Software Overview:

          System Version: OS X 10.9.4 (13E28)
          Kernel Version: Darwin 13.3.0
          Boot Volume: Macintosh HD
          Boot Mode: Normal
          Computer Name: kronos
          User Name: Janos Gyerik (janos)
          Secure Virtual Memory: Enabled
          Time since boot: 25 days 14:19
