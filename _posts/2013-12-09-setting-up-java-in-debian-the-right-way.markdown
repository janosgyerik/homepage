---
layout: post
status: publish
published: true
title: Setting up Java in Debian the right way
date: 2013-12-09 19:56:55.000000000 +01:00
categories:
- Hacks
- Software
tags: []
---
I've been using the OpenJDK, but I had some problems with it: Android Studio and PyCharm are tested with Oracle's JDK, and as such there are known bugs and crashes with OpenJDK. To fix my instability issues I had to take the hint and switch to Oracle's. Here's the official doc for setting this up in Debian:

[https://wiki.debian.org/JavaPackage](https://wiki.debian.org/JavaPackage)

Following the explanations, I was able to convert Oracle's tarball to a `deb` package using `make-jpkg`, and with the `update-alternatives` examples I could set the default version to use correctly. (Before this I was setting `JAVA_HOME` and `PATH` by hand, which is *dirty*, don't do it.)
