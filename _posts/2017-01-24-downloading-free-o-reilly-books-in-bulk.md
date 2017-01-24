---
layout: post
title: "Downloading free O'Reilly books in bulk"
categories:
- software
- hacks
tags: []
---
{% include JB/setup %}

This page lists a bunch of FREE O'Reilly books:

[https://lifehacker.ru/2017/01/09/free-oreilly-ebooks/](https://lifehacker.ru/2017/01/09/free-oreilly-ebooks/)

When such a neat list is available,
downloading them in bulk can become very easy sometimes.
Luckily that is indeed the case for this list.
Let's take a closer look.

The first book on the list is *The Secrets Behind Great One-on-One Meetings*,
the URL points to:

    http://www.oreilly.com/business/free/the-secrets-behind-great-one-on-one-meetings.csp

On that page there is a form to fill to get the page with download links.
On the download page, the book is available in PDF, MOBI and EPUB formats,
via the links:

    http://www.oreilly.com/business/free/files/the-secrets-behind-great-one-on-one-meetings.pdf
    http://www.oreilly.com/business/free/files/the-secrets-behind-great-one-on-one-meetings.mobi
    http://www.oreilly.com/business/free/files/the-secrets-behind-great-one-on-one-meetings.epub

Notice the similarities between the link on the first page,
and the download links.
With the complete list of the books,
and with some simple transformations and looping,
you can download the books in bulk.

One easy way to get the complete list is with jQuery.
Open the JavaScript console of your browser,
for example Chrome or Firefox.
Notice that the links to free books all have URL ending with `.csp`.
The DOM query to find those links can be written as:

    $('a[href$=".csp"]')

We can extract from this result just the `href` fields,
join them with line breaks and print as plain list on the console:

    $('a[href$=".csp"]').map(function() { return this.href }).get().join('\n')

Save this in a file, let's call it `list.txt`.

With a little shell scripting,
we can loop over this list,
and make the necessary minor transformations to download all the books,
grouped into folders by category:

    for base in $(cat list.txt); do
        base=${base/free/free/files}
        base=${base%.csp}
        category=$base
        category=${category/\/free*/}
        category=${category##*/}
        mkdir -p $category
        (cd $category; curl -O $base.{mobi,pdf,epub})
    done

That's basically it. Beware, at the time of this writing,
the total size of the collection is around 4.5 gigabytes.
