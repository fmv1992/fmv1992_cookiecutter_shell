SHELL := /bin/bash -euo pipefail
export ROOT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

export PROJECT ?= fmv1992_cookiecutter_shell

all: dev check test

dev:
	cp -rf ./other/git/hooks/* ./.git/hooks/

check:

test:
	bash -xv ./other/tests/test_instantiation.sh

git_delete_stale_branches:
	$(shell get_project_path gnu_make_api)/bin/git_delete_stale_branches $(ROOT_DIR) ./other/git/branches/
