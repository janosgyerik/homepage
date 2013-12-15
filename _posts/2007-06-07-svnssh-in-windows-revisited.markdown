---
layout: post
status: publish
published: true
title: svn+ssh:// in windows revisited
author: janos
author_login: janos
author_email: info@titan2x.com
wordpress_id: 15
wordpress_url: http://titan2x.wordpress.com/2007/06/07/svnssh-in-windows-revisited/
date: 2007-06-07 01:40:00.000000000 +02:00
categories:
- Hacks
tags: []
comments:
- id: 3
  author: Leslie
  author_email: ''
  author_url: ''
  date: '2007-08-15 12:20:00 +0200'
  date_gmt: '2007-08-15 12:20:00 +0200'
  content: Thanks so much for these posts, I managed to get RapidSvn up and running
    with them.
---
<p>Oh well, `SVN_SSH="c:/program files/putty/plink.exe"` didn't work very well for me for two reasons:</p>

<ul>
<li>Every time a console window would pop up, that's kind of ugly.</li>
<li>After some time it simply stopped working, somehow it could not connect to the repository server anymore, no idea why.</li>
</ul>

<p>So i downloaded TortoiseSVN for its tortoiseplink.exe file. The reason why I didn't start with this step is that I didn't want the Explorer plugin as I had bad experience with that in the past. Unfortunately the installer didn't give me the option to skip the Explorer plugin so i ended up using it anyway. Here's the new value for the SVN_SSH variable: </p>

<blockquote>"c:/program files/tortoisesvn/bin/tortoiseplink.exe"</blockquote>

<p>This has worked for me very well ever since (the past couple of weeks).</p>
