---
layout: post
status: publish
published: true
title: Detect language preference in Django and confirm it works
author: janos
author_login: janos
author_email: info@titan2x.com
wordpress_id: 659
wordpress_url: http://www.janosgyerik.com/?p=659
date: 2012-09-25 12:44:07.000000000 +02:00
categories:
- Hacks
- Software
tags: []
comments: []
---
Django has built-in facility for detecting the preferred language of clients, but it is not enabled by default.

First of all, you need to enable the <code>django.middleware.locale.LocaleMiddleware</code> in the <code>MIDDLEWARE_CLASSES</code> configuration in <code>settings.py</code>. The ordering of the middleware classes is relevant, in particular <code>LocaleMiddleware</code> must come <em>after</em> <code>SessionMiddleware</code> and <em>before</em> <code>CommonMiddleware</code>. A bit of a "gotcha" there is that in the default <code>settings.py</code> file the <code>CommonMiddleware</code> comes before <code>SessionMiddleware</code>. Make sure their order is correct, and insert <code>LocaleMiddleware</code> somewhere in between, like this:
<pre>MIDDLEWARE_CLASSES = (
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.locale.LocaleMiddleware',
    'django.middleware.common.CommonMiddleware',
    # other middleware ...
)</pre>
As a result, Django will fill in the detected language preference of the client in all request objects as <code>request.LANGUAGE_CODE</code>, in a format like <code>en</code> for English, <code>pt-br</code> for Brazilian Portugese, and so on.

To test that it works, create a primitive view method like this (and wire it to a url handler):
<pre>from django.http import HttpResponse

def mylang(request):
    return HttpResponse("request.LANGUAGE_CODE = %s\n" % request.LANGUAGE_CODE)</pre>
It is easiest to fake a client preference and thereby test the preference is correctly detected using <code>curl</code> or <code>wget</code>:
<pre>curl http://localhost:8000/mylang
curl http://localhost:8000/mylang --header 'Accept-Language: de'
curl http://localhost:8000/mylang --header 'Accept-Language: de' --cookie django_language=hu</pre>
For more details see the official documentation:

<a href="https://docs.djangoproject.com/en/dev/topics/i18n/translation/#how-django-discovers-language-preference">https://docs.djangoproject.com/en/dev/topics/i18n/translation/#how-django-discovers-language-preference</a>
