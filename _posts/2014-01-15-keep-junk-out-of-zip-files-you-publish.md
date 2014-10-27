---
layout: post
title: "Keep junk out of zip files you publish"
categories:
- musings
- software
tags: []
---
{% include JB/setup %}

Recently I started playing with [Android Bootstrap](http://www.androidbootstrap.com/).
I generated an app using the website,
built and installed it,
but it crashed immediately on launch with this error:

```
E/AndroidRuntime( 3497): Caused by: java.lang.RuntimeException: native typeface cannot be made
E/AndroidRuntime( 3497):        at android.graphics.Typeface.<init>(Typeface.jav a:175)
E/AndroidRuntime( 3497):        at android.graphics.Typeface.createFromAsset(Typ eface.java:149)
E/AndroidRuntime( 3497):        at com.example.myapp1.ui.view.CapitalizedTextVie w.setTF(CapitalizedTextView.java:56)
E/AndroidRuntime( 3497):        at com.example.myapp1.ui.view.CapitalizedTextVie w.<init>(CapitalizedTextView.java:31)
E/AndroidRuntime( 3497):        ... 23 more
```

That's ok, [others had the same problem](https://github.com/donnfelker/android-bootstrap-site/issues/14),
so the fix was easy:
download the **Roboto Regular** font from http://developer.android.com/design/style/typography.html,
copy `Roboto-Regular.ttf` to the `assets/` folder of the app,
rebuild, relaunch, that's it.

I normally don't unzip blindly just anything I downloaded,
so I checked the contents of the roboto zip first:

```
$ unzip -l ~/Downloads/roboto-1.2.zip 
Archive:  ~/Downloads/roboto-1.2.zip
  Length      Date    Time    Name
---------  ---------- -----   ----
        0  2013-10-26 02:33   Roboto_v1.2/
        0  2013-06-04 22:39   Roboto_v1.2/Icon^M
        0  2013-10-26 02:36   __MACOSX/
        0  2013-10-26 02:36   __MACOSX/Roboto_v1.2/
   447433  2013-06-04 22:39   __MACOSX/Roboto_v1.2/._Icon^M
        0  2013-10-26 02:34   Roboto_v1.2/Roboto/
     6148  2013-10-26 02:34   Roboto_v1.2/Roboto/.DS_Store
...
```

Wow, what a load of junk:
`__MACOSX` directory,
`.DS_Store` files,
`Icon` files with 0 length...
I'm surprised that a zip published on developer.android.com can be packaged so carelessly,
ridden with junk.
Weird.
