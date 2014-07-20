---
layout: post
title: "Installing rgdal in R on OS X Mavericks"
categories:
- hacks
- software
tags: []
---
{% include JB/setup %}

Installing the `rgdal` library in R version 3.1.0 doesn't work out of the box at the moment:

```rout
> install.packages('rgdal')

   package ‘rgdal’ is available as a source package but not as a binary

Warning in install.packages :
  package ‘rgdal’ is not available (for R version 3.1.0)
```

After reading `?install.packages` a bit,
I tried using the `type=source` option,
but that still doesn't cut it:

```rout
> install.packages('rgdal', type='source')
trying URL 'http://cran.rstudio.com/src/contrib/rgdal_0.8-16.tar.gz'
Content type 'application/x-gzip' length 1616275 bytes (1.5 Mb)
opened URL
==================================================
downloaded 1.5 Mb

* installing *source* package ‘rgdal’ ...
** package ‘rgdal’ successfully unpacked and MD5 sums checked
configure: CC: clang
configure: CXX: clang++
configure: rgdal: 0.8-15
checking for /usr/bin/svnversion... yes
configure: svn revision: 498
configure: gdal-config: gdal-config
checking gdal-config usability... 
./configure: line 2119: gdal-config: command not found
no
Error: gdal-config not found
The gdal-config script distributed with GDAL could not be found.
If you have not installed the GDAL libraries, you can
download the source from  http://www.gdal.org/
If you have installed the GDAL libraries, then make sure that
gdal-config is in your path. Try typing gdal-config at a
shell prompt and see if it runs. If not, use:
 --configure-args='--with-gdal-config=/usr/local/bin/gdal-config'
with appropriate values for your installation.
```

I guessed that I need to install the `gdal` libraries first.
Using [macports][1]:

    sudo port install gdal

After this I repeated the R command to install with `type=source`,
and it worked like a charm.

[1]: http://www.macports.org/
