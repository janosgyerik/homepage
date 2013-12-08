---
layout: post
status: publish
published: true
title: Hosting Bazaar projects on Launchpad 2
author: janos
author_login: janos
author_email: info@titan2x.com
wordpress_id: 39
wordpress_url: http://titan2x.wordpress.com/2008/06/15/hosting-bazaar-projects-on-launchpad-2/
date: 2008-06-15 08:23:00.000000000 +02:00
categories:
- Hacks
tags: []
comments: []
---
Wow. Actually, you don't need to go through all that stuff I wrote in the last post. If you have a Launchpad account, and configured SSH public keys, you can simply push to Launchpad, anywhere! Like this:

<blockquote>bzr push lp:~janos-gyerik/scripts/software-cache</blockquote><br />

It takes a while for Launchpad to pick up the changes. So wait a little, and then you can fill in project details.
