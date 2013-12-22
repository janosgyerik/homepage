---
layout: post
status: publish
published: true
title: How to update files in /dev after editing disk partitions
date: 2008-07-01 09:04:00.000000000 +02:00
categories:
- Hacks
tags: []
comments: []
---
<ul>
	<li>After editing the partition table, to have the proper device files created under `/dev`, run: `partprobe`. (It is in `parted` package.)</li>
	<li>After creating filesystems, to have the proper files created under `/dev/disk/by-uuid`, run: `/etc/init.d/udev restart`.</li>
	<li>To find the uuid of filesystems, run: `blkid`.</li>
</ul>
This is in Ubuntu or Debian.
