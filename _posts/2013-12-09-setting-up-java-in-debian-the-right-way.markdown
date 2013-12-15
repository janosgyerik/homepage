---
layout: post
status: publish
published: true
title: Setting up Java in Debian the right way
author: janos
author_login: janos
author_email: info@titan2x.com
wordpress_id: 1165
wordpress_url: http://www.janosgyerik.com/?p=1165
date: 2013-12-09 19:56:55.000000000 +01:00
categories:
- Hacks
- Software
tags: []
comments: []
---
<span style="line-height: 1.714285714; font-size: 1rem;">I've been using the OpenJDK, but I had some problems with it: Android Studio and PyCharm are tested with Oracle's JDK, and as such there are known bugs and crashes with OpenJDK. To fix my instability issues I had to take the hint and switch to Oracle's. Here's the official doc for setting this up in Debian:</span>

<a href="https://wiki.debian.org/JavaPackage">https://wiki.debian.org/JavaPackage</a>

Following the explanations, I was able to convert Oracle's tarball to a <code>deb</code> package using <code>make-jpkg</code>, and with the <code>update-alternatives</code> examples I could set the default version to use correctly. (Before this I was setting <code>JAVA_HOME</code> and <code>PATH</code> by hand, which is <em>dirty</em>, don't do it.)
