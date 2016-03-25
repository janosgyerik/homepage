---
layout: post
status: publish
published: true
title: Installing PIL on Mac OS X Snow Leopard
date: 2011-06-11 23:23:55.000000000 +02:00
categories:
- hacks
- software
tags: []
---
PIL is an image processing library for python. It is required by Django if you use ImageField.

Usually you can install python modules with easy_install module_name, but that did not work for PIL on Mac, after a quick google search it turns out this is a common issue many people have.

At the moment there was no dmg file (binary package) for python 2.6 (the version I have on the Mac). So I installed using ports.

```
sudo port selfupdate
sudo port install py26-pil
sudo port select --set python python26
```

The ugly part is that this will install a whole bunch of other stuff as dependencies, such as ncurses, tcl, tk, sqlite3, xorg-scrnsaverproto and others, even though you might have them already as standard (non-ports) packages.

And, I also had to re-install django, by going to the Django folder and the usual "sudo python setup.py install".

It all works now, so I'm happy. Btw the easy_install method worked fine at my shared hosting provider.
