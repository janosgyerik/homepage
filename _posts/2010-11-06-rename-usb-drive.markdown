---
layout: post
status: publish
published: true
title: How to rename USB Drive in Linux
date: 2010-11-06 12:20:25.000000000 +01:00
categories:
- Hacks
tags: []
---
That is, how to change the label of a USB Drive in Linux.

<a href="https://help.ubuntu.com/community/RenameUSBDrive">https://help.ubuntu.com/community/RenameUSBDrive</a>

```
sudo mlabel -i /dev/sdd1 ::NewLabel
```

