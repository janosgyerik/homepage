---
layout: post
status: publish
published: true
title: Subversion does not remember or update my password
date: 2013-02-06 14:50:35.000000000 +01:00
categories:
- Hacks
- software
tags: []
---
I had this strange issue the other day. My account password has recently changed, and for each Subversion repository linked to that account I had to re-enter my password. Normally it is enough to re-enter once per repository: Subversion updates the corresponding authentication setting file so that I don't need to enter it again. But for some repositories it kept asking for it...

After some digging around, I realized that my user did not have write access to the file that sores the password. That is easy to fix once you know what to look for, and if you know which file it is. However that can be tricky if like me you don't know how Subversion organizes its settings files...

In Windows 7 (using the Git shell) you can find your Subversion setting files that you don't have write access to like this:

```
find /c/Users/YOURUSER/AppData/Roaming/Subversion ! -perm -200 -type f -ls
```

This can be useful to confirm your suspicion about filesystem permission issues. You can add back your write permission with the command:

```
find /c/Users/YOURUSER/AppData/Roaming/Subversion ! -perm -200 -type f -exec chmod {} \;
```

If you are really lazy to type all that, you can simply add write permission to yourself on all files in the Subversion directory with:

```
chmod -R u+w /c/Users/YOURUSER/AppData/Roaming/Subversion
```

How did it happen that my write permission has disappeared on some of the files? I haven't the foggiest idea...
