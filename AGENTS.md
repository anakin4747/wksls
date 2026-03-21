
# WKS Language Server

## Git Best Practices

- **Commit Often:** Make small, focused commits.
- **Descriptive Messages:** Use clear, imperative commit messages.
- **Test Driven Development:**
  - Write tests before implementing features or fixes.
  - After creating the test, stop and request approval before proceeding.
- **.gitignore:** Exclude build artifacts and sensitive files.
- **No Secrets:** Never commit passwords or API keys.
- **Whitespace:** Never leave trailing whitespace

Commit every logical atomic addition or change using git. Each commit should
represent one coherent unit of work (e.g. add a helper function, fix a bug,
update the flake). Do not batch unrelated changes into a single commit. Commit
messages should be concise and written in the imperative mood.

## Code review

After creating a commit code review your work. Ask the following questions to
see how the code can be made cleaner:
- Did your change create any dead code?
- Did your change invalidate some comments?
- Is your change in the style of the codebase?
- Can guard clauses be used to avoid indenting?
- Can this code be refactored into a function to improve readibility?
- Is this commit atomic and only focused on one topic?
- Did anything unrelated get included in the commit by accident?
- Does this code reuse functionality already present in the codebase?
- Did the commit duplicate any functionality already present in the codebase?
- Is there a simplier way to implement this solution?
- Did you add anything extra functionality that doesn't have a corresponding
  test?

Fix the code accordingly in new commits.

# TODOs

```do right now
- completion is still completing things in the wrong places
  the tests for completing only commands at the beginning and only arguments
  after does not work
    [DEBUG][2026-03-21 03:59:46] ...unwrapped-7a8d316/share/nvim/runtime/lua/vim/lsp/log.lua:151    "rpc.send"      { id = 14, jsonrpc = "2.0", method = "shutdown" }
    [DEBUG][2026-03-21 03:59:55] ...unwrapped-7a8d316/share/nvim/runtime/lua/vim/lsp/log.lua:151    "omnifunc.findstart"    { base = "", findstart = 1 }
    [DEBUG][2026-03-21 03:59:55] ...unwrapped-7a8d316/share/nvim/runtime/lua/vim/lsp/log.lua:151    "LSP[wks]"      "client.request"        2       "textDocument/completion"    {
     context = { triggerKind = 1 }, position = { character = 0, line = 0 }, textDocument = { uri = "file:///home/kin/src/wksls/tests/openembedded-core/scripts/lib/wic/canned-wks/
    efi-bootdisk.wks.in" } }        <function 1>    3
    [DEBUG][2026-03-21 03:59:55] ...unwrapped-7a8d316/share/nvim/runtime/lua/vim/lsp/log.lua:151    "rpc.send"      { id = 15, jsonrpc = "2.0", method = "textDocument/completion"
    , params = { context = { triggerKind = 1 }, position = { character = 0, line = 0 }, textDocument = { uri = "file:///home/kin/src/wksls/tests/openembedded-core/scripts/lib/wic
    /canned-wks/efi-bootdisk.wks.in" } } }
    [DEBUG][2026-03-21 03:59:55] ...unwrapped-7a8d316/share/nvim/runtime/lua/vim/lsp/log.lua:151    "rpc.receive"   { id = 15, jsonrpc = "2.0", result = { { kind = 14, label = "b
    ootloader" }, { kind = 14, label = "part" }, { kind = 14, label = "partition" }, { kind = 5, label = "--active" }, { kind = 5, label = "--align" }, { kind = 5, label = "--app
    end" }, { kind = 5, label = "--configfile" }, { kind = 5, label = "--exclude-path" }, { kind = 5, label = "--extra-filesystem-space" }, { kind = 5, label = "--extra-partition
    -space" }, { kind = 5, label = "--fixed-size" }, { kind = 5, label = "--fsoptions" }, { kind = 5, label = "--fstype" }, { kind = 5, label = "--fsuuid" }, { kind = 5, label =
    "--label" }, { kind = 5, label = "--mkfs-extraopts" }, { kind = 5, label = "--no-table" }, { kind = 5, label = "--offset" }, { kind = 5, label = "--ondisk" }, { kind = 5, lab
    el = "--ondrive" }, { kind = 5, label = "--overhead-factor" }, { kind = 5, label = "--part-name" }, { kind = 5, label = "--part-type" }, { kind = 5, label = "--ptable" }, { k
    ind = 5, label = "--rootfs" }, { kind = 5, label = "--rootfs-dir" }, { kind = 5, label = "--size" }, { kind = 5, label = "--source" }, { kind = 5, label = "--sourceparams" },
     { kind = 5, label = "--system-id" }, { kind = 5, label = "--timeout" }, { kind = 5, label = "--use-uuid" }, { kind = 5, label = "--uuid" } } }
    [DEBUG][2026-03-21 04:00:06] ...unwrapped-7a8d316/share/nvim/runtime/lua/vim/lsp/log.lua:151    "omnifunc.findstart"    { base = "", findstart = 1 }
    [DEBUG][2026-03-21 04:00:06] ...unwrapped-7a8d316/share/nvim/runtime/lua/vim/lsp/log.lua:151    "LSP[wks]"      "client.request"        2       "textDocument/completion"    {
     context = { triggerKind = 1 }, position = { character = 24, line = 1 }, textDocument = { uri = "file:///home/kin/src/wksls/tests/openembedded-core/scripts/lib/wic/canned-wks
    /efi-bootdisk.wks.in" } }       <function 1>    3
    [DEBUG][2026-03-21 04:00:06] ...unwrapped-7a8d316/share/nvim/runtime/lua/vim/lsp/log.lua:151    "rpc.send"      { id = 16, jsonrpc = "2.0", method = "textDocument/completion"
    , params = { context = { triggerKind = 1 }, position = { character = 24, line = 1 }, textDocument = { uri = "file:///home/kin/src/wksls/tests/openembedded-core/scripts/lib/wi
    c/canned-wks/efi-bootdisk.wks.in" } } }
    [DEBUG][2026-03-21 04:00:06] ...unwrapped-7a8d316/share/nvim/runtime/lua/vim/lsp/log.lua:151    "rpc.receive"   { id = 16, jsonrpc = "2.0", result = { { kind = 14, label = "b
    ootloader" }, { kind = 14, label = "part" }, { kind = 14, label = "partition" }, { kind = 5, label = "--active" }, { kind = 5, label = "--align" }, { kind = 5, label = "--app
    end" }, { kind = 5, label = "--configfile" }, { kind = 5, label = "--exclude-path" }, { kind = 5, label = "--extra-filesystem-space" }, { kind = 5, label = "--extra-partition
    -space" }, { kind = 5, label = "--fixed-size" }, { kind = 5, label = "--fsoptions" }, { kind = 5, label = "--fstype" }, { kind = 5, label = "--fsuuid" }, { kind = 5, label =
    "--label" }, { kind = 5, label = "--mkfs-extraopts" }, { kind = 5, label = "--no-table" }, { kind = 5, label = "--offset" }, { kind = 5, label = "--ondisk" }, { kind = 5, lab
    el = "--ondrive" }, { kind = 5, label = "--overhead-factor" }, { kind = 5, label = "--part-name" }, { kind = 5, label = "--part-type" }, { kind = 5, label = "--ptable" }, { k
    ind = 5, label = "--rootfs" }, { kind = 5, label = "--rootfs-dir" }, { kind = 5, label = "--size" }, { kind = 5, label = "--source" }, { kind = 5, label = "--sourceparams" },
     { kind = 5, label = "--system-id" }, { kind = 5, label = "--timeout" }, { kind = 5, label = "--use-uuid" }, { kind = 5, label = "--uuid" } } }


- add tests to capture these bugs then fix them

- completion for every argument to every type of option does not work. for
  example:

  --ptable
  --source

- go to definition for the source plugin arguments.
- go to definition for everything possible. This might just be for source
  plugins though

- bootloader lines should only complete with bootloader arguments and vice
  versa for part

```

