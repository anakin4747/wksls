.PHONY: all test lint install

all:
	nix develop --command make test lint

lint:
	shellcheck --external-sources --shell=bash wksls tests/*_tests.bats

test:
	bats --formatter $(CURDIR)/wksls-format-pretty tests/*_tests.bats

install:
	nix profile install .
