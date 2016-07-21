---
layout: post
title: "Live templates in IntelliJ"
categories:
- hacks
- software
tags: []
---
{% include JB/setup %}

[Live templates in IntelliJ](https://www.jetbrains.com/help/idea/2016.1/live-templates.html) are awesome.

Although I'm still new to them,
I'm very happy with my first few very simple templates.

`should`: create a test case easily:

    @org.junit.Test
    public void should_$name$() {
        $END$
    }

Don't let the complete package name `org.junit.Test` deceive you:
it's a simple trick to get the `import` statement added.
After that the annotation will be automatically shortened.
This is done by checking these two options in the live template's configuration:

- **Use static import if possible**
- **Shorten FQ names**

`$name$` is a custom variable. After the template is inserted,
the cursor will be put in its place.
Perfect to give a name to the test method.

`$END$` is a built-in variable, it marks the position where the cursor should be placed after the template and all template variables are inserted.
So after giving a name to the test method,
I can carry on typing the implementation.

`asse`: easily insert an `assertEquals` assertion:

    org.junit.Assert.assertEquals($expected$, $actual$);

Again,
the `$expected$` and `$actual$` custom variables are just placeholders to force the cursor to jump to the positions where I want it to be.

As the first example,
this live template also requires the same options to automatically add the `import` statement and to shorten the fully qualified names.
