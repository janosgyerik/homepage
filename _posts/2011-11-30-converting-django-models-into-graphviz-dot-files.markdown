---
layout: post
status: publish
published: true
title: Converting Django models into Graphviz DOT files
date: 2011-11-30 04:23:38.000000000 +01:00
categories:
- software
tags: []
---
This was really easy and the result is really good-lookin.

https://code.djangoproject.com/wiki/DjangoGraphviz

The article is almost accurate. Some really accurate steps:

```
cd /path/to/your/django/project
git clone https://github.com/django-extensions/django-extensions.git
cp django-extensions/django_extensions/management/modelviz.py . 
ln -s $PWD/django-extensions/django_extensions/templates/django_extensions templates/ 
python modelviz.py name_of_django_app &gt; app.dot
dot app.dot -Tpng -o app.png
```

(And of course you need [http://www.graphviz.org/](http://www.graphviz.org/) first.)

**UPDATE:** ok the above is really the ugly way of doing it. The nice way is:


```
# Install django-extensions 
pip install django-extensions

# In settings.py add django_extensions INSTALLED_APPS

# Generate graph
python manage.py graph_models name_of_django_app &gt; app.dot
dot app.dot -Tpng -o app.png
```

