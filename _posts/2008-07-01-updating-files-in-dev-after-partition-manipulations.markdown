---
layout: post
status: publish
published: true
title: How to update files in /dev after editing disk partitions
author: janos
author_login: janos
author_email: info@titan2x.com
wordpress_id: 43
wordpress_url: http://titan2x.wordpress.com/2008/07/01/updating-files-in-dev-after-partition-manipulations/
date: 2008-07-01 09:04:00.000000000 +02:00
categories:
- Hacks
tags: []
comments: []
---
<ul>
	<li>After editing the partition table, to have the proper device files created under <code>/dev</code>, run: <code>partprobe</code>. (It is in <code>parted</code> package.)</li>
	<li>After creating filesystems, to have the proper files created under <code>/dev/disk/by-uuid</code>, run: <code>/etc/init.d/udev restart</code>.</li>
	<li>To find the uuid of filesystems, run: <code>blkid</code>.</li>
</ul>
<div>This is in Ubuntu or Debian.</div>
