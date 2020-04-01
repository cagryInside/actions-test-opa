DOCKER_TAG ?= linux-authz-$(USER)
VIRTUALENV_RUN_TARGET = virtualenv_run-dev
VIRTUALENV_RUN_REQUIREMENTS = requirements-dev.txt

export GIT_SHA = $(shell git rev-parse --short HEAD)

.PHONY: test
test: clean-cache install-hooks
	tox
	tox -e opatest

.PHONY: install-hooks
install-hooks: virtualenv_run
	tox -e install-hooks

virtualenv_run: $(VIRTUALENV_RUN_REQUIREMENTS)
	tox -e $(VIRTUALENV_RUN_TARGET)


.PHONY: clean
clean: clean-cache
	rm -rf docs/build virtualenv_run .tox

.PHONY: clean-cache
clean-cache:
	find -name '*.pyc' -delete
	find -name '__pycache__' -delete
