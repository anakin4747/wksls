# Code Review

After creating a commit, review your work by asking:

- Did your change create any dead code?
- Did your change invalidate any comments?
- Is your change in the style of the codebase?
- Can guard clauses be used to avoid indenting?
- Can this code be refactored into a function to improve readability?
- Is this commit atomic and only focused on one topic?
- Did anything unrelated get included in the commit by accident?
- Does this code reuse functionality already present in the codebase?
- Did the commit duplicate any functionality already present in the codebase?
- Is there a simpler way to implement this solution?
- Did you add extra functionality that doesn't have a corresponding test?
- Never commit with failing tests.
- Avoid unneeded complexity.

Fix any issues found in new commits.
