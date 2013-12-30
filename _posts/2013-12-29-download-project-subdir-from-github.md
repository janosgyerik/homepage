---
layout: post
status: publish
published: true
title: How to download a project subdirectory from GitHub
date: 2013-12-29 05:39:55.000000000 +01:00
categories:
- Hacks
- Software
tags: []
---
If you want to download an entire project from GitHub without version control data,
you can use the **Download ZIP** option of the website.
Alternatively, you could use command line tools, for example:

```
curl -L https://github.com/janosgyerik/jquery-upvote/tarball/master > project.tar.gz
```

What if you want to download only a subdirectory?
The website doesn't have an option for that, at least not yet.
Luckily,
thanks to Subversion support in GitHub,
you could use the `svn` command line tool to that effect, for example:

```
svn export https://github.com/janosgyerik/jquery-upvote/trunk/lib jquery-upvote-lib
```

This creates a directory locally with the content of the specified subdirectory of the project.

Just make sure to construct the URL correctly, using the format:

```
https://github.com/USER/PROJECT/trunk/PATH DEST
```