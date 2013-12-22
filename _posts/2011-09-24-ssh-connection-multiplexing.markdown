---
layout: post
status: publish
published: true
title: ssh connection multiplexing
date: 2011-09-24 00:14:44.000000000 +02:00
categories:
- Hacks
- Software
tags: []
---
Aaaaaaaah. So good I finally tried this.

I knew about ssh multiplexing for a while, and that it can speed up your ssh connections when you ssh to a server in several terminal windows in parallel. However, I typically use just one terminal window per server, and a screen session right after I login, so I normally don't have more than one connection. But, my software repositories happen to be on the same remote server I use a lot, and since my new internet provider is pretty slow, the long delays after every commit/push quickly became annoying.

Not anymore! ssh multiplexing is just the thing I needed, enabling it is as easy as adding this to your ~/.ssh/config:

```
Host *
 ControlMaster auto
 ControlPath ~/.ssh/master-%r@%h:%p
```

