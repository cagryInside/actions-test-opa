.PHONY: test
test:
	 /opt/opa/bin/opa test -vv --timeout 30s ./tests/ ./files/
