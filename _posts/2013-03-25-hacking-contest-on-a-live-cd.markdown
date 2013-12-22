---
layout: post
status: publish
published: true
title: Hacking contest on a Live CD
date: 2013-03-25 18:48:27.000000000 +01:00
categories:
- Hacks
- News
- Software
tags: []
comments:
- id: 2267
  author: frytaz1
  author_email: frytaz@gmail.com
  author_url: ''
  date: '2013-04-15 19:14:31 +0200'
  date_gmt: '2013-04-15 19:14:31 +0200'
  content: "Cool, as for now got into level02 :)\r\nGona try next one soon, great
    contest"
---
I built a remastered Linux Live CD that should be interesting, educational, and highly entertaining for any self-respecting programmer: a security challenge with 6 levels based on the online contest created by <a href="https://stripe.com/blog/capture-the-flag">Stripe</a> in early 2012.

The CD contains a very light Linux system (based on <a href="http://www.tinycorelinux.net/">Tiny Core</a>), the ISO image is less than 30 megabytes. You can download it from here:
<a href="https://sourceforge.net/projects/ctfomatic/files/">https://sourceforge.net/projects/ctfomatic/files/</a>

The easiest way to use the Live CD is with a software like VirtualBox: create a virtual machine with no hard disk and 256MB memory and point the CD device to the ISO file and that's it, start the VM! The Live CD uses US qwerty keyboard by default, you can change that by passing a boot parameter at the boot prompt, for example:

```
boot: kmap=azerty/fr
```

Alternatively you can use the shortcuts `fr`, `jp` or `hu` for French, Japanese or Hungarian keymap, respectively.

When the system starts you are logged in as user `level00`. You will be presented with a hint that should help you gain access to the password of user `level01`. Your mission, should you choose to accept it, is to find and exploit the vulnerabilities presented at each increasingly difficult level, advancing forward until you reach `level06` (and celebrate!)

By completing this challenge you will become a better programmer:
<ul>
	<li>You will increase your awareness of the importance of security, and probably write more secure, more robust code in the future.</li>
	<li>You will improve your skill of finding problems and weaknesses, which is the critical first step in optimization tasks.</li>
	<li>You will have a wonderful time, and come out enlightened!</li>
</ul>
The source code of the scripts used to build this CD is available on GitHub:
<a href="https://github.com/janosgyerik/capture-the-flag">https://github.com/janosgyerik/capture-the-flag
</a>

Have fun!
