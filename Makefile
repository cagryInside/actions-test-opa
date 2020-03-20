.PHONY: test
test:
	 sudo /opt/opa/bin/opa test -vv --timeout 30s ./tests/ ./files/
