---
name: code-review
description: Code review checklist. Use after creating a commit to review the quality of your changes.
---

After creating a commit, check every rule below. **Every rule is mandatory. A single violation fails the review — fix it in a new commit and re-run the full review before proceeding.**

## Rules

- **No dead code.** Remove any dead code introduced by your change.
- **No stale comments.** Update or remove any comments invalidated by your change.
- **Consistent style.** The change must match the style of the surrounding codebase.
- **No unnecessary indentation.** Use guard clauses instead of indented branches where possible.
- **No inlined complexity.** Extract repeated or complex logic into named functions.
- **Atomic commits.** Each commit must be focused on one topic only.
- **No unrelated changes.** The commit must not include changes outside its stated topic.
- **No reimplementation.** Reuse existing functionality instead of writing it again.
- **No duplication.** Do not duplicate functionality already present in the codebase.
- **Simplest solution.** Prefer the simplest implementation that satisfies the requirements.
- **Tests for new functionality.** Every new piece of functionality must have a corresponding test.
- **No failing tests.** All tests must pass before committing.
- **No unneeded complexity.** Remove any complexity that is not justified by a requirement.
- **Commit passes cocogitto.** The commit must pass all checks defined in the cocogitto configuration.

## Process

1. Check each rule above against the commit.
2. If any rule fails, fix the violation and amend the commit.
3. Re-run the full review from the top.
4. Only when all rules pass is the review complete.
