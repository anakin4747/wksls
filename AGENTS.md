
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

## Priority: LSP method coverage

- [x] `textDocument/didChange` — keep in-memory text in sync after edits
- [x] `textDocument/completion` — enumerate all keywords and flags as completions
- [ ] `textDocument/didClose` — free memory and complete the document lifecycle; blocked on `lsts_close` upstream
- [ ] `shutdown` — respond to shutdown before exit (currently non-conformant); blocked on `lsts_shutdown` upstream
- [ ] `textDocument/diagnostics` — validate directive syntax and flag combinations

- create a vim ftplugin how of this

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


