---
layout: post
title: "Live templates in IntelliJ are awesome"
categories:
- hacks
- software
tags: []
---
{% include JB/setup %}

I'm still new to [live templates in IntelliJ](https://www.jetbrains.com/help/idea/2016.1/live-templates.html),
but I'm already a huge fan.
My first few templates are very simple, but already save me a lot of time.

### Add a test method easily

    @org.junit.Test
    public void should_$name$() {
        $END$
    }

Make sure to check the **Shorten FQ names** box when creating this template.

[<img src="/assets/images/screenshots/live-templates/test-method-configuration.png" alt="define className variable" style="width: 678px;"/>][3]

When you type "should" (the abbreviation),
this will add the necessary `import org.junit.Test;` statement at the top of the file, and this code:

    @Test
    public void should_() {

    }

It is thanks to the **Shorten FQ names** option that `@org.junit.Test` is reduced to simply `@Test`.

The `$name$` variable is irrelevant, it could be named something else.
The purpose of that variable is that when the template is inserted in the class,
the cursor will be placed in the position of `$name$`,
asking you to enter something.

After you entered a value for `$name$` (effectively the name of the test method),
the cursor will finally jump to `$END$`, a built-in variable,
so that you can carry on and implement the test case.

<div class="text-muted">
<a href="http://stackoverflow.com/documentation/intellij-idea/2703/live-templates/9047/add-a-test-method-easily#t=201607241747291522594">(See also on Stack Overflow Documents)</a>
</div>

### Add an assertion easily

    org.junit.Assert.assertEquals($expected$, $actual$);

The `$expected$` and `$actual$` custom variables are just placeholders to force the cursor to jump to the positions where I want it to be.

As the first example,
this live template also requires the same options to automatically add the `import` statement and to shorten the fully qualified names.

### Insert the name of the current class

Last but not least, consider the *utility class pattern*:
a class with only `static` methods and no fields.
It's recommended to prevent instantiation of such classes by adding a private a constructor.

This live template example makes it easy to add a private constructor to an existing class, using the name of the enclosing class.

    private $className$() {
        throw new AssertionError("utility class, forbidden constructor");
    }

Applicable in Java: declaration scope.

[<img src="/assets/images/screenshots/live-templates/className-configure-live-template.png" alt="configure live template" style="width: 678px;"/>][1]

Click **Edit variables** to define the `className` variable as the built-in `className()` expression, and check the **Skip if defined** box to avoid prompting for a custom name, which is unnecessary in this example.

[<img src="/assets/images/screenshots/live-templates/className-define-className-variable.png" alt="define className variable" style="width: 678px;"/>][2]

For example, inside a class like this:

    class ListUtils {

        // ...
    }

When you type "utility_class" (the abbreviation), this will insert a constructor like this:

    class ListUtils {
        private ListUtils() {
            throw new AssertionError("utility class, forbidden constructor");
        }

        // ...
    }

<div class="text-muted">
<a href="http://stackoverflow.com/documentation/intellij-idea/2703/live-templates/9048/insert-the-name-of-the-current-class#t=201607241747291522594">(See also on Stack Overflow Documents)</a>
</div>

  [1]: /assets/images/screenshots/live-templates/className-configure-live-template.png
  [2]: /assets/images/screenshots/live-templates/className-define-className-variable.png
  [3]: /assets/images/screenshots/live-templates/test-method-configuration.png
