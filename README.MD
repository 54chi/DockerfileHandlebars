# Node Alpine based for CC builds

A ~140Mb CC Build environment. Includes npm, handlebars, gulp, sass, bower, ruby

To build
```
sudo docker build -t num2/cc_build .
```

Volume "\workdir" is enabled by default and could be used to share files between the host and the container.

## Compiling handlebars templates

To use: from the command line in your container, invoke handlebars
```
handlebars hbs/pdp.hbs -f compiled/pdp.tpl.js
```
