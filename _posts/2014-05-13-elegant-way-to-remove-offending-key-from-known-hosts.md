---
layout: post
title: "Elegant way to remove offending key from known hosts"
categories:
- hacks
tags: []
---
{% include JB/setup %}

This should look familiar:

```
$ ssh mars
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@    WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!     @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
IT IS POSSIBLE THAT SOMEONE IS DOING SOMETHING NASTY!
Someone could be eavesdropping on you right now (man-in-the-middle attack)!
It is also possible that a host key has just been changed.
The fingerprint for the RSA key sent by the remote host is
67:7e:21:58:e4:12:eb:d4:3c:22:45:69:f5:08:63:ee.
Please contact your system administrator.
Add correct host key in /home/jack/.ssh/known_hosts to get rid of this message.
Offending RSA key in /home/jack/.ssh/known_hosts:17
RSA host key for example.com has changed and you have requested strict checking.
Host key verification failed.
```

Let's assume you *know for a fact* it's not really a man in the middle attack.
For example your sysadmin told you yesterday that they installed a new SSL certifate on your server "mars".
Here are some solutions, in increasing order of *elegance and awesomeness*:

1. Fire up your text editor, find line 17, delete it, save the file (booo!)

1. Fire up `vim ~/.ssh/known_hosts`, press `17G` to jump to line 17, press `dd` to delete the line, press `:wq` to save and exit (yeah, rockin'!)

1. Fire up `vim +17 ~/.ssh/known_hosts`, press `dd` and then `:wq`

1. Run `vim +17d +wq ~/.ssh/known_hosts`, jobs done

1. Run `ssh-keygen -R example.com`, jobs done

The last one is the best,
but I don't like that it's so unintuitive.
What's this to do with generating keys!

Notice that in the `ssh-keygen -R servername` command you cannot use the SSH alias name, like I did `ssh mars` in the beginning.
You have to type the server name as it is written near the end of the error message, `example.com` in this example.

Since it's unintuitive, it's not easy to remember.
Hence this blog post ;-)
