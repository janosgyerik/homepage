---
layout: post
status: publish
published: true
title: 'ImproperlyConfigured: The SECRET_KEY setting must not be empty'
date: 2013-06-09 08:45:13.000000000 +02:00
categories:
- hacks
- software
tags: []
---
I hit by a strange issue with Django. If I try to use a local configuration with

```
./manage.py shell --settings=myproject.local_settings
```

I got the error:

```
ImproperlyConfigured: The SECRET_KEY setting must not be empty
```

Strange because `SECRET_KEY` is certainly set. No stack trace, just a single line of error.

The cause turned out to be that in the main `settings.py` file I imported a method from one of my apps like this:

```
from accounts.views import render_failure
OPENID_RENDER_FAILURE = render_failure
```

I don't understand why exactly this is a problem, but removing the import solved the issue. On the other hand, I needed that import as the `OPENID_RENDER_FAILURE` setting of the `django-openid-auth` package takes a callable, giving it the absolute function name `accounts.views.render_failure` as a string doesn't cut it. I worked around that like this:

```
def render_failure(*args, **kwargs):
    from accounts.views import render_failure
    return render_failure(*args, **kwargs)
OPENID_RENDER_FAILURE = render_failure
```

Now everything works fine.
