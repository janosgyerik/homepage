---
layout: post
status: publish
published: true
title: Ubuntu crapping out on me (crypt on raid)
author: janos
author_login: janos
author_email: info@titan2x.com
wordpress_id: 24
wordpress_url: http://titan2x.wordpress.com/2008/03/19/ubuntu-crapping-out-on-me-crypt-on-raid/
date: 2008-03-19 04:23:00.000000000 +01:00
categories:
- Hacks
- Musings
tags: []
comments: []
---
Shocker. Installing Gutsy 64-bit now to replace Windows 2003 Server. The installer looked pretty good. I was impressed by the option to create software raid partitions <em>and</em> encrypted partitions. I thought to myself: it can't be this easy.

Yeap, sadly, it wasn't. Upon first boot, gutsy crapped out on me and dumped me into the rescue shell. The issue:
<blockquote>fsck.ext3: No such file or directory while trying to open /dev/mapper/md0_crypt
/dev/mapper/md0_crypt:
The superblock could not be read or does not describe a correct ext2
filesystem.  If the device is valid and it really contains an ext2
filesystem (and not swap or ufs or something else), then the superblock
is corrupt, and you might try running e2fsck with an alternate superblock:
    e2fsck -b 8193 &lt;device&gt;</blockquote>

This is precisely the same issue as this guy was seeing in debian:
<a href="http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=393728">dm-crypt on raid does not play nicely</a>

Conclusion: at the moment crypt on raid doesn't work in ubuntu/debian releases. (You can probably make it work based on the article above.)