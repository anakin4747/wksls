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

@test "hover over bootloader returns documentation" {
    lsts_hover \
        "openembedded-core/meta/recipes-core/ovmf/ovmf-shell-image/ovmf-shell-image.wks:4:1" \
        "fixtures/hover_bootloader.rpc.json"
}

@test "hover over part returns documentation" {
    lsts_hover \
        "openembedded-core/meta/recipes-core/ovmf/ovmf-shell-image/ovmf-shell-image.wks:3:1" \
        "fixtures/hover_part.rpc.json"
}

@test "hover over partition returns documentation" {
    lsts_hover \
        "fixtures/hover.wks:1:1" \
        "fixtures/hover_part.rpc.json"
}

@test "hover over --source returns documentation" {
    lsts_hover \
        "openembedded-core/meta/recipes-core/ovmf/ovmf-shell-image/ovmf-shell-image.wks:3:8" \
        "fixtures/hover_--source.rpc.json"
}

@test "hover over --ondisk returns documentation" {
    lsts_hover \
        "openembedded-core/meta/recipes-core/ovmf/ovmf-shell-image/ovmf-shell-image.wks:3:24" \
        "fixtures/hover_--ondisk.rpc.json"
}

@test "hover over --fstype returns documentation" {
    lsts_hover \
        "openembedded-core/meta/recipes-core/ovmf/ovmf-shell-image/ovmf-shell-image.wks:3:37" \
        "fixtures/hover_--fstype.rpc.json"
}

@test "hover over --align returns documentation" {
    lsts_hover \
        "openembedded-core/meta/recipes-core/ovmf/ovmf-shell-image/ovmf-shell-image.wks:3:51" \
        "fixtures/hover_--align.rpc.json"
}

@test "hover over --ptable returns documentation" {
    lsts_hover \
        "openembedded-core/meta/recipes-core/ovmf/ovmf-shell-image/ovmf-shell-image.wks:4:12" \
        "fixtures/hover_--ptable.rpc.json"
}

@test "hover over --timeout returns documentation" {
    lsts_hover \
        "openembedded-core/meta/recipes-core/ovmf/ovmf-shell-image/ovmf-shell-image.wks:4:25" \
        "fixtures/hover_--timeout.rpc.json"
}

@test "hover over --configfile returns documentation" {
    lsts_hover \
        "openembedded-core/scripts/lib/wic/canned-wks/directdisk-bootloader-config.wks:7:12" \
        "fixtures/hover_--configfile.rpc.json"
}

@test "hover over --append returns documentation" {
    lsts_hover \
        "openembedded-core/meta-selftest/recipes-test/images/wic-image-minimal.wks:10:38" \
        "fixtures/hover_--append.rpc.json"
}

@test "hover over --size returns documentation" {
    lsts_hover \
        "openembedded-core/meta-selftest/wic/overlayfs_etc.wks.in:3:33" \
        "fixtures/hover_--size.rpc.json"
}

@test "hover over --sourceparams returns documentation" {
    lsts_hover \
        "openembedded-core/meta-selftest/wic/overlayfs_etc.wks.in:1:63" \
        "fixtures/hover_--sourceparams.rpc.json"
}

@test "hover over --label returns documentation" {
    lsts_hover \
        "openembedded-core/meta-selftest/recipes-test/images/wic-image-minimal.wks:5:49" \
        "fixtures/hover_--label.rpc.json"
}

@test "hover over --active returns documentation" {
    lsts_hover \
        "openembedded-core/meta-selftest/recipes-test/images/wic-image-minimal.wks:5:62" \
        "fixtures/hover_--active.rpc.json"
}

@test "hover over --use-uuid returns documentation" {
    lsts_hover \
        "openembedded-core/meta-selftest/recipes-test/images/wic-image-minimal.wks:6:81" \
        "fixtures/hover_--use-uuid.rpc.json"
}

@test "hover over --fsuuid returns documentation" {
    lsts_hover \
        "openembedded-core/meta-selftest/recipes-test/images/wic-image-minimal.wks:7:129" \
        "fixtures/hover_--fsuuid.rpc.json"
}

