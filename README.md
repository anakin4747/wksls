# wksls

> **AGENTIC TDD Project** — This entire application is built using Test-Driven
> Development to guide Ai agents through the implementation. Tests written with
> [lsts](https://github.com/anakin4747/lsts) define the expected behaviour
> first; the agent is then directed to make them pass.

A Language Server Protocol (LSP) server for OpenEmbedded/Yocto
[Wic Kickstart](https://docs.yoctoproject.org/ref-manual/kickstart.html)
(`.wks`) files.

This is a project that emphasizes simplicity. The application is a single shell
script called `wksls`. The test suite is a single file called
`tests/wksls_tests.bats`.

## Features

### Hover

Displays documentation for the keyword under the cursor.

<div align="center">
  <p>
    <h4>Neovim Hover</h4>
    <video controls muted src="https://github.com/user-attachments/assets/a65a4b95-05b8-4d44-b263-3399bb00b0f2" alt="Hovering over a WKS keyword in Neovim displays inline documentation from the language server"></video>
  </p>
  <p>
    <h4>VS Code Hover</h4>
    <video controls muted src="https://github.com/user-attachments/assets/fbfaa2ca-6d80-4621-b272-cf031b9c3e3e" alt="Hovering over a WKS keyword in VS Code displays inline documentation from the language server"></video>
  </p>
</div>

### Completion

Provides keyword and argument suggestions.

<div align="center">
  <p>
    <h4>Neovim Completion</h4>
    <video controls muted src="https://github.com/user-attachments/assets/287f1e2c-f238-422e-a9c2-40014f04e7ca" alt="Triggering completion in Neovim shows WKS keyword suggestions provided by the language server"></video>
  </p>
  <p>
    <h4>VS Code Completion</h4>
    <video controls muted src="https://github.com/user-attachments/assets/530bfd3e-10b0-4b2f-9361-663a179df960" alt="Triggering completion in VS Code shows WKS keyword suggestions provided by the language server"></video>
  </p>
</div>

### Diagnostics

Reports syntax and semantic errors inline.

<div align="center">
  <p>
    <h4>Neovim Diagnostics</h4>
    <video controls muted src="https://github.com/user-attachments/assets/f57d95e8-8bd0-474c-b45b-3eb8617f53b7" alt="Neovim displays inline error diagnostics for invalid WKS syntax reported by the language server"></video>
  </p>
  <p>
    <h4>VS Code Diagnostics</h4>
    <video controls muted src="https://github.com/user-attachments/assets/6b4a6997-17b2-4a73-8a7f-c0970c26e2ac" alt="VS Code displays inline error diagnostics for invalid WKS syntax reported by the language server"></video>
  </p>
</div>

### Go-to Definition

Jumps to the definition of the wks plugins under the cursor.

<div align="center">
  <p>
    <h4>Neovim Go-to Definition</h4>
    <video controls muted src="https://github.com/user-attachments/assets/938675e1-d440-4e4f-a602-788ada4e06e9" alt="Using go-to definition in Neovim jumps to the definition of a WKS symbol via the language server"></video>
  </p>
  <p>
    <h4>VS Code Go-to Definition</h4>
    <video controls muted src="https://github.com/user-attachments/assets/b1b25ec2-3b62-4ea0-82a0-db2d5e41cd91" alt="Using go-to definition in VS Code jumps to the definition of a WKS symbol via the language server"></video>
  </p>
</div>

## Dependencies

- `bash` 4.0+
- `jq`

## Installation

### Manual

Requires `bash` and `jq` to be on your `PATH`.

```sh
git clone https://github.com/anakin4747/wksls
cd wksls
make install
# or with a custom prefix:
make install PREFIX=~/.local
```

To uninstall:

```sh
make uninstall
# or:
make uninstall PREFIX=~/.local
```

### Nix

Install directly from the flake into your profile:

```sh
nix profile add github:anakin4747/wksls
```

To uninstall:

```sh
nix profile remove wksls
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

```sh
make install-vscode-ext     # VS Code
make install-vscodium-ext   # VSCodium
```

Or install the `wksls-*.vsix` file from the GitHub releases.

The extension expects `wksls` to be on your `PATH`. Install the language
server first using one of the methods above.

## License

GPL-2.0-only. See [LICENSE](LICENSE).

