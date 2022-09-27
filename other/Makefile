# general preamble
SHELL := bash
.SHELLFLAGS := -eu -o pipefail -c
.DELETE_ON_ERROR:
MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules

# run the help command when running `make` by itself
.DEFAULT_GOAL := help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

run:  ## start the dev app
	./bin/start

refresh:  ## refresh the workspace
	./bin/refresh-workspace

login:  ## login to AWS
	wf login

ro-shell:  ## start a read-only shell on prod data
	export DJANGO_SETTINGS_MODULE="conjura.settings.prodaccessenv.ro"
	export DJANGO_ALLOW_ASYNC_UNSAFE=true
	ipython -i /workspaces/dotfiles/dotfiles/ro_shell.py

.PHONY: help run refresh login ro-shell

