
vim.lsp.config('wksls', {
    cmd = { 'wksls' },
    filetypes = { 'wks' },
    root_markers = { '.git' },
})

vim.lsp.enable('wksls')
