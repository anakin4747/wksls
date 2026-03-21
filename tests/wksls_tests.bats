#!/usr/bin/env bats

source ./tests/lsts/lsts

lsts_set_cmd "wksls"
lsts_set_root "$(dirname "$BATS_TEST_FILENAME")"
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

@test "hover over bootloader returns documentation" {
    lsts_hover \
        "openembedded-core/scripts/lib/wic/canned-wks/efi-bootdisk.wks.in" 0 0 \
        "fixtures/hover_bootloader.rpc.json"
}

@test "hover over part returns documentation" {
    lsts_hover \
        "openembedded-core/scripts/lib/wic/canned-wks/efi-bootdisk.wks.in" 1 0 \
        "fixtures/hover_part.rpc.json"
}
