---
layout: post
title: "Fixing R error in Mac OS X: tar: Failed to set default locale"
categories:
- software
- hacks
tags: []
---
{% include JB/setup %}

When I install packages in R in Mac OS X (10.9),
I get this warning:

    tar: Failed to set default locale

In my shell I have `LANG` set to `en_US` and `LC_ALL` set to `en_US.UTF-8`.

This command seems to fix it:

    defaults write org.R-project.R force.LANG en_US.UTF-8

After restarting R, no more warnings about the default locale.
