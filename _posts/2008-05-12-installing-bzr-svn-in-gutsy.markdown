---
layout: post
status: publish
published: true
title: Installing bzr-svn in gutsy
author: janos
author_login: janos
author_email: info@titan2x.com
wordpress_id: 32
wordpress_url: http://titan2x.wordpress.com/2008/05/12/installing-bzr-svn-in-gutsy/
date: 2008-05-12 05:09:00.000000000 +02:00
categories:
- Hacks
tags: []
comments: []
---
I already added the gutsy repository for <code>bzr</code>, but since the latest version of <code>bzr-svn</code> lives only in gutsy-backports for now, I had to add that as well, so I had these extra lines in <code>/etc/apt/sources.list</code> for these two packages:

<blockquote>deb http://jp.archive.ubuntu.com/ubuntu/ gutsy-backports main restricted universe multiverse
deb-src http://jp.archive.ubuntu.com/ubuntu/ gutsy-backports main restricted universe multiverse

# extra repos
deb http://ppa.launchpad.net/bzr/ubuntu gutsy main
deb-src http://ppa.launchpad.net/bzr/ubuntu gutsy main
</blockquote><br />

Unfortunately, there is a conflict between the latest versions, namely, <code>bzr-svn</code> depends on an older version of <code>bzr</code>, causing a simple <code>apt-get install bzr-svn</code> to fail.

The solution:
<blockquote>sudo apt-get install bzr=1.3.1~rc1-0ubuntu1~gutsy1 bzr-svn</blockquote><br />

FYI, the dependency requirement of <code>bzr-svn</code>:<blockquote>apt-cache show bzr-svn | grep ^Depends</blockquote><br />

...and the available versions of <code>bzr</code>:<blockquote>apt-cache show bzr | grep ^Version</blockquote>
