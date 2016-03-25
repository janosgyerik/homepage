---
layout: post
status: publish
published: true
title: Tab switching slow in Eclipse on Mac OS X
date: 2010-09-15 20:56:14.000000000 +02:00
categories:
- hacks
tags: []
---
The fix:

1. Find eclipse.ini file in the Eclipse installation.

2. Edit/add the following values:

```
-Xms256m
-Xmx1024m
-Dosgi.requiredJavaVersion=1.6
```

The requiredJavaVersion=1.6 is the key, but adjusting the heap settings is probably also a good idea.
