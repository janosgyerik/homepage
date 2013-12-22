---
layout: post
status: publish
published: true
title: 'From zero to Django: get Django going in windows within minutes'
date: 2012-08-08 21:47:59.000000000 +02:00
categories:
- Hacks
- Musings
- Software
tags: []
---
My 5-step banana ice cream recipe got more reaction in one hour than my usual geeky posts in years. Maybe I should combine the two concepts! Or maybe not. Heck, I already like this title so here's the geeky recipe: a *decidedly imperfect* recipe for getting my django project up and running on a fresh new install of windows.

<h3>Preparation time</h3>

*minutes!*

<h3>Ingredients</h3>

<ul>
<li>latest stable python2.x:

<ul>
<li><a href="http://www.python.org/ftp/python/2.7.3/python-2.7.3.msi">http://www.python.org/ftp/python/2.7.3/python-2.7.3.msi</a></li>
</ul></li>
<li>latest stable `setuptools`:

<ul>
<li><a href="http://pypi.python.org/packages/2.7/s/setuptools/setuptools-0.6c11.win32-py2.7.exe">http://pypi.python.org/packages/2.7/s/setuptools/setuptools-0.6c11.win32-py2.7.exe</a></li>
<li>... just to `easy_install pip`</li>
</ul></li>
<li>(optional) latest stable Bazaar:

<ul>
<li><a href="https://launchpad.net/bzr/2.5/2.5.1/+download/bzr-2.5.1-1-setup.exe">https://launchpad.net/bzr/2.5/2.5.1/+download/bzr-2.5.1-1-setup.exe</a></li>
<li>Because the django project is in Bazaar</li>
<li>... and it is my choice of VCS anyway</li>
</ul></li>
<li>(optional) latest stable `git`:

<ul>
<li><a href="http://code.google.com/p/msysgit/downloads/detail?name=Git-1.7.11-preview20120710.exe">http://code.google.com/p/msysgit/downloads/detail?name=Git-1.7.11-preview20120710.exe</a></li>
<li>Because of the awesome bash shell</li>
</ul></li>
<li>(optional) putty:

<ul>
<li><a href="http://the.earth.li/~sgtatham/putty/latest/x86/putty-0.62-installer.exe">http://the.earth.li/~sgtatham/putty/latest/x86/putty-0.62-installer.exe</a></li>
<li>for ssh, creating keys, and the key agent</li>
</ul></li>
</ul>

<h3>Preparation</h3>

<ol>
<li>(optional) Install `putty`, create ssh key with `puttygen`, save private and public keys, add to `authorized_keys` on repository server, start `pagent`, add the key to it.</li>
<li>Install `python`, install `setuptools`</li>
<li>Edit environmental variables:

<ol>
<li>Append to `PATH`: `c:\python27;c:\python27\scripts`</li>
<li>Set `BZR_SSH=c:\program files\putty\plink.exe`</li>
</ol></li>
<li>(optional) Install `git`</li>
<li>Fire up the bash terminal (git bash or DOS command prompt)</li>
<li>`easy_install pip`</li>
<li>(optional) Install Bazaar, `bzr co bzr+ssh://myserver/~/repos/project`</li>
<li>Install Django using pip: `pip install django==1.4` (use the version you need!)</li>
<li>Install dependencies of the Django project, typically listed in a file: `pip install -r requirements.txt`</li>
<li>Run in Django's local server: `python manage.py runserver`</li>
</ol>

Best served in a modern browser like Chrome at <a href="http://localhost:7000/">http://localhost:7000/</a> Enjoy!

<h3>Variations for the more adventurous</h3>

<ul>
<li>Screw `putty`, use the `openssh` that comes with `git bash`</li>
<li>`pip install virtualenv`, create a virtual env and run Django inside it.</li>
</ul>
