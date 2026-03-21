" Vim syntax file for OpenEmbedded Wic Kickstart (.wks) files

if exists("b:current_syntax")
    finish
endif

" Comments
syntax match wksComment /#.*/
highlight link wksComment Comment

" Directives
syntax keyword wksDirective part bootloader include
highlight link wksDirective Statement

" Boolean flags (no value)
syntax match wksBoolFlag /--\(active\|use-uuid\|rootfs\|no-table\)\>/
highlight link wksBoolFlag Special

" Long options that take a value
syntax match wksOption /--\(source\|sourceparams\|ondisk\|fstype\|label\|align\|size\|ptable\|timeout\|append\|configfile\|fsuuid\|part-name\|rootfs-dir\)\>/
highlight link wksOption Identifier

" Quoted strings
syntax region wksString start=/"/ end=/"/ contains=wksVar
highlight link wksString String

" Variable substitutions inside strings e.g. ${KERNEL_CONSOLE}
syntax match wksVar /\${[A-Z_][A-Z0-9_]*}/ contained
highlight link wksVar PreProc

" Unquoted = values (e.g. --fstype=ext4)
syntax match wksValue /=\zs[^ \t"]\+/
highlight link wksValue String

" Mount points: /, /boot, /opt/...
syntax match wksMountPoint /\s\zs\/[^ \t]*/
highlight link wksMountPoint Number

" Disk identifiers: sda, sdb, nvme0n1, mmcblk0, cd
syntax match wksDisk /\<\(sda\|sdb\|sdc\|nvme[0-9]n[0-9]\|mmcblk[0-9]\|cd\)\>/
highlight link wksDisk Number

let b:current_syntax = "wks"
