---
layout: post
status: publish
published: true
title: Segmentation fault with getenv in Solaris
date: 2009-04-23 05:54:00.000000000 +02:00
categories:
- hacks
tags: []
---
Had a strange issue just now. Although the value returned by `getenv` was not `NULL`, any attempts to access the memory pointed to by it resulted in segmentation fault.

The cause was the missing `#include &lt;stdio.h&gt;` line, which is pretty easy to spot if you look at the build output.