@test "hover over --rootfs-dir returns documentation" {
    lsts_hover \
        "openembedded-core/meta-selftest/recipes-test/images/wic-image-minimal.wks:7:29" \
        "fixtures/hover_--rootfs-dir.rpc.json"
}

@test "hover over --part-name returns documentation" {
    lsts_hover \
        "openembedded-core/meta-selftest/wic/test_gpt_partition_name.wks:3:20" \
        "fixtures/hover_--part-name.rpc.json"
}

@test "hover over --overhead-factor returns documentation" {
    lsts_hover \
        "openembedded-core/scripts/lib/wic/canned-wks/efi-bootdisk.wks.in:2:122" \
        "fixtures/hover_--overhead-factor.rpc.json"
}

@test "hover over --exclude-path returns documentation" {
    lsts_hover \
        "openembedded-core/scripts/lib/wic/canned-wks/efi-bootdisk.wks.in:3:64" \
        "fixtures/hover_--exclude-path.rpc.json"
}

@test "hover over --part-type returns documentation" {
    lsts_hover \
        "openembedded-core/scripts/lib/wic/canned-wks/efi-uki-bootdisk.wks.in:2:137" \
        "fixtures/hover_--part-type.rpc.json"
}

@test "hover over --fixed-size returns documentation" {
    lsts_hover \
        "fixtures/hover.wks:2:1" \
        "fixtures/hover_--fixed-size.rpc.json"
}

@test "hover over --ondrive returns documentation" {
    lsts_hover \
        "fixtures/hover.wks:3:1" \
        "fixtures/hover_--ondrive.rpc.json"
}

@test "hover over --fsoptions returns documentation" {
    lsts_hover \
        "fixtures/hover.wks:4:1" \
        "fixtures/hover_--fsoptions.rpc.json"
}

@test "hover over --offset returns documentation" {
    lsts_hover \
        "fixtures/hover.wks:5:1" \
        "fixtures/hover_--offset.rpc.json"
}

@test "hover over --no-table returns documentation" {
    lsts_hover \
        "fixtures/hover.wks:6:1" \
        "fixtures/hover_--no-table.rpc.json"
}

@test "hover over --extra-filesystem-space returns documentation" {
    lsts_hover \
        "fixtures/hover.wks:7:1" \
        "fixtures/hover_--extra-filesystem-space.rpc.json"
}

@test "hover over --extra-partition-space returns documentation" {
    lsts_hover \
        "fixtures/hover.wks:8:1" \
        "fixtures/hover_--extra-partition-space.rpc.json"
}

@test "hover over --uuid returns documentation" {
    lsts_hover \
        "fixtures/hover.wks:9:1" \
        "fixtures/hover_--uuid.rpc.json"
}

@test "hover over --system-id returns documentation" {
    lsts_hover \
        "fixtures/hover.wks:10:1" \
        "fixtures/hover_--system-id.rpc.json"
}

@test "hover over --mkfs-extraopts returns documentation" {
    lsts_hover \
        "fixtures/hover.wks:11:1" \
        "fixtures/hover_--mkfs-extraopts.rpc.json"
}

@test "hover over --rootfs returns documentation" {
    lsts_hover \
        "fixtures/hover.wks:12:1" \
        "fixtures/hover_--rootfs.rpc.json"
}

@test "hover works when tokens are tab-separated" {
    lsts_hover \
        "fixtures/hover_tabs.wks:1:12" \
        "fixtures/hover_--ptable.rpc.json"
}

@test "hover over --source rootfs value returns plugin documentation" {
    lsts_hover \
        "fixtures/hover_source_plugins.wks:1:17" \
        "fixtures/hover_source_rootfs.rpc.json"
}

@test "hover over --source bootimg_efi value returns plugin documentation" {
    lsts_hover \
        "fixtures/hover_source_plugins.wks:2:17" \
        "fixtures/hover_source_bootimg_efi.rpc.json"
}

@test "hover over --source bootimg_partition value returns plugin documentation" {
    lsts_hover \
        "fixtures/hover_source_plugins.wks:3:17" \
        "fixtures/hover_source_bootimg_partition.rpc.json"
}

