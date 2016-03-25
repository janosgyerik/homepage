---
layout: post
status: publish
published: true
title: Overriding TMPDIR when you don't have enough space on /tmp
date: 2013-12-08 16:37:55.000000000 +01:00
categories:
- hacks
- musings
- software
tags: []
---
Sometimes you might not have enough disk space on the `/tmp` directory but need it badly. For example when creating a `deb` package from a Java tarball in Debian using `make-jpkg`, there's no command line parameter or any other apparent means to specify an alternative working directory for temporary files.

Check-mate? Luckily, no! I could force a different directory using the `TMPDIR` environment variable like this:

```
TMPDIR=/some/where make-jpkg  jdk-7u45-linux-x64.tar.gz
```

