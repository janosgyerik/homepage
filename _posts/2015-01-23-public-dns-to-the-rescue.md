---
layout: post
title: "Public DNS to the rescue"
categories:
- hacks
tags: []
---
{% include JB/setup %}

A few weeks ago I was staying at a cheap hotel with crappy wifi.
The connection to the access point appeared to be ok,
but I couldn't visit any websites.
Just out of curiosity I tried to ping a server I knew by IP,
and it worked.
I checked the ports I knew to be open on that server to make sure it's really the server I know,
and it all made sense.

In short, it looked like the networking and routing was fine,
except DNS.
Then I remembered something about public DNS services.
So I did a quick search on my phone (mobile internet, as opposed to my laptop),
and found these addresses of [Google Public DNS][1]:

- 8.8.8.8
- 8.8.4.4

I added these lines in `/etc/resolv.conf`:

    nameserver 8.8.8.8
    nameserver 8.8.4.4

Bingo, problem solved!
Good thing these numbers are easy to remember.

[1]: https://developers.google.com/speed/public-dns/docs/using
