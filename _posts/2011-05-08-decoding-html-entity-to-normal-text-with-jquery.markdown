---
layout: post
status: publish
published: true
title: How to convert html entity characters to normal text with jquery
author: janos
author_login: janos
author_email: info@titan2x.com
wordpress_id: 299
wordpress_url: http://titan2x.wordpress.com/?p=299
date: 2011-05-08 02:04:18.000000000 +02:00
categories:
- Hacks
- Software
tags: []
comments: []
---
I display Google Local Search results in custom InfoWindows and text input fields. Recently I discovered that if place titles have html entity characters in their name such as &amp;quot;, they show up in their encoded forms if I print them with:
<pre>$(obj).text(title);</pre>
One way to convert/decode to normal text:
<pre>$(obj).text($('&lt;span/&gt;').html(title).text());</pre>
I agree, it's not very pretty. If you know a better way please let me know!
