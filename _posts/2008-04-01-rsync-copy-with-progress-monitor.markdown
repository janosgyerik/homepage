---
layout: post
status: publish
published: true
title: rsync - copy with progress monitor
date: 2008-04-01 06:21:00.000000000 +02:00
categories:
- Hacks
- software
tags: []
---
I always wanted to see the progress of a `cp` command. For example it can be quite frustrating when you copy huge files like VMware machines and the screen doesn't show anything for long minutes or hours. I really should get my ass up and learn how to use `rsync`, but for the time being simply copying files with progress monitor is good enough.

These are two equivalent ways of recursively copying a directory.

<blockquote>rsync -av path/dir1/ path/dir1 --progress</blockquote>
<blockquote>rsync -av path/dir1 path --progress</blockquote>
