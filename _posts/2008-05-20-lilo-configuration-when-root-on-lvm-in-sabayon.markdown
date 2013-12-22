---
layout: post
status: publish
published: true
title: Lilo configuration when root on lvm in Sabayon
date: 2008-05-20 02:30:00.000000000 +02:00
categories:
- Hacks
tags: []
comments: []
---

```
image=/boot/kernel-genkernel-x86-2.6.22-sabayon
        label=gentoo
        read-only
        root=/dev/ram0
        append="dolvm2 root=/dev/ram0 ramdisk=8192 real_root=/dev/lvg/sabayon  quiet  init=/linuxrc splash=silent,theme:sabayon CONSOLE=/dev/tty1 pci=nomsi"
        initrd=/boot/initramfs-genkernel-x86-2.6.22-sabayon
```

