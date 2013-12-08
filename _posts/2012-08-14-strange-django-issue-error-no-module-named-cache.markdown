---
layout: post
status: publish
published: true
title: 'Strange Django issue: Error: No module named cache'
author: janos
author_login: janos
author_email: info@titan2x.com
wordpress_id: 712
wordpress_url: http://www.janosgyerik.com/?p=712
date: 2012-08-14 18:27:05.000000000 +02:00
categories:
- Hacks
- Software
tags: []
comments: []
---
Just now when running <code>./manage.py syncdb</code> Django (1.4) gave a strange error:

<pre><code>Error: No module named cache
</code></pre>

What tha... Googled it, no help. A <code>pip install -r pip.txt --upgrade</code> made it work. Lucky! (Among other things it replaced my Django 1.4 installation in the virtualenv. I suspect that fixed it.)
