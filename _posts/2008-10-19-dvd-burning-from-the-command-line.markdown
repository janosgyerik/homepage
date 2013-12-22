---
layout: post
status: publish
published: true
title: How to burn dvd using command line tools in Linux
date: 2008-10-19 13:44:00.000000000 +02:00
categories:
- Hacks
tags: []
---
In Ubuntu or Debian:
<ul>
	<li>`sudo apt-get install dvd+rw-tools`</li>
	<li>`growisofs -dvd-compat -Z /dev/scd0 -R -J -pad path_to_dir`</li>
</ul>
