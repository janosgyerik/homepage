---
layout: post
status: publish
published: true
title: Viewing old revisions in the web browser interface of Subversion
author: janos
author_login: janos
author_email: info@titan2x.com
wordpress_id: 923
wordpress_url: http://www.janosgyerik.com/?p=923
date: 2013-05-13 21:19:28.000000000 +02:00
categories:
- Hacks
- Software
tags: []
comments: []
---
If Apache is configured to browse a Subversion repository, its files and directories are shown as of the latest version by default, for example:

<a href="http://svn.apache.org/repos/asf/subversion/trunk/">http://svn.apache.org/repos/asf/subversion/trunk/</a>

If you want to browse the content of older revisions, there is a non-trivial way by inserting `/!svn/bc/REVNO` between the base URL of the repository and the path component of the target directory inside the repository, for example you can browse the contents as of revision 1234123 like this:

<a href="http://svn.apache.org/repos/asf/!svn/bc/1234123/subversion/trunk/">http://svn.apache.org/repos/asf/!svn/bc/1234123/subversion/trunk/</a>