@test "hover over --source bootimg_pcbios value returns plugin documentation" {
    lsts_hover \
        "fixtures/hover_source_plugins.wks:4:17" \
        "fixtures/hover_source_bootimg_pcbios.rpc.json"
}

@test "hover over --source bootimg_biosplusefi value returns plugin documentation" {
    lsts_hover \
        "fixtures/hover_source_plugins.wks:5:17" \
        "fixtures/hover_source_bootimg_biosplusefi.rpc.json"
}

@test "hover over --source empty value returns plugin documentation" {
    lsts_hover \
        "fixtures/hover_source_plugins.wks:6:17" \
        "fixtures/hover_source_empty.rpc.json"
}

@test "hover over --source extra_partition value returns plugin documentation" {
    lsts_hover \
        "fixtures/hover_source_plugins.wks:7:17" \
        "fixtures/hover_source_extra_partition.rpc.json"
}

@test "hover over --source isoimage_isohybrid value returns plugin documentation" {
    lsts_hover \
        "fixtures/hover_source_plugins.wks:8:17" \
        "fixtures/hover_source_isoimage_isohybrid.rpc.json"
}

@test "hover over --source rawcopy value returns plugin documentation" {
    lsts_hover \
        "fixtures/hover_source_plugins.wks:9:17" \
        "fixtures/hover_source_rawcopy.rpc.json"
}

@test "completion at line start returns only keywords" {
    lsts_completion \
        "fixtures/completion_context.wks:2:1" \
        "fixtures/completion_keywords.rpc.json"
}

@test "completion mid-line returns only flags" {
    lsts_completion \
        "fixtures/completion_context.wks:1:8" \
        "fixtures/completion_part_flags.rpc.json"
}

@test "completion after --fstype= returns fstype values" {
    lsts_completion \
        "fixtures/completion.wks:1:11" \
        "fixtures/completion_--fstype.rpc.json"
}

@test "completion after --ptable= returns ptable values" {
    lsts_completion \
        "fixtures/completion.wks:2:11" \
        "fixtures/completion_--ptable.rpc.json"
}

@test "completion after --fstype= with no value typed returns fstype values" {
    lsts_completion \
        "fixtures/completion_empty_value.wks:1:33" \
        "fixtures/completion_--fstype.rpc.json"
}

@test "completion after --ptable= with no value typed returns ptable values" {
    lsts_completion \
        "fixtures/completion_empty_value.wks:2:21" \
        "fixtures/completion_--ptable.rpc.json"
}

@test "completion at char 0 on non-empty line returns only keywords" {
    lsts_completion \
        "openembedded-core/scripts/lib/wic/canned-wks/efi-bootdisk.wks.in:1:1" \
        "fixtures/completion_keywords.rpc.json"
}

@test "completion after space-separated --ptable returns ptable values" {
    lsts_completion \
        "openembedded-core/scripts/lib/wic/canned-wks/efi-bootdisk.wks.in:1:20" \
        "fixtures/completion_--ptable.rpc.json"
}

@test "completion after space-separated --source returns source plugin values" {
    lsts_completion \
        "openembedded-core/scripts/lib/wic/canned-wks/efi-bootdisk.wks.in:2:21" \
        "fixtures/completion_--source.rpc.json"
}

@test "completion mid-line on bootloader line returns only bootloader flags" {
    lsts_completion \
        "openembedded-core/scripts/lib/wic/canned-wks/efi-bootdisk.wks.in:1:12" \
        "fixtures/completion_bootloader_flags.rpc.json"
}

@test "completion mid-line on part line returns only part flags" {
    lsts_completion \
        "openembedded-core/scripts/lib/wic/canned-wks/efi-bootdisk.wks.in:2:12" \
        "fixtures/completion_part_flags.rpc.json"
}

@test "completion with partial keyword prefix returns only keywords" {
    lsts_completion \
        "fixtures/completion_partial_keyword.wks:1:3" \
        "fixtures/completion_keywords.rpc.json"
}

@test "initialize advertises definitionProvider" {
    lsts_initialize
    echo "$LSTS_RESPONSE" | jq -e '.result.capabilities.definitionProvider == true'
}

