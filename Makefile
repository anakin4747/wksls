.PHONY: all test lint

all:
	nix develop --command make test lint

lint:
	shellcheck --external-sources --shell=bash tests/*_tests.bats

test:
	bats --formatter $(CURDIR)/wksls-format-pretty tests/*_tests.bats
