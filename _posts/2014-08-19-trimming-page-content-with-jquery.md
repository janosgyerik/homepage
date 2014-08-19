---
layout: post
title: "Trimming page content with jQuery"
categories:
- hacks
tags: []
---
{% include JB/setup %}

Today I needed to find some [brown baggers][1]
(experts who give fun tech talks during lunch break,
for the gesture of a "brown bag lunch" in return) on [this website][2].

I had just one small bu very annoying problem:
the site has no easy way to filter experts,
the best way to search for an expertise is a browser's page search function.
Unfortunately the page is long,
and although the experts are grouped by city,
it's hard to tell if a match I'm looking at is in the section of the city I'm looking for.

[jQuery][3] to the rescue!
Looking at the HTML source,
the page includes jQuery,
so I can just open the JavaScript of Chrome and play with the DOM easily.
When inspecting a couple of *baggers*,
I found that each of them has `class="bagger"`,
and `id` ending with the name of their city,
for example `id="something_CITYNAME"`.
If I can remove the baggers from other cities,
the page will be easier to search,
with fewer or no false positives.

After a couple of failed tests where I deleted the wrong (or all) baggers by mistake,
forcing me to reload the entire (and very slow loading) page,
I arrived at a safer and easier method:

- Step 1: hide all the `.bagger`s
- Step 2: show the baggers with id ending with the city I need

The jQuery:

    $('.bagger').hide()
    $('.bagger[id$=Lyon]').show()

You have page that doesn't suit your taste?
If it uses jQuery or other popular JavaScript libraries,
just fire up a JavaScript console and trim the content to your liking!

[1]: http://en.wikipedia.org/wiki/Brown_bag_seminar
[2]: http://www.brownbaglunch.fr/baggers.html
[3]: http://jquery.com/
