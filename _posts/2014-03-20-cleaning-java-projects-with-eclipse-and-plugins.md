---
layout: post
title: "Cleaning Java projects with Eclipse and plugins"
categories:
- hacks
- software
tags: []
---
{% include JB/setup %}

If you ever have to work with ugly legacy code (ugh),
or if you want to refactor very complex code (perhaps to reduce cyclomatic complexity?) without breaking anything,
here are some practical tips you can use with Eclipse.
In version Kepler,
you can install all the plugins I mention below using the Marketplace.

### Get rid of the junk with [UCDetector](http://www.ucdetector.org/)

Before you start optimizing anything,
it's best to first remove all unused classes and methods.
Otherwise you might waste time on stuff that don't actually matter.

This plugin detects unreferenced classes and methods.
Right click on a project
and select **UCDetector | Detect unnecessary code**.
The initial scan might take a while.
When finished,
go to the **Problems** view,
and use the menu of the view to group by **Type**.

<a href="#" class="thumbnail">
<img src="{{ site.url }}/assets/screenshots/eclipse-problems-group-by.png" />
</a>

After this,
check out the categories of UCDetector,
especially the **References** section:

<a href="#" class="thumbnail">
<img src="{{ site.url }}/assets/screenshots/eclipse-problems-ucdetector.png" />
</a>

Be careful, not everything that's unreferenced is junk!
Some classes and methods might be used by Spring, Hibernate, third party code, or reflection.
If, after careful thinking,
you don't see a reason for these classes and methods to exist,
then cut them.
You can always bring them back from your VCS if ever needed.

Congratulations,
your technical debt is already reduced!
And most probably your test coverage has increased too!
Read the project's front page carefully,
it gives other useful tips.

### Find dangerous code with [FindBugs](http://findbugs.sourceforge.net/)

If you've never tried this,
I guarantee you'll be amazed at the damage *you yourself* have inflicted on your precious project.
Right-click on a project and select **Find Bugs | Find Bugs**.
The initial scan might take a while.
When finished,
open the **Bug Explorer** view and behold the horrors,
in **Scariest**, **Very Scary** and **Scary** categories.
Didn't I say you'll be amazed ;-)

### Refactor complex code safely with [EclEmma](http://www.eclemma.org/)

How do you refactor some really complex code, safely?
How can you be sure you're not breaking something in the process?
Here's one way:

1. Add unit tests to cover ALL executions paths. 100%, no exceptions.
2. Refactor. If tests still pass, it must be correct. Right?

EclEmma won't refactor anything for you, unfortunately.
But it will show the execution paths you've covered or missed.
Open your unit test class and use EclEmma's toolbar to run the tests.
Switch to the class under test,
and you should see lines highlighted with green-yellow-red colors,
depending on where execution passed or didn't during the tests.
Keep adding test cases until all lines in the target method are green,
no red or yellow lines.
Now you can go ahead and refactor safely,
your unit tests have your back!

### Stay clean using [SonarQube](http://www.sonarqube.org/)

Previously known as Sonar,
this is not an Eclipse plugin but a code quality checking tool.
Normally part of continuous integration,
running automatically on a server after your builds.
Setup is beyond the scope of this article.
Hopefully you have it in place at your work.
Find it out, and get it enabled for your projects.

You should certainly fix all **Critical** violations,
and probably the **Major** ones too.
If there are a daunting number of problems,
maybe you can take it step by step to ease the pain gradually.
Have each of your teammates fix N problems per week,
and your projects will steadily get cleaner and cleaner!

### That's it?

Do you have more ideas?
Do you know how to do these things in IntelliJ?
Please comment!
