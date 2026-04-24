.PHONY: validate-router designmd-lint designmd-spec designmd-diff-sample designmd-export-tailwind designmd-export-dtcg capability-list capability-spec-template capability-web-template capability-contract package-generic package-claude package-openai list-adapters

validate-router:
	ruby scripts/validate_router.rb

designmd-lint:
	node ./scripts/designmd.mjs lint ./skills/visual-style/DESIGN.md

designmd-spec:
	node ./scripts/designmd.mjs spec --rules

designmd-diff-sample:
	node ./scripts/designmd.mjs diff ./docs/designmd-examples/taste-stitch-base.DESIGN.md ./docs/designmd-examples/taste-stitch-variant.DESIGN.md

designmd-export-tailwind:
	node ./scripts/designmd.mjs export --format tailwind ./skills/visual-style/DESIGN.md

designmd-export-dtcg:
	node ./scripts/designmd.mjs export --format dtcg ./skills/visual-style/DESIGN.md

capability-list:
	node ./scripts/capability.mjs list

capability-spec-template:
	node ./scripts/capability.mjs spec-template

capability-web-template:
	node ./scripts/capability.mjs web-template

capability-contract:
	node ./scripts/capability.mjs contract

package-generic:
	sh install.sh generic

package-claude:
	sh install.sh claude

package-openai:
	sh install.sh openai

list-adapters:
	sh install.sh --list
