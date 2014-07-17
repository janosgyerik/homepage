---
layout: post
title: "Playing with Shiny by RStudio"
categories:
- software
- hacks
tags: []
---
{% include JB/setup %}

[Shiny by RStudio][1] is a web application framework for R and it's awesome.
The [tutorial][2] is very easy to follow and demonstrates well the power of the framework.
It gives your R data and plots a very nice web interface,
with editable parameters,
and automatic re-rendering upon change of inputs.
It really makes your plots and data come to life.
The HTML output uses Bootstrap's responsive features,
so the sites you build will render nicely from large screens to small.

I put together a quick demo for fun:

https://janos.shinyapps.io/us-hospitals/

This is a visualization of US hospitals,
ranked by parameters you can choose.
For example you can find the hospitals where patients of heart failure (and others) have the lowest mortality rate,
in a given state.
You can play with the parameters and the plots and the data table are automatically updated.
[(Here's the source code.)][3]

[1]: http://shiny.rstudio.com/
[2]: http://shiny.rstudio.com/tutorial/
[3]: https://github.com/janosgyerik/r-shiny-us-hospitals
