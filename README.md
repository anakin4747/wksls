# wksls

> **LLM TDD Project** — This entire application is built using Test-Driven
> Development to guide LLMs through the implementation. Tests written with
> [lsts](https://github.com/anakin4747/lsts) define the expected behaviour
> first; the LLM is then directed to make them pass.

A Language Server Protocol (LSP) server for OpenEmbedded/Yocto
[Wic Kickstart](https://docs.yoctoproject.org/ref-manual/kickstart.html)
(`.wks`) files.

## Dependencies

- `bash` 4.0+
- `jq`

## Installation

### Nix (recommended)

Install directly from the flake into your profile:

```sh
nix profile install github:anakin4747/wksls
```

### Manual

Requires `bash` and `jq` to be on your `PATH`.

```sh
make install-manual          # installs to /usr/local/bin
# or with a custom prefix:
make install-manual PREFIX=~/.local
```

To uninstall:

```sh
make uninstall-manual
# or:
make uninstall-manual PREFIX=~/.local
```

## Editor configuration

### Neovim

Requires Neovim 0.11+ (native LSP client with `vim.lsp.config`).

Add the following to your `init.lua`:

```lua
vim.lsp.config('wksls', {
    cmd = { 'wksls' },
    filetypes = { 'wks' },
    root_markers = { '.git' },
})

vim.lsp.enable('wksls')
```

### VS Code / VSCodium

The extension lives in the `vscode-wksls/` directory and must be installed
separately from the language server.

**VSCodium:**

```sh
make install-vscode-ext
```

**VS Code:**

```sh
mkdir -p ~/.vscode/extensions/wksls-0.0.1
cp -r vscode-wksls/. ~/.vscode/extensions/wksls-0.0.1
```

Or package and install a `.vsix`:

```sh
cd vscode-wksls
npx @vscode/vsce package --allow-missing-publisher
codium --install-extension wksls-0.0.1.vsix
```

The extension expects `wksls` to be on your `PATH`. Install the language
server first using one of the methods above.

## License

GPL-2.0-only. See [LICENSE](LICENSE).

