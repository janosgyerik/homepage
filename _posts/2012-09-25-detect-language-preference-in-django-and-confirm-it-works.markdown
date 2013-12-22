---
layout: post
status: publish
published: true
title: Detect language preference in Django and confirm it works
date: 2012-09-25 12:44:07.000000000 +02:00
categories:
- Hacks
- Software
tags: []
comments: []
---
Django has built-in facility for detecting the preferred language of clients, but it is not enabled by default.

First of all, you need to enable the `django.middleware.locale.LocaleMiddleware` in the `MIDDLEWARE_CLASSES` configuration in `settings.py`. The ordering of the middleware classes is relevant, in particular `LocaleMiddleware` must come *after* `SessionMiddleware` and *before* `CommonMiddleware`. A bit of a "gotcha" there is that in the default `settings.py` file the `CommonMiddleware` comes before `SessionMiddleware`. Make sure their order is correct, and insert `LocaleMiddleware` somewhere in between, like this:
<pre>
MIDDLEWARE_CLASSES = (
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.locale.LocaleMiddleware',
    'django.middleware.common.CommonMiddleware',
    # other middleware ...
)
</pre>
As a result, Django will fill in the detected language preference of the client in all request objects as `request.LANGUAGE_CODE`, in a format like `en` for English, `pt-br` for Brazilian Portugese, and so on.

To test that it works, create a primitive view method like this (and wire it to a url handler):
<pre>
from django.http import HttpResponse

def mylang(request):
    return HttpResponse("request.LANGUAGE_CODE = %s\n" % request.LANGUAGE_CODE)
</pre>
It is easiest to fake a client preference and thereby test the preference is correctly detected using `curl` or `wget`:
<pre>
curl http://localhost:8000/mylang
curl http://localhost:8000/mylang --header 'Accept-Language: de'
curl http://localhost:8000/mylang --header 'Accept-Language: de' --cookie django_language=hu
</pre>
For more details see the official documentation:

<a href="https://docs.djangoproject.com/en/dev/topics/i18n/translation/#how-django-discovers-language-preference">https://docs.djangoproject.com/en/dev/topics/i18n/translation/#how-django-discovers-language-preference</a>
