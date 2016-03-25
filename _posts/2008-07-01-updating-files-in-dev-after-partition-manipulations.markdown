---
layout: post
status: publish
published: true
title: How to update files in /dev after editing disk partitions
date: 2008-07-01 09:04:00.000000000 +02:00
categories:
- hacks
tags: []
---

1. After editing the partition table, to have the proper device files created under `/dev`, run: `partprobe`. (It is in `parted` package.)
1. After creating filesystems, to have the proper files created under `/dev/disk/by-uuid`, run: `/etc/init.d/udev restart`.
1. To find the uuid of filesystems, run: `blkid`.

This is in Ubuntu or Debian.
