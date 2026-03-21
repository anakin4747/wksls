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

@test "initialize advertises openClose textDocumentSync" {
    lsts_initialize
    echo "$LSTS_RESPONSE" | jq -e '.result.capabilities.textDocumentSync.openClose == true'
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

@test "hover over partition returns documentation" {
    lsts_hover "fixtures/hover.wks" 2 0 "fixtures/hover_part.rpc.json"
}

@test "hover over --append returns documentation" {
    lsts_hover "fixtures/hover.wks" 3 0 "fixtures/hover_--append.rpc.json"
}

@test "hover over --configfile returns documentation" {
    lsts_hover "fixtures/hover.wks" 4 0 "fixtures/hover_--configfile.rpc.json"
}

@test "hover over --ptable returns documentation" {
    lsts_hover "fixtures/hover.wks" 5 0 "fixtures/hover_--ptable.rpc.json"
}

@test "hover over --timeout returns documentation" {
    lsts_hover "fixtures/hover.wks" 6 0 "fixtures/hover_--timeout.rpc.json"
}

@test "hover over --size returns documentation" {
    lsts_hover "fixtures/hover.wks" 7 0 "fixtures/hover_--size.rpc.json"
}

@test "hover over --fixed-size returns documentation" {
    lsts_hover "fixtures/hover.wks" 8 0 "fixtures/hover_--fixed-size.rpc.json"
}

@test "hover over --source returns documentation" {
    lsts_hover "fixtures/hover.wks" 9 0 "fixtures/hover_--source.rpc.json"
}

@test "hover over --ondisk returns documentation" {
    lsts_hover "fixtures/hover.wks" 10 0 "fixtures/hover_--ondisk.rpc.json"
}

@test "hover over --ondrive returns documentation" {
    lsts_hover "fixtures/hover.wks" 11 0 "fixtures/hover_--ondrive.rpc.json"
}

@test "hover over --fstype returns documentation" {
    lsts_hover "fixtures/hover.wks" 12 0 "fixtures/hover_--fstype.rpc.json"
}

@test "hover over --fsoptions returns documentation" {
    lsts_hover "fixtures/hover.wks" 13 0 "fixtures/hover_--fsoptions.rpc.json"
}

@test "hover over --label returns documentation" {
    lsts_hover "fixtures/hover.wks" 14 0 "fixtures/hover_--label.rpc.json"
}

@test "hover over --active returns documentation" {
    lsts_hover "fixtures/hover.wks" 15 0 "fixtures/hover_--active.rpc.json"
}

@test "hover over --align returns documentation" {
    lsts_hover "fixtures/hover.wks" 16 0 "fixtures/hover_--align.rpc.json"
}

@test "hover over --offset returns documentation" {
    lsts_hover "fixtures/hover.wks" 17 0 "fixtures/hover_--offset.rpc.json"
}

@test "hover over --no-table returns documentation" {
    lsts_hover "fixtures/hover.wks" 18 0 "fixtures/hover_--no-table.rpc.json"
}

@test "hover over --exclude-path returns documentation" {
    lsts_hover "fixtures/hover.wks" 19 0 "fixtures/hover_--exclude-path.rpc.json"
}

@test "hover over --extra-filesystem-space returns documentation" {
    lsts_hover "fixtures/hover.wks" 20 0 "fixtures/hover_--extra-filesystem-space.rpc.json"
}

@test "hover over --extra-partition-space returns documentation" {
    lsts_hover "fixtures/hover.wks" 21 0 "fixtures/hover_--extra-partition-space.rpc.json"
}

@test "hover over --overhead-factor returns documentation" {
    lsts_hover "fixtures/hover.wks" 22 0 "fixtures/hover_--overhead-factor.rpc.json"
}

@test "hover over --part-name returns documentation" {
    lsts_hover "fixtures/hover.wks" 23 0 "fixtures/hover_--part-name.rpc.json"
}

@test "hover over --part-type returns documentation" {
    lsts_hover "fixtures/hover.wks" 24 0 "fixtures/hover_--part-type.rpc.json"
}

@test "hover over --use-uuid returns documentation" {
    lsts_hover "fixtures/hover.wks" 25 0 "fixtures/hover_--use-uuid.rpc.json"
}

@test "hover over --uuid returns documentation" {
    lsts_hover "fixtures/hover.wks" 26 0 "fixtures/hover_--uuid.rpc.json"
}

@test "hover over --fsuuid returns documentation" {
    lsts_hover "fixtures/hover.wks" 27 0 "fixtures/hover_--fsuuid.rpc.json"
}

@test "hover over --system-id returns documentation" {
    lsts_hover "fixtures/hover.wks" 28 0 "fixtures/hover_--system-id.rpc.json"
}

@test "hover over --mkfs-extraopts returns documentation" {
    lsts_hover "fixtures/hover.wks" 29 0 "fixtures/hover_--mkfs-extraopts.rpc.json"
}
