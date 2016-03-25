---
layout: post
status: publish
published: true
title: Setting default device in R in Mac OS X
date: 2013-02-08 10:01:19.000000000 +01:00
categories:
- Hacks
- software
tags: []
---
On Mac OS X, for some reason the default device for displaying plots is Quartz. This can be inconvenient, since for example the `savePlot` function works only with X11 devices with Cairo support.

To change the default device, I created `~/.Rprofile` like this:


```
`setHook(packageEvent("grDevices", "onLoad"),
    function(...) grDevices::X11.options(type='cairo'))
options(device='x11')
`
```


The `setHook` creates a hook so that when the `grDevices` module is loaded, it sets the default type of X11 devices to `cairo`.

The second line sets the default device to X11.

Both of these lines are necessary, otherwise the default device would either not be X11, or it would not be the correct X11 type.
