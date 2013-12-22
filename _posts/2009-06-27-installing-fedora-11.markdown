---
layout: post
status: publish
published: true
title: Installing Fedora 11
date: 2009-06-27 14:04:37.000000000 +02:00
categories:
- Musings
- Software
tags: []
---
My hard disk started showing signs of slow and painful death, so after I backed up all my data I confirmed with smartctl that yes, it's dying.
<blockquote>smartctl -t long /dev/sda smartctl -a /dev/sda</blockquote>
This looked like a good opportunity to try something new, at least Kubuntu instead of Ubuntu. So I went for the much celebrated Fedora 11.

### The live CD

My half-broken hard disk was still in the computer when I started the Live CD and Fedora scored some plus point for showing a warning about the disk, and a very cool GUI for the smartctl self tests. Next I replaced the hard disk with two new ones, and started the Live CD again and wanted to use the fancy GUI for smartctl. I looked through the menus, the Gnome applets but couldn't find it. Wonder where it is, it's a shame to hide this superb tool in a dusty corner. So I did the smartctl the *old* way. (By now I know where it is: Applications / System Tools / Palimpsest Disk Utility.) Then I had some MAJOR problems with the disk partitioner. I have two disks of the same size and I used to have them in a software RAID1, but that's not what I intended for this time. The installer's partitioner oddly showed me only one disk, and with an odd name. It looked like some kind of mirroring setup, so I checked `/proc/mdstat` and `lvs` but I couldn't find anything. For hours I didn't know what hit me, when finally I figured out it's `dmraid`.

### dmraid

I was very disappointed by this `dmraid` thing. Why does the installer try to be so damn smart and do something I don't want without asking me? And then why is it so damn hard to turn it off? I passed `nodmraid`kernel param to the installer as suggested by google sensei, but no dice. Finally I managed to turn the bloody thing off with:
<ol>
	<li>Rest both partition tables</li>
	<li>Start the installer, and if you're lucky it will ask you to reinitialize the partitions, go for it and exit the installer</li>
	<li>Run `dmraid -an` and `dmraid -x`, or something like that, I don't remember exactly</li>
	<li>Just to be safe, I created my partitions in `cfdisk` before going back to the installer.</li>
</ol>
Finally the installer showed the disks as they really were and I could get on with the installation.

### After installation

So far so good. I liked that upon first start-up the system offered to setup ntp synchronization. It's also nice that the nfs client tools work well out of the box, in some systems I often need to tweak `/etc/init.d` scripts to get nfs partitions automatically mounted at boot. And I could setup my RAID1 partitions just fine in my good old-fashioned mdadm way.
