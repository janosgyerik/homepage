---
layout: post
title: "Say hello to portping"
categories:
- news
- hacks
- software
tags: []
---
{% include JB/setup %}

I found a good purpose for Go: a command line tool to ping ports.
I often need something like this at work,
and it's a PITA that there's no `telnet` command in Windows.
Actually, `telnet` is not even very practical for the purpose.
(`nmap` would be good, a bit too good, and pose a security risk.)

I researched first if such tool already exists.
I found [CryPing](http://www.cryer.co.uk/downloads/cryping/examples.htm),
which does what I need, but...
Do I really want to install a closed-source program of some guy in Windows? Noooope!

I also researched for similar tools on [godoc.org](https://godoc.org).
But I couldn't find a command line tool,
only some bloated libraries that did much more than what I wanted,
and not really the way I wanted.

And why Go? Because I can easily build cross-platform.
Installation is a simple download of an exe,
no other tools like a JVM or a Python interpreter needed,
simply runs natively.

So I put together portping: [https://github.com/janosgyerik/portping](https://github.com/janosgyerik/portping)

Posted for code review as well: [Port pinger command line tool](http://codereview.stackexchange.com/q/124078/12390)

I have something that works, I called it v1.0.
There are plenty of opportunities for improvement,
I left many TODO comments in the code.
I hope you might find this interesting to contribute to.
