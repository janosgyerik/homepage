---
layout: post
status: publish
published: true
title: Disabling access to Facebook
date: 2013-11-23 19:16:18.000000000 +01:00
categories:
- hacks
tags: []
---
Here's a little tip for the not-so-tech-savvy, because it's important.

Facebook tracks the websites you visit even if you don't click on Like buttons. When a Like button is loaded, it executes code on facebook.com, sending your IP address, the website you are on, among other things. There is a way to switch this off effectively, by telling your computer the wrong address of facebook.com, so that your browser and any other processes will never find Facebook, and thus will never send any information to Facebook. You can do this by overriding the address of facebook.com in the so-called *hosts file* on your computer.

Press <kbd>Windows + r</kbd> keys and enter this command:

```
notepad %systemroot%\system32\drivers\etc\hosts
```

This opens the hosts file on your system in notepad, a plain text editor. Append this line to end of the file:

    127.0.0.1 facebook.com www.facebook.com connect.facebook.net
    ::1 facebook.com www.facebook.com connect.facebook.net

Once this is done, Facebook, and its Like buttons will stop working, because your browser will not find Facebook. If you want to re-enable Facebook, edit the file again and either remove this line, or prefix it with a `#` sign to make it ignored.

If you are on a Mac, edit `/etc/hosts` instead.
However, at the time of this writing (Mac OS X10.9.4),
the `::1` shortcut for the IPv6 loopback interface doesn't seem to work,
so you have to replace that with `fe80::1%lo0`, like this:

    fe80::1%lo0 facebook.com www.facebook.com connect.facebook.net

### Browser caching

An important thing to keep in mind when testing this is that some application have their own DNS cache. For example the Chrome browser: it doesn't make sense to lookup IP addresses on every page reload, if the address of facebook.com was 173.252.110.27 a minute ago it should still be the same now, right? This makes it hard to test things, because it takes a couple of minutes for Chrome to expire its cache. (Unless you know a method to expunge it.)

One testing method that worked well for me is using the **Incognito Window** feature of Chrome. Every time you change something in `/etc/hosts`, open a new incognito window to view the result, and it should work immediately. The non-incognito windows will work too, eventually, it just takes a couple of minutes.

(For more details, see this [related discussion][1], and [my conclusion][2] on it.)

### Block more

If you want to be really thorough,
you might want to block even more facebook related domains,
here's a more complete list:

```
# Block Facebook IPv4
127.0.0.1   www.facebook.com
127.0.0.1   facebook.com
127.0.0.1   login.facebook.com
127.0.0.1   www.login.facebook.com
127.0.0.1   fbcdn.net
127.0.0.1   www.fbcdn.net
127.0.0.1   fbcdn.com
127.0.0.1   www.fbcdn.com
127.0.0.1   static.ak.fbcdn.net
127.0.0.1   static.ak.connect.facebook.com
127.0.0.1   connect.facebook.net
127.0.0.1   www.connect.facebook.net
127.0.0.1   apps.facebook.com

# Block Facebook IPv6
fe80::1%lo0 facebook.com
fe80::1%lo0 login.facebook.com
fe80::1%lo0 www.login.facebook.com
fe80::1%lo0 fbcdn.net
fe80::1%lo0 www.fbcdn.net
fe80::1%lo0 fbcdn.com
fe80::1%lo0 www.fbcdn.com
fe80::1%lo0 static.ak.fbcdn.net
fe80::1%lo0 static.ak.connect.facebook.com
fe80::1%lo0 connect.facebook.net
fe80::1%lo0 www.connect.facebook.net
fe80::1%lo0 apps.facebook.com
```

[1]: http://superuser.com/q/544789/126831
[2]: http://superuser.com/a/794907/126831
