---
layout: post
status: publish
published: true
title: Authenticated proxy server and command line applications in Windows
date: 2012-12-04 21:17:24.000000000 +01:00
categories:
- hacks
tags: []
---
I tend to forget a couple of "gotchas" when working in an environment with a proxy server and restricted internet access.

Let's assume an environment where you have a browser correctly configured to use a proxy server and it's working well.

The environment variables to set for command line applications, if needed:

    http_proxy=http://proxyuser:proxypass@proxyserver:port/path
    https_proxy=http://proxyuser:proxypass@proxyserver:port/path
    ftp_proxy=http://proxyuser:proxypass@proxyserver:port/path

*(It's enough to set only the ones you actually need.)*

For this you need to know the proxy server.
Usually it's not difficult to figure out from the proxy settings in the browser or the network settings in the control panel,
but in some Windows systems (or at your workplace) the value of this setting may not be accessible (by the configuration of your sysadmins).
In that case, you can try to find it using one of these methods:

    ping wpad
    ipconfig /all
    netstat -ban

`ping wpad` is the easiest to read but the least likely to work in your system.
`netstat -ban` is the most difficult to read but it *has to* work always.

Finally, sometimes it may still not work despite setting `http_proxy` correctly, resulting in proxy authentication errors for some reason.
When that happens, try to access the URL in the browser first,
and then try it again on the command line.
