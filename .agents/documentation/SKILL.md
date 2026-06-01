---
name: documentation
description: Documentation and Markdown writing guidelines. Use when writing or updating any documentation or Markdown files.
---

- Never duplicate the contents of a file or directory listing in documentation.
- Instead, direct the reader to the source of truth by referencing its filepath or the command to retrieve it.

**Instead of this:**
```markdown
The config file contains:

```toml
[commit_types]
  [commit_types.feat]
  ...
```
```

**Do this:**
```markdown
See `cog.toml` for the config.
```

**Instead of this:**
```markdown
The project structure is:
- src/
- tests/
- README.md
```

**Do this:**
```markdown
Run `ls` or `tree` to explore the project structure.
```
