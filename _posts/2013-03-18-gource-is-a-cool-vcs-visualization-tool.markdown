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
comments:
- id: 2210
  author: trident_job
  author_email: trident_job@hotmail.com
  author_url: http://tridentjob.blogspot.com
  date: '2013-04-12 09:30:44 +0200'
  date_gmt: '2013-04-12 09:30:44 +0200'
  content: "That's quite fun :)\r\n\r\nThx for sharing this, I'm just discovering
    this software."
- id: 2355
  author: sam
  author_email: iwonderwhy5@hotmail.com
  author_url: https://github.com/whitewhidow/live-git-for-gource
  date: '2013-05-08 09:23:37 +0200'
  date_gmt: '2013-05-08 09:23:37 +0200'
  content: "hi, check out https://github.com/whitewhidow/live-git-for-gource\r\n\r\nYou
    can use it to display LIVE updates of a git repo, nice to have on a screen in
    your company's common area"
- id: 2358
  author: janos
  author_email: info@titan2x.com
  author_url: ''
  date: '2013-05-08 18:58:50 +0200'
  date_gmt: '2013-05-08 18:58:50 +0200'
  content: Wow. That sounds pretty awesome. Yup, will definitely try to get this going
    at work.
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
<pre>gource --file-idle-time 0 --seconds-per-day .3 -640x480 -o gource.ppm
ffmpeg -y -r 60 -f image2pipe -vcodec ppm -i gource.ppm -vcodec libvpx -b 10000K gource.webm</pre>