- getting the docs locally instead of saved with the language server so that it
  always gets the most relavent info

- have all of the information in the language server be dynamically pulled from
  the docs repos and what not so updating the info as the projects progress
  they can be easily updated.


## Priority: LSP method coverage

- [x] `textDocument/didChange` — keep in-memory text in sync after edits
- [x] `textDocument/completion` — enumerate all keywords and flags as completions
- [ ] `textDocument/didClose` — free memory and complete the document lifecycle; blocked on `lsts_close` upstream
- [ ] `shutdown` — respond to shutdown before exit (currently non-conformant); blocked on `lsts_shutdown` upstream
- [ ] `textDocument/diagnostics` — validate directive syntax and flag combinations; push model needs an `lsts_recv_notification` helper upstream; pull model (`textDocument/diagnostic`, LSP 3.17) also has no lsts helper

- [x] create a vim ftplugin (`ftplugin/wks.vim`)

## Potential lsts enhancements to upstream

These are missing helpers that would allow wksls tests to use lsts conventions
rather than calling `lsts_notify`/`lsts_request` inline.

- **`lsts_change <path> <version> <new-text>`:** A helper for
  `textDocument/didChange` (full-sync). Would let the `didChange` test use a
  single lsts call instead of hand-building the notification params.

- **`lsts_close <path>`:** A helper for `textDocument/didClose`. Needed before
  a `didClose` test can be written using lsts conventions.

- **`lsts_shutdown`:** A helper that sends the `shutdown` request and waits for
  a response, then sends `exit`. Needed before a conformant shutdown test can be
  written using lsts conventions.

- **`lsts_recv_notification`:** A helper that reads messages until a
  server-initiated notification (no `id`, has `method`) is received. Needed to
  test push-model diagnostics (`textDocument/publishDiagnostics`).

- **Position-only request helpers that skip implicit initialize/open:** `lsts_hover`
  always calls `lsts_initialize` and `lsts_open` internally. Tests that need to
  send a request mid-session (e.g. after a `didChange`) cannot use `lsts_hover`
  and must hand-roll `lsts_request`/`lsts_recv_response` instead.

## Potential lsts bugs to upstream

These were observed while debugging wksls and may warrant fixes or improvements
in the `tests/lsts` submodule.

- **No strict mode:** `lsts` does not use `set -o errexit/nounset/pipefail`.
  Errors in helper functions can silently pass tests that should fail.

- **`lsts_initialize` does not assert specific capabilities:** It only checks
  that `.result.capabilities` is an object. A server advertising no useful
  capabilities (e.g. missing `hoverProvider` or wrong `textDocumentSync`)
  would still pass the initialize test.

- **`lsts_stop` sends `exit` with params `{}`:** The LSP spec defines `exit`
  as a notification with no params. Sending `{}` is harmless for most servers
  but is technically non-conformant.

- **`lsts_recv_response` has no timeout on the outer loop:** The inner
  `IFS= read` calls use `LSTS_TIMEOUT` but the `while true` loop itself has no
  upper bound, so a server that never sends a response will hang the test
  indefinitely rather than timing out cleanly.

- **`LSTS_RESPONSE` normalises tabs and newlines to spaces:** The `tr '\t\n' '
  '` in `lsts_recv` means fixture files must also have all whitespace collapsed.
  A server that pretty-prints its JSON would never match a fixture even if the
  data is semantically identical.


