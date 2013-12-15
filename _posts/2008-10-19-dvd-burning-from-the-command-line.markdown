---
layout: post
status: publish
published: true
title: How to burn dvd using command line tools in Linux
author: janos
author_login: janos
author_email: info@titan2x.com
wordpress_id: 57
wordpress_url: http://titan2x.wordpress.com/2008/10/19/dvd-burning-from-the-command-line/
date: 2008-10-19 13:44:00.000000000 +02:00
categories:
- Hacks
tags: []
comments: []
---
In Ubuntu or Debian:
<ul>
	<li>`sudo apt-get install dvd+rw-tools`</li>
	<li>`growisofs -dvd-compat -Z /dev/scd0 -R -J -pad path_to_dir`</li>
</ul>
