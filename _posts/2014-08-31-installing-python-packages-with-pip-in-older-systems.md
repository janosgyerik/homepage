---
layout: post
title: "Installing Python packages with Pip in older systems"
categories:
- hacks
- software
tags: []
---
{% include JB/setup %}

Recently I had the pleasure of having to install Python packages with Pip in an old-ish Linux (Suse Enterprise).
For example when trying to install [Flask][1],
this is what happened:
My stack trace was something like this:

>     $ pip install flask -v
>     Downloading/unpacking flask
>       Could not fetch URL https://pypi.python.org/simple/flask/: connection error: [Errno 1] _ssl.c:493: error:14090086:SSL routines:SSL3_GET_SERVER_CERTIFICATE:certificate verify failed
>       Will skip URL https://pypi.python.org/simple/flask/ when looking for download links for flask
>       Could not fetch URL https://pypi.python.org/simple/: connection error: [Errno 1] _ssl.c:493: error:14090086:SSL routines:SSL3_GET_SERVER_CERTIFICATE:certificate verify failed
>       Will skip URL https://pypi.python.org/simple/ when looking for download links for flask
>       Cannot fetch index base URL https://pypi.python.org/simple/
>       Could not fetch URL https://pypi.python.org/simple/flask/: connection error: [Errno 1] _ssl.c:493: error:14090086:SSL routines:SSL3_GET_SERVER_CERTIFICATE:certificate verify failed
>       Will skip URL https://pypi.python.org/simple/flask/ when looking for download links for flask
>       Could not find any downloads that satisfy the requirement flask
>     Cleaning up...
>       Removing temporary dir /tmp/virtualenv/build...
>     No distributions at all found for flask

After some hours of trying to figure this out
(perhaps updating the registered SSL certificates?),
I was running out of time,
and needed to find another way to get my packages installed.

First, I downloaded my Python dependencies to my own PC:

    mkdir pip-cache
    pip install -r requirements.txt --download pip-cache/

Next, copied the packages to the Linux box:

    pscp.exe -r pip-cache janos@:tmp/

Finally, made `pip` on the Linux box use my cache of packages:

    pip install -r requirements.txt --no-index --find-links ~/tmp/pip-cache

Although this is less than ideal,
it's not every day that I need to install Python packages,
so I'm ok to do this on the odd occasion.
 
[1]: http://flask.pocoo.org/
