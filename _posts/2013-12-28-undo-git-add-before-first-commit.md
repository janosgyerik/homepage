---
layout: post
status: publish
published: true
title: How to undo git add before first commit
date: 2013-12-28 05:39:55.000000000 +01:00
categories:
- Hacks
- software
tags: []
---
Normally I undo `git add somefile` with `git reset somefile`.
However, if you're before the first commit, this won't work:

```
$ git reset somefile
fatal: Failed to resolve 'HEAD' as a valid ref.
```

The solution:

```
$ git rm --cached somefile
rm 'somefile'
$ git status -s somefile
?? somefile
```
