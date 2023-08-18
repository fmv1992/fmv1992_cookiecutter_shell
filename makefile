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
	git_delete_stale_branches --delete --git-directory . --config-directory ./other/git/branches/
