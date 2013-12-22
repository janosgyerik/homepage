---
layout: post
status: publish
published: true
title: Installing libgtk1.2 on recent versions of Ubuntu
date: 2010-07-18 08:13:09.000000000 +02:00
categories:
- Hacks
- Musings
- Software
tags: []
---
libgtk-1.2 is very old and unmaintained software, and it has been removed from recent versions of Ubuntu and Debian. Read more here:

[http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=520441](http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=520441)

Unfortunately, lots of old games and other apps still depend on it. If you must, install it with:

```
sudo apt-add-repository ppa:adamkoczur/gtk1.2
sudo apt-get update
sudo apt-get install libgtk1.2
```

I needed this to install Darwinia, it seems it is also needed for Uplink and other games.

[http://www.introversion.co.uk/darwinia/](http://www.introversion.co.uk/darwinia/)
