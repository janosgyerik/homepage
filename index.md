---
layout: page
title: Janos Gyerik
tagline: Journal of a coder
---
{% include JB/setup %}

<div class="alert alert-block alert-warning">
I'm in the process of migrating from <a href="http://blog.janosgyerik.com/">my old WordPress blog</a> hosted on <a href="http://www.dreamhost.com/r.cgi?455568">DreamHost</a> to this shiny new <a href="http://jekyllbootstrap.com/">Jekyll</a> site <a href="http://github.com/janosgyerik/homepage">hosted on GitHub</a>.
</div>

I like to code and I do it a lot.
I want to work for green energy or health, eventually.
I am deeply worried about these fields,
and I believe that great software could really make a big difference.
I work on private and open-source projects in my spare time.
If you want to join forces, drop me a line!

Check out my stuff:

- Blog --- http://blog.janosgyerik.com/

  Sort of a blog,
  this is really my *journal of daily hacks*.
  I don't like to research the same problem twice,
  so when I figure out something,
  I try to write it down quickly.
  I also post new releases of my apps and websites here,
  so it's a good way to follow what I'm up to.

- Wiki --- http://wiki.titan2x.com/

  My personal reference of all things related to computers,
  programming, operating systems (especially GNU/Linux) and databases.
  A lot of cheat sheets,
  some in-depth articles and how to guides of larger topics.

Launchpad – https://launchpad.net/~janos-gyerik

My profile on Launchpad, a Bazaar hosting site. You can find some of my open-source projects there, as well as my contribution to other open-source projects.

GitHub – https://github.com/janosgyerik

My profile on GitHub, a Git hosting site. You can find some of my open-source projects there, as well as my contribution to other open-source projects.

Stack Exchange

profile for janos on Stack Exchange, a network of free, community-driven Q&A sitesI occasionally post questions or answers on Stack Exchange sites. Check out my network profile to see my activities on all the Stack Exchange sites. I am most active on Unix and Linux, Stack Overflow, Programmers and Ask Ubuntu.

Bazaar Version Control

My book on Bazaar, the distributed version control system was published in June 2013. It’s intended for anyone who may be new to version control systems. If you are a programmer or a system administrator, you can benefit greatly from using Bazaar in your projects. If you are already familiar with version control systems, this book should serve as a fast and easy way to understand Bazaar. You can download a sample chapter for free form the publisher’s website.

SSH public keys

http://launchpad.net/~janos-gyerik/+sshkeys

I like to code and I do it a lot. I want to build software to save the planet.

If you use Bazaar, you might be interested in my book Bazaar Version Control, published in June, 2013. It's not free, but you can download a full sample chapter to help you decide if you might like it or not.

I make Android apps, websites like bashoneliners.com, and other open source stuff.

You can find me on Twitter as @janosgyerik or on my blog.

Read [Jekyll Quick Start](http://jekyllbootstrap.com/usage/jekyll-quick-start.html)

Complete usage and documentation available at: [Jekyll Bootstrap](http://jekyllbootstrap.com)

## Update Author Attributes

In `_config.yml` remember to specify your own data:
    
    title : My Blog =)
    
    author :
      name : Name Lastname
      email : blah@email.test
      github : username
      twitter : username

The theme should reference these variables whenever needed.
    
## Sample Posts

This blog contains sample posts which help stage pages and blog data.
When you don't need the samples anymore just delete the `_posts/core-samples` folder.

    $ rm -rf _posts/core-samples

Here's a sample "posts list".

<ul class="posts">
  {% for post in site.posts %}
    <li><span>{{ post.date | date_to_string }}</span> &raquo; <a href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a></li>
  {% endfor %}
</ul>

## To-Do

This theme is still unfinished. If you'd like to be added as a contributor, [please fork](http://github.com/plusjade/jekyll-bootstrap)!
We need to clean up the themes, make theme usage guides with theme-specific markup examples.


