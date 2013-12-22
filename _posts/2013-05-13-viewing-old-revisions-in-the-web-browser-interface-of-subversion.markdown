---
layout: post
status: publish
published: true
title: Viewing old revisions in the web browser interface of Subversion
date: 2013-05-13 21:19:28.000000000 +02:00
categories:
- Hacks
- Software
tags: []
---
If Apache is configured to browse a Subversion repository, its files and directories are shown as of the latest version by default, for example:

[http://svn.apache.org/repos/asf/subversion/trunk/](http://svn.apache.org/repos/asf/subversion/trunk/)

If you want to browse the content of older revisions, there is a non-trivial way by inserting `/!svn/bc/REVNO` between the base URL of the repository and the path component of the target directory inside the repository, for example you can browse the contents as of revision 1234123 like this:

[http://svn.apache.org/repos/asf/!svn/bc/1234123/subversion/trunk/](http://svn.apache.org/repos/asf/!svn/bc/1234123/subversion/trunk/)
