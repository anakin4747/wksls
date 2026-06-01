---
name: code-review
description: Code review checklist. Use after creating a commit to review the quality of your changes.
---

After creating a commit, review your work against these rules and fix any violations in new commits:

- Remove any dead code introduced by your change.
- Update or remove comments invalidated by your change.
- Match the style of the surrounding codebase.
- Use guard clauses instead of indented branches where possible.
- Extract repeated or complex logic into named functions to improve readability.
- Keep each commit atomic and focused on one topic only.
- Exclude any changes unrelated to the commit's topic.
- Reuse existing functionality instead of reimplementing it.
- Do not duplicate functionality already present in the codebase.
- Prefer the simplest implementation that satisfies the requirements.
- Every new piece of functionality must have a corresponding test.
- Never commit with failing tests.
- Remove unneeded complexity.
