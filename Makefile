.PHONY: all dev test lint install install-manual uninstall-manual install-vscode-ext

PREFIX ?= /usr/local

all:
	nix develop --command make test lint

dev:
	st -e \
		nix develop --command \
			nvim --clean \
				-u $(CURDIR)/dev/init.lua \
				$(CURDIR)/tests/openembedded-core/scripts/lib/wic/canned-wks/systemd-bootdisk.wks &

lint:
	shellcheck --external-sources --shell=bash wksls tests/*_tests.bats

test:
	bats --formatter $(CURDIR)/wksls-format-pretty tests/*_tests.bats

install:
	nix profile install .

install-manual:
	install -m 755 wksls $(PREFIX)/bin/wksls

uninstall-manual:
	rm -f $(PREFIX)/bin/wksls

install-vscode-ext:
	mkdir -p ~/.vscode-oss/extensions/wksls-0.0.1
	cp -r vscode-wksls/. ~/.vscode-oss/extensions/wksls-0.0.1
