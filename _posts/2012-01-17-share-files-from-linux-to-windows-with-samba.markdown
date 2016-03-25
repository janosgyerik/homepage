---
layout: post
status: publish
published: true
title: Share a folder read-only from Linux to Windows with Samba
date: 2012-01-17 11:12:58.000000000 +01:00
categories:
- hacks
- Musings
- software
tags: []
---
I thought sharing a folder on Linux to Windows machines read-only and without any authentication whatsoever was very simple to do with Samba. And it really is, if you know Samba well :-) Which I don't, so I had some troubles due to incorrect value for the "security" option. The default value in a relatively modern installation is "user", with other possible values like "share" marked as deprecated in the config file. Because of that small mistake my sanity tests failed with error messages like:

```
C:\net view \servername
 System error 5 has occurred.

The network path was not found.
```

or

```
C:\dir \servernamesharename
 Logon failure: unknown user name or bad password.
```

Changing `security = user` to `security = share` was the fix. And it is well explained in `man smb.conf`.

Btw the `testparm -s` command shows settings that override the default values, which can be pretty handy in debugging your setup.

You probably want to start samba on system boot. In redhat derivatives you can do that with:

```
chkconfig smb on
```


### Useful links to debug Samba (if you are in a hurry)

http://www.hackorama.com/network/samba.shtml

http://www.oregontechsupport.com/samba/samba.php

http://www.linuxhomenetworking.com/wiki/index.php/Quick_HOWTO_:_Ch12_:_Samba_Security_and_Troubleshooting

### A nice series of articles for doing a more sophisticated setup the right way

http://www.linuxjournal.com/magazine/paranoid-penguin-samba-security-part-i

http://www.linuxjournal.com/magazine/paranoid-penguin-samba-security-part-ii

http://www.linuxjournal.com/magazine/paranoid-penguin-samba-security-part-iii

http://www.linuxjournal.com/magazine/paranoid-penguin-samba-security-part-iv
