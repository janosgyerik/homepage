---
layout: post
title: "How to hire good programmers"
categories:
- musings
tags: []
---
{% include JB/setup %}

These are my very opinionated ideas about hiring. Many of them come from these sources:

- [How to hire a programmer][4]
- [Smart and Gets Things Done][5]
- [6 secrets for building a super team][6]
- [The programmer competency matrix][3]

I suggest to read these, and also the links they reference. Below is my personal very opinionated summary. Although many points are general, some aspects are specific to Java.

## Make your company look interesting

A crucial part of hiring good programmers might be attracting them.

If you have very high standards, nobody might get through. To have more candidates who get through, you need to attract more good candidates.

Perhaps you can start by making your job postings as interesting as they can be. Read your own job posting, pretend you are a good programmer, and ask yourself:

- Is this interesting?
- What will I learn from this, what will I achieve here?
- Did they put effort in writing this, or is it just a routine text?

If your project scores well on the [Joel Test][7], include it! If the score is less than 10, then don’t mention it.

## Interesting testing methods

Perhaps interesting testing methods can help make your company look more interesting.

- [CodinGame][1]: can you score better than "YourCompany Bronze" on Tron? Don't stop there, the higher you score the better.
- [Codility][2]: can you solve one of these puzzles: X, Y, Z (pick some you find relevant for the post)
- [Untrusted][8]: can you pass all levels in this game
- [Capture The Flag][9] (for positions with high emphasis on software security): can you pass at least the first 3 levels on this Live CD. The more levels you pass the better.

## Make your company more visible

Programmers love Stack Overflow. The creators of Stack Overflow have a sister site for companies and job seekers, called Careers 2.0:

http://careers.stackoverflow.com/

It is free to have a company profile. So you should have it. It can be an additional channel to attract interesting candidates. It also gives candidates an opportunity to highlight their relevant activities. This website is far more specialized and better for programmers compared to for example LinkedIn.

## Judging programmers by the right indicators

One of the best indicators of a programmer’s skill is code he has written.

- Open-source projects hosted on GitHub or other
- Relevant contributions to open-source projects
- Android apps built, preferably with source code
- Websites made, preferably with source code

In addition to coding, another important skill is general problem solving and communication. A StackOverflow profile can be interesting. A Careers 2.0 profile allows a candidate to highlight other relevant skills I may have forgotten to list. If they have one, they should include it in their application.

## How to evaluate source code

Ok so you have a bunch of code written by a candidate. How do you measure the quality of their code?

- Problem decomposition and organization:
    - Is the solution well-decomposed to multiple short methods instead of a few giant methods with 100+ lines?
    - Is the solution well-decomposed to multiple logical classes instead of a few giant classes with 100+ lines?

- Unit testing:
    - Did he have the good sense to include unit tests?
    - Did he test all (or most) corner cases?
    - Many shorter methods instead of few larger ones
    - Each test case test one specific feature and has descriptive name

- Readability: Did he care to make his code easy to read? (= easy to maintain)

- Good practices: there are too many things to list, here are some very common bad signs:
    - Using raw types like `Set` instead of `Set<String>`
    - Duplicated code fragments instead of reusable methods
    - Handling or throwing generic `Exceptions` instead of specialized ones
    - Using implementations instead of interfaces in method signature, for example `HashSet` instead of `Set`
    - Using old style iterations instead of `for (String name : names) { ... }`

- Correctness:
    - Does the solution pass your in-house unit tests? 
    - Could he find the simple solution instead of the over engineered / naive one?
    - Is the main logic good?
    - Run through the FindBugs plugin in Eclipse, there shouldn’t be critical problems

## Non-coding tests

There can be many good programmers who don’t have much interesting open-source work to show. To evaluate those, some more tests can help. Such tests should be broad-minded and ideally cover many areas in the [Programmer Competency Matrix][3].

Especially, a good programmer should:

- Know well data structures
- Know well algorithms
- Be comfortable with version control tools, including their command line interface
- Be able to automate builds (build a project using the command line without an IDE)
- Be familiar with unit testing, test driven development and its benefits
- Be familiar with related relevant frameworks and tools (Maven, Spring, Hibernate, Swing, JUnit, Mockito)
- Be comfortable with other languages too in addition to Java
- Be comfortable with some scripting languages
- Be comfortable in a UNIX shell

## Managing job interviews

Job interviews can be a huge waste of time. Unworthy candidates should not reach the in-person interview level. You should see sample code or homework solutions before inviting for in-person interview.

If an unworthy candidate manages to get through somehow, you have to ask yourselves, what did you do wrong, and adapt your pre-interview testing methods.

## Interview independently

Ideally two or more persons should interview a candidate, on the same day, and completely independently. They should not share their opinions before the interview process is over. They should write a report immediately after the interview, and send it to each other at the same time. If my friend tells me X is a great candidate I probably won’t be able to remain objective and see him in a pink light, clouding my judgment.

## What to ask during the interview

Candidates who reach this point should be pretty good already. A FizzBuzz test is probably redundant. For me, the purpose of the in-person interview is to verify that:

- The person did the tests himself
- The experience with languages/tools/concepts listed on the CV
- The person is a good cultural fit. Apply the "Sunday test": if this person was alone in the office on a Sunday, would that make you more likely to come in just to hang out with him?
- Good communication skills

## Conclusions

I haven’t had a chance to test all these ideas yet. Maybe not all of them are great. If I was hiring today, this is how I would do it. Consider this a proposal, not as hard rules.

One thing is for sure: there is NO one-size-fits-all solution. Customize according to the position you’re hiring for. You cannot get reliably good results from any automated method or recipe. You always have to make some effort yourself, look into the candidate in detail, so that you can spot relevant information not covered by the "rules". Maybe a great candidate is poor in one area that’s not so relevant, but he’s absolutely brilliant in another critical area. Only a human can judge such situations.

[1]: http://www.codingame.com/cg/#!page:training
[2]: https://codility.com/programmers/lessons/
[3]: http://www.starling-software.com/employment/programmer-competency-matrix.html
[4]: http://www.codinghorror.com/blog/2012/03/how-to-hire-a-programmer.html
[5]: http://www.amazon.com/Smart-Gets-Things-Done-Technical/dp/1590598385
[6]: http://gigaom.com/2012/04/28/6-secrets-for-building-a-super-team/
[7]: http://www.joelonsoftware.com/articles/fog0000000043.html
[8]: http://alexnisnevich.github.io/untrusted/
[9]: https://github.com/janosgyerik/capture-the-flag
