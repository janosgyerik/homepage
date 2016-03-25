---
layout: post
status: publish
published: true
title: How to get the mouse wheel working in vmware
date: 2008-10-03 07:07:00.000000000 +02:00
categories:
- hacks
tags: []
---
Sometimes the mouse wheel just doesn't work for me in vmware. Then I remembered I used to have to add some options for that in the X11 configuration file about 5-10 years ago. In modern native installations no such tricks should be needed, but I guess things are different when you run in vmware. So in case you ever need, the magic lines to put in `/etc/X11/xorg.conf` :
<blockquote>Option "Protocol" "IMPS/2"
Option "ZAxisMapping" "4 5"</blockquote>
