---
layout: page
title : Blog
tagline: My journal of daily hacks
group: navigation
order: 1
---
{% include JB/setup %}

{% for post in site.posts limit:50 %}
  <h3>
    <a href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a>
    <small class="text-muted">{{ post.date | date: "%B %e, %Y" }}</small>
  </h3>
  {% capture preview %}{{ post.content | post_preview }}{% endcapture %}
  {% if preview != '' %}
  <blockquote>{{ preview }}</blockquote>
  {% endif %}
{% endfor %}

<div class="alert alert-info">
For older articles, <a href="/archive.html">see the complete Archive</a>.
</div>
