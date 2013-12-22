---
layout: post
status: publish
published: true
title: Where is the ternary operator in Python
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
