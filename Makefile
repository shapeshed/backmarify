build: mkbuild-dir copy-files browserify
test: jshint karma 

browserify:
	@./node_modules/browserify/bin/cmd.js ./src/main.js -d -o ./build/main.js

copy-files:
	@cp ./src/index.html ./build/index.html

jshint:
	@./node_modules/jshint/bin/jshint ./src/**/*.js

karma:
	@karma start

mkbuild-dir:
	@mkdir -p ./build

server: 
	@./node_modules/http-server/bin/http-server build
		
watch:
	@while true; do inotifywait -e modify ./; make browserify; done
