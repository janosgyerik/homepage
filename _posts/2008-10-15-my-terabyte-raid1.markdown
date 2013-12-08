---
layout: post
status: publish
published: true
title: My terabyte raid1
author: janos
author_login: janos
author_email: info@titan2x.com
wordpress_id: 55
wordpress_url: http://titan2x.wordpress.com/2008/10/15/my-terabyte-raid1/
date: 2008-10-15 09:41:00.000000000 +02:00
categories:
- Hacks
tags: []
comments: []
---
<p>My raid1 array with two 120G disks was getting filled up lately, so when usage reached 90% I decided it's time to upgrade. To my great surprise prices have gone much lower than I expected: I got two 1T disks for the same price as the old 120G disks -- $100 apiece.</p>

<p>It's been a long time since I setup my raid1 array so I had to read up on <code>man mdadm</code> and <code>mdadm --help</code>.</p>

<ul>
<li>Created a full backup of the old disks: <br /><code>cd /storage; tar cvpf disk200/raid1.tar raid1</code></li>
<li>Powered down the machine, replaced the disks, checked in BIOS they are recognized correctly.</li>
<li>Started up the machine, created a single primary partition on the two new disks with <code>cfdisk</code>, set the filesystem size to <code>1000G</code>. This left a few hundred MB free space at the end of the disk, a safe thing to do in my experience.</li>
<li>Created the raid1 md device: <br /><code>mdadm --create /dev/md0 -l1 -n2 /dev/sdc1 /dev/sde1</code></li>
<li>The resyncing of two 1T disks takes time. An easy way to monitor the progress is with <code>watch cat /proc/mdstat</code>. It was more convenient for me to have a notification email sent to my mobile phone with <code>while cat /proc/mdstat | grep resync; do sleep 60; done; cat /proc/mdstat | mail -s mdstat titan2x@mysupersecretmobile.com</code></li>
<li>Once the resync is done I created filesystem on it: <br /><code>mkfs.ext3 /dev/md0</code></li>
<li>In <code>/etc/fstab</code> filesystems are identified by UUID, not by traditional names like <code>/dev/md0</code>. To follow this new practice I updated the UUID in <code>/etc/fstab</code> for the partition according to the output of <code>blkid</code>.</li>
<li><code>mount -a</code> complained about <code>/dev/disk/by-uuid/...</code> missing. This is fixed by restarting udev:<br /><code>/etc/init.d/udev restart</code></li>
<li>Mounted the partition with <code>mount -a</code>, and restored the files: <br /><code>cd /storage; tar xvpf disk200/raid1.tar</code></li>
</ul>
