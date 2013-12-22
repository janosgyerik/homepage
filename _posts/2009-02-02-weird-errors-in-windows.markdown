---
layout: post
status: publish
published: true
title: Weird errors in Windows
date: 2009-02-02 01:50:00.000000000 +01:00
categories:
- Hacks
tags: []
---
When trying to uninstall an application (called FarPoint, a sleek spreadsheet development platform), I got an error that I need .NET framework 2.0 or higher to use this uninstaller. Which is weird, because I do have .NET 2.0, and the software would not work without it anyway in the first place. 

The solution was, I had to run the uninstaller as administrator. Even though the application was not registered in `appwiz.cpl`

By the way, to run any app in windows as administrator, you don't need to logout and login as admin, you can just do this:
<blockquote>runas /u:administrator cmd</blockquote>

And then from the appearing `cmd` prompt window you can run whatever you want as admin.
