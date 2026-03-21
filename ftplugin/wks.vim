" Vim filetype plugin for OpenEmbedded Wic Kickstart (.wks) files
if exists("b:did_ftplugin")
    finish
endif
let b:did_ftplugin = 1

let s:cpo_save = &cpo
set cpo&vim

" Comments start with #
setlocal commentstring=#\ %s

" Words include hyphens so that --flag-name moves as one word
setlocal iskeyword+=-

" No automatic line wrapping; .wks lines can be long
setlocal textwidth=0

" Disable automatic comment continuation; reset first so we know the baseline
setlocal formatoptions& formatoptions-=cro

" Restore filetype effects when :setfiletype is used to switch away
let b:undo_ftplugin = "setlocal commentstring< iskeyword< textwidth< formatoptions<"

let &cpo = s:cpo_save
unlet s:cpo_save
