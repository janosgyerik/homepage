---
layout: post
status: publish
published: true
title: Subversion does not remember or update my password
author: janos
author_login: janos
author_email: info@titan2x.com
wordpress_id: 869
wordpress_url: http://www.janosgyerik.com/?p=869
date: 2013-02-06 14:50:35.000000000 +01:00
categories:
- Hacks
- Software
tags: []
comments: []
---
I had this strange issue the other day. My account password has recently changed, and for each Subversion repository linked to that account I had to re-enter my password. Normally it is enough to re-enter once per repository: Subversion updates the corresponding authentication setting file so that I don't need to enter it again. But for some repositories it kept asking for it...

After some digging around, I realized that my user did not have write access to the file that sores the password. That is easy to fix once you know what to look for, and if you know which file it is. However that can be tricky if like me you don't know how Subversion organizes its settings files...

In Windows 7 (using the Git shell) you can find your Subversion setting files that you don't have write access to like this:
<pre>find /<wbr />c/Users/YOURUSER/<wbr />AppData/<wbr />Roaming/<wbr />Subversion<wbr /> ! -perm -200 -type f -ls</pre>
This can be useful to confirm your suspicion about filesystem permission issues. You can add back your write permission with the command:
<pre>find /<wbr />c/Users/YOURUSER/<wbr />AppData/<wbr />Roaming/<wbr />Subversion<wbr /> ! -perm -200 -type f -exec chmod {} \;</pre>
If you are really lazy to type all that, you can simply add write permission to yourself on all files in the Subversion directory with:
<pre>chmod -R u+w /<wbr />c/Users/YOURUSER/<wbr />AppData/<wbr />Roaming/<wbr />Subversion</pre>
How did it happen that my write permission has disappeared on some of the files? I haven't the foggiest idea...

<wbr />
