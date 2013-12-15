---
layout: post
status: publish
published: true
title: Hosting Bazaar projects on Launchpad
author: janos
author_login: janos
author_email: info@titan2x.com
wordpress_id: 38
wordpress_url: http://titan2x.wordpress.com/2008/06/14/hosting-bazaar-projects-on-launchpad/
date: 2008-06-14 23:38:00.000000000 +02:00
categories:
- Hacks
- Musings
- Software
tags: []
comments: []
---
What is <a href="https://launchpad.net/">Launchpad</a>?

<blockquote>Launchpad is a free software hosting and development website. We make it easy to collaborate across multiple projects.</blockquote>
<br />

You can use it to 
<ol>
<li>Develop your custom Ubuntu packages.</li>
<li>Host your projects in the <a href="http://bazaar-vcs.org/">Bazaar VCS</a>.</li>
</ol>

Of course, all the projects you host there will be public. Write operations are accomplished using SSH public keys. 

Setup steps:
<ol>
<li>Login to Launchpad, go to the `Code` tab. <a href="https://code.launchpad.net/~janos-gyerik">This is mine</a></li>
<li>Click on `Register a branch` button.</li>
<li>There are different hosting options. I chose `Hosted` to make Launchpad the primary location of my project. Projects of this type are updated with `bzr push` command.</li>
<li>Before you can push to Launchpad you need two things. 
<ol><li>Add your SSH public key. (Launchpad | Overview | Update SSH keys)</li>
<li>Login to Launchpad with Bazaar, for example: 
<blockquote>bzr lp-login janos-gyerik</blockquote></li></ol>
Go to the Bazaar project directory and do `bzr push` like this: 
<blockquote>bzr push lp:~janos-gyerik/+junk/software-cache</blockquote></ol>

After this, anybody will be able to checkout the project with 
<blockquote>bzr co lp:~janos-gyerik/+junk/software-cache</blockquote> and authenticated users will be able to do write operations.
