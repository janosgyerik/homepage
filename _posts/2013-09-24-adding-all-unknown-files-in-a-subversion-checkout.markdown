---
layout: post
status: publish
published: true
title: Adding all unknown files in a Subversion checkout
author: janos
author_login: janos
author_email: info@titan2x.com
wordpress_id: 1114
wordpress_url: http://www.janosgyerik.com/?p=1114
date: 2013-09-24 06:08:16.000000000 +02:00
categories:
- Hacks
- Software
tags: []
comments: []
---
Adding all unknown files in a working tree is usually very simple in other version control systems, for example:
<div>
<pre><code>git add .
bzr add
</code></pre>
Not so simple in Subversion:
<pre><code>$ svn add .
svn: warning: '.' is already under version control
</code></pre>
But if you add the <code>--force</code> flag, that will do!

Keep in mind that this is <strong>not</strong> the same as:
<pre><code>svn add * --force
</code></pre>
That would add not only unknown files, but ignored files too, which is usually not you want. Make sure to specify directories explicitly, avoid using <code>*</code> with this command.

</div>
