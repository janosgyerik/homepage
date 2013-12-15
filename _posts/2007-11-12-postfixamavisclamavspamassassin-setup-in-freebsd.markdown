---
layout: post
status: publish
published: true
title: Postfix+Amavis+ClamAV+SpamAssassin setup in FreeBSD
author: janos
author_login: janos
author_email: info@titan2x.com
wordpress_id: 17
wordpress_url: http://titan2x.wordpress.com/2007/11/12/postfixamavisclamavspamassassin-setup-in-freebsd/
date: 2007-11-12 01:16:00.000000000 +01:00
categories:
- Hacks
tags: []
comments: []
---
<p>A friend's sysadmin went missing so was left with a broken mail server that did not deliver anything. There are plenty of articles on doing this in Linux, the challenge was doing it in FreeBSD 5.4, when the latest stable version is 6.2.</p>

<p>An excellent first reading: </p>

<p><a href="http://www.linuxjournal.com/article/7778">Linux Journal - Adding Clam Antivirus to Your Postfix Server</a></p>

<p>Although an article for Linux, it explains well the setup steps that need to be done. I applied similar steps in the FreeBSD system, with the differences below.</p>

<p>1. Stopped everything first.</p>
<pre>/usr/local/etc/rc.d/postfix.sh stop
/usr/local/etc/rc.d/amavisd.sh stop</pre>

<p>2. Saved a backup of `/etc/amavisd.conf`, copied `/usr/local/etc/amavisd.conf` over it, and edited the file according to the article and the original file. (Created users, directories, changed permissions, etc.)</p>

<p>3. Saved a backup of `/usr/local/etc/clamd.conf`. Actually, upon configuring ClamAV it turned out that the version is just too old. When starting up, it warned that not only the virus database needs to be up to date, but the software itself too. Reluctantly, I downloaded the latest source from here: </p>

<p><a href="http://www.clamav.net/download/sources">http://www.clamav.net/download/sources</a></p>

<p>The build went through without issue. Before installing, had to remove the ClamAV FreeBSD package with `pkg_deinstall` or `pkg_delete`. BUT! Before you do that, make sure you save the rc script, as the source tarball does not have it. </p>

<p>After the build, configured according to the article and the original file. (Created users, directories, changed permissions, etc.)</p>

<p>4. With the above setup, things were still not perfect, ClamAV's logs had frequent errors about SpamAssassin, and spam was not filtered well. Even though it was the latest SpamAssassin package for the system, it just wasn't quite good enough. So had to install this from source too, from CPAN:</p>

<p><a href="http://search.cpan.org/">http://search.cpan.org/</a></p>

<p>5. With all the above setup, started running the services, the order doesn't really matter. This should be done after system startup:</p>

<pre>/usr/local/etc/rc.d/amavisd.sh start
/usr/local/etc/rc.d/clamav-clamd.sh start
/usr/local/etc/rc.d/clamav-freshclam.sh start</pre>

<p>To have these automatically started, look at the individual rc scripts, they mention what variable needs to be set in `/etc/rc.conf` to have them automatically start. </p>

<p>With the above setup, `postqueue -p` showed decreasing number of unprocessed messages, from over 1500 down to just dozens. My friend confirmed proper mail delivery and spam filtering. </p>

<p>To conclude, things were setup the right way, and not deviating much from the "FreeBSD way". ClamAV just *had* to be setup from source, there was no other way. SpamAssassin likewise, being a dependency of ClamAV. Amavis and Postfix are still from the original FreeBSD packages, but they work fine so are not a problem right now.</p>
