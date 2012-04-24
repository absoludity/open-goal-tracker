test: test-unit

test-unit:
	@phantomjs bin/run-qunit.js file://$(PWD)/test/index.html

test-unit-xml:
	@phantomjs bin/run-qunit.js file://$(PWD)/test/index.html junit-xml

test-debug:
	@phantomjs --remote-debugger-port=9000 bin/run-qunit.js file://$(PWD)/test/index.html

watch: watch-unit-ubuntu

watch-unit-ubuntu:
	@./bin/ubuntu-autotest.py

run:
	@./bin/serve.py

.PHONY: run test test-unit watch watch-unit
