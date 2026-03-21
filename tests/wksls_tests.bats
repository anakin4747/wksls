#!/usr/bin/env bats

source ./tests/lsts/lsts

lsts_set_cmd "wksls"
lsts_set_root "$(dirname "$BATS_TEST_FILENAME")/openembedded-core/"
lsts_set_langId "wks"

setup() {
    lsts_start
}

teardown() {
    lsts_stop
}

@test "initializes successfully" {
    lsts_initialize
}

