---
layout: post
status: publish
published: true
title: How to increase JVM heap size for Maven
date: 2012-05-15 16:20:08.000000000 +02:00
categories:
- Hacks
- software
tags: []
---
Do not edit mvn (or mvn.bat) itself. Add any necessary JVM arguments to the MAVEN_OPTS environment variable.

```
-Xmx512m
```

Depending on your environment, increasing the max heap may not be enough, you might get a different kind of OOM:

```
java.lang.OutOfMemoryError: PermGen space
```

The "PermGen space" is for storing information about the heap itself. The bigger the heap, the PermGen space also needs to be bigger, you can increase both like this:

```
-Xmx512m -XX:MaxPermSize=128m
```

