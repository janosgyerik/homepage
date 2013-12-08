---
layout: post
status: publish
published: true
title: Authenticated proxy server and command line applications in Windows
author: janos
author_login: janos
author_email: info@titan2x.com
wordpress_id: 835
wordpress_url: http://www.janosgyerik.com/?p=835
date: 2012-12-04 21:17:24.000000000 +01:00
categories:
- Hacks
tags: []
comments: []
---
I tend to forget a couple of "gotchas" when working in an environment with a proxy server and restricted internet access. So these are a few reminders to self.

Let's assume an environment where you have a browser correctly configured to use a proxy server and it is working well.

The environment variables to set for command line applications, if needed:
<pre>http_proxy=http://proxyuser:proxypass@proxyserver:port/path
https_proxy=http://proxyuser:proxypass@proxyserver:port/path
ftp_proxy=http://proxyuser:proxypass@proxyserver:port/path</pre>
(enough to set only the ones you actually need)

For this you need to know the proxy server. Usually it is not difficult to figure out from the proxy settings in the browser or the network settings in the control panel, but in some Windows systems the setting may not be visible. In that case, you can try to find it from one of these:
<pre>ping wpad
ipconfig /all
netstat -ban</pre>
<code>ping wpad</code> is the easiest to read but the least likely to work in your system, <code>netstat -ban</code> is the most difficult to read but it <em>has to</em> work always.

Finally, sometimes it may still not work despite setting <code>http_proxy</code> correctly, resulting in proxy authentication errors for some reason. When that happens, try to access the URL in the browser first, and then try it again on the command line.
