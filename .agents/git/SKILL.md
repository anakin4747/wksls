---
name: git
description: Git best practices and commit workflow. Use when making commits or managing git history.
---

- Commit often with small, focused commits.
- Each commit should represent one coherent unit of work (e.g. add a helper function, fix a bug, update the flake). Do not batch unrelated changes into a single commit.
- Exclude build artifacts and sensitive files via .gitignore.
- Never commit passwords or API keys.
- Never leave trailing whitespace.

## Commit messages

This repo uses [cocogitto](https://docs.cocogitto.io/) to enforce conventional commits. Read `cog.toml` for the allowed commit types and format.

## Test Driven Development

- Write tests before implementing features or fixes.
- After creating the test, stop and request approval before proceeding.
