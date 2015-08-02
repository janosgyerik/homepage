---
layout: post
title: "Setting hostname in OSX"
categories:
- hacks
tags: []
---
{% include JB/setup %}

Setting the hostname in OSX:

    sudo scutil --set HostName larryx.local

Getting the hostname:

    scutil --get HostName
