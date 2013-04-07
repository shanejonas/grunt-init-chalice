# {%= name %}

{%= description %}

## Getting Started

## Installation
If you haven't already done so, install [grunt-init][].
Use git to clone this template into `~/.grunt-init/`, as follows:


```
git clone git@github.com:shanejonas/grunt-init-chalice.git ~/.grunt-init/chalice
```

After that you can run:
```
  npm install -g grunt-cli
  npm install
  grunt
  open http://localhost:3000
```

---

## The Holy Grail

### Description
Chalice is thin library that makes [Backbone](http://backbonejs.org)
work on both the client and  the server.
![holygrail](http://f.cl.ly/items/2q1I0a061O1L2F213p1e/mphg.gif)

---

### The Ups
- Leaves Routing and MV* to the developer just like [Backbone]()
- Speed
- Thin Libraries
- Express Plugin for the server side (pass `app` around)

---

### Thin Libraries
This documentation site and the libraries (backbone + chalice + handlebars + zepto) are only 29kb gzip/compressed.
![thin-libraries](http://f.cl.ly/items/0Q292M0K1x153N2a2M2B/Screen%20Shot%202013-04-02%20at%2011.27.18%20PM.png)

---

### The Speed
Dom creation libraries are getting [faster](http://jsperf.com/dom-creation-libs). But the clear winner is still concatenating strings. This also makes it easier to work with views on the server. Having the views on the server shows the user the page instantly instead of waiting for backbone to load/fetch on client side. This boilerplate is also 100/100 PageSpeed out of the box!

---

### The Approach
I'm pretty opinionated with my CommonJS dependencies here but it just makes sense
if the end goal is to get Backbone running on the server. My approach is
to provide a thin layer on top of Backbone that allows it to run fast
and seamless inside `node.js`. The templates are [handlebars]() and the
language is [coffeescript]().

---

## The Grunt Build System
Grunt is becoming a popular build tool, and for good reason. If you
haven't seen grunt before, check the [getting started guide](). Running
`grunt` out of the box will give you a dev server on `localhost:3000`
that will selectively rebuild and livereload in the browser when `coffee-script` or `stylus` files
change.

- `grunt` - Alias for "default" task
- `grunt default` - Alias for "clean", "stylus:dev", "browserify2:dev", "express:app", "livereload-start", "regarde" tasks.
- `grunt build` - Alias for "clean", "stylus:build", "browserify2:build".
- `grunt serve` - Alias for "express:app", "express-keepalive" tasks.
- `grunt clean` - Clean files and folders.
- `grunt devtools` - A GUI For grunt in chrome devtools

![grunt-devtools](http://cloud.shanejon.as/image/3s0l2X3J0I1f/Screen%20Shot%202013-03-31%20at%2011.00.08%20PM.png)

You can get a list of all the tasks by running `grunt --help`.

---

### Parts of the Library
The libraries live on `npm` and [github](http://github.com/shanejonas).

- [View](https://github.com/shanejonas/chalice-view)
- [CompositeView](https://github.com/shanejonas/chalice-compositeview)
- [Client](https://github.com/shanejonas/chalice-client)
- [Server](https://github.com/shanejonas/chalice-server)

---

#### Examples Applications:
- [Blog Example](https://github.com/shanejonas/chalice-blog)
- [Documentation Site](https://github.com/shanejonas/chalice)

## License
Copyright (c) {%= grunt.template.today('yyyy') %} {%= author_name %}
Licensed under the {%= licenses.join(', ') %} license{%= licenses.length === 1 ? '' : 's' %}
