---
layout: post
status: publish
published: true
title: Using XBMC with an external player
author: janos
author_login: janos
author_email: info@titan2x.com
wordpress_id: 966
wordpress_url: http://www.janosgyerik.com/?p=966
date: 2013-05-25 09:09:34.000000000 +02:00
categories:
- Hacks
- Software
tags: []
comments: []
---
First of all, <a href="http://xbmc.org/">XBMC</a> looks really awesome:

[nggallery id=5]

I'm using XBMC mainly to watch my favorite internet streams, such as <a href="http://www.ted.com/">TED</a> and <a href="http://vimcasts.org/">vimcasts</a>.

I'm not using it yet for my movie collection, because I have some issues with its built-in player:
<ul>
	<li>Adjusting the volume is not easy enough: in VLC I can just use the mouse scroll</li>
	<li>Adjusting the aspect ratio is not easy enough</li>
</ul>
Finally I figured out how to use an external player. I created a configuration file in `~/.xbmc/userdata/playercorefactory.xml` like this:

[gist id=5648461 bump=1]

This way it will use VLC for local video files only, and continue to use the built-in player for others.

For more information on hacking the configuration, <a href="http://wiki.xbmc.org/index.php?title=External_players">see the docs</a>.
