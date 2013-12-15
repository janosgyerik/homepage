---
layout: post
status: publish
published: true
title: Installing VMware Server 1.0.x in hardy
author: janos
author_login: janos
author_email: info@titan2x.com
wordpress_id: 33
wordpress_url: http://titan2x.wordpress.com/2008/05/15/installing-vmware-server-1-0-x-in-hardy/
date: 2008-05-15 08:52:00.000000000 +02:00
categories:
- Hacks
tags: []
comments: []
---
Of course you need the usual requirements:

<ul>
<li>`linux-headers-FLAVOR` where FLAVOR is for example `generic`, `server`, etc. Instead of flavor it can be the exact kernel version (`uname -r`).</li>
<li>`gcc` and `g++` and `inetd` or `xinetd`</li>
<li>On 64-bit platforms `ia32-libs` too, as this version of VMware is a 32-bit app.</li></ul>

With the above and the vmware server tarball you *usually* would be able to build the vmware modules. Unfortunately that's not always the case given that you are on an unsupported platform etc etc etc. To make it work there is a `vmware-any-any-update` tarball developed by a Czech dude called Petr. His FTP site is here:<br />
<a href="http://platan.vc.cvut.cz/ftp/pub/vmware/">http://platan.vc.cvut.cz/ftp/pub/vmware/</a>


There is a `runme.pl` script inside that you are supposed to run as the super-user... Scary stuff. But it worked for a lot of people, including me.

Oh and one more thing. Even though `vmware-config.pl` completed successfully, vmware still didn't run due to the following library issue:
<blockquote>/usr/lib/vmware/bin/vmware: /usr/lib/vmware/lib/libgcc_s.so.1/libgcc_s.so.1: version `GCC_4.2.0' not found (required by /usr/lib32/libstdc++.so.6)</blockquote>

I made a backup of `usr/lib/vmware/lib/libgcc_s.so.1/libgcc_s.so.1` and replaced with `/lib/libgcc_s.so.1`
