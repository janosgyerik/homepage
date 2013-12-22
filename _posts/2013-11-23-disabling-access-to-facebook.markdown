---
layout: post
status: publish
published: true
title: Disabling access to Facebook
author: janos
author_login: janos
author_email: info@titan2x.com
wordpress_id: 1137
wordpress_url: http://www.janosgyerik.com/?p=1137
date: 2013-11-23 19:16:18.000000000 +01:00
categories:
- Hacks
tags: []
comments: []
---
Here's a little tip for the not-so-tech-savvy, because it's important.

Facebook tracks the websites you visit even if you don't click on Like buttons. When a Like button is loaded, it executes code on facebook.com, sending your IP address, the website you are on, among other things. There is a way to switch this off effectively, by telling your computer the wrong address of facebook.com, so that your browser and any other processes will never find Facebook, and thus will never send any information to Facebook. You can do this by overriding the address of facebook.com in the so-called *hosts file* on your computer.

Press <kbd>Windows + r</kbd> keys and enter this command:

```
notepad %systemroot%\system32\drivers\etc\hosts
```

This opens the hosts file on your system in notepad, a plain text editor. Append this line to end of the file:

```
127.0.0.1 facebook.com www.facebook.com connect.facebook.net
```

Once this is done, Facebook, and its Like buttons will stop working, because your browser will not find Facebook. If you want to re-enable Facebook, edit the file again and either remove this line, or prefix it with a `#` sign to make it ignored.
