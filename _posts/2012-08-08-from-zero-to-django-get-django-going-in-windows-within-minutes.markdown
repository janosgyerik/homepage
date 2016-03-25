---
layout: post
status: publish
published: true
title: 'From zero to Django: get Django going in windows within minutes'
date: 2012-08-08 21:47:59.000000000 +02:00
categories:
- hacks
- Musings
- software
tags: []
---
My 5-step banana ice cream recipe got more reaction in one hour than my usual geeky posts in years. Maybe I should combine the two concepts! Or maybe not. Heck, I already like this title so here's the geeky recipe: a *decidedly imperfect* recipe for getting my django project up and running on a fresh new install of windows.


### Preparation time

*minutes!*

### Ingredients

- latest stable python2.x:

    - http://www.python.org/ftp/python/2.7.3/python-2.7.3.msi

- latest stable `setuptools`:

    - http://pypi.python.org/packages/2.7/s/setuptools/setuptools-0.6c11.win32-py2.7.exe
    - ... just to `easy_install pip`

- (optional) latest stable Bazaar:

    - https://launchpad.net/bzr/2.5/2.5.1/+download/bzr-2.5.1-1-setup.exe
    - Because the django project is in Bazaar
    - ... and it is my choice of VCS anyway

- (optional) latest stable `git`:

    - http://code.google.com/p/msysgit/downloads/detail?name=Git-1.7.11-preview20120710.exe
    - Because of the awesome bash shell

- (optional) putty:

    - http://the.earth.li/~sgtatham/putty/latest/x86/putty-0.62-installer.exe
    - for ssh, creating keys, and the key agent

### Preparation

- (optional) Install `putty`, create ssh key with `puttygen`, save private and public keys, add to `authorized_keys` on repository server, start `pagent`, add the key to it.
- Install `python`, install `setuptools`
- Edit environmental variables:

    - Append to `PATH`: `c:\python27;c:\python27\scripts`
    - Set `BZR_SSH=c:\program files\putty\plink.exe`

- (optional) Install `git`
- Fire up the bash terminal (git bash or DOS command prompt):

    - `easy_install pip`

- (optional) Install Bazaar, `bzr co bzr+ssh://myserver/~/repos/project`
- Install Django using pip: `pip install django==1.4` (use the version you need!)
- Install dependencies of the Django project, typically listed in a file: `pip install -r requirements.txt`
- Run in Django's local server: `python manage.py runserver`

Best served in a modern browser like Chrome at [http://localhost:7000/](http://localhost:7000/) Enjoy!

### Variations for the more adventurous


- Screw `putty`, use the `openssh` that comes with `git bash`
- `pip install virtualenv`, create a virtual env and run Django inside it.

