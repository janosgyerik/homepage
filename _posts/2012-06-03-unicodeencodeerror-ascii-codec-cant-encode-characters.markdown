---
layout: post
status: publish
published: true
title: 'UnicodeEncodeError: ''ascii'' codec can''t encode characters'
author: janos
author_login: janos
author_email: info@titan2x.com
wordpress_id: 649
wordpress_url: http://www.janosgyerik.com/?p=649
date: 2012-06-03 17:21:50.000000000 +02:00
categories:
- Hacks
- Software
tags: []
comments: []
---
When coding in python, I've been hit by the following error every once in a while:
<pre>UnicodeEncodeError: 'ascii' codec can't encode characters in position 25-28: ordinal not in range(128)</pre>
Today I finally figured why:
<pre>$ python -c 'import sys; print sys.stdout.encoding'
$ US-ASCII</pre>
Although my terminal application is capable of outputting unicode characters, python (2.6) somehow does not know it, and tries to output everything in <code>ascii</code>, hence the error. The solution is to set <code>PYTHONIOENCODING</code> in my ~/.bashrc:
<pre>export PYTHONIOENCODING=utf-8</pre>
