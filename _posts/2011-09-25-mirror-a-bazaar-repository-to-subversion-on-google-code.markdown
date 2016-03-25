---
layout: post
status: publish
published: true
title: Mirror a Bazaar repository to Subversion on Google Code
date: 2011-09-25 02:26:59.000000000 +02:00
categories:
- Hacks
- software
tags: []
---
In this example I use the "bashoneliners" project, replace the project name appropriately for your case.

1. Create a new empty Subversion repository on Google Code

2. Checkout from Google with bzr co https://bashoneliners.googlecode.com/svn/trunk

3. Pull from the original Bazaar repository:

```
bzr pull path_to_branch --overwrite
```

To keep the Subversion repository up to date on Google Code, simply run `bzr pull` without other arguments.

Remember that you must never commit on the mirror Subversion repository by other methods, that will mess things up. But that is normal for a "mirror" repository isn't it.
