---
layout: post
status: publish
published: true
title: Setting default device in R in Mac OS X
author: janos
author_login: janos
author_email: info@titan2x.com
wordpress_id: 876
wordpress_url: http://www.janosgyerik.com/?p=876
date: 2013-02-08 10:01:19.000000000 +01:00
categories:
- Hacks
- Software
tags: []
comments: []
---
On Mac OS X, for some reason the default device for displaying plots is Quartz. This can be inconvenient, since for example the <code>savePlot</code> function works only with X11 devices with Cairo support.

To change the default device, I created <code>~/.Rprofile</code> like this:

<pre><code>setHook(packageEvent("grDevices", "onLoad"),
    function(...) grDevices::X11.options(type='cairo'))
options(device='x11')
</code></pre>

The <code>setHook</code> creates a hook so that when the <code>grDevices</code> module is loaded, it sets the default type of X11 devices to <code>cairo</code>.

The second line sets the default device to X11.

Both of these lines are necessary, otherwise the default device would either not be X11, or it would not be the correct X11 type.
