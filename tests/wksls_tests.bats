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

@test "initialize advertises full textDocumentSync change" {
    lsts_initialize
    echo "$LSTS_RESPONSE" | jq -e '.result.capabilities.textDocumentSync.change == 1'
}

@test "hover reflects didChange content" {
    lsts_initialize

    local uri="file://$LSTS_ROOT/fixtures/hover.wks"

    lsts_open "fixtures/hover.wks"

    # Replace the full text with --ptable via didChange.
    lsts_notify "textDocument/didChange" \
        "{\"textDocument\":{\"uri\":\"${uri}\",\"version\":2},\"contentChanges\":[{\"text\":\"--ptable\"}]}"

    lsts_request "textDocument/hover" \
        "{\"textDocument\":{\"uri\":\"${uri}\"},\"position\":{\"line\":0,\"character\":0}}"
    lsts_recv_response

    diff <(echo "$LSTS_RESPONSE") "fixtures/hover_--ptable.rpc.json"
}

@test "hover over bootloader returns documentation" {
    lsts_hover \
        "openembedded-core/meta/recipes-core/ovmf/ovmf-shell-image/ovmf-shell-image.wks" 3 0 \
        "fixtures/hover_bootloader.rpc.json"
}

@test "hover over part returns documentation" {
    lsts_hover \
        "openembedded-core/meta/recipes-core/ovmf/ovmf-shell-image/ovmf-shell-image.wks" 2 0 \
        "fixtures/hover_part.rpc.json"
}

@test "hover over partition returns documentation" {
    lsts_hover "fixtures/hover.wks" 0 0 "fixtures/hover_part.rpc.json"
}

@test "hover over --source returns documentation" {
    lsts_hover \
        "openembedded-core/meta/recipes-core/ovmf/ovmf-shell-image/ovmf-shell-image.wks" 2 7 \
        "fixtures/hover_--source.rpc.json"
}

@test "hover over --ondisk returns documentation" {
    lsts_hover \
        "openembedded-core/meta/recipes-core/ovmf/ovmf-shell-image/ovmf-shell-image.wks" 2 23 \
        "fixtures/hover_--ondisk.rpc.json"
}

@test "hover over --fstype returns documentation" {
    lsts_hover \
        "openembedded-core/meta/recipes-core/ovmf/ovmf-shell-image/ovmf-shell-image.wks" 2 36 \
        "fixtures/hover_--fstype.rpc.json"
}

@test "hover over --align returns documentation" {
    lsts_hover \
        "openembedded-core/meta/recipes-core/ovmf/ovmf-shell-image/ovmf-shell-image.wks" 2 50 \
        "fixtures/hover_--align.rpc.json"
}

@test "hover over --ptable returns documentation" {
    lsts_hover \
        "openembedded-core/meta/recipes-core/ovmf/ovmf-shell-image/ovmf-shell-image.wks" 3 11 \
        "fixtures/hover_--ptable.rpc.json"
}

@test "hover over --timeout returns documentation" {
    lsts_hover \
        "openembedded-core/meta/recipes-core/ovmf/ovmf-shell-image/ovmf-shell-image.wks" 3 24 \
        "fixtures/hover_--timeout.rpc.json"
}

@test "hover over --configfile returns documentation" {
    lsts_hover \
        "openembedded-core/scripts/lib/wic/canned-wks/directdisk-bootloader-config.wks" 6 11 \
        "fixtures/hover_--configfile.rpc.json"
}

@test "hover over --append returns documentation" {
    lsts_hover \
        "openembedded-core/meta-selftest/recipes-test/images/wic-image-minimal.wks" 9 37 \
        "fixtures/hover_--append.rpc.json"
}

@test "hover over --size returns documentation" {
    lsts_hover \
        "openembedded-core/meta-selftest/wic/overlayfs_etc.wks.in" 2 32 \
        "fixtures/hover_--size.rpc.json"
}

