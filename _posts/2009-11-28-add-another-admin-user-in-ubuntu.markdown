---
layout: post
status: publish
published: true
title: How to add another admin user in ubuntu
author: janos
author_login: janos
author_email: info@titan2x.com
wordpress_id: 173
wordpress_url: http://titan2x.wordpress.com/?p=173
date: 2009-11-28 18:35:35.000000000 +01:00
categories:
- Hacks
tags: []
comments: []
---
In Ubuntu the first user you create will have special privileges. This happens during the installation, at the step when you create the first user account, Ubuntu adds that user to several system groups to grant some special privileges such us running sudo, mount cdrom and usb drives. In particular the default system groups at the time of this writing: adm dialout cdrom plugdev lpadmin admin sambashare.

What if you want to add another user the same special privileges, for example to let your wife install packages and do other administrative stuff. Yeah I know it sounds crazy. Maybe think again. If you still want to do this, this one-liner will do:
<pre>for i in $(grep :boss /etc/group | cut -f1 -d:); do
sudo adduser wife $i; done</pre>
If you want to exclude some groups:
<pre>for i in $(grep :user1 /etc/group | cut -f1 -d: | grep -v adm); do
sudo adduser user2 $i; done</pre>
