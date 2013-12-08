---
layout: post
status: publish
published: true
title: How to do grep in windows
author: janos
author_login: janos
author_email: info@titan2x.com
wordpress_id: 31
wordpress_url: http://titan2x.wordpress.com/2008/05/08/grep-in-windows/
date: 2008-05-08 04:30:00.000000000 +02:00
categories:
- Hacks
tags: []
comments: []
---
<code>findstr</code> in windows works similarly to <code>grep</code> in unix. For example you can do this:
<pre>netstat -a | findstr 8000</pre>
Another command <code>find</code> is also similar, with slightly different syntax and powers. I don't remember which is which, but with one of them you can use regular expressions.