@test "hover over --sourceparams returns documentation" {
    lsts_hover \
        "openembedded-core/meta-selftest/wic/overlayfs_etc.wks.in" 0 62 \
        "fixtures/hover_--sourceparams.rpc.json"
}

@test "hover over --label returns documentation" {
    lsts_hover \
        "openembedded-core/meta-selftest/recipes-test/images/wic-image-minimal.wks" 4 48 \
        "fixtures/hover_--label.rpc.json"
}

@test "hover over --active returns documentation" {
    lsts_hover \
        "openembedded-core/meta-selftest/recipes-test/images/wic-image-minimal.wks" 4 61 \
        "fixtures/hover_--active.rpc.json"
}

@test "hover over --use-uuid returns documentation" {
    lsts_hover \
        "openembedded-core/meta-selftest/recipes-test/images/wic-image-minimal.wks" 5 80 \
        "fixtures/hover_--use-uuid.rpc.json"
}

@test "hover over --fsuuid returns documentation" {
    lsts_hover \
        "openembedded-core/meta-selftest/recipes-test/images/wic-image-minimal.wks" 6 128 \
        "fixtures/hover_--fsuuid.rpc.json"
}

@test "hover over --rootfs-dir returns documentation" {
    lsts_hover \
        "openembedded-core/meta-selftest/recipes-test/images/wic-image-minimal.wks" 6 28 \
        "fixtures/hover_--rootfs-dir.rpc.json"
}

@test "hover over --part-name returns documentation" {
    lsts_hover \
        "openembedded-core/meta-selftest/wic/test_gpt_partition_name.wks" 2 19 \
        "fixtures/hover_--part-name.rpc.json"
}

@test "hover over --overhead-factor returns documentation" {
    lsts_hover \
        "openembedded-core/scripts/lib/wic/canned-wks/efi-bootdisk.wks.in" 1 121 \
        "fixtures/hover_--overhead-factor.rpc.json"
}

@test "hover over --exclude-path returns documentation" {
    lsts_hover \
        "openembedded-core/scripts/lib/wic/canned-wks/efi-bootdisk.wks.in" 2 63 \
        "fixtures/hover_--exclude-path.rpc.json"
}

@test "hover over --part-type returns documentation" {
    lsts_hover \
        "openembedded-core/scripts/lib/wic/canned-wks/efi-uki-bootdisk.wks.in" 1 136 \
        "fixtures/hover_--part-type.rpc.json"
}

@test "hover over --fixed-size returns documentation" {
    lsts_hover "fixtures/hover.wks" 1 0 "fixtures/hover_--fixed-size.rpc.json"
}

@test "hover over --ondrive returns documentation" {
    lsts_hover "fixtures/hover.wks" 2 0 "fixtures/hover_--ondrive.rpc.json"
}

@test "hover over --fsoptions returns documentation" {
    lsts_hover "fixtures/hover.wks" 3 0 "fixtures/hover_--fsoptions.rpc.json"
}

@test "hover over --offset returns documentation" {
    lsts_hover "fixtures/hover.wks" 4 0 "fixtures/hover_--offset.rpc.json"
}

@test "hover over --no-table returns documentation" {
    lsts_hover "fixtures/hover.wks" 5 0 "fixtures/hover_--no-table.rpc.json"
}

@test "hover over --extra-filesystem-space returns documentation" {
    lsts_hover "fixtures/hover.wks" 6 0 "fixtures/hover_--extra-filesystem-space.rpc.json"
}

@test "hover over --extra-partition-space returns documentation" {
    lsts_hover "fixtures/hover.wks" 7 0 "fixtures/hover_--extra-partition-space.rpc.json"
}

@test "hover over --uuid returns documentation" {
    lsts_hover "fixtures/hover.wks" 8 0 "fixtures/hover_--uuid.rpc.json"
}

