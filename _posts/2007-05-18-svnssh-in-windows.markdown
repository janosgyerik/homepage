---
layout: post
status: publish
published: true
title: svn+ssh:// in windows
date: 2007-05-18 08:31:00.000000000 +02:00
categories:
- Hacks
tags: []
comments: []
---
Whether I tried from a client like RapidSVN or from the command line, this is the error I got:

<blockquote>svn: Can't create tunnel: The system cannot find the file specified.</blockquote>

It would have been helpful if the message mentioned what file it was looking for, but whatever...
...even more surprisingly, google-ing didn't turn up a solution either...

Luckily I remembered something about plink.exe ...

The second obstacle was finding the right way to specify the path to plink.exe

I added the environmental variable: `SVN_SSH`
With value: `"c:/program files/putty/plink.exe"`
Yes, the path is unix style and NOT windows style.
And yes, the path is enclosed in double quotes (because of the space in it).
