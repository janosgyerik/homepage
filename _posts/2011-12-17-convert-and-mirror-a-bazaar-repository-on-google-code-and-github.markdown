---
layout: post
status: publish
published: true
title: Convert and mirror a Bazaar repository on Google Code and GitHub
author: janos
author_login: janos
author_email: info@titan2x.com
wordpress_id: 442
wordpress_url: http://titan2x.wordpress.com/?p=442
date: 2011-12-17 07:36:03.000000000 +01:00
categories:
- Hacks
- Software
tags: []
comments: []
---
An open source project should be as open as possible, for that reason I decided to make the source code of <a href="http://www.bashoneliners.com/">bashoneliners.com</a> available in more than one VCS, for example in Subversion and Git in addition to Bazaar which remains the "master" branch.
<h3>Bazaar to Subversion</h3>
Thanks to the bzr-svn plugin which comes bundled with the latest versions of Bazaar this is really easy and straightforward.
<h4>Initial setup: import full history from Bazaar to Google Code</h4>
<pre>bzr co /path/to/bzr/repo /path/to/svn/pusher
cd /path/to/svn/pusher
bzr push https://PROJECT.googlecode.com/svn/trunk</pre>
<h4>Mirroring periodically</h4>
<pre>cd /path/to/svn/pusher
bzr up &amp;&amp; bzr push</pre>
Occasionally, especially if you have a lot of changes to push at once, the connection can get interrupted, or even bzr could crash. No worries, just repeat the "bzr push".

As usual with mirrors, if you ever commit to the Google Code repository with anything else other than the above script, the mirroring will stop working because your branches have diverged. If you ever do that by mistake it's not the end of the world, you can reset the repository on Google Code and rebuild it again.
<h3>Bazaar to Git</h3>
There is a nice plugin for this too, but since I could not get it working easily on my Mac, I chose an alternative path that's less pretty but very easy to get going, by using the Subversion mirror on Google Code as a stepping stone from Bazaar to Git.
<h4>Initial setup: import full history from Google Code to GitHub</h4>
<pre>git svn clone https://PROJECT.googlecode.com/svn/trunk /path/to/git/pusher
cd /path/to/git/pusher
git remote add origin git@github.com:repo-url
git push origin master</pre>
<h4>Mirroring periodically</h4>
<pre>cd /path/to/git/pusher
git svn rebase &amp;&amp; git push origin master</pre>
As usual with mirrors, if you ever commit to the GitHub repository with anything else other than the above script, the mirroring will stop working because your branches have diverged. If you ever do that by mistake it's not the end of the world, since with Git you can rewrite history ;-)
<div></div>
