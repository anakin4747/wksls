
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

.PHONY: install
install:
	install -m 755 wksls $(PREFIX)/bin/wksls

.PHONY: uninstall
uninstall:
	rm -f $(PREFIX)/bin/wksls

.PHONY: install-vscode-ext
install-vscode-ext:
	mkdir -p ~/.vscode/extensions/wksls-0.0.1
	cp -r vscode-wksls/. ~/.vscode/extensions/wksls-0.0.1

.PHONY: install-vscodium-ext
install-vscodium-ext:
	mkdir -p ~/.vscode-oss/extensions/wksls-0.0.1
	cp -r vscode-wksls/. ~/.vscode-oss/extensions/wksls-0.0.1
