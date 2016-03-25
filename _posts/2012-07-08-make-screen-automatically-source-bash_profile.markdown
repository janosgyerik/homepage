---
layout: post
status: publish
published: true
title: Make screen automatically source .bash_profile
date: 2012-07-08 08:49:19.000000000 +02:00
categories:
- hacks
- software
tags: []
---
By default `screen` doesn't use a login shell,
and as a consequence,
`.bash_profile` is not sourced.
(Something I find pretty strange,
considering that `screen` is most useful as a login shell...)

To make `screen` start `bash` as a login shell,
add this line to your `.screenrc`:

    shell -bash

Or if you need something more sophisticated,
you can create a custom script for `screen` to use as a shell.
For example create `~/.screen.shell` like this:

    bash --login

and make it executable:

    chmod +x ~/.screen.shell

and add to `~/.screenrc` this line:

    shell $HOME/.screen.shell
