---
layout: post
status: publish
published: true
title: Share a folder read-only from Linux to Windows with Samba
author: janos
author_login: janos
author_email: info@titan2x.com
wordpress_id: 516
wordpress_url: http://www.janosgyerik.com/?p=516
date: 2012-01-17 11:12:58.000000000 +01:00
categories:
- Hacks
- Musings
- Software
tags: []
comments: []
---
I thought sharing a folder on Linux to Windows machines read-only and without any authentication whatsoever was very simple to do with Samba. And it really is, if you know Samba well :-) Which I don't, so I had some troubles due to incorrect value for the "security" option. The default value in a relatively modern installation is "user", with other possible values like "share" marked as deprecated in the config file. Because of that small mistake my sanity tests failed with error messages like:
<pre>C:&gt;net view \servername
 System error 5 has occurred.

The network path was not found.</pre>
or
<pre>C:&gt;dir \servernamesharename
 Logon failure: unknown user name or bad password.</pre>
Changing "security = user" to "security = share" was the fix. And it is well explained in "man smb.conf".

Btw the "testparm -s" command shows settings that override the default values, which can be pretty handy in debugging your setup.

<strong>UPDATE:</strong> you probably also want samba to start on system boot. In redhat derivatives you can do that with:
<pre>chkconfig smb on</pre>
<h3>Useful links to debug Samba (if you are in a hurry)</h3>
<a href="http://www.hackorama.com/network/samba.shtml">http://www.hackorama.com/network/samba.shtml</a>

<a href="http://www.oregontechsupport.com/samba/samba.php">http://www.oregontechsupport.com/samba/samba.php</a>

<a href="http://www.linuxhomenetworking.com/wiki/index.php/Quick_HOWTO_:_Ch12_:_Samba_Security_and_Troubleshooting">http://www.linuxhomenetworking.com/wiki/index.php/Quick_HOWTO_:_Ch12_:_Samba_Security_and_Troubleshooting</a>
<h3>A nice series of articles for doing a more sophisticated setup the right way</h3>
<a href="http://www.linuxjournal.com/magazine/paranoid-penguin-samba-security-part-i">http://www.linuxjournal.com/magazine/paranoid-penguin-samba-security-part-i</a>

<a href="http://www.linuxjournal.com/magazine/paranoid-penguin-samba-security-part-ii">http://www.linuxjournal.com/magazine/paranoid-penguin-samba-security-part-ii</a>

<a href="http://www.linuxjournal.com/magazine/paranoid-penguin-samba-security-part-iii">http://www.linuxjournal.com/magazine/paranoid-penguin-samba-security-part-iii</a>

<a href="http://www.linuxjournal.com/magazine/paranoid-penguin-samba-security-part-iv">http://www.linuxjournal.com/magazine/paranoid-penguin-samba-security-part-iv</a>

&nbsp;
