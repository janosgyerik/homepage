---
layout: post
status: publish
published: true
title: How to convert and mount daa format files with wine
date: 2008-10-17 09:28:00.000000000 +02:00
categories:
- hacks
tags: []
---
Downloaded a bunch of c++ books but the files were in DAA format. Found a neat utility called daa2iso developed by some dude, but it didn't work. The only alternative at the moment was PowerISO, a windows tool. I thought it's time to give `wine` a shot. And it worked brilliantly too.

1. Installed `wine` (didn't have it yet)
1. Ran: `wine PowerISO38.exe`. A window popped up, looking like a regular windows installation, went along with it, installed it in "Program Files", not even knowing what that means in `wine`. The installer complained at the end, but decided to ignore for now.
1. Ran: `wine ~/.wine/drive_c/Program Files/PowerISO/PowerISO.exe` and behold, it just worked. Located the daa file and extracted it into my usual books folder.
1. Felt like it's time for a different kind of wine, to celebrate ;-)

