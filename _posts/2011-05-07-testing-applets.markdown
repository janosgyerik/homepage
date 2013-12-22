---
layout: post
status: publish
published: true
title: Testing applets without a browser
date: 2011-05-07 20:58:19.000000000 +02:00
categories:
- Hacks
tags: []
comments: []
---
I don't like applets. They are troublesome and slow. But that doesn't change the fact that sometimes I still have to work with it.

I was having some difficulties testing an applet in Chrome. At first the Java Console came up when I clicked on the failing applet, but then it disappeared and I could not bring it back. It also takes ages to load applets, very inconvenient for debugging.

Luckily there is a way to test applets without a browser, with the appletviewer command line tool:
<pre>appletviewer applet.html</pre>
It's not perfect though, because the environment can be very different when you run the applet from the command line and when it is executed in a browser. So after testing outside a browser you probably have no choice but to repeat your tests in a browser too.
