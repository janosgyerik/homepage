---
layout: post
status: publish
published: true
title: How to set up Japanese input in Ubuntu
date: 2010-12-06 00:29:23.000000000 +01:00
categories:
- Hacks
tags: []
---
The official documentation is here, but incomplete:
[https://help.ubuntu.com/community/JapaneseInput](https://help.ubuntu.com/community/JapaneseInput)

A couple of steps are missing, this is how I did it in Ubuntu 10.10.

1. `sudo apt-get install anthy ibus-anthy`
1. Go to **System / Preferences / Keyboard Input Methods**
1. It asked me **twice** if I want to start the ibus service. Probably some bug, just say **Yes**.
1. Go to **Input Method** tab
1. Select **Anthy** from the **Select an input method** drop-down menu

After this you should be able to switch between Japanese/English input with `Control + Space`.

To make this permanent, you need to set one more thing:

1. Go to **System / Administration / Language Support**
1. Set **Keyboard input method system** to `ibus`

