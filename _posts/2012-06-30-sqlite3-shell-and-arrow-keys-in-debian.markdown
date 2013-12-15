---
layout: post
status: publish
published: true
title: 'Sqlite3 shell and arrow keys in Debian '
author: janos
author_login: janos
author_email: info@titan2x.com
wordpress_id: 671
wordpress_url: http://www.janosgyerik.com/?p=671
date: 2012-06-30 11:40:21.000000000 +02:00
categories:
- Hacks
- Software
tags: []
comments: []
---
In Debian, the arrow keys do not work in the `sqlite3` shell by default. For example arrow up-down doesn't work to browse the command history, and arrow left-right doesn't work to edit the current command line.

This is intentional, according to this conversation:
<a href="http://www.mail-archive.com/sqlite-users@sqlite.org/msg68970.html">http://www.mail-archive.com/sqlite-users@sqlite.org/msg68970.html</a>

The reason: the command line editing features are an external dependency, and so the maintainers of the `sqlite3` binary package have decided not to make assumptions about the available external libraries, and by default do not make references to them, otherwise the binary could be unusable.

To enable the command line editing features, you have to build `sqlite3` from source. During the build, the available command line editing libraries are automatically detected and enabled, if any.

<pre>`apt-get source sqlite3
cd sqlite3-3.7.13
./configure
make
make install
`</pre>

If after this the arrow keys are still not working, that must be because you don't have any command line editing libraries in your system.
