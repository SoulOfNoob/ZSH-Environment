###########
# Install #
###########
target := nothing

.PHONY: install
install: ## Run the alpine testing container
	/bin/bash ./install.sh

###########
# Testing #
###########
target := nothing

.PHONY: test
test: ## Run the interactive testing script
	/bin/bash ./test.sh

.PHONY: test-alpine
test-alpine: ## Run the alpine testing container
	/bin/bash ./test.sh 1 false

.PHONY: test-alpine-build
test-alpine-build: ## Build and run the alpine testing container
	/bin/bash ./test.sh 1 true

.PHONY: test-arch
test-arch: ## Run the arch testing container
	/bin/bash ./test.sh 2 false

.PHONY: test-arch-build
test-arch-build: ## Build and run the arch testing container
	/bin/bash ./test.sh 2 true

.PHONY: test-debian
test-debian: ## Run the debian testing container
	/bin/bash ./test.sh 3 false

.PHONY: test-debian-build
test-debian-build: ## Build and run the debian testing container
	/bin/bash ./test.sh 3 true

.PHONY: test-wrt
test-wrt: ## Run the wrt testing container
	/bin/bash ./test.sh 4 false

.PHONY: test-wrt-build
test-wrt-build: ## Build and run the wrt testing container
	/bin/bash ./test.sh 4 true

.PHONY: test-slackware
test-slackware: ## Run the slackware testing container
	/bin/bash ./test.sh 5 false

.PHONY: test-slackware-build
test-slackware-build: ## Build and run the slackware testing container
	/bin/bash ./test.sh 5 true

########
# Help #
########

.DEFAULT_GOAL := help

.PHONY: help
help: ## Lists all available commands
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make <command> \033[36m\033[0m\n"} /^[$$()% a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-25s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)


