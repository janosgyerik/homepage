---
layout: post
status: publish
published: true
title: How to synchronize subversion repositories with svnsync
date: 2008-03-05 17:41:00.000000000 +01:00
categories:
- Hacks
tags: []
---
I backup my svn repositories using `svnadmin dump`. From a dump like that a repository can be fully restored at any location via `svnadmin load`.

I'm playing with the idea of hosting some of my repositories on Google, but then I won't be able to use `svnadmin dump`, my trusty backup method. However, snvsync looks promising as a suitable replacement.

1. Create a target repository with `svnadmin create some_dir`

2. Create a shell script at `some_dir/hooks/pre-revprop-change` that does nothing and just exits successfully (`exit 0`). Make sure the script is executable.

3. Initialize the target repository with `svnsync init file:///abs_path/some_dir source_repo_url`

4. Synchronize to target repository with `svnsync sync file:///abs_path/some_dir`. Notice that you don't specify the source repository here anymore, that's because the target is tied to the repository used in the initialization step.

Do not commit to the target repository. Always commit to the source, and after that run `svnsync sync` on the target, whenever needed.

If you want to *mirror* a Subversion repository to a complete different remote server, you can use a distributed version control software like Bazaar or Git. [Here's an article how I do this with Bazaar.](http://titan2x.wordpress.com/2011/03/10/mirroring-a-subversion-repository-using-bazaar/)
