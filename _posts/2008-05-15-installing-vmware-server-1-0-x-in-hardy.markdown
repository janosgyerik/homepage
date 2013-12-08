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
<li><code>linux-headers-FLAVOR</code> where FLAVOR is for example <code>generic</code>, <code>server</code>, etc. Instead of flavor it can be the exact kernel version (<code>uname -r</code>).</li>
<li><code>gcc</code> and <code>g++</code> and <code>inetd</code> or <code>xinetd</code></li>
<li>On 64-bit platforms <code>ia32-libs</code> too, as this version of VMware is a 32-bit app.</li></ul>

<p>With the above and the vmware server tarball you <em>usually</em> would be able to build the vmware modules. Unfortunately that's not always the case given that you are on an unsupported platform etc etc etc. To make it work there is a <code>vmware-any-any-update</code> tarball developed by a Czech dude called Petr. His FTP site is here:<br />
<a href="http://platan.vc.cvut.cz/ftp/pub/vmware/">http://platan.vc.cvut.cz/ftp/pub/vmware/</a>
</p>

<p>There is a <code>runme.pl</code> script inside that you are supposed to run as the super-user... Scary stuff. But it worked for a lot of people, including me.</p>

<p>Oh and one more thing. Even though <code>vmware-config.pl</code> completed successfully, vmware still didn't run due to the following library issue:</p>
<blockquote>/usr/lib/vmware/bin/vmware: /usr/lib/vmware/lib/libgcc_s.so.1/libgcc_s.so.1: version `GCC_4.2.0' not found (required by /usr/lib32/libstdc++.so.6)</blockquote>

<p>I made a backup of <code>usr/lib/vmware/lib/libgcc_s.so.1/libgcc_s.so.1</code> and replaced with <code>/lib/libgcc_s.so.1</code></p>
