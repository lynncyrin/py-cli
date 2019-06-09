.DEFAULT_GOAL := help

help: # automatically documents the makefile, by outputing everything behind a ##
	@grep -E '^[0-9a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

# Prereqs:
# 	- homebrew => https://brew.sh/
# 	-	yq => `brew install yq`
# 	- docker => `brew cask install docker`

clean: ## 🗑️  Clear local files and assets
	@./scripts/clean.sh

build: ## ⚙️  Build into local environment - for osx
	@./scripts/build-local-osx.sh

test: build ## ✅ Run all checks - tests, linters, etc.
	@./scripts/test.sh
