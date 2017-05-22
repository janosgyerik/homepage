---
layout: post
title: "bashoneliners.com is back!"
categories:
- hacks
- software
tags: []
---
{% include JB/setup %}

I'm happy to say that with the fix of social logins,
such as login with Google, Yahoo, OpenID,
[bashoneliners.com][1] is finally back!

So WTF happened, you might ask.
Perfectionism and overthinking, that's what happened.

The site used to have old-style OpenID/social authentication,
and many authentication providers started to move away from it in favor of OAuth2.
Starting from Google, little by little,
all old-style providers stopped their legacy services,
making login impossible on [bashoneliners.com][1].

Django modules for OAuth2 have been around for a long time,
so finding a solution was not the problem.
The problem was that I wanted to migrate user accounts automatically and smoothly,
which was kind of difficult,
so I ended up postponing the task again and again.

Better late than never,
finally I got off my butt to fix this.
Login with GitHub, Google, Yahoo and OpenID works again.
After you login, you will see a message to fill a form with links to your new and old accounts,
so that I can merge them manually,
so that your contributions won't be lost.
The solution is neither automatic nor smooth,
but it works, and that's the only thing that matters.

I shared this "story" here in case it may serve as a cautionary tale for others.
If you have something somewhere half-abandoned, half-defunct,
that might have an imperfect but effective solution,
then get off your butt and just get it done.

[1]: http://www.bashoneliners.com
