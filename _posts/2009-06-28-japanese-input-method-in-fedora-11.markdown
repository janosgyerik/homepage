---
layout: post
status: publish
published: true
title: How to set up Japanese input method in Fedora 11
date: 2009-06-28 16:18:42.000000000 +02:00
categories:
- hacks
- software
tags: []
---
It's great that these things keep getting easier. I used to have to tweak .gnomerc and .uim files and running uim-xim at startup... Probably that's a thing of the past. Here's how you do it the modern way.
<blockquote>yum install scim-lang-japanese</blockquote>
Next, go to *System | Preferences | Input Method*. This brings up the *IM Chooser* dialog. I selected IBus because it was marked recommended. Then in *Input Method Preferences*, and choose the *Input Methods* tab and select the input methods you want. That's it! You can swith to Japanese input with Ctrl - Space.
