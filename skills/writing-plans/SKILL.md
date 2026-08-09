---
name: writing-plans
description: Use when you have a spec or requirements for a multi-step task, before touching code
compatibility: opencode
---

## What I do

- Write comprehensive implementation plans with bite-sized tasks
- Create plans assuming zero codebase context for the implementer
- Document exact file paths, code, testing, and verification steps
- Follow DRY, YAGNI, TDD principles with frequent commits

## When to use me

Use this skill when you have a spec or requirements for a multi-step task and need to create an implementation plan before starting work.

## Plan Structure

### Header (Required)
```markdown
# [Feature Name] Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use subagent-driven-development (recommended) or executing-plans to implement this plan task-by-task.

**Goal:** [One sentence describing what this builds]
**Architecture:** [2-3 sentences about approach]
**Tech Stack:** [Key technologies/libraries]
```

### Task Granularity
Each step is one action (2-5 minutes):
- "Write the failing test" - step
- "Run it to make sure it fails" - step
- "Implement the minimal code to make the test pass" - step
- "Run the tests and make sure they pass" - step
- "Commit" - step

### Task Template
```markdown
### Task N: [Name]

**Files to create/modify:**
- src/feature.js (new)
- src/__tests__/feature.test.js (new)
- src/utils.js (modified)

**Steps:**
1. Write failing test for [specific behavior]
2. Run test to confirm failure
3. Implement minimal code to pass
4. Run test to confirm pass
5. Commit

**Verification:**
- [ ] Tests pass
- [ ] Linter clean
- [ ] No regressions
```

### Task Dependencies
Show how tasks relate:
```markdown
## Dependency Graph

Task 1 (Schema) → Task 2 (API) → Task 3 (Frontend)
                ↘ Task 4 (Tests)

Task 1 must complete before Task 2 and Task 4.
Task 2 must complete before Task 3.
```

### Risk Assessment
Identify potential issues upfront:
```markdown
## Risks

| Risk | Impact | Likelihood | Mitigation |
|------|--------|------------|------------|
| External API changes | High | Low | Pin API version, add retry logic |
| Database migration fails | High | Medium | Test on staging first, backup data |
| Performance regression | Medium | Medium | Add benchmarks, monitor metrics |
```

### File Structure
Before defining tasks, map out which files will be created or modified:
- Design units with clear boundaries and well-defined interfaces
- Each file should have one clear responsibility
- Files that change together should live together

## Key Rules

- Exact file paths always
- Complete code in every step - if a step changes code, show the code
- Exact commands with expected output
- DRY, YAGNI, TDD, frequent commits
- No placeholders (TBD, TODO, "implement later")
- Incremental file writing (~1000 tokens per edit)

## Self-Review

After writing the complete plan:
1. Spec coverage - verify each requirement has a task
2. Placeholder scan - search for red flag patterns
3. Type consistency - ensure names match across tasks

## Common pitfalls

| Pitfall | Why it's bad | What to do instead |
|---------|--------------|-------------------|
| Tasks too large (>30 min) | Hard to verify, easy to get lost | Break into smaller tasks |
| No verification steps | Can't confirm progress | Always include test/lint/build checks |
| Missing dependencies | Tasks fail out of order | Map dependencies clearly |
| Placeholders (TBD, TODO) | Implementer blocked | Complete all details |
| No risk assessment | Surprises derail plan | Identify risks upfront |

## Examples

### Good task example
```markdown
### Task 2: Create user API endpoint

**Files to create/modify:**
- src/routes/users.js (new)
- src/__tests__/users.test.js (new)

**Steps:**
1. Write failing test for POST /api/users
2. Run test to confirm failure
3. Implement Express route handler
4. Run test to confirm pass
5. Commit

**Verification:**
- [ ] Tests pass (npm test)
- [ ] Linter clean (npm run lint)
- [ ] No regressions
```

### Bad task example
```markdown
Task 2: Implement user API

Steps:
- Write code
- Test it
- Make it work
```
