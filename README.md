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

Or add it to your NixOS/home-manager configuration:

```nix
environment.systemPackages = [ inputs.wksls.packages.${system}.default ];
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

The Vim runtime files (syntax highlighting, filetype detection, ftplugin) are
in the `ftdetect/`, `ftplugin/`, and `syntax/` directories. Copy them into
your Neovim runtime path or add the repo to your `runtimepath`:

```lua
vim.opt.runtimepath:append('/path/to/wksls')
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

## LSP coverage

Legend: `[x]` implemented · `[ ]` not implemented · `[-]` not applicable / out of scope

### Lifecycle

| Status | Method |
|---|---|
| `[x]` | `initialize` — advertises `hoverProvider`, `completionProvider`, full-sync `textDocumentSync` |
| `[ ]` | `initialized` — notification silently ignored |
| `[ ]` | `shutdown` — silently ignored (non-conformant); blocked on `lsts_shutdown` upstream |
| `[x]` | `exit` — cleanly exits the process |
| `[ ]` | `client/registerCapability` |
| `[ ]` | `client/unregisterCapability` |
| `[ ]` | `$/setTrace` |
| `[ ]` | `$/logTrace` |
| `[ ]` | `$/cancelRequest` |
| `[ ]` | `$/progress` |

### Text document synchronization

| Status | Method |
|---|---|
| `[x]` | `textDocument/didOpen` — stores full document text in memory |
| `[x]` | `textDocument/didChange` — full-sync (change type 1); replaces in-memory text |
| `[ ]` | `textDocument/didClose` — advertised via `openClose: true` but ignored; memory not freed; blocked on `lsts_close` upstream |
| `[ ]` | `textDocument/willSave` |
| `[ ]` | `textDocument/willSaveWaitUntil` |
| `[ ]` | `textDocument/didSave` |

### Language features

| Status | Method |
|---|---|
| `[x]` | `textDocument/hover` — markdown docs for all 32 keywords and flags |
| `[x]` | `textDocument/completion` — all keywords/flags; context-aware values for `--fstype` and `--ptable` |
| `[ ]` | `completionItem/resolve` |
| `[ ]` | `textDocument/signatureHelp` |
| `[ ]` | `textDocument/declaration` |
| `[ ]` | `textDocument/definition` |
| `[ ]` | `textDocument/typeDefinition` |
| `[ ]` | `textDocument/implementation` |
| `[ ]` | `textDocument/references` |
| `[ ]` | `textDocument/documentHighlight` |
| `[ ]` | `textDocument/documentSymbol` |
| `[ ]` | `textDocument/codeAction` |
| `[ ]` | `codeAction/resolve` |
| `[ ]` | `textDocument/codeLens` |
| `[ ]` | `codeLens/refresh` |
| `[ ]` | `textDocument/documentLink` |
| `[ ]` | `documentLink/resolve` |
| `[ ]` | `textDocument/documentColor` |
| `[ ]` | `textDocument/colorPresentation` |
| `[ ]` | `textDocument/formatting` |
| `[ ]` | `textDocument/rangeFormatting` |
| `[ ]` | `textDocument/onTypeFormatting` |
| `[ ]` | `textDocument/rename` |
| `[ ]` | `textDocument/prepareRename` |
| `[ ]` | `textDocument/foldingRange` |
| `[ ]` | `textDocument/selectionRange` |
| `[ ]` | `textDocument/linkedEditingRange` |
| `[ ]` | `textDocument/semanticTokens/full` |
| `[ ]` | `textDocument/semanticTokens/full/delta` |
| `[ ]` | `textDocument/semanticTokens/range` |
| `[ ]` | `textDocument/inlayHint` |
| `[ ]` | `inlayHint/resolve` |
| `[ ]` | `workspace/inlayHint/refresh` |
| `[ ]` | `textDocument/inlineValue` |
| `[ ]` | `workspace/inlineValue/refresh` |
| `[ ]` | `textDocument/moniker` |
| `[ ]` | `textDocument/prepareCallHierarchy` |
| `[ ]` | `callHierarchy/incomingCalls` |
| `[ ]` | `callHierarchy/outgoingCalls` |
| `[ ]` | `textDocument/prepareTypeHierarchy` |
| `[ ]` | `typeHierarchy/supertypes` |
| `[ ]` | `typeHierarchy/subtypes` |

### Diagnostics

| Status | Method |
|---|---|
| `[ ]` | `textDocument/publishDiagnostics` — push model; no validation implemented; blocked on `lsts_recv_notification` upstream |
| `[ ]` | `textDocument/diagnostic` — pull model (LSP 3.17); blocked on missing lsts helper upstream |
| `[ ]` | `workspace/diagnostic` |

### Workspace features

| Status | Method |
|---|---|
| `[ ]` | `workspace/symbol` |
| `[ ]` | `workspaceSymbol/resolve` |
| `[ ]` | `workspace/configuration` |
| `[ ]` | `workspace/didChangeConfiguration` |
| `[ ]` | `workspace/workspaceFolders` |
| `[ ]` | `workspace/didChangeWorkspaceFolders` |
| `[ ]` | `workspace/didChangeWatchedFiles` |
| `[ ]` | `workspace/executeCommand` |
| `[ ]` | `workspace/applyEdit` |
| `[ ]` | `workspace/willCreateFiles` |
| `[ ]` | `workspace/didCreateFiles` |
| `[ ]` | `workspace/willRenameFiles` |
| `[ ]` | `workspace/didRenameFiles` |
| `[ ]` | `workspace/willDeleteFiles` |
| `[ ]` | `workspace/didDeleteFiles` |

### Window features

| Status | Method |
|---|---|
| `[ ]` | `window/showMessage` |
| `[ ]` | `window/showMessageRequest` |
| `[ ]` | `window/logMessage` |
| `[ ]` | `window/showDocument` |
| `[ ]` | `window/workDoneProgress/create` |
| `[ ]` | `window/workDoneProgress/cancel` |
| `[ ]` | `telemetry/event` |
