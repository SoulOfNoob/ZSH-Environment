###########
# Testing #
###########
target := nothing

.PHONY: test-alpine
test-alpine: ## Build the docker container
	/bin/sh ./test.sh 1 false

.PHONY: test-alpine-build
test-alpine-build: ## Build the docker container
	/bin/sh ./test.sh 1 true

.PHONY: test-arch
test-arch: ## Build the docker container
	/bin/sh ./test.sh 2 false

.PHONY: test-arch-build
test-arch-build: ## Build the docker container
	/bin/sh ./test.sh 2 true

.PHONY: test-debian
test-debian: ## Build the docker container
	/bin/sh ./test.sh 3 false

.PHONY: test-debian-build
test-debian-build: ## Build the docker container
	/bin/sh ./test.sh 3 true

.PHONY: test-wrt
test-wrt: ## Build the docker container
	/bin/sh ./test.sh 4 false

.PHONY: test-wrt-build
test-wrt-build: ## Build the docker container
	/bin/sh ./test.sh 4 true

.PHONY: test-slackware
test-slackware: ## Build the docker container
	/bin/sh ./test.sh 5 false

.PHONY: test-slackware-build
test-slackware-build: ## Build the docker container
	/bin/sh ./test.sh 5 true

