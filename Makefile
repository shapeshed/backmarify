test: jshint karma 

browserify:
	@./node_modules/browserify/bin/cmd.js app.js -d -o main.js

server: 
	@./node_modules/http-server/bin/http-server
		
watch:
	@while true; do inotifywait -e modify ./; make browserify; done

karma:
	@karma start

jshint:
	@./node_modules/jshint/bin/jshint app.js
