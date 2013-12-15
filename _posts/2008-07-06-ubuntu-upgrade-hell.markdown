---
layout: post
status: publish
published: true
title: Ubuntu upgrade hell
author: janos
author_login: janos
author_email: info@titan2x.com
wordpress_id: 45
wordpress_url: http://titan2x.wordpress.com/2008/07/06/ubuntu-upgrade-hell/
date: 2008-07-06 03:35:00.000000000 +02:00
categories:
- Hacks
- Musings
tags: []
comments: []
---
I'm deeply disappointed.

My GF booted into her feisty system after a fairly long time. It was expected that there would be a lot of package upgrades, there were 80. Nothing wrong with that so far, though it took more than an hour, while I've seen several of my other ubuntu systems dist-upgrade over 100 packages in a matter of minutes, but whatever.

After the package upgrades a reboot was necessary which is understandable, since a new kernel was installed. Then came a couple of surprises. First of all, the option to boot into her windows system (her default system) just disappeared. There were three ubuntu kernels in the list, none of them worked. The root commands of grub were set with the wrong partition number, and the kernel parameters were set with the wrong uuid numbers.

It was easy and straightforward enough to fix all this, but not for my GF. This idiotic behavior of the package upgrade was uncalled for. I don't remember editing the grub config file by hand, the backup version of the file attests to this, it looks like a perfectly normal, standard ubuntu-generated grub config file.

I wonder what's going on within the company. Most of the time they do brilliant things and have successfully made the distro closest to my expectations and by far ahead of any other offer out there, yet recently they fail at very simple things. Like the removal of LVM editor from the desktop installer of hardy is just a plain retarded move. Aaaargh.
