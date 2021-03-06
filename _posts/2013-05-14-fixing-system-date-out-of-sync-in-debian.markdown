---
layout: post
status: publish
published: true
title: Fixing system date out of sync in Debian
date: 2013-05-14 05:22:21.000000000 +02:00
categories:
- hacks
tags: []
---
I started using my old-ish Debian server again and realized the system date is off by 20 minutes...

The solution is to install `ntpdate`, which automatically synchronizes the clock at certain system events, for example when the network interface comes up.

To force synchronizing *now*, you can run `ntpdate` manually, but you must specify the NTP servers to use as reference on the command line, otherwise it will give you an error like this:

```
14 May 06:53:06 ntpdate[6505]: no servers can be used, exiting
```

An easier way is to run `ntpdate-debian` without arguments, which will use the NTP servers configured in `/etc/default/ntpdate`, which is a Debian-specific setup.
