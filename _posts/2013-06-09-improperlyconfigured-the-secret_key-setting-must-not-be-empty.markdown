---
layout: post
status: publish
published: true
title: 'ImproperlyConfigured: The SECRET_KEY setting must not be empty'
author: janos
author_login: janos
author_email: info@titan2x.com
wordpress_id: 986
wordpress_url: http://www.janosgyerik.com/?p=986
date: 2013-06-09 08:45:13.000000000 +02:00
categories:
- Hacks
- Software
tags: []
comments:
- id: 3181
  author: Sergio Pulgarín
  author_email: sergio.pulgarin@gmail.com
  author_url: ''
  date: '2013-08-05 19:03:00 +0200'
  date_gmt: '2013-08-05 19:03:00 +0200'
  content: Same thing happened to me. For me it was that I was importing a module
    inside settings.py before defining the SECRET_KEY setting. This module itself
    imported a custom User model, which caused the problem.
- id: 3193
  author: Mitchell Harris
  author_email: mjhcompany@gmail.com
  author_url: http://www.tulsa.io/
  date: '2013-11-10 02:45:00 +0100'
  date_gmt: '2013-11-10 02:45:00 +0100'
  content: Im certain that youve resolved this by now but just incase someone catches
    this in a search result... this error randomly popped up for after working just
    fine. Turns out I forgot to add the "--" to the --settings command-line argument.
---
I hit by a strange issue with Django. If I try to use a local configuration with
<pre>./manage.py shell --settings=myproject.local_settings</pre>
I got the error:
<pre>ImproperlyConfigured: The SECRET_KEY setting must not be empty</pre>
Strange because `SECRET_KEY` is certainly set. No stack trace, just a single line of error.

The cause turned out to be that in the main `settings.py` file I imported a method from one of my apps like this:
<pre>from accounts.views import render_failure
OPENID_RENDER_FAILURE = render_failure</pre>
I don't understand why exactly this is a problem, but removing the import solved the issue. On the other hand, I needed that import as the `OPENID_RENDER_FAILURE` setting of the `django-openid-auth` package takes a callable, giving it the absolute function name `accounts.views.render_failure` as a string doesn't cut it. I worked around that like this:
<pre>def render_failure(*args, **kwargs):
    from accounts.views import render_failure
    return render_failure(*args, **kwargs)
OPENID_RENDER_FAILURE = render_failure</pre>
Now everything works fine.
