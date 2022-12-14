.PHONY: dev test help
.DEFAULT_GOAL: help

default: help

help: ## Output available commands
	@echo "Available commands:"
	@echo
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

local_test: ## Runs tests locally in Docker
	@docker-compose build local_test
	@docker-compose run local_test

ci_test: ## Runs tests in CI in Docker
	@docker-compose build ci_test
	@docker-compose run --rm ci_test
