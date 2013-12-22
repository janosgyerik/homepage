---
layout: post
status: publish
published: true
title: 'UnicodeEncodeError: ''ascii'' codec can''t encode characters'
date: 2012-06-03 17:21:50.000000000 +02:00
categories:
- Hacks
- Software
tags: []
comments: []
---
When coding in python, I've been hit by the following error every once in a while:

```
UnicodeEncodeError: 'ascii' codec can't encode characters in position 25-28: ordinal not in range(128)
```

Today I finally figured why:

```
$ python -c 'import sys; print sys.stdout.encoding'
$ US-ASCII
```

Although my terminal application is capable of outputting unicode characters, python (2.6) somehow does not know it, and tries to output everything in `ascii`, hence the error. The solution is to set `PYTHONIOENCODING` in my ~/.bashrc:

```
export PYTHONIOENCODING=utf-8
```

