---
layout: post
status: publish
published: true
title: Moving away from Ubuntu
date: 2008-11-27 20:25:00.000000000 +01:00
categories:
- musings
tags: []
---
I stopped using Ubuntu/Gnome on my home desktop about half a year ago, to see how the other distros and KDE are doing, and to become skilled at using them too and reach a comfort level similar to that of Ubuntu/Gnome. Below is the summary of my experiences and impressions so far. But first, it is important to mention my basic expectations from a system.

- Responsive, snappy, doesn't crash
- Audio support out of the box, easy video and dvd playback easy to setup
- Easy to install new software
- Rich software repository, rarely need to look for unsupported/external sources
- Out of the box support for my nvidia FX5200 card
- Japanese fonts and input support
- Mount NFS partitions during boot
- Good LVM support in the installer
- Menus logically organized
- KDE4 desktop (I want to get familiar with it)
- Easy shutdown with power button
- Easy to make CapsLock an additional Control
- Flash plugin works out of the box in firefox


That's quite a long list. These are reasonable expectations though, Ubuntu happens to excel in most of these. 

### PCLinuxOS

Linux Format called this the "new Ubuntu". I used it only briefly, as it did not support KDE4 at the time, only KDE3. I do not recall significant negative impressions, but then again, it's been a while since I tried this. Perhaps audio was tricky at first, other than that I was mostly positive about it. Btw the light version of the OS, PCLinuxOS MiniME is excellent in VMWare, very snappy too.

### Sabayon

The best-looking system I've tried. However, being Gentoo based, it was not really comfortable to use. Software installation, or even software search took awfully long. On the other, the repository did have everything I needed. A couple of things were difficult/unintuitive to get to work.

- Getting NFS partitions mounted during boot (had to customize the boot sequence and scripts by hand)
- Syntax highlighting and function folding in vim. This was the most unexpected problem, for a system of such stature.
- Lilo configuration when root partition is on LVM (I documented the steps in this blog)

Overall, Sabayon looked great, but it was somehow slow. Also it crashed a few times. All that was kind of expected though, I mean, if you want an easy system then anything gentoo-based is clearly not the right choice. I just mentioned here to highlight Sabayon's good looks. And it actually worked much better than I had expected.

### OpenSUSE 11

I had very high expectations towards this distro, often ranking only one step behind Ubuntu on distrowatch.com. Unfortunately it fell short miserably.

- Was not really responsive. In particular, I had some strange keyboard problems like alt-tab doesn't switch windows, or I have to press it 3 consecutive times to make it work. Same thing for creating new tabs in Konsoles.
- Multimedia support was fairly easy. A quick search turned up a page on the opensuse site with a link that installed all the required packages, after which it all worked fine.
- Although the software repositories are fairly rich, it did not have FreeMind, and it was so difficult to install from external sources that I gave up in the middle.
- Japanese fonts were ugly
- Getting NFS partitions mounted during boot was tricky.
- The LVM manager in the installer was not very intuitive, but it worked ok.
- It set up some RTC alarm, turning on the computer at 5am every day. I could not find a configurator for this, and I'm not sure how it worked, because even if I changed the alarm to be non-periodic and to be yesterday (so it stops waking up every day), sooner or later the system reset it back to 5am. Worst of all, when I tried to search for relevant configuration by doing `grep -ri rtc /etc`, the command would exit with segmentation fault, and then the system would hang a few seconds later with CapsLock and NumLock blinking. This might be some hardware fault though.
- Shutdown by power button only works on the login screen, otherwise it brings up the logout menu (not what I want).
- At some point KDE stopped remembering my changes to the Desktop. Icons I deleted kept coming back after reboot. Another thing I blame KDE for is not being able to delete files on NFS mounts. That was very annoying. However, the reason why I chose OpenSUSE was that it was one of the earliest systems to support KDE4 as the default desktop. Perhaps it was too early to do so.

Overall, I was disappointed with suse, though I kept using it for many months.

### Mandriva 2009

The main motivation to replace suse was that KDE4 should be must more mature by now. My initial experience was not so good.

- The system menu is not organized logically. I am used to finding my desktop/system preferences somewhere near the top, but in mandriva they are kind of scattered around. They seem to just simply use the default KDE menu. A good desktop OS should do better than that, and create their own unique well organized menu.
- I could not find a menu for making CapsLock an additional Control.
- Something is wrong with the startup sound, the tune gets cut off in the middle.
- The plasma icons don't look as good as in suse.
- The Konsole fonts are too huge.
- Video playback did not work out of the box, but it works ok now with Kmplayer.
- Firefox did not have the flash plugin.
- The community doesn't seem to be very active, googling for basic things like video playback in mandriva turns up surprisingly few (or no) results.

After a lot of grumbling at first my girlfriend convinced me to wait a bit and give it a chance. So far that's working out quite well, and my impressions are turning quite positive.

- The LVM manager in the installer is superb.
- This is the first system to mount NFS partitions without touching the boot scripts.
- Japanese fonts are beautiful.
- The repository had FreeMind.
- The screensaver is a slideshow of amazingly beautiful scenery.
- The power button shuts down the computer easily.
- It cleared up the strange RTC alarm that suse insisted on.

But the game is far from over yet. I haven't tried playing DVDs, and then there is the test of time... So, to be continued...
