---
layout: post
status: publish
published: true
title: Where is the ternary operator in Python
author: janos
author_login: janos
author_email: info@titan2x.com
wordpress_id: 155
wordpress_url: http://titan2x.wordpress.com/?p=155
date: 2009-08-27 15:57:22.000000000 +02:00
categories:
- Hacks
tags: []
comments: []
---
There is NO ternary operator in python but you can imitate like this, which is kinda cool:
<blockquote>val = ('val1', 'val2')[x &lt; y]</blockquote>
... as an imitation of ...
<blockquote>val = x &lt; y ? 'val2' : 'val1'</blockquote>
