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

The first one I call `should`, to create a test case easily:

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

---

Another one I call `asserteq`, to easily insert an `assertEquals` assertion:

    org.junit.Assert.assertEquals($expected$, $actual$);

Again,
the `$expected$` and `$actual$` custom variables are just placeholders to force the cursor to jump to the positions where I want it to be.

As the first example,
this live template also requires the same options to automatically add the `import` statement and to shorten the fully qualified names.

---

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

  [1]: /assets/images/screenshots/live-templates/className-configure-live-template.png
  [2]: /assets/images/screenshots/live-templates/className-define-className-variable.png
