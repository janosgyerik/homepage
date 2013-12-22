---
layout: post
status: publish
published: true
title: Problems using Launchpad through proxy finally resolved
date: 2012-08-21 20:48:09.000000000 +02:00
categories:
- Hacks
- Software
tags: []
comments: []
---
A long-standing bug with Bazaar/Launchpad has finally been resolved! Until recently I was not able to checkout anything from Launchpad through a corporate proxy, getting errors like:
<pre>
bzr: ERROR: Connection error: Couldn't resolve host 'xmlrpc.launchpad.net' [Errno 11004] getaddrinfo failed
</pre>
or
<pre>
bzr: ERROR: Certificate error: hostname '172.16.16.16' doesn't match either of '*.launchpad.net', 'launchpad.net'
</pre>
Finally this has been resolved in Bazaar 2.5.1 (you do need 2.5.1, the problem still existed in 2.5). Another important piece is that if you are using the command line, the proxy should be set in https_proxy environment variable, in the format:
<pre>
export https_proxy=http://proxyuser:proxypass@proxyserver:port/path
</pre>
Notice the "s" in "https_proxy", this is different from "http_proxy", and required for Launchpad urls such as "lp:someproject".

With this in place now I can checkout with `bzr co lp:theproject` as usual.
