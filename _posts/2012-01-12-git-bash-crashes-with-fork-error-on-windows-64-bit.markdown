---
layout: post
status: publish
published: true
title: Git bash crashes with fork error on windows 64 bit
author: janos
author_login: janos
author_email: info@titan2x.com
wordpress_id: 502
wordpress_url: http://www.janosgyerik.com/?p=502
date: 2012-01-12 21:02:02.000000000 +01:00
categories:
- Hacks
- Software
tags: []
comments: []
---
If you are on a 64-bit windows system, and start bash that's included with git from a DOS command prompt and experience fork errors like this:
<pre>bash-3.1$ dirname
 C:Program FilesGitbinbash.exe: *** fork: can't reserve memory for stack 0x490000 - 0x
 690000, Win32 error 0
 0 [main] bash 1612 sync_with_child: child 4896(0x328) died before initiali
 zation with status code 0x1
 216 [main] bash 1612 sync_with_child: *** child state waiting for longjmp
 bash: fork: Resource temporarily unavailable</pre>
... a possible cause can be that your DOS command prompt is the 32-bit version (the default when running cmd with w+r) when you need in fact the 64-bit version. The fix:
<pre>c:\windows\syswow64\cmd.exe /c bash</pre>
