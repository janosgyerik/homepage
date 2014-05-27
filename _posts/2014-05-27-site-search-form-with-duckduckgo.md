---
layout: post
title: "Site search form with DuckDuckGo"
categories:
- hacks
- software
tags: []
---
{% include JB/setup %}

The [documentation of DuckDuckGo][1] isn't very clear about adding a site search form to your site.
They give an example using an `iframe`,
but that's not so great,
because you don't have much control over the style,
especially that green button,
for example here:

```html
<iframe src="http://duckduckgo.com/search.html?site=janosgyerik.com&prefill=Search DuckDuckGo" style="overflow:hidden;margin:0;padding:0;width:408px;height:40px;" frameborder="0"></iframe>
```

<iframe src="http://duckduckgo.com/search.html?site=janosgyerik.com&prefill=Search DuckDuckGo" style="overflow:hidden;margin:0;padding:0;width:408px;height:40px;" frameborder="0"></iframe>

Luckily they included a link to [the blog of the founder][2],
which demonstrates how to do this, essentially:

```html
<form action="https://duckduckgo.com/">
  <input type="text" name="q">
  <input type="hidden" name="sites" value="janosgyerik.com">
  <button type="submit">Search</button>
</form>
```

The same thing, but using Bootstrap 3 style:

```html
<form class="form-inline" role="search" action="https://duckduckgo.com/">
  <div class="form-group">
    <input type="text" name="q" class="form-control" placeholder="Search on janosgyerik.com">
    <input type="hidden" name="sites" value="janosgyerik.com">
  </div>
  <button type="submit" class="btn btn-default">Search</button>
</form>
```

<form class="form-inline" role="search" action="https://duckduckgo.com/">
  <div class="form-group">
    <input type="text" name="q" class="form-control" placeholder="Search on janosgyerik.com">
    <input type="hidden" name="sites" value="janosgyerik.com">
  </div>
  <button type="submit" class="btn btn-default">Search</button>
</form>

Yes, finally I added site search to this site (see the navbar!),
it was really long overdue!


[1]: https://duckduckgo.com/search_box
[2]: http://www.gabrielweinberg.com/blog/
