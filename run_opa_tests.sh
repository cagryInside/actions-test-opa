#!/bin/bash

# Runs opa tests without coverage so that test success/failures are reported correctly
/opt/opa/bin/opa test -vv --timeout 30s ./tests/ ./files/
