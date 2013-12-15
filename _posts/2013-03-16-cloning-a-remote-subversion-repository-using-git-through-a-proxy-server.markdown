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
To clone a remote Subversion repository using Git through a proxy server, edit the `~/.subversion/servers` file appropriately:

<pre>`[global]
# http-proxy-exceptions = *.exception.com, www.internal-site.org
# http-proxy-host = defaultproxy.whatever.com
# http-proxy-port = 7000
# http-proxy-username = defaultusername
# http-proxy-password = defaultpassword
`</pre>

Note that even in Windows, the correct path is actually `~/.subversion/servers` when using `git-svn`, even though this is NOT the normal configuration directory for the native `svn.exe`. For example in Windows 7 `svn.exe` typically uses the path `C:\Users\YOURUSER\AppData\Roaming\Subversion`.

This was quite confusing to me at first, because after I got `svn checkout` working well by editing `C:\Users\YOURUSER\AppData\Roaming\Subversion\servers` I was surprised to find that `git clone svn` still had the proxy issue.

In case you were wondering, the `http_proxy` and `https_proxy` environment variables are ignored by both Git and Subversion.
