---
layout: post
status: publish
published: true
title: Solaris got goood (version 5.11)
date: 2013-12-01 11:32:33.000000000 +01:00
categories:
- Musings
- software
tags: []
---
Looking through my old drafts in this blog, posts I never published, I found this piece.

---

I recently installed the new OpenSolaris, version 5.11, released in 2008 December, I think. From the live CD. On my laptop. Earlier versions used to be quite painful, and I would definitely not consider putting on a laptop. (Ah, that's a lie. I did actually install 5.10 on my ThinkPad X31...)

5.10 used to require a LOT of disk space. I remember failed installations on a virtual machine with a 10G virtual disk, running out of space. The new 5.11 system installed from the Live CD is only 2.4G now, much better!

But enough talking, let's get to technical stuff. What compelled me to post this entry is the ease at which I could do things that used to be difficult, such as:

- Setup sudo. In the past I had to install sudo and visudo myself. Now, they are included in the system by default.
- Install vim. This used to be tricky too, now it's installed by default, with all the modern features such as syntax highlighting. Oh joy.
- Setup sudoers. In the default configuration users in group "wheel" can execute all commands. Solaris doesn't have a group called "wheel", but it has a group called "staff" with GID 10, which is the usual GID for "wheel". After making this change I was going to add my user to this group, but then, I found it was already member of this group, which makes perfect sense, as this is the first user I created during installation.

And so on and so on. These are little things, but it's great to see real UNIX systems becoming free and so much more usable than in the past.

---

I don't know why I didn't post this, back in 2009. I guess I wanted to write more cool things. I'm posting now, because it made me want to install OpenSolaris again :-)
