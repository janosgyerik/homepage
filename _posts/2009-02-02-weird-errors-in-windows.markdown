---
layout: post
status: publish
published: true
title: Weird errors in Windows
author: janos
author_login: janos
author_email: info@titan2x.com
wordpress_id: 62
wordpress_url: http://titan2x.wordpress.com/2009/02/02/weird-errors-in-windows/
date: 2009-02-02 01:50:00.000000000 +01:00
categories:
- Hacks
tags: []
comments: []
---
When trying to uninstall an application (called FarPoint, a sleek spreadsheet development platform), I got an error that I need .NET framework 2.0 or higher to use this uninstaller. Which is weird, because I do have .NET 2.0, and the software would not work without it anyway in the first place. 

<p>The solution was, I had to run the uninstaller as administrator. Even though the application was not registered in <code>appwiz.cpl</code></p>

By the way, to run any app in windows as administrator, you don't need to logout and login as admin, you can just do this:
<blockquote>runas /u:administrator cmd</blockquote>

And then from the appearing <code>cmd</code> prompt window you can run whatever you want as admin.
