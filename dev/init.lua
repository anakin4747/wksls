-- Minimal neovim config for testing wksls from the repo root.
-- Launch via: make dev

vim.filetype.add({ extension = { wks = "wks" } })

vim.lsp.config("wksls", {
    cmd = { vim.fn.getcwd() .. "/wksls" },
    filetypes = { "wks" },
    root_markers = { ".git" },
})

vim.lsp.enable("wksls")
