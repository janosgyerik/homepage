---
layout: post
status: publish
published: true
title: svn+ssh:// in windows revisited
date: 2007-06-07 01:40:00.000000000 +02:00
categories:
- Hacks
tags: []
---
Oh well, `SVN_SSH="c:/program files/putty/plink.exe"` didn't work very well for me for two reasons:

- Every time a console window would pop up, that's kind of ugly.
- After some time it simply stopped working, somehow it could not connect to the repository server anymore, no idea why.


So I downloaded *TortoiseSVN* for its `tortoiseplink.exe` file. The reason why I didn't start with this step is that I didn't want the Explorer plugin as I had bad experience with that in the past. Unfortunately the installer didn't give me the option to skip the Explorer plugin so I ended up using it anyway. Here's the new value for the `SVN_SSH` variable: 

```
c:/program files/tortoisesvn/bin/tortoiseplink.exe
```

This has worked for me very well ever since (the past couple of weeks).
