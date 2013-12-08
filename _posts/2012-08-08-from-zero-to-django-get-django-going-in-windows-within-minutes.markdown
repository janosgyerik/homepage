---
layout: post
status: publish
published: true
title: 'From zero to Django: get Django going in windows within minutes'
author: janos
author_login: janos
author_email: info@titan2x.com
wordpress_id: 686
wordpress_url: http://www.janosgyerik.com/?p=686
date: 2012-08-08 21:47:59.000000000 +02:00
categories:
- Hacks
- Musings
- Software
tags: []
comments: []
---
My 5-step banana ice cream recipe got more reaction in one hour than my usual geeky posts in years. Maybe I should combine the two concepts! Or maybe not. Heck, I already like this title so here's the geeky recipe: a <em>decidedly imperfect</em> recipe for getting my django project up and running on a fresh new install of windows.

<h3>Preparation time</h3>

<em>minutes!</em>

<h3>Ingredients</h3>

<ul>
<li>latest stable python2.x:

<ul>
<li><a href="http://www.python.org/ftp/python/2.7.3/python-2.7.3.msi">http://www.python.org/ftp/python/2.7.3/python-2.7.3.msi</a></li>
</ul></li>
<li>latest stable <code>setuptools</code>:

<ul>
<li><a href="http://pypi.python.org/packages/2.7/s/setuptools/setuptools-0.6c11.win32-py2.7.exe">http://pypi.python.org/packages/2.7/s/setuptools/setuptools-0.6c11.win32-py2.7.exe</a></li>
<li>... just to <code>easy_install pip</code></li>
</ul></li>
<li>(optional) latest stable Bazaar:

<ul>
<li><a href="https://launchpad.net/bzr/2.5/2.5.1/+download/bzr-2.5.1-1-setup.exe">https://launchpad.net/bzr/2.5/2.5.1/+download/bzr-2.5.1-1-setup.exe</a></li>
<li>Because the django project is in Bazaar</li>
<li>... and it is my choice of VCS anyway</li>
</ul></li>
<li>(optional) latest stable <code>git</code>:

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
<li><p>(optional) Install <code>putty</code>, create ssh key with <code>puttygen</code>, save private and public keys, add to <code>authorized_keys</code> on repository server, start <code>pagent</code>, add the key to it.</p></li>
<li><p>Install <code>python</code>, install <code>setuptools</code></p></li>
<li>Edit environmental variables:

<ol>
<li>Append to <code>PATH</code>: <code>c:\python27;c:\python27\scripts</code></li>
<li>Set <code>BZR_SSH=c:\program files\putty\plink.exe</code></li>
</ol></li>
<li><p>(optional) Install <code>git</code></p></li>
<li><p>Fire up the bash terminal (git bash or DOS command prompt)</p></li>
<li><p><code>easy_install pip</code></p></li>
<li><p>(optional) Install Bazaar, <code>bzr co bzr+ssh://myserver/~/repos/project</code></p></li>
<li><p>Install Django using pip: <code>pip install django==1.4</code> (use the version you need!)</p></li>
<li><p>Install dependencies of the Django project, typically listed in a file: <code>pip install -r requirements.txt</code></p></li>
<li><p>Run in Django's local server: <code>python manage.py runserver</code></p></li>
</ol>

Best served in a modern browser like Chrome at <a href="http://localhost:7000/">http://localhost:7000/</a> Enjoy!

<h3>Variations for the more adventurous</h3>

<ul>
<li>Screw <code>putty</code>, use the <code>openssh</code> that comes with <code>git bash</code></li>
<li><code>pip install virtualenv</code>, create a virtual env and run Django inside it.</li>
</ul>