@test "definition on --source value finds plugin source file" {
    lsts_definition \
        "openembedded-core/scripts/lib/wic/canned-wks/efi-bootdisk.wks.in:2:21" \
        "fixtures/definition_rootfs.rpc.json"
}

@test "definition on non-source token returns null" {
    lsts_definition \
        "openembedded-core/scripts/lib/wic/canned-wks/efi-bootdisk.wks.in:1:1" \
        "fixtures/definition_null.rpc.json"
}

@test "definition on --source bootimg_efi finds plugin source file" {
    lsts_definition \
        "openembedded-core/scripts/lib/wic/canned-wks/mkefidisk.wks:5:26" \
        "fixtures/definition_bootimg_efi.rpc.json"
}

@test "definition on --source bootimg_partition finds plugin source file" {
    lsts_definition \
        "openembedded-core/scripts/lib/wic/canned-wks/sdimage-bootpart.wks:5:29" \
        "fixtures/definition_bootimg_partition.rpc.json"
}

@test "definition on --source bootimg_pcbios finds plugin source file" {
    lsts_definition \
        "openembedded-core/scripts/lib/wic/canned-wks/directdisk-gpt.wks:6:28" \
        "fixtures/definition_bootimg_pcbios.rpc.json"
}

@test "definition on --source isoimage_isohybrid finds plugin source file" {
    lsts_definition \
        "openembedded-core/scripts/lib/wic/canned-wks/mkhybridiso.wks:5:30" \
        "fixtures/definition_isoimage_isohybrid.rpc.json"
}

@test "definition on --source bootimg_biosplusefi finds plugin source file" {
    lsts_definition \
        "oe-fixture/scripts/lib/wic/canned-wks/wksls-biosplusefi.wks:1:30" \
        "fixtures/definition_bootimg_biosplusefi.rpc.json"
}

@test "definition on --source empty finds plugin source file" {
    lsts_definition \
        "oe-fixture/scripts/lib/wic/canned-wks/wksls-empty.wks:1:19" \
        "fixtures/definition_empty.rpc.json"
}

@test "definition on --source extra_partition finds plugin source file" {
    lsts_definition \
        "oe-fixture/scripts/lib/wic/canned-wks/wksls-extra-partition.wks:1:24" \
        "fixtures/definition_extra_partition.rpc.json"
}

@test "definition on --source rawcopy finds plugin source file" {
    lsts_definition \
        "oe-fixture/scripts/lib/wic/canned-wks/wksls-rawcopy.wks:1:20" \
        "fixtures/definition_rawcopy.rpc.json"
}

@test "diagnostics on unknown directive reports error" {
    lsts_diagnostics \
        "fixtures/diagnostics_unknown_directive.wks" \
        "fixtures/diagnostics_unknown_directive.rpc.json"
}

@test "diagnostics on unknown flag reports error" {
    lsts_diagnostics \
        "fixtures/diagnostics_unknown_flag.wks" \
        "fixtures/diagnostics_unknown_flag.rpc.json"
}

@test "diagnostics on invalid --fstype value reports error" {
    lsts_diagnostics \
        "fixtures/diagnostics_invalid_fstype.wks" \
        "fixtures/diagnostics_invalid_fstype.rpc.json"
}

@test "diagnostics on invalid --ptable value reports error" {
    lsts_diagnostics \
        "fixtures/diagnostics_invalid_ptable.wks" \
        "fixtures/diagnostics_invalid_ptable.rpc.json"
}

@test "diagnostics on invalid --fstype space-separated value reports error" {
    lsts_diagnostics \
        "fixtures/diagnostics_invalid_fstype_space.wks" \
        "fixtures/diagnostics_invalid_fstype_space.rpc.json"
}

@test "diagnostics on invalid --ptable space-separated value reports error" {
    lsts_diagnostics \
        "fixtures/diagnostics_invalid_ptable_space.wks" \
        "fixtures/diagnostics_invalid_ptable_space.rpc.json"
}

@test "diagnostics on --size and --fixed-size together reports error" {
    lsts_diagnostics \
        "fixtures/diagnostics_size_and_fixed_size.wks" \
        "fixtures/diagnostics_size_and_fixed_size.rpc.json"
}

