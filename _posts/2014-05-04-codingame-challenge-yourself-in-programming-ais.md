---
layout: post
title: "CodinGame: challenge yourself in programming AIs"
categories:
- hacks
- software
tags: []
---
{% include JB/setup %}

[CodinGame (codingame.com)][1] is a website with monthly programming contests.
It's similar to [Codility (codility.com)][4],
but more playful:
many of the challenges are defined in the context of some game,
and beautifully done.

Here's for example the first level in [Ragnarök - Power of Thor][3]:

![Ragnarök - Power of Thor game view]({{ site.url }}/assets/screenshots/thor1-game.png)

You have to program the AI to navigate Thor to the lightning,
which can be at any random location in the playing field.
The program receives initialization data from stdin,
followed by additional data in every round.

The game works with an infinite loop:
you receive some data from stdin about the current round,
and you have to print your move to stdout.
There is a fantastic code editor next to the game field:

![Ragnarök - Power of Thor editor]({{ site.url }}/assets/screenshots/thor1-editor.png)

It has syntax highlighting and auto-completion.
It's not as good as a proper IDE,
but for easier problems it's good enough.
You can choose from many programming languages,
including C++, Go, Scala, Haskell, Python, Ruby, JavaScript and even Bash.

Here's another screenshot from the Thor series, Ragnarök - Thor vs Giants][4]:

![Ragnarök - Thor vs Giants]({{ site.url }}/assets/screenshots/thor3-game.png)

This one is a level 3 problem.
You have to kill the giants by striking your hammer.
It has a blast radius of 9 meters,
but you only get limited shots.
Good luck with that, it's pretty damn hard!

All in all, it's a fun way to test your programming skills.
You can participate in the monthly contests,
or just practice with the growing collection of [training exercises][2].

  [1]: http://www.codingame.com/
  [2]: http://www.codingame.com/cg/#!page:training
  [3]: http://www.codingame.com/cg/candidatedemoservlet?id=67728dbcaecff22dd35ba2c3e97395da1ce8
  [4]: http://www.codingame.com/cg/candidatedemoservlet?id=6773bde9c46b33945d3f32939e69505fd795
  [5]: https://codility.com/
