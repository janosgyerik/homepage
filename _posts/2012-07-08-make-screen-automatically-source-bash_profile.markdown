---
layout: post
status: publish
published: true
title: Make screen automatically source .bash_profile
author: janos
author_login: janos
author_email: info@titan2x.com
wordpress_id: 675
wordpress_url: http://www.janosgyerik.com/?p=675
date: 2012-07-08 08:49:19.000000000 +02:00
categories:
- Hacks
- Software
tags: []
comments: []
---
By default <code>screen</code> does not start as a login shell, and therefore <code>.bash_profile</code> is not sourced. (Wonder what is the rationale behind this decision, considering that 99% of the time I use it as login shell...)

A simple remedy is to create a custom script that will be used as <code>screen</code>'s shell, and edit <code>.screenrc</code> to tell <code>screen</code> to use the custom script. The custom script: (I put in <code>~/.screen.shell</code>)

<pre><code>bash --login
</code></pre>

Note: remember to make the script file executable.

The line in <code>.screenrc</code>:

<pre><code>shell $HOME/.screen.shell
</code></pre>
