---
layout: post
status: publish
published: true
title: Sharing files between Windows7 host and Debian guest with VirtualBox
author: janos
author_login: janos
author_email: info@titan2x.com
wordpress_id: 848
wordpress_url: http://www.janosgyerik.com/?p=848
date: 2013-01-01 09:27:38.000000000 +01:00
categories:
- Hacks
- Software
tags: []
comments:
- id: 839
  author: Gergely Nagy
  author_email: nagy.gergely@gnanet.net
  author_url: ''
  date: '2013-01-01 09:32:06 +0100'
  date_gmt: '2013-01-01 09:32:06 +0100'
  content: I am more excited about the new drag and drop between host and guest
---
With VirtualBox it is very easy to share files between the host and guest systems by using shared folders. In a Windows7 host and a freshly installed Debian guest I only needed a few steps:
<ol>
	<li>In the guest's settings added a shared folder named "shared" and ticked the "auto-mount" box.</li>
	<li>In the guest: <code>apt-get install linux-headers-486</code></li>
	<li>Reboot the guest</li>
</ol>
After reboot, the shared folder was visible at the path <code>/media/sf_shared</code>

The documentation mentions many more steps, I guess they may be necessary in other hosts or guests.
