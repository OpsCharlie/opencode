---
description: Run linters and formatters on changed files
agent: build
---
Find all files changed since the last commit using `git diff --name-only HEAD`. For each changed file, run the appropriate linter and formatter:

- `.sh`, `.bash`, `.zsh` → `shellcheck` and `shfmt -w`
- `.py` → `ruff check --fix` and `ruff format`
- `.lua` → `stylua`
- `.yaml`, `.yml` → `yaml-language-server` or `prettier`
- `.json`, `.md` → `prettier --write`
- Ansible files (`.yml` in ansible roles) → `ansible-lint`

Fix any issues found. Show a summary of what was fixed.
