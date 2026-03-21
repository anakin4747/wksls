-- Neovim syntax file for OpenEmbedded Wic Kickstart (.wks) files
-- Gruvbox colour assignments:
--   GruvboxYellow  directives (part, bootloader, include)
--   GruvboxBlue    long options (--flag)
--   GruvboxGreen   quoted strings and = values
--   GruvboxOrange  mount points and disk identifiers
--   GruvboxRed     boolean flags (--active, --use-uuid, --rootfs)
--   GruvboxGray    comments
--
-- if vim.b.current_syntax then
--     return
-- end

vim.cmd([[
    " Comments
    syntax match wksComment /#.*/

    " Directives
    syntax keyword wksDirective part bootloader include

    " Boolean flags (no value)
    syntax match wksBoolFlag /--\(active\|use-uuid\|rootfs\|no-table\)\>/

    " Long options that take a value
    syntax match wksOption /--\(source\|sourceparams\|ondisk\|fstype\|label\|align\|size\|ptable\|timeout\|append\|configfile\|fsuuid\|part-name\|rootfs-dir\)\>/

    " Quoted strings
    syntax region wksString start=/"/ end=/"/ contains=wksVar

    " Variable substitutions inside strings e.g. ${KERNEL_CONSOLE}
    syntax match wksVar /\${[A-Z_][A-Z0-9_]*}/ contained

    " Unquoted = values (e.g. --fstype=ext4)
    syntax match wksValue /=\zs[^ \t"]\+/

    " Mount points: /, /boot, /opt/...
    syntax match wksMountPoint /\s\zs\/[^ \t]*/

    " Disk identifiers: sda, sdb, nvme0n1, mmcblk0, cd
    syntax match wksDisk /\<\(sda\|sdb\|sdc\|nvme[0-9]n[0-9]\|mmcblk[0-9]\|cd\)\>/

    highlight link wksComment    Comment
    highlight link wksDirective  Statement
    highlight link wksBoolFlag   Special
    highlight link wksOption     Identifier
    highlight link wksString     String
    highlight link wksVar        PreProc
    highlight link wksValue      String
    highlight link wksMountPoint Number
    highlight link wksDisk       Number
]])

vim.b.current_syntax = "wks"

vim.api.nvim_create_augroup("wks_filetype", { clear = true })
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    group   = "wks_filetype",
    pattern = { "*.wks", "*.wks.inc?" },
    callback = function()
        vim.bo.filetype = "wks"
    end,
})
