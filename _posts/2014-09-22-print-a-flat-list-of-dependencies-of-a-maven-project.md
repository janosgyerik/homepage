---
layout: post
title: "Print a flat list of dependencies of a Maven project"
categories:
- hacks
tags: []
---
{% include JB/setup %}

This [bash one-liner][1] can be handy sometimes:

    mvn dependency:list | sed -ne s/..........// -e /patterntoexclude/d -e s/:compile//p -e s/:runtime//p | sort | uniq

The `mvn dependency:list` command produces a list of dependencies that's readable but not very program-friendly, looking like this:

>     [INFO] The following files have been resolved:
>     [INFO]    joda-time:joda-time:jar:2.3:compile
>     [INFO]    junit:junit:jar:4.11:test
>     [INFO]    log4j:log4j:jar:1.2.12:compile

A `sed` can shave off the extra formatting to turn this into:

>     joda-time:joda-time:jar:2.4
>     log4j:log4j:jar:1.2.12

Explanation:

- `-n` don't print by default
- `-e s/..........//` shave off the first 10 characters
- `-e /patterntoexclude/d` you can exclude some unwanted patterns from the list using the `d` command like this
- `-e s/:compile//p -e s/:runtime//p` replace and print `:compile` and `:runtime`

As multi-module projects may include duplicates, filter the result through `| sort | uniq`

[1]: http://www.bashoneliners.com/oneliners/oneliner/206/
