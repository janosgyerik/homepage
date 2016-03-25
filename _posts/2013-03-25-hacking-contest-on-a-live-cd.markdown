---
layout: post
status: publish
published: true
title: Hacking contest on a Live CD
date: 2013-03-25 18:48:27.000000000 +01:00
categories:
- hacks
- news
- software
tags: []
---
I built a remastered Linux Live CD that should be interesting, educational, and highly entertaining for any self-respecting programmer: a security challenge with 6 levels based on the online contest created by [Stripe](https://stripe.com/blog/capture-the-flag) in early 2012.

The CD contains a very light Linux system (based on [Tiny Core](http://www.tinycorelinux.net/)), the ISO image is less than 30 megabytes. You can download it from here:
https://sourceforge.net/projects/ctfomatic/files/

The easiest way to use the Live CD is with a software like VirtualBox: create a virtual machine with no hard disk and 256MB memory and point the CD device to the ISO file and that's it, start the VM! The Live CD uses US qwerty keyboard by default, you can change that by passing a boot parameter at the boot prompt, for example:

```
boot: kmap=azerty/fr
```

Alternatively you can use the shortcuts `fr`, `jp` or `hu` for French, Japanese or Hungarian keymap, respectively.

When the system starts you are logged in as user `level00`. You will be presented with a hint that should help you gain access to the password of user `level01`. Your mission, should you choose to accept it, is to find and exploit the vulnerabilities presented at each increasingly difficult level, advancing forward until you reach `level06` (and celebrate!)

By completing this challenge you will become a better programmer:

- You will increase your awareness of the importance of security, and probably write more secure, more robust code in the future.
- You will improve your skill of finding problems and weaknesses, which is the critical first step in optimization tasks.
- You will have a wonderful time, and come out enlightened!

The source code of the scripts used to build this CD is available on GitHub:
https://github.com/janosgyerik/capture-the-flag

Have fun!
