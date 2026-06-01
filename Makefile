
PREFIX ?= /usr/local

.PHONY: all
all:
	nix develop --extra-experimental-features 'nix-command flakes' --command make test lint

.PHONY: lint
lint:
	shellcheck --external-sources --shell=bash wksls tests/*_tests.bats

.PHONY: test
test:
	bats --formatter $(CURDIR)/wksls-format-pretty tests/*_tests.bats

.PHONY: release
release:
	nix develop --extra-experimental-features 'nix-command flakes' --command cog bump --auto
	git push --follow-tags

.PHONY: install
install:
	install -m 755 wksls $(PREFIX)/bin/wksls

.PHONY: uninstall
uninstall:
	rm -f $(PREFIX)/bin/wksls

.PHONY: install-vscode-ext
install-vscode-ext:
	version=$$(jq -r .version vscode-wksls/package.json); \
	cd vscode-wksls && npm install && npx @vscode/vsce package --out "wksls-$$version.vsix" && \
	code --install-extension "wksls-$$version.vsix"

.PHONY: install-vscodium-ext
install-vscodium-ext:
	version=$$(jq -r .version vscode-wksls/package.json); \
	cd vscode-wksls && npm install && npx @vscode/vsce package --out "wksls-$$version.vsix" && \
	codium --install-extension "wksls-$$version.vsix"
