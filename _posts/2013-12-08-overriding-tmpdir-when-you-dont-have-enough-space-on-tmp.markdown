---
layout: post
status: publish
published: true
title: Overriding TMPDIR when you don't have enough space on /tmp
author: janos
author_login: janos
author_email: info@titan2x.com
wordpress_id: 254
wordpress_url: http://titan2x.wordpress.com/?p=254
date: 2013-12-08 16:37:55.000000000 +01:00
categories:
- Hacks
- Musings
- Software
tags: []
comments: []
---
Sometimes you might not have enough disk space on the `/tmp` directory but need it badly. For example when creating a `deb` package from a Java tarball in Debian using `make-jpkg`, there's no command line parameter or any other apparent means to specify an alternative working directory for temporary files.

Check-mate? Luckily, no! I could force a different directory using the `TMPDIR` environment variable like this:
<pre>TMPDIR=/some/where make-jpkg  jdk-7u45-linux-x64.tar.gz</pre>
