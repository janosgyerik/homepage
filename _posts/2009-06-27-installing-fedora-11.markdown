---
layout: post
status: publish
published: true
title: Installing Fedora 11
author: janos
author_login: janos
author_email: info@titan2x.com
wordpress_id: 135
wordpress_url: http://titan2x.wordpress.com/?p=135
date: 2009-06-27 14:04:37.000000000 +02:00
categories:
- Musings
- Software
tags: []
comments: []
---
My hard disk started showing signs of slow and painful death, so after I backed up all my data I confirmed with smartctl that yes, it's dying.
<blockquote>smartctl -t long /dev/sda smartctl -a /dev/sda</blockquote>
This looked like a good opportunity to try something new, at least Kubuntu instead of Ubuntu. So I went for the much celebrated Fedora 11.
<h3>The live CD</h3>
My half-broken hard disk was still in the computer when I started the Live CD and Fedora scored some plus point for showing a warning about the disk, and a very cool GUI for the smartctl self tests. Next I replaced the hard disk with two new ones, and started the Live CD again and wanted to use the fancy GUI for smartctl. I looked through the menus, the Gnome applets but couldn't find it. Wonder where it is, it's a shame to hide this superb tool in a dusty corner. So I did the smartctl the <em>old</em> way. (By now I know where it is: Applications / System Tools / Palimpsest Disk Utility.) Then I had some MAJOR problems with the disk partitioner. I have two disks of the same size and I used to have them in a software RAID1, but that's not what I intended for this time. The installer's partitioner oddly showed me only one disk, and with an odd name. It looked like some kind of mirroring setup, so I checked <code>/proc/mdstat</code> and <code>lvs</code> but I couldn't find anything. For hours I didn't know what hit me, when finally I figured out it's <code>dmraid</code>.
<h3>dmraid</h3>
I was very disappointed by this <code>dmraid</code> thing. Why does the installer try to be so damn smart and do something I don't want without asking me? And then why is it so damn hard to turn it off? I passed <code>nodmraid</code>kernel param to the installer as suggested by google sensei, but no dice. Finally I managed to turn the bloody thing off with:
<ol>
	<li>Rest both partition tables</li>
	<li>Start the installer, and if you're lucky it will ask you to reinitialize the partitions, go for it and exit the installer</li>
	<li>Run <code>dmraid -an</code> and <code>dmraid -x</code>, or something like that, I don't remember exactly</li>
	<li>Just to be safe, I created my partitions in <code>cfdisk</code> before going back to the installer.</li>
</ol>
Finally the installer showed the disks as they really were and I could get on with the installation.
<h3>After installation</h3>
So far so good. I liked that upon first start-up the system offered to setup ntp synchronization. It's also nice that the nfs client tools work well out of the box, in some systems I often need to tweak <code>/etc/init.d</code> scripts to get nfs partitions automatically mounted at boot. And I could setup my RAID1 partitions just fine in my good old-fashioned mdadm way.
