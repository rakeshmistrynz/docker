# Supported tags and respective `Dockerfile` links

* `latest`, `1.0.0` [(*Dockerfile*)](https://github.com/chadrien/docker/blob/87a129093e42fde8ea59d7e0d38136d84648a3e8/patternlab-php/Dockerfile)

# Patternlab-php

The PHP version of Pattern Lab is, at its core, a static site generator. It combines platform-agnostic assets, like the [Mustache](http://mustache.github.io/)-based patterns and the JavaScript-based viewer, with a PHP-based "builder" that transforms and dynamically builds the Pattern Lab site. By making it a static site generator, Pattern Lab strongly separates patterns, data, and presentation from build logic.

![Paternlab logo](http://patternlab.io/assets/icon-atom.svg)

# How to use this image

If you just want to see what Patternlab is about and see a live demo without having to install/configure the dependencies, run:

```
docker run -p 80:80 chadrien/patternlab-php
```

If you want to have a running Patternlab using your own sources, you can also use a `volume`:

```
docker run -p 80:80 -v $(pwd)/source:/opt/patternlab-php/source chadrien/patternlab-php
```

The patternlab watcher is running so changes in your `source` directory should be visible instantly.

**Note**: if the `source` directory being used as `volume` is empty, it's going to be initialised with a copy of the core sources from patternlab-php.