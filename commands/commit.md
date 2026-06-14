---
description: Write a Commitizen commit message
agent: plan
---
Write a commit message for the current change using Commitizen / Conventional Commits format.

Requirements:
- use `git diff --staged`
- Choose the correct type: feat, fix, chore, docs, refactor, test, style, perf, ci, build, or revert
- Infer scope from changed file paths (e.g. deploy, commands)
- Keep the title under 50 characters, lowercase after type/scope, no trailing period, imperative mood
- Wrap the body at 72 characters. No icons or emoticons in the body
- Detect breaking changes and add `!` or BREAKING CHANGE
- Reference any issue/PR numbers in a footer
- Omit body for trivial changes
- Output as a `gitcommit` fenced code block
- Return only the commit message
