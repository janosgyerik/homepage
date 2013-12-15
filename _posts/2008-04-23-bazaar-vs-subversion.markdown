---
layout: post
status: publish
published: true
title: Bazaar VS Subversion
author: janos
author_login: janos
author_email: info@titan2x.com
wordpress_id: 28
wordpress_url: http://titan2x.wordpress.com/2008/04/23/bazaar-vs-subversion/
date: 2008-04-23 02:11:00.000000000 +02:00
categories:
- Musings
- Software
tags: []
comments: []
---
A Bazaar repository check-out contains the complete revision history. This has the advantage that the check-out itself can act as a repository and the disadvantage of more network data transfer during initial check-out.

In Bazaar you cannot check-out subtrees of a repository. You always have to check-out the entire tree. This implies that Bazaar operations are more atomic than in Subversion. An additional nice touch is that in a Bazaar check-out there is a single `.bzr` directory at the tree root for VCS information, as opposed to Subversion where all subdirectories have a `.svn` subdirectory. In Subversion this makes it very annoying to do `grep -r`, sometimes.

In Subversion the handling of file moving/renaming operations is not very clever, for example if you make changes to a file and then try to rename it, Subversion will complain. Also, when renaming a directory, a directory with the old name still lingers there until you commit. In Bazaar there are no such weirdness.

My only complaint against Bazaar so far is that it's not as verbose as Subversion, for example I don't know the best way to determine the current revision number in a checked-out copy. Another thing is the output of status can be very inconvenient to read, for example when there are many unknown files.
