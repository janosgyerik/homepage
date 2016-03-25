---
layout: post
status: publish
published: true
title: Debugging deprecation warnings in Django
date: 2013-06-01 15:59:14.000000000 +02:00
categories:
- hacks
tags: []
---
Ever since switching to Django 1.5, I've been annoyed by this:

    DeprecationWarning: django.conf.urls.defaults is deprecated; use django.conf.urls instead

I've been annoyed because I duly made the necessary changes in my project and verified that I'm not using the old module anymore:

    grep -rl django.conf.urls.defaults .

Yet I was still getting this warning... Finally I understood (thanks to some googling) that the cause is that one of the apps included in the project are still using the old module. To find out which one, here's a really elegant solution:

    python -W error manage.py runserver

This way deprecation warnings will raise an error and from the stack trace it's easy to find the perpetrator. In my case it was `django-openid-auth`, which at version 0.5 is still using the old format. I recently learned about [`django-social-auth`](https://github.com/omab/django-social-auth), probably I'll be switching to that one in the near future.
