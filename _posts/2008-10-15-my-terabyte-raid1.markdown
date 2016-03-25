---
layout: post
status: publish
published: true
title: My terabyte raid1
date: 2008-10-15 09:41:00.000000000 +02:00
categories:
- hacks
tags: []
---
My raid1 array with two 120G disks was getting filled up lately, so when usage reached 90% I decided it's time to upgrade. To my great surprise prices have gone much lower than I expected: I got two 1T disks for the same price as the old 120G disks -- $100 apiece.

It's been a long time since I setup my raid1 array so I had to read up on `man mdadm` and `mdadm --help`.

1. Created a full backup of the old disks: <br />`cd /storage; tar cvpf disk200/raid1.tar raid1`
1. Powered down the machine, replaced the disks, checked in BIOS they are recognized correctly.
1. Started up the machine, created a single primary partition on the two new disks with `cfdisk`, set the filesystem size to `1000G`. This left a few hundred MB free space at the end of the disk, a safe thing to do in my experience.
1. Created the raid1 md device: <br />`mdadm --create /dev/md0 -l1 -n2 /dev/sdc1 /dev/sde1`
1. The resyncing of two 1T disks takes time. An easy way to monitor the progress is with `watch cat /proc/mdstat`. It was more convenient for me to have a notification email sent to my mobile phone with `while cat /proc/mdstat | grep resync; do sleep 60; done; cat /proc/mdstat | mail -s mdstat titan2x@mysupersecretmobile.com`
1. Once the resync is done I created filesystem on it: <br />`mkfs.ext3 /dev/md0`
1. In `/etc/fstab` filesystems are identified by UUID, not by traditional names like `/dev/md0`. To follow this new practice I updated the UUID in `/etc/fstab` for the partition according to the output of `blkid`.
1. `mount -a` complained about `/dev/disk/by-uuid/...` missing. This is fixed by restarting udev:<br />`/etc/init.d/udev restart`
1. Mounted the partition with `mount -a`, and restored the files: <br />`cd /storage; tar xvpf disk200/raid1.tar`

