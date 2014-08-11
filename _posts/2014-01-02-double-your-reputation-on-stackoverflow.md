---
layout: post
title: "Double your reputation on stackoverflow"
categories:
- Hacks
tags: []
---
{% include JB/setup %}

How to find the balance between two opposing goals:

- Increase your reputation on [stackoverflow.com](http://stackoverflow.com/) *as fast as possible*
- Spend *as little time as possible* on doing this

This article is about the most effective technique I know and use actively today.
For maximum effect it's important that:

- You are (almost) an expert in some popular technologies
- You write well: your answers must be clear, brief and to the point, accurate
- You are helpful: you must be passionate about helping, teaching, and giving the best possible answers

### Spend as little time as possible

The key is minimizing the time you spend on questions that are unlikely to yield much score for you.
It's most rewarding to:

- Focus on questions in your top areas of expertise
- Focus on questions with no answers

There are many ways to filter questions on stack overflow,
but none of them will work out of the box perfectly this way.
However, there is a way to use the site to emulate this effect.

### Focus on your most rewarding areas of expertise

I say *most rewarding areas* instead of *top areas* on purpose.
You may be an expert in some *technologyX*,
and answer many questions on *technologyX*,
yet not be rewarded for it, for various reasons:

- There are not enough users of technologyX who ask questions
- There are not enough experts of technologyX who understand and appreciate your answers
- There are too enough experts of technologyX who regularly answer questions and it's just too difficult to be faster *and* better
- (...)

Finding your most rewarding areas is trivially easy:
head over to the **Tags** page of your profile,
and it will tell you exactly that, for example:

![screenshot](/assets/themes/images/screenshots/2014-01-so-tags.png)

For each tag,
the first number is the score you received from answers,
the second number is the total number of answers.
For example,
for 66 answers on questions tagged `unix` I received 91 upvotes,
while for 29 answers on questions tagged `java` I received only 23 upvotes.
Although I would much rather stand out with `java` answers,
apparently I score much better for `unix` answers.

### Focus on questions with no answers

Once you know your most rewarding areas,
do the following:

1. Go to the **Questions** page, in particular:
   - the **newest** tab
   - showing the latest 5 questions only
   - that is: http://stackoverflow.com/questions?pagesize=5&sort=newest
2. Add your most successful tags to **Favorite Tags**
3. Open your most successful tags in *new tabs in your browser*,
   for example in my case I would open:
   - http://stackoverflow.com/questions/tagged/unix
   - http://stackoverflow.com/questions/tagged/sed
   - http://stackoverflow.com/questions/tagged/django

It *might be best* to not even look at the pages now, leave them alone:
most questions probably already have answers.
You can do something else for a while,
just keep an eye on the tab titles,
as they will change when new questions arrive, like this:

![screenshot](/assets/themes/images/screenshots/2014-01-so-tab-activity1.png)

There, the tab titles show the number of new questions in brackets.
It's critical and no accident that the number appears at the beginning of the title,
otherwise you wouldn't see them.
Now is a good time to switch to those tabs and consider the new questions,
hopefully before your competitors see them.

### To answer or not to answer?

Just because a question has a tag of your top skills,
it doesn't mean it's worth your time.
If the question is too long and unclear,
then maybe it's better to let it go.
If you're really nice,
you can drop a comment to warn the poster of problems with his question.

If the question is well formed,
but a solid answer would take too much time,
then maybe it's better to let it go.
Sometimes you can just sit back,
and let your competitors answer and learn a new trick.

If you're absolutely confident you can give a great answer,
then go for it.

It may take some practice to be able to answer fast.
Not only you need to provide a good solution, fast,
you need to explain it very well, fast.
It helps if you're good at writing.
The book [On Writing Well, by William Zinsser](http://www.amazon.com/Writing-Well-30th-Anniversary-Edition/dp/0060891548) should help with that.

Solving problems fast and writing good answers fast is a matter or practice:
if you keep doing it, you'll keep getting better at it.

### Be the first to answer

Questions with no answers appeal to your competitors just as much as they do to you.
While you're typing your kick-ass answer,
somebody else might notice the unanswered question,
start answering, and maybe even finish first.

Something I often do is *put my foot in the door*:
I post a basic answer first,
and edit it immediately to complete it nicely in a second step.

The first version of your answer has to be good enough:
it has to answer the question correctly,
and it has to deter your competitors from trying to come up with something better.
The second version has to be perfect,
with good explanation and additional useful tips.
A solid answer can potentially:

- compel your competitors to upvote
- get upvotes later, long after you answered
- get more traffic (and thus upvotes) later by better search engine ranking

First answers tend to receive the most attention.
Sometimes even poor first answers can get several upvotes,
and even if your answer is better,
it can get overlooked if you were 2nd or 3rd.
Inexperienced users (and that's most of them) sometimes accept answers with the highest vote count even when there are better answers.

### Does this work with any tag?

No. This technique doesn't work well with tags that are not very active.

For tags like `bzr` or `yahoo-pipes`,
sometimes there are no new questions for days.
You can [create filters for such tags](http://stackexchange.com/filters/new),
but the sad truth is that you probably won't get signficant score for these.
Not much traffic = not many upvotes.

For tags like `java` or `python`,
the traffic is intense.
There can be several questions per minute.
On the other hand,
just like the main questions page of stackoverflow is too broad,
these subjects are too broad as well.
You might be better selecting more specialized tags within these domains,
such as `spring`, `hibernate` or `maven` for Java,
and `django`, or `numpy` for Python,
depending on the subdomains you're good at.

### What about other strategies?

This is a bit of an extreme technique:
trying to maximize your score and minimize your time spent.
I don't use it exactly in this form,
but it was easier to explain this way.
These days I'm focusing on my less rewarding tags,
to improve them to score better.
specifically because I want to score better.
Use a variation that suits you best.

### todo, to old article

don't bother answering questions like this:

---

http://stackoverflow.com/questions/21170279/using-asorti-function-in-shell-script

I dont know how to use asorti function in shell script language , i have tried the following commands :

n= gawk `asorti($array)`
n= awk `asorti(array)`
n= gawk `asorti($array)`
but none of them are work !!

---

http://stackoverflow.com/questions/21171568/install-ubuntu-as-a-program-in-windows-8

I have tried i some time to find a guide or a Way to install ubuntu in windows 8 as an program or virtual machine. Can anyone explain to mé how to do it or link a guide?

Thanks in advance

---

http://stackoverflow.com/questions/21172223/boot-ubuntu-using-usb-syslinux-error

I am trying to boot Linux from a USB created through using the Universal USB Installer. When i try to boot my laptop (HP Pavilion G6 Series) displays:

SYSLINUX 4.07 EDD 2013 - 07 - 25 Copyright (C) 1994 - 2013 H. Peter Anvin et al

I have used this same USB on a different system and it did boot correctly. Any help is very appreciated, thanks.

---

