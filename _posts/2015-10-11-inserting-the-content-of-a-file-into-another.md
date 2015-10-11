---
layout: post
title: "Inserting the content of a file into another in Bash"
categories:
- hacks
- software
tags: []
---
{% include JB/setup %}

Inserting the content of one file into another in Bash seems simple enough.
But all these attempts are actually wrong:

    # on BSD this results in an infinite loop filling your disk
    # on GNU it overwrites main.txt with the content of other.txt
    cat other.txt main.txt > main.txt

    # quirky, weird behavior, !$@!!#!@?
    cat other.txt main.txt | tee main.txt >/dev/null

    # doesn't work, line 0 is not addressable
    sed -i '0rother.txt' main.txt

This works in GNU sed, but a bit tricky:

    sed -i -e '1rother.txt' -e '1{h;d}' -e '2{x;G}' main.txt

That is:

- On line 1, append the content of the `other.txt`
- On line 1, copy pattern space to hold space, and delete pattern space
- On line 2, exchange the content of the hold and pattern spaces, and append the hold space to pattern space

The reason it's tricky is that the `r` command appends content,
and line 0 is not addressable, so we have to do it on line 1,
moving the content of the original line out of the way and then bringing it back after the content of the file is appended.

Another alternative is using `sponge` from [`moreutils`](https://packages.debian.org/sid/moreutils):

    cat other.txt main.txt | sponge main.txt

By the way, `moreutils` is really awesome.
Among others, it contains a utility called `ts` that prepends a timestamp to lines coming from `stdin`.
How many times I wanted to have that!

<div class="text-muted">
See also on #stackoverflow: <a href="http://stackoverflow.com/questions/11250023/linux-to-prepend-the-data-from-one-file-to-another">Linux to prepend the data from one file to another</a>, and on #codereview: <a href="http://codereview.stackexchange.com/questions/100647/add-license-to-beginning-of-files/107191#107191">Add license to beginning of files</a>
</div>
