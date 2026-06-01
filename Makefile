.PHONY: all test lint install uninstall install-vscode-ext install-vscodium-ext

PREFIX ?= /usr/local

all:
	nix develop --extra-experimental-features 'nix-command flakes' --command make test lint

lint:
	shellcheck --external-sources --shell=bash wksls tests/*_tests.bats

test:
	bats --formatter $(CURDIR)/wksls-format-pretty tests/*_tests.bats

install:
	install -m 755 wksls $(PREFIX)/bin/wksls

uninstall:
	rm -f $(PREFIX)/bin/wksls

install-vscode-ext:
	mkdir -p ~/.vscode/extensions/wksls-0.0.1
	cp -r vscode-wksls/. ~/.vscode/extensions/wksls-0.0.1

install-vscodium-ext:
	mkdir -p ~/.vscode-oss/extensions/wksls-0.0.1
	cp -r vscode-wksls/. ~/.vscode-oss/extensions/wksls-0.0.1
