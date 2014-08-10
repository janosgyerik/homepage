---
layout: post
title: "Disabling access to Facebook 2"
categories:
- hacks
tags: []
---
{% include JB/setup %}

A while ago I wrote about [disabling access to Facebook][1] on Windows,
by editing the `%systemroot%\system32\drivers\etc\hosts` file.

I didn't mention about Mac OS X and Linux.
It just seemed too obvious: edit `/etc/hosts`, *duh*!
Until I received a comment asking specifically for Mac OS X.
When I checked on it,
I realized my setup was no longer working!
Despite having `127.0.0.1 facebook.com` and `::1 facebook.com` in `/etc/hosts`,
facebook.com was loading happily in Chrome. *What the hell!*

So I started digging,
and found many other users with similar issues:

[Why can't I block Facebook using /etc/hosts on Mountain Lion?][2]

Apparently,
at the time of this writing there's a bug in Mac OS X (10.9.4),
and the `::1` shortcut for the IPv6 loopback interface doesn’t seem to work,
so you have to replace that with `fe80::1%lo0`, like this:

    fe80::1%lo0 facebook.com www.facebook.com connect.facebook.net

Worst of all,
testing this was a nightmare,
because I didn't realize that Chrome uses a DNS cache of its own:
changes to `/etc/hosts` are not visible immediately,
it takes a couple of minutes until they take effect.
The workaround is to open a new **Incognito Window** after every edit.

[1]: http://www.janosgyerik.com/disabling-access-to-facebook/
[2]: http://superuser.com/q/544789/126831
