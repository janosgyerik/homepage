---
layout: post
status: publish
published: true
title: 'Strange Django issue: Error: No module named cache'
date: 2012-08-14 18:27:05.000000000 +02:00
categories:
- hacks
- software
tags: []
---
Just now when running `./manage.py syncdb` Django (1.4) gave a strange error:


```
`Error: No module named cache
`
```


What tha... Googled it, no help. A `pip install -r pip.txt --upgrade` made it work. Lucky! (Among other things it replaced my Django 1.4 installation in the virtualenv. I suspect that fixed it.)
