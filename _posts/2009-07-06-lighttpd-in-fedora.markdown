---
layout: post
status: publish
published: true
title: How to enable public_html user homepages in lighttpd in Fedora
date: 2009-07-06 21:17:30.000000000 +02:00
categories:
- hacks
- Musings
tags: []
---
I wanted to enable user homepages in lighttpd in Fedora, that is, so that if you go to localhost/~myuser/ you can see the user's homepage which is in ~myuser/public_html directory. In many web servers it works like that by default, but inlighttpd in Fedora it does not. There is only one config file, `/etc/lighttpd/lighttpd.conf` and I searched through all options with `"user"` in them but nothing. Finally I looked at the settings on my Ubuntu box, and found the missing piece:
<blockquote>userdir.path = "public_html"</blockquote>
