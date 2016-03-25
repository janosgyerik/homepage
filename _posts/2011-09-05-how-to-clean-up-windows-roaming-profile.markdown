---
layout: post
status: publish
published: true
title: How to clean up Windows roaming profile
date: 2011-09-05 18:03:41.000000000 +02:00
categories:
- hacks
tags: []
---
I hate it when it takes a long time to log in/out of Windows XP. Very often the slowness is due to using too much disk space in the roaming profile, combined with a slow network. You can check the disk usage of your profile in: **My Computer** properties (shortcut: `Windows + Pause`) and then **Advanced / User Profiles / Settings**. The user profile folder is typically: `c:/Documents and Settings/your_username/`. If there are large files under this folder that you don't really need in your roaming profile, it's good to move them somewhere else. Typical space eaters in my case are:

- Desktop - I sometimes inadvertently drop large files here, especially files downloaded by browsers.
- 3rd party software. Some software may store large data here too, for example Maven stores its repositories here by default.
- Application Data (hidden folder) - if too large it might be suspicious, but in general you should not mess with this folder.

Exception: the Local Settings (hidden folder) is not counted in your roaming profile, so you can ignore even if it's huge, in fact don't mess with this folder.
After some cleaning up, check the result again in My Computers properties. Happy cleaning!