@test "hover over --system-id returns documentation" {
    lsts_hover "fixtures/hover.wks" 9 0 "fixtures/hover_--system-id.rpc.json"
}

@test "hover over --mkfs-extraopts returns documentation" {
    lsts_hover "fixtures/hover.wks" 10 0 "fixtures/hover_--mkfs-extraopts.rpc.json"
}

@test "hover over --rootfs returns documentation" {
    lsts_hover "fixtures/hover.wks" 11 0 "fixtures/hover_--rootfs.rpc.json"
}

@test "hover works when tokens are tab-separated" {
    lsts_hover "fixtures/hover_tabs.wks" 0 11 "fixtures/hover_--ptable.rpc.json"
}

@test "completion at line start returns only keywords" {
    lsts_completion "fixtures/completion_context.wks" 1 0 \
        "fixtures/completion_keywords.rpc.json"
}

@test "completion mid-line returns only flags" {
    lsts_completion "fixtures/completion_context.wks" 0 7 \
        "fixtures/completion_flags.rpc.json"
}

@test "completion after --fstype= returns fstype values" {
    lsts_completion "fixtures/completion.wks" 0 10 \
        "fixtures/completion_--fstype.rpc.json"
}

@test "completion after --ptable= returns ptable values" {
    lsts_completion "fixtures/completion.wks" 1 10 \
        "fixtures/completion_--ptable.rpc.json"
}

@test "completion after --fstype= with no value typed returns fstype values" {
    lsts_completion "fixtures/completion_empty_value.wks" 0 32 \
        "fixtures/completion_--fstype.rpc.json"
}

@test "completion after --ptable= with no value typed returns ptable values" {
    lsts_completion "fixtures/completion_empty_value.wks" 1 20 \
        "fixtures/completion_--ptable.rpc.json"
}

@test "completion at char 0 on non-empty line returns only keywords" {
    lsts_completion \
        "openembedded-core/scripts/lib/wic/canned-wks/efi-bootdisk.wks.in" 0 0 \
        "fixtures/completion_keywords.rpc.json"
}

@test "completion after space-separated --ptable returns ptable values" {
    lsts_completion \
        "openembedded-core/scripts/lib/wic/canned-wks/efi-bootdisk.wks.in" 0 19 \
        "fixtures/completion_--ptable.rpc.json"
}

@test "completion after space-separated --source returns source plugin values" {
    lsts_completion \
        "openembedded-core/scripts/lib/wic/canned-wks/efi-bootdisk.wks.in" 1 20 \
        "fixtures/completion_--source.rpc.json"
}

@test "initialize advertises definitionProvider" {
    lsts_initialize
    echo "$LSTS_RESPONSE" | jq -e '.result.capabilities.definitionProvider == true'
}

@test "definition on --source value finds plugin source file" {
    lsts_definition "openembedded-core/scripts/lib/wic/canned-wks/efi-bootdisk.wks.in" 1 20 \
        "fixtures/definition_rootfs.rpc.json"
}

@test "definition on non-source token returns null" {
    lsts_definition \
        "openembedded-core/scripts/lib/wic/canned-wks/efi-bootdisk.wks.in" 0 0 \
        "fixtures/definition_null.rpc.json"
}

@test "fails to start when jq is not installed" {
    local bash_dir wksls_src
    bash_dir="$(dirname "$(command -v bash)")"
    wksls_src="$(dirname "$BATS_TEST_FILENAME")/../wksls"
    run env -i PATH="$bash_dir" bash "$wksls_src"
    [[ "$status" -ne 0 ]]
}

@test "prints error to stderr when jq is not installed" {
    local bash_dir wksls_src
    bash_dir="$(dirname "$(command -v bash)")"
    wksls_src="$(dirname "$BATS_TEST_FILENAME")/../wksls"
    run env -i PATH="$bash_dir" bash "$wksls_src"
    [[ "$output" == *"jq"* ]]
}
