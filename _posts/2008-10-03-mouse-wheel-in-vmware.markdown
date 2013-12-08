---
layout: post
status: publish
published: true
title: How to get the mouse wheel working in vmware
author: janos
author_login: janos
author_email: info@titan2x.com
wordpress_id: 50
wordpress_url: http://titan2x.wordpress.com/2008/10/03/mouse-wheel-in-vmware/
date: 2008-10-03 07:07:00.000000000 +02:00
categories:
- Hacks
tags: []
comments: []
---
Sometimes the mouse wheel just doesn't work for me in vmware. Then I remembered I used to have to add some options for that in the X11 configuration file about 5-10 years ago. In modern native installations no such tricks should be needed, but I guess things are different when you run in vmware. So in case you ever need, the magic lines to put in <code>/etc/X11/xorg.conf</code> :
<blockquote>Option "Protocol" "IMPS/2"
Option "ZAxisMapping" "4 5"</blockquote>
