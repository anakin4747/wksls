" Vim syntax file for OpenEmbedded Wic Kickstart (.wks) files

if exists("b:current_syntax")
    finish
endif

" Comments
syntax match wksComment /#.*/
highlight link wksComment Comment

" Directives ('partition' is a valid alias for 'part')
syntax keyword wksDirective part partition bootloader include
highlight link wksDirective Statement

" Boolean flags (no value)
syntax match wksBoolFlag /--\(active\|use-uuid\|no-table\)\>/
highlight link wksBoolFlag Special

" Long options that take a value
syntax match wksOption /--\(source\|sourceparams\|ondisk\|ondrive\|fstype\|fsoptions\|label\|align\|size\|fixed-size\|offset\|exclude-path\|extra-filesystem-space\|extra-partition-space\|overhead-factor\|part-name\|part-type\|uuid\|fsuuid\|system-id\|mkfs-extraopts\|rootfs-dir\|rootfs\|ptable\|timeout\|append\|configfile\)\>/
highlight link wksOption Identifier

" Quoted strings
syntax region wksString start=/"/ end=/"/ contains=wksVar
highlight link wksString String

" Variable substitutions: ${VAR_NAME} — inside strings and unquoted
syntax match wksVar /\${[A-Za-z_][A-Za-z0-9_]*}/
highlight link wksVar PreProc

" Unquoted = values (e.g. --fstype=ext4)
syntax match wksValue /=\zs[^ \t"]\+/
highlight link wksValue String

" Mount points: /, /boot, /opt/...
syntax match wksMountPoint /\s\zs\/[^ \t=]*/
highlight link wksMountPoint Number

" Disk identifiers: sda–sdz, nvme<N>n<N>, mmcblk<N>
syntax match wksDisk /\<\(sd[a-z]\+\|nvme[0-9]\+n[0-9]\+\|mmcblk[0-9]\+\)\>/
highlight link wksDisk Number

let b:current_syntax = "wks"
