---
layout: post
status: publish
published: true
title: How to archive and restore with cpio
date: 2008-10-03 15:25:00.000000000 +02:00
categories:
- hacks
tags: []
---
Create archive:
1. cd to the directory that you want to archive
2. `find . -xdev -print0 | cpio -oa0V | gzip &gt; path_to_save.cpio.gz`

Restore from archive:
1. cd to the directory into which you want to restore the files
2. `gzip -cd path_to_save.cpio.gz | cpio -imV`

See? Easy as abc ;-)
