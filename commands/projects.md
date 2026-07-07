---
description: List all opencode projects and their directories
agent: plan
---

List every project opencode knows about, showing each project's title and directory (worktree).

Instructions:
- Read the project list from opencode's local database with `python3` (read-only). The DB is at `$XDG_DATA_HOME/opencode/opencode.db`, defaulting to `~/.local/share/opencode/opencode.db`. Open it read-only via `sqlite3.connect("file:<path>?mode=ro&immutable=1", uri=True)` so a running server is never disturbed.
- Query the `project` table for `worktree`, `name`, and `vcs`.
- Compute each project's TITLE the same way the UI does: use `name` if set, otherwise the last path segment of `worktree` (`os.path.basename(worktree.rstrip("/"))`). For the `/` worktree with no name, show `(global)`.
- `vcs` is `git` or empty; show `-` when empty. Sort by `worktree`.
- Do NOT use the `sqlite3` CLI (it may be absent) — use Python's built-in `sqlite3` module. Prefer writing a small script to a temp file and running it, rather than a fragile `python3 -c` one-liner.

Output format: a plain table, one project per line:

```text
TITLE              DIRECTORY (worktree)                    VCS
-----------------  --------------------------------------  ----
<title>            <worktree>                              <git|->
...

Total: <N> projects
```

Notes:
- The TITLE mirrors the web sidebar. When several projects share a basename (e.g. multiple "Zabbix"), the full `worktree` path disambiguates them — that is the point of this command.
- This lists local projects only (the `project` table). Remote workspaces are not included.
- If the DB file is missing, say so and suggest the user run opencode at least once.
- Keep the output concise; do not dump raw rows.

If the user passed `$ARGUMENTS`, treat it as a case-insensitive substring filter matching either the TITLE or the `worktree` path, and only show matching projects.
