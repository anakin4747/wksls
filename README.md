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
    <video controls muted src="https://github.com/user-attachments/assets/df5e4b82-f6ba-4055-aefa-5e5cb9015c03" alt="Hovering over a WKS keyword in Neovim displays inline documentation from the language server"></video>
  </p>
  <p>
    <h4>VS Code Hover</h4>
    <video controls muted src="https://github.com/user-attachments/assets/67cf17be-5d8d-4c5d-abf4-b11261d01374" alt="Hovering over a WKS keyword in VS Code displays inline documentation from the language server"></video>
  </p>
</div>

### Completion

Provides keyword and argument suggestions.

<div align="center">
  <p>
    <h4>Neovim Completion</h4>
    <video controls muted src="https://github.com/user-attachments/assets/f209746d-ee90-4ed3-8b2b-6f0ba5e57a33" alt="Triggering completion in Neovim shows WKS keyword suggestions provided by the language server"></video>
  </p>
  <p>
    <h4>VS Code Completion</h4>
    <video controls muted src="https://github.com/user-attachments/assets/aeb9459c-d946-44fa-984f-cb81df579b78" alt="Triggering completion in VS Code shows WKS keyword suggestions provided by the language server"></video>
  </p>
</div>

### Diagnostics

Reports syntax and semantic errors inline.

<div align="center">
  <p>
    <h4>Neovim Diagnostics</h4>
    <video controls muted src="https://github.com/user-attachments/assets/c8e6b614-42d8-4ed2-ad0a-67cb7c4f63d0" alt="Neovim displays inline error diagnostics for invalid WKS syntax reported by the language server"></video>
  </p>
  <p>
    <h4>VS Code Diagnostics</h4>
    <video controls muted src="https://github.com/user-attachments/assets/51b164f2-e680-4ab3-b261-91a1e77b70a0" alt="VS Code displays inline error diagnostics for invalid WKS syntax reported by the language server"></video>
  </p>
</div>

### Go-to Definition

Jumps to the definition of the wks plugins under the cursor.

<div align="center">
  <p>
    <h4>Neovim Go-to Definition</h4>
    <video controls muted src="https://github.com/user-attachments/assets/dfa29733-d55f-44a2-bdf0-2fbb7055173e" alt="Using go-to definition in Neovim jumps to the definition of a WKS symbol via the language server"></video>
  </p>
  <p>
    <h4>VS Code Go-to Definition</h4>
    <video controls muted src="https://github.com/user-attachments/assets/2427e779-7589-469d-acd8-88f0d7237c75" alt="Using go-to definition in VS Code jumps to the definition of a WKS symbol via the language server"></video>
  </p>
</div>

## Dependencies

- `bash` 4.0+
- `jq`

## Installation

### Nix

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

