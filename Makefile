.PHONY: all test lint

all:
	nix develop --command make test lint

lint:
	-shellcheck --shell=bash lsts tests/*_tests.bats

test:
	bats --formatter $(CURDIR)/wksls-format-pretty tests/*_tests.bats
