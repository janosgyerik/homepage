---
layout: post
status: publish
published: true
title: Installing bzr-svn in gutsy
date: 2008-05-12 05:09:00.000000000 +02:00
categories:
- Hacks
tags: []
---
I already added the gutsy repository for `bzr`, but since the latest version of `bzr-svn` lives only in gutsy-backports for now, I had to add that as well, so I had these extra lines in `/etc/apt/sources.list` for these two packages:

<blockquote>deb http://jp.archive.ubuntu.com/ubuntu/ gutsy-backports main restricted universe multiverse
deb-src http://jp.archive.ubuntu.com/ubuntu/ gutsy-backports main restricted universe multiverse

# extra repos
deb http://ppa.launchpad.net/bzr/ubuntu gutsy main
deb-src http://ppa.launchpad.net/bzr/ubuntu gutsy main
</blockquote><br />

Unfortunately, there is a conflict between the latest versions, namely, `bzr-svn` depends on an older version of `bzr`, causing a simple `apt-get install bzr-svn` to fail.

The solution:
<blockquote>sudo apt-get install bzr=1.3.1~rc1-0ubuntu1~gutsy1 bzr-svn</blockquote><br />

FYI, the dependency requirement of `bzr-svn`:<blockquote>apt-cache show bzr-svn | grep ^Depends</blockquote><br />

...and the available versions of `bzr`:<blockquote>apt-cache show bzr | grep ^Version</blockquote>
