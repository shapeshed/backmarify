SHELL := /bin/bash
JSMD5 = $(shell md5sum ./build/main.js.tmp | awk '{ print $$1 }')

build: clearbuild-dir mkbuild-dir copy-files browserify md5-js replace-js-string remove-tmp-files
test: jshint karma 

browserify:
	@./node_modules/browserify/bin/cmd.js ./src/main.js -d -o ./build/main.js.tmp

clearbuild-dir:
	@rm -Rf ./build

copy-files:
	@cp ./src/index.html ./build/index.html

jshint:
	@./node_modules/jshint/bin/jshint ./src/*.js

karma:
	@karma start

md5-js: 
	@cp ./build/main.js.tmp ./build/main-$(JSMD5).js 

mkbuild-dir:
	@mkdir -p ./build

replace-js-string:
	@find ./build -name index.html | xargs sed -i "s/main\.js/main-$(JSMD5)\.js/" 
	
remove-tmp-files:
	@rm build/*.tmp

server: 
	@./node_modules/http-server/bin/http-server -c 0 build

uglify: 
	@./node_modules/uglify-js2/bin/uglifyjs2 build/main.js.tmp build/main.js 

remove-tmp:
	@rm build/main.js.tmp
		
watch:
	@while true; do inotifywait --exclude .swp --exclude .swo -e modify ./src; make build; done
