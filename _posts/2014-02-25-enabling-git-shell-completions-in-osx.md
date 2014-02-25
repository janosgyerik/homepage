---
layout: post
title: "Enabling Git shell completions in OSX"
categories:
- hacks
tags: []
---
{% include JB/setup %}

Hard to believe I survived so long with Git in the shell without setting up auto-completion features in Mac OS X. But that's what happened!
At last, I got annoyed by some longish remote names and some longish branch names, to the point that gave me the right push.

I have an oldish PC, with Snow Leopard and [MacPorts](http://www.macports.org/).
Based on [this article on superuser.com](http://superuser.com/questions/31744/how-to-get-git-completion-bash-to-work-on-mac-os-x), it seemed pretty simple to do:

    sudo port selfupdate
    sudo port install git-core +bash_completion

You have to pay attention to the output of these commands.
Somewhere in the middle the install step mentioned that the completion features will only work in Bash version >= 4.1.
Checking what I have at hand:

    $ echo $BASH_VERSION 
    3.2.48(1)-release
    $ echo $SHELL
    /bin/bash
    $ which bash
    /opt/local/bin/bash
    $ bash --version
    GNU bash, version 4.2.45(2)-release (i386-apple-darwin10.8.0)
    Copyright (C) 2011 Free Software Foundation, Inc.
    License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>

    This is free software; you are free to change and redistribute it.
    There is NO WARRANTY, to the extent permitted by law.

So my current shell is `/bin/bash`, version 3.2,
but a 4.2 version exists already in my system at `/opt/local/bin/bash`.
Let's change my shell:

    $ chsh -s /opt/local/bin/bash
    Changing shell for janos.
    Password for janos: 
    chsh: /opt/local/bin/bash: non-standard shell

It didn't work, apparently because the shell I specified is "not standard".
According to the man page of `chsh`,
standard shells are the ones listed in `/etc/shells`.
This Bash 4 was installed by MacPorts,
and I do mean it as a standard shell,
so let's add it to the list:

    echo /opt/local/bin/bash | sudo tee -a /etc/shells 

After this I could change my shell,
and in a new terminal window or tab I could start enjoying auto-completion in Git commands, yeay!
Most importantly in operations with remotes and branches.
