.PHONY: validate-router package-generic package-claude package-openai list-adapters

validate-router:
	ruby scripts/validate_router.rb

package-generic:
	sh install.sh generic

package-claude:
	sh install.sh claude

package-openai:
	sh install.sh openai

list-adapters:
	sh install.sh --list
