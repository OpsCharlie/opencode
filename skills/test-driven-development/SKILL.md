---
name: test-driven-development
description: Use when implementing any feature or bugfix, before writing implementation code
compatibility: opencode
---

## What I do

- Write tests first, watch them fail, then write minimal code to pass
- Follow Red-Green-Refactor cycle strictly
- Ensure every test fails for the right reason before implementing
- Prevent "test after" anti-pattern

## When to use me

Use this skill when implementing any feature, bugfix, or refactoring. Always use for new features and bug fixes.

## The Iron Law

```
NO PRODUCTION CODE WITHOUT A FAILING TEST FIRST
```

Write code before the test? Delete it. Start over.

## Red-Green-Refactor Cycle

### RED - Write Failing Test
1. Write one minimal test showing what should happen
2. Requirements: One behavior, clear name, real code (no mocks unless unavoidable)

### Verify RED - Watch It Fail (MANDATORY)
```bash
npm test path/to/test.test.ts
```
Confirm:
- Test fails (not errors)
- Failure message is expected
- Fails because feature missing (not typos)

### GREEN - Minimal Code
Write simplest code to pass the test:
- No features beyond what was asked
- No "flexibility" or "configurability" that wasn't requested
- If you write 200 lines and it could be 50, rewrite it

### Verify GREEN - Watch It Pass (MANDATORY)
```bash
npm test path/to/test.test.ts
```
Confirm:
- Test passes
- Other tests still pass
- Output pristine (no errors, warnings)

### REFACTOR - Clean Up
After green only:
- Remove duplication
- Improve names
- Extract helpers
Keep tests green. Don't add behavior.

## For Infrastructure & Scripting (Ansible & Shell)

While traditional unit-testing frameworks (like Jest or pytest) might not always apply to infrastructure and scripts, the cycle of **verify-first** is still critical:

### 1. Shell Scripts
- **Red:** Run `shellcheck my_script.sh` on your initial structure. Check for missing safety configurations or unquoted variables.
- **Green:** Implement strict bash mode (`set -euo pipefail`), quote all variables, use correct exit codes, and fix logic until `shellcheck` runs with 0 errors/warnings.
- **Refactor:** Deduplicate functions, improve naming, and enhance readability while keeping `shellcheck` perfectly clean.

### 2. Ansible Playbooks & Roles
- **Red:** Run `ansible-lint` on the initial scaffolding. Note any syntax, legacy module, or formatting issues.
- **Green:** Implement the tasks using FQCN, dict-based fact access (e.g. `ansible_facts['os_family']`), and proper handlers. Run `ansible-lint` until it returns exit code 0.
- **Refactor:** Reorganize tasks, group similar items under block blocks, clean up defaults, and use handlers/listen-topics while maintaining a 100% clean `ansible-lint` run.

## Why Order Matters

Tests written after code pass immediately. Passing immediately proves nothing:
- Might test wrong thing
- Might test implementation, not behavior
- Might miss edge cases you forgot
- You never saw it catch the bug

Test-first forces you to see the test fail, proving it actually tests something.

## Common Rationalizations

| Excuse | Reality |
|--------|---------|
| "Too simple to test" | Simple code breaks. Test takes 30 seconds. |
| "I'll test after" | Tests passing immediately prove nothing. |
| "Already manually tested" | Ad-hoc ≠ systematic. No record, can't re-run. |
| "TDD will slow me down" | TDD faster than debugging. Pragmatic = test-first. |
