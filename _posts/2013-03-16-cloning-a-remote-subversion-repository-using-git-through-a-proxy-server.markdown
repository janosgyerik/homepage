---
layout: post
status: publish
published: true
title: Cloning a remote Subversion repository using Git through a proxy server
author: janos
author_login: janos
author_email: info@titan2x.com
wordpress_id: 897
wordpress_url: http://www.janosgyerik.com/?p=897
date: 2013-03-16 12:37:36.000000000 +01:00
categories:
- Hacks
- Software
tags: []
comments: []
---
To clone a remote Subversion repository using Git through a proxy server, edit the <code>~/.subversion/servers</code> file appropriately:

<pre><code>[global]
# http-proxy-exceptions = *.exception.com, www.internal-site.org
# http-proxy-host = defaultproxy.whatever.com
# http-proxy-port = 7000
# http-proxy-username = defaultusername
# http-proxy-password = defaultpassword
</code></pre>

Note that even in Windows, the correct path is actually <code>~/.subversion/servers</code> when using <code>git-svn</code>, even though this is NOT the normal configuration directory for the native <code>svn.exe</code>. For example in Windows 7 <code>svn.exe</code> typically uses the path <code>C:\Users\YOURUSER\AppData\Roaming\Subversion</code>.

This was quite confusing to me at first, because after I got <code>svn checkout</code> working well by editing <code>C:\Users\YOURUSER\AppData\Roaming\Subversion\servers</code> I was surprised to find that <code>git clone svn</code> still had the proxy issue.

In case you were wondering, the <code>http_proxy</code> and <code>https_proxy</code> environment variables are ignored by both Git and Subversion.
