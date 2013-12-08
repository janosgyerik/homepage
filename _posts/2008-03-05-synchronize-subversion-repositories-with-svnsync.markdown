---
layout: post
status: publish
published: true
title: How to synchronize subversion repositories with svnsync
author: janos
author_login: janos
author_email: info@titan2x.com
wordpress_id: 20
wordpress_url: http://titan2x.wordpress.com/2008/03/05/synchronize-subversion-repositories-with-svnsync/
date: 2008-03-05 17:41:00.000000000 +01:00
categories:
- Hacks
tags: []
comments: []
---
I backup my svn repositories using <code>svnadmin dump</code>. From a dump like that a repository can be fully restored at any location via <code>svnadmin load</code>.

I'm playing with the idea of hosting some of my repositories on Google, but then I won't be able to use <code>svnadmin dump</code>, my trusty backup method. However, snvsync looks promising as a suitable replacement.

1. Create a target repository with <code>svnadmin create some_dir</code>

2. Create a shell script at <code>some_dir/hooks/pre-revprop-change</code> that does nothing and just exits successfully (<code>exit 0</code>). Make sure the script is executable.

3. Initialize the target repository with <code>svnsync init file:///abs_path/some_dir source_repo_url</code>

4. Synchronize to target repository with <code>svnsync sync file:///abs_path/some_dir</code>. Notice that you don't specify the source repository here anymore, that's because the target is tied to the repository used in the initialization step.

Do not commit to the target repository. Always commit to the source, and after that run <code>svnsync sync</code> on the target, whenever needed.

If you want to <em>mirror</em> a Subversion repository to a complete different remote server, you can use a distributed version control software like Bazaar or Git. <a href="http://titan2x.wordpress.com/2011/03/10/mirroring-a-subversion-repository-using-bazaar/">Here's an article how I do this with Bazaar.</a>
