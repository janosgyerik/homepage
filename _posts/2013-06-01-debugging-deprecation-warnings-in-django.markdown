---
layout: post
status: publish
published: true
title: Debugging deprecation warnings in Django
author: janos
author_login: janos
author_email: info@titan2x.com
wordpress_id: 972
wordpress_url: http://www.janosgyerik.com/?p=972
date: 2013-06-01 15:59:14.000000000 +02:00
categories:
- Uncategorized
tags: []
comments: []
---
Ever since switching to Django 1.5, I've been annoyed by this:
<pre>DeprecationWarning: django.conf.urls.defaults is deprecated; use django.conf.urls instead</pre>
I've been annoyed because I duly made the necessary changes in my project and verified that I'm not using the old module anymore:
<pre>grep -rl django.conf.urls.defaults .</pre>
Yet I was still getting this warning... Finally I understood (thanks to some googling) that the cause is that one of the apps included in the project are still using the old module. To find out which one, here's a really elegant solution:
<pre>python -W error manage.py runserver</pre>
This way deprecation warnings will raise an error and from the stack trace it's easy to find the perpetrator. In my case it was `django-openid-auth`, which at version 0.5 is still using the old format. I recently learned about <a href="https://github.com/omab/django-social-auth">`django-social-auth`</a>, probably I'll be switching to that one in the near future.
