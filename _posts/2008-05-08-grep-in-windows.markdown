---
layout: post
status: publish
published: true
title: How to do grep in windows
date: 2008-05-08 04:30:00.000000000 +02:00
categories:
- Hacks
tags: []
---
`findstr` in windows works similarly to `grep` in unix. For example you can do this:

```netstat -a | findstr 8000
```

Another command `find` is also similar, with slightly different syntax and powers. I don't remember which is which, but with one of them you can use regular expressions.
