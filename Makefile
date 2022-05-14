ifneq ($(wildcard IHP/.*),)
IHP = IHP/lib/IHP
else
ifneq ($(wildcard build/ihp-lib),)
IHP = build/ihp-lib
else
ifneq ($(shell which RunDevServer),)
IHP = $(shell dirname $$(which RunDevServer))/../lib/IHP
else
IHP = $(error IHP not found! Run the following command to fix this:    nix-shell --run 'make .envrc'    )
endif
endif
endif

tailwind-dev:
	node_modules/.bin/tailwind -c tailwind/tailwind.config.js -i ./tailwind/app.css -o static/app.css --watch

node_modules:
  NODE_ENV=production npm ci

static/app.css:
	NODE_ENV=production node_modules/.bin/tailwind -c tailwind/tailwind.config.js -i ./tailwind/app.css -o static/app.css --minify

CSS_FILES += static/app.css

JS_FILES += ${IHP}/static/vendor/timeago.js
JS_FILES += ${IHP}/static/helpers.js
JS_FILES += ${IHP}/static/vendor/morphdom-umd.min.js
JS_FILES += ${IHP}/static/vendor/turbolinks.js
JS_FILES += ${IHP}/static/vendor/turbolinksInstantClick.js
JS_FILES += ${IHP}/static/vendor/turbolinksMorphdom.js

include ${IHP}/Makefile.dist

