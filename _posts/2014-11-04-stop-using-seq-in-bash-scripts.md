---
layout: post
title: "Stop using seq in Bash scripts"
categories:
- hacks
tags: []
---
{% include JB/setup %}

In the past, I used to generate sequences of numbers using the `seq` utility, for example:

    $ seq 1 5
    1
    2
    3
    4
    5

However, this is not recommended.
`seq` may not exist on all systems,
and there is a portable way to do this in Bash:

    for i in {1..5}; do echo $i; done

However, this won't work if the range parameters are in variables.
In that case you can use this kind of loop:

    max=5
    for ((i=1; i<=$max; ++i)); do echo $i; done

More examples emulating `seq` using more portable methods:

    # seq 1 2 10
    for i in {1..10..2}; do echo $i; done
    for ((i=1; i<=10; i+=2)); do echo $i; done

    # seq -w 5 10
    for ((i=5; i<=10; ++i)); do printf '%02d\n' $i; done
