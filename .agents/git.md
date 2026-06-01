# Git Best Practices

- Commit often with small, focused commits.
- Use clear, imperative commit messages.
- Commit every logical atomic addition or change. Each commit should represent
  one coherent unit of work (e.g. add a helper function, fix a bug, update the
  flake). Do not batch unrelated changes into a single commit.
- Exclude build artifacts and sensitive files via .gitignore.
- Never commit passwords or API keys.
- Never leave trailing whitespace.

## Test Driven Development

- Write tests before implementing features or fixes.
- After creating the test, stop and request approval before proceeding.
