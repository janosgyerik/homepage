---
layout: post
status: publish
published: true
title: Changing Launchpad branch from Mirrored to Hosted
date: 2010-10-08 22:23:05.000000000 +02:00
categories:
- hacks
- software
tags: []
---
I realized the `lp:senspodapp` branch is not so good to have *Mirrored*. I set it to mirror from the location where I usually develop, but my development branch is not always 100% clean, and it's better to keep official releases separate anyway. So I wanted to change it from *Mirrored* to *Hosted*, which would effectively mean that `lp:senspodapp` gets updated when I explicitly do so, and I can get on with my development in my own branch http://bzr.titan2x.com/android/SenspodApp

So how to do it? Unfortunately Launchpad doesn't have an option to change from Mirrored. The workaround is to register another branch, and switch over to it. It takes a couple of steps.

1. Register a new branch, say "devel", leave it empty (nothing pushed)
1. Change the "trunk" series to use "devel", the new empty branch. We cannot create the "main" branch as long as the "trunk" series uses it.
1. Delete "main"
1. Re-create "main"
1. Change the "trunk" series to use "main"
1. Push to "main"

