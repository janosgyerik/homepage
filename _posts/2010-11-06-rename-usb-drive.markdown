---
layout: post
status: publish
published: true
title: How to rename USB Drive in Linux
author: janos
author_login: janos
author_email: info@titan2x.com
wordpress_id: 227
wordpress_url: http://titan2x.wordpress.com/?p=227
date: 2010-11-06 12:20:25.000000000 +01:00
categories:
- Hacks
tags: []
comments: []
---
That is, how to change the label of a USB Drive in Linux.

<a href="https://help.ubuntu.com/community/RenameUSBDrive">https://help.ubuntu.com/community/RenameUSBDrive</a>
<pre>sudo mlabel -i /dev/sdd1 ::NewLabel</pre>
