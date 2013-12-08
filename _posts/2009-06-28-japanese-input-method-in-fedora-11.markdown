---
layout: post
status: publish
published: true
title: How to set up Japanese input method in Fedora 11
author: janos
author_login: janos
author_email: info@titan2x.com
wordpress_id: 144
wordpress_url: http://titan2x.wordpress.com/?p=144
date: 2009-06-28 16:18:42.000000000 +02:00
categories:
- Hacks
- Software
tags: []
comments: []
---
It's great that these things keep getting easier. I used to have to tweak .gnomerc and .uim files and running uim-xim at startup... Probably that's a thing of the past. Here's how you do it the modern way.
<blockquote>yum install scim-lang-japanese</blockquote>
Next, go to <em>System | Preferences | Input Method</em>. This brings up the <em>IM Chooser</em> dialog. I selected IBus because it was marked recommended. Then in <em>Input Method Preferences</em>, and choose the <em>Input Methods</em> tab and select the input methods you want. That's it! You can swith to Japanese input with Ctrl - Space.
