---
layout: post
status: publish
published: true
title: Using XBMC with an external player
date: 2013-05-25 09:09:34.000000000 +02:00
categories:
- hacks
- software
tags: []
---
First of all, [XBMC](http://xbmc.org/) looks really awesome:

<div class="row">
  <div class="col-lg-3">
    <a class="thumbnail" href="/assets/images/screenshots/xbmc/screenshot000.png">
      <img alt="..." src="/assets/images/screenshots/xbmc/screenshot000.png">
    </a>
  </div>
  <div class="col-lg-3">
    <a class="thumbnail" href="/assets/images/screenshots/xbmc/screenshot001.png">
      <img alt="..." src="/assets/images/screenshots/xbmc/screenshot001.png">
    </a>
  </div>
  <div class="col-lg-3">
    <a class="thumbnail" href="/assets/images/screenshots/xbmc/screenshot002.png">
      <img alt="..." src="/assets/images/screenshots/xbmc/screenshot002.png">
    </a>
  </div>
  <div class="col-lg-3">
    <a class="thumbnail" href="/assets/images/screenshots/xbmc/screenshot003.png">
      <img alt="..." src="/assets/images/screenshots/xbmc/screenshot003.png">
    </a>
  </div>
</div>

I'm using XBMC mainly to watch my favorite internet streams, such as [TED](http://www.ted.com/) and [vimcasts](http://vimcasts.org/).

I'm not using it yet for my movie collection, because I have some issues with its built-in player:

- Adjusting the volume is not easy enough: in VLC I can just use the mouse scroll
- Adjusting the aspect ratio is not easy enough

Finally I figured out how to use an external player. I created a configuration file in `~/.xbmc/userdata/playercorefactory.xml` like this:

<script src="https://gist.github.com/janosgyerik/5648461.js"></script>

This way it will use VLC for local video files only, and continue to use the built-in player for others.

For more information on hacking the configuration, [see the docs](http://wiki.xbmc.org/index.php?title=External_players).
