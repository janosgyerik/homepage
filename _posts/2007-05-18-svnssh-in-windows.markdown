---
layout: post
status: publish
published: true
title: svn+ssh:// in windows
author: janos
author_login: janos
author_email: info@titan2x.com
wordpress_id: 14
wordpress_url: http://titan2x.wordpress.com/2007/05/18/svnssh-in-windows/
date: 2007-05-18 08:31:00.000000000 +02:00
categories:
- Hacks
tags: []
comments: []
---
<p>Whether I tried from a client like RapidSVN or from the command line, this is the error I got:</p>

<blockquote>svn: Can't create tunnel: The system cannot find the file specified.</blockquote>

<p>It would have been helpful if the message mentioned what file it was looking for, but whatever...
...even more surprisingly, google-ing didn't turn up a solution either...</p>

<p>Luckily I remembered something about plink.exe ...</p>

<p>The second obstacle was finding the right way to specify the path to plink.exe</p>

<p>I added the environmental variable: <code>SVN_SSH</code>
With value: <code>"c:/program files/putty/plink.exe"</code>
Yes, the path is unix style and NOT windows style.
And yes, the path is enclosed in double quotes (because of the space in it).</p>