@test "diagnostics on --overhead-factor with --fixed-size reports error" {
    lsts_diagnostics \
        "fixtures/diagnostics_fixed_size_overhead.wks" \
        "fixtures/diagnostics_fixed_size_overhead.rpc.json"
}

@test "diagnostics on --extra-filesystem-space with --fixed-size reports error" {
    lsts_diagnostics \
        "fixtures/diagnostics_fixed_size_extra_space.wks" \
        "fixtures/diagnostics_fixed_size_extra_space.rpc.json"
}

@test "diagnostics on --label with squashfs reports error" {
    lsts_diagnostics \
        "fixtures/diagnostics_squashfs_label.wks" \
        "fixtures/diagnostics_squashfs_label.rpc.json"
}

@test "diagnostics on --fsuuid with squashfs reports error" {
    lsts_diagnostics \
        "fixtures/diagnostics_squashfs_fsuuid.wks" \
        "fixtures/diagnostics_squashfs_fsuuid.rpc.json"
}

@test "diagnostics on --label with erofs reports error" {
    lsts_diagnostics \
        "fixtures/diagnostics_erofs_label.wks" \
        "fixtures/diagnostics_erofs_label.rpc.json"
}

@test "diagnostics on --use-label without --label reports error" {
    lsts_diagnostics \
        "fixtures/diagnostics_use_label_no_label.wks" \
        "fixtures/diagnostics_use_label_no_label.rpc.json"
}

@test "diagnostics on duplicate bootloader directive reports error" {
    lsts_diagnostics \
        "fixtures/diagnostics_duplicate_bootloader.wks" \
        "fixtures/diagnostics_duplicate_bootloader.rpc.json"
}

@test "diagnostics on invalid --size value reports error" {
    lsts_diagnostics \
        "fixtures/diagnostics_bad_size_value.wks" \
        "fixtures/diagnostics_bad_size_value.rpc.json"
}

@test "diagnostics on invalid --align value reports error" {
    lsts_diagnostics \
        "fixtures/diagnostics_bad_align_value.wks" \
        "fixtures/diagnostics_bad_align_value.rpc.json"
}

@test "diagnostics on --overhead-factor below 1.0 reports error" {
    lsts_diagnostics \
        "fixtures/diagnostics_bad_overhead_factor.wks" \
        "fixtures/diagnostics_bad_overhead_factor.rpc.json"
}

@test "diagnostics on out-of-range --system-id reports error" {
    lsts_diagnostics \
        "fixtures/diagnostics_bad_system_id.wks" \
        "fixtures/diagnostics_bad_system_id.rpc.json"
}

@test "diagnostics on --use-uuid with --uuid reports error" {
    lsts_diagnostics \
        "fixtures/diagnostics_use_uuid_with_uuid.wks" \
        "fixtures/diagnostics_use_uuid_with_uuid.rpc.json"
}

@test "diagnostics on --sourceparams without --source reports error" {
    lsts_diagnostics \
        "fixtures/diagnostics_sourceparams_no_source.wks" \
        "fixtures/diagnostics_sourceparams_no_source.rpc.json"
}

@test "diagnostics update on didChange" {
    lsts_initialize
    lsts_open "fixtures/diagnostics_unknown_flag.wks"
    _lsts_recv_notification "textDocument/publishDiagnostics"
    local uri="file://$LSTS_ROOT/fixtures/diagnostics_unknown_flag.wks"
    local new_text
    new_text="$(jq -Rs . <"$LSTS_ROOT/fixtures/diagnostics_unknown_directive.wks")"
    lsts_notify "textDocument/didChange" \
        "{\"textDocument\":{\"uri\":\"${uri}\",\"version\":2},\"contentChanges\":[{\"text\":${new_text}}]}"
    _lsts_recv_notification "textDocument/publishDiagnostics"
    echo "$LSTS_RESPONSE" | jq -e \
        '(.params.diagnostics | length) == 1
        and .params.diagnostics[0].severity == 1
        and (.params.diagnostics[0].message | contains("blah"))'
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
