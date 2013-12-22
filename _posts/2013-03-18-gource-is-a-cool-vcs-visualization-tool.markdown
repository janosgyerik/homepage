---
layout: post
status: publish
published: true
title: Gource is a cool VCS visualization tool
date: 2013-03-18 18:36:32.000000000 +01:00
categories:
- Hacks
- Software
tags: []
---
Gource is a really cool open-source software to visualize the revision history of your projects, whether you're using Git, Bazaar, Mercurial or Subversion.

<a href="https://code.google.com/p/gource/">https://code.google.com/p/gource/</a>

The project website has many cool example screenshots generated from the repositories of famous projects such as the Linux kernel or Git.

Here's what some of my projects look like in gource:

1. Revision history of <a href="http://www.bashoneliners.com/">Bash One-Liners</a>:
http://www.youtube.com/watch?v=9kLhZIlKDyM

2. Revision history of the <a href="https://play.google.com/store/apps/details?id=com.recipenotes.lite">RecipeNotes App</a>:
http://www.youtube.com/watch?v=tHq51klN42Y

To generate these videos I used the following commands on Mac OS X:

```
gource --file-idle-time 0 --seconds-per-day .3 -640x480 -o gource.ppm
ffmpeg -y -r 60 -f image2pipe -vcodec ppm -i gource.ppm -vcodec libvpx -b 10000K gource.webm
```

