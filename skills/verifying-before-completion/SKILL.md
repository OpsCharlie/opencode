---
name: verifying-before-completion
description: Use when about to claim work is complete, fixed, or passing, before committing or creating PRs
compatibility: opencode
---

## What I do

- Run verification commands and confirm output before making any success claims
- Provide evidence before assertions always
- Prevent false completion claims
- Ensure fresh verification for every status claim

## When to use me

Use this skill BEFORE:
- ANY variation of success/completion claims
- ANY expression of satisfaction
- ANY positive statement about work state
- Committing, PR creation, task completion
- Moving to next task
- Delegating to agents

## The Gate Function

BEFORE claiming any status or expressing satisfaction:

1. IDENTIFY: What command proves this claim?
2. RUN: Execute the FULL command (fresh, complete)
3. READ: Full output, check exit code, count failures
4. VERIFY: Does output confirm the claim?
   - If NO: State actual status with evidence
   - If YES: State claim WITH evidence
5. ONLY THEN: Make the claim

## Common Failures

| Claim | Requires | Not Sufficient |
|-------|----------|----------------|
| Tests pass | Test command output: 0 failures | Previous run, "should pass" |
| Linter clean | Linter output: 0 errors | Partial check, extrapolation |
| Build succeeds | Build command: exit 0 | Linter passing, logs look good |
| Bug fixed | Test original symptom: passes | Code changed, assumed fixed |
| Shell scripts clean | `shellcheck <script>`: 0 issues | Manual trial execution only |
| Ansible roles clean | `ansible-lint <file/folder>`: 0 issues | Syntax check only |

## Red Flags - STOP

- Using "should", "probably", "seems to"
- Expressing satisfaction before verification ("Great!", "Perfect!", "Done!")
- About to commit/push/PR without verification
- Trusting agent success reports
- Relying on partial verification

## Key Patterns

**Tests:**
```
RIGHT: [Run test command] [See: 34/34 pass] "All tests pass"
WRONG: "Should pass now" / "Looks correct"
```

**Build:**
```
RIGHT: [Run build] [See: exit 0] "Build passes"
WRONG: "Linter passed" (linter doesn't check compilation)
```

**Requirements:**
```
RIGHT: Re-read plan → Create checklist → Verify each → Report gaps or completion
...
WRONG: "Tests pass, phase complete"
```

**Shell Scripts:**
```
RIGHT: [Run shellcheck script.sh] [See: exit 0 / no violations] "Shellcheck passed"
WRONG: "It runs fine on my machine" (ignores potential edge cases or warnings)
```

**Ansible Playbooks & Roles:**
```
RIGHT: [Run ansible-lint roles/my_role] [See: 0 issues] "Ansible-lint passes with 0 violations"
WRONG: "Ansible syntax check passed"
```

## The Bottom Line

**No shortcuts for verification.**

Run the command. Read the output. THEN claim the result.

This is non-negotiable.
