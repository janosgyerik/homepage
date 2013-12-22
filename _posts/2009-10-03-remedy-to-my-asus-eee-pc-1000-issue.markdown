---
layout: post
status: publish
published: true
title: Remedy to my ASUS Eee PC 1000 issue
date: 2009-10-03 10:48:59.000000000 +02:00
categories:
- Hacks
- Musings
tags: []
comments: []
---
I have a major problem with the title netbook from the day I bought it. After roughly 6-8 hours overall running time, it freezes at some point randomly, with nothing interesting in `/var/log/messages` or anywhere else. It runs Easy Peasy btw.

I stumbled upon a remedy by chance. If I turn off wireless networking when I'm not connected, it doesn't seem to freeze. Although it's a little bit annoying to switch wireless on and off when I work in different places, it's far better than the frequent freezes. I wonder what is the underlying problem, but it's not really worth the time and effort to properly debug it.
