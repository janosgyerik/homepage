---
layout: post
status: publish
published: true
title: Tab switching slow in Eclipse on Mac OS X
author: janos
author_login: janos
author_email: info@titan2x.com
wordpress_id: 215
wordpress_url: http://titan2x.wordpress.com/?p=215
date: 2010-09-15 20:56:14.000000000 +02:00
categories:
- Hacks
tags: []
comments: []
---
The fix:

1. Find eclipse.ini file in the Eclipse installation.

2. Edit/add the following values:
<pre>-Xms256m
-Xmx1024m
-Dosgi.requiredJavaVersion=1.6</pre>
The requiredJavaVersion=1.6 is the key, but adjusting the heap settings is probably also a good idea.
