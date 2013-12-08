---
layout: post
status: publish
published: true
title: How to convert and mount daa format files with wine
author: janos
author_login: janos
author_email: info@titan2x.com
wordpress_id: 56
wordpress_url: http://titan2x.wordpress.com/2008/10/17/converting-mounting-daa-files-with-wine/
date: 2008-10-17 09:28:00.000000000 +02:00
categories:
- Hacks
tags: []
comments: []
---
Downloaded a bunch of c++ books but the files were in DAA format. Found a neat utility called daa2iso developed by some dude, but it didn't work. The only alternative at the moment was PowerISO, a windows tool. I thought it's time to give <code>wine</code> a shot. And it worked brilliantly too.
<ul>
	<li>Installed <code>wine</code> (didn't have it yet)</li>
	<li>Ran: <code>wine PowerISO38.exe</code>. A window popped up, looking like a regular windows installation, went along with it, installed it in "Program Files", not even knowing what that means in <code>wine</code>. The installer complained at the end, but decided to ignore for now.</li>
	<li>Ran: <code>wine ~/.wine/drive_c/Program Files/PowerISO/PowerISO.exe</code> and behold, it just worked. Located the daa file and extracted it into my usual books folder.</li>
	<li>Felt like it's time for a different kind of wine, to celebrate ;-)</li>
</ul>
