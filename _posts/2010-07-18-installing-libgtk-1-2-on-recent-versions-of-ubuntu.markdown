---
layout: post
status: publish
published: true
title: Installing libgtk1.2 on recent versions of Ubuntu
date: 2010-07-18 08:13:09.000000000 +02:00
categories:
- Hacks
- Musings
- Software
tags: []
comments:
- id: 5
  author: Mike
  author_email: mike@ultrateq.net
  author_url: ''
  date: '2011-01-15 18:22:21 +0100'
  date_gmt: '2011-01-15 09:22:21 +0100'
  content: |-
    Thanks, that's what I needed.

    Only note is i had to remove the hyphen from package name in last line so it read:

    sudo apt-get install libgtk1.2
- id: 6
  author: titan2x
  author_email: info@titan2x.com
  author_url: http://titan2x.com/
  date: '2011-01-16 21:45:31 +0100'
  date_gmt: '2011-01-16 12:45:31 +0100'
  content: You're probably right, I must have mistyped it... I corrected it now, thanks!
- id: 7
  author: dev
  author_email: ericdelyon@yopmail.com
  author_url: ''
  date: '2011-04-15 22:13:12 +0200'
  date_gmt: '2011-04-15 13:13:12 +0200'
  content: merci sa ma vachement aidez pour installé uplink!
- id: 8
  author: Alby97
  author_email: alberto.pau@hotmail.it
  author_url: http://twitter.com/Alby97_Gatorade
  date: '2011-08-22 22:17:01 +0200'
  date_gmt: '2011-08-22 13:17:01 +0200'
  content: |-
    You also need it for ePSXe.

    Thanks :)
- id: 9
  author: Felix
  author_email: fxsmoncada@yahoo.com
  author_url: ''
  date: '2011-10-17 07:26:15 +0200'
  date_gmt: '2011-10-16 22:26:15 +0200'
  content: thank you very much! It worked perfectly!
- id: 10
  author: michal
  author_email: selmi@centrum.sk
  author_url: ''
  date: '2012-01-05 21:48:17 +0100'
  date_gmt: '2012-01-05 12:48:17 +0100'
  content: doesn't work for oneiric :(
---
libgtk-1.2 is very old and unmaintained software, and it has been removed from recent versions of Ubuntu and Debian. Read more here:

<a href="http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=520441">http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=520441</a>

Unfortunately, lots of old games and other apps still depend on it. If you must, install it with:
<pre>sudo apt-add-repository ppa:adamkoczur/gtk1.2
sudo apt-get update
sudo apt-get install libgtk1.2</pre>
I needed this to install Darwinia, it seems it is also needed for Uplink and other games.

<a href="http://www.introversion.co.uk/darwinia/">http://www.introversion.co.uk/darwinia/</a>
