---
layout: post
title: "Working with different versions of Python on OSX using MacPorts"
categories:
- hacks
tags: []
---
{% include JB/setup %}

Working with Python can be a bit troublesome these days:
version 3 is recommended and has many great improvements,
but some interesting frameworks and tools are still on version 2.x.
At least for the time being,
I need both versions side by side.

On OSX, installing Python is fairly easy with [MacPorts][MacPorts]:

    sudo port install python27
    sudo port install python34

What's easy to forget sometimes is *selecting* the version to use as the system's default.
The right way to do this is in the output of the above commands:

>     To make python 3.4 the default (i.e. the version you get when you run 'python'),
>     please run:
>
>     sudo port select --set python python34

Do similarly for `pip`:

    sudo port install py27-pip
    sudo port install py34-pip
    sudo port select --set pip pip34

You can confirm the current versions with these commands:

>     $ python --version
>     Python 3.4.2
>     $ pip --version
>     pip 1.5.6 from /opt/local/Library/Frameworks/Python.framework/Versions/3.4/lib/python3.4/site-packages (python 3.4)

Once you have `pip`,
use it to install Python packages.
Avoid installing package system-wide, with few exceptions.
For example, installing `pep8`, `pyflakes`, `virtualenv` system-wide is probably ok,
although I tend to install even these in my user's home directory rather than system-wide, for example:

    pip install --user pep8

However,
web development projects based on web-frameworks like Django or Flask,
or other experimental projects are best to use with a *virtualenv*.
`virtualenv` is a tool that creates an independent Python installation directory,
where you can install all your project dependencies without interfering with other packages in the base system.
Using `virtualenv` you can work on multiple projects that require completely different sets of dependencies and package versions.

Make sure to initialize the `virtualenv` directory using the appropriate Python version,
if it's different from the default version in the base system.
For example having 3.4 as default,
to create a `virtualenv` using Python 2.7 instead:

>     $ virtualenv -p $(which python2.7) ./myproj --distribute
>     Running virtualenv with interpreter /usr/bin/python2.7
>     New python executable in ./myproj/bin/python2.7
>     Also creating executable in ./myproj/bin/python
>     Installing setuptools, pip...done.

Activate this newly created virtualenv:

>     $ . myproj/bin/activate
>     (myproj) $

Notice that the prompt has changed:
now it's prefixed with `(myproj)`,
the name of the virtualenv.
Being inside a virtualenv just means that some shell variables were replaced to make all Python commands use the Python binaries and packages installed inside the virtualenv instead of the system default.
So if you run now `pip install django`,
that will install Django inside this `virtualenv`,
not affecting anything else on your system.
No need for `--user` anymore, it won't have any effect.
To get out of the virtualenv,
run `deactivate`.

[MacPorts]: https://www.macports.org/
