---
name: requesting-code-review
description: Use when completing tasks, implementing major features, or before merging to verify work meets requirements
compatibility: opencode
---

## What I do

- Dispatch code-reviewer sub-agent using the Task tool
- Provide precisely crafted context for evaluation
- Keep reviewer focused on work product, not session history
- Enable early and frequent reviews

## When to use me

**Mandatory:**
- After each task in subagent-driven development
- After completing major feature
- Before merge to main

**Optional but valuable:**
- When stuck (fresh perspective)
- Before refactoring (baseline check)
- After fixing complex bug

## How to Request Review

### 1. Get git SHAs
```bash
BASE_SHA=$(git rev-parse HEAD~1)  # or origin/main
HEAD_SHA=$(git rev-parse HEAD)
```

### 2. Dispatch code-reviewer sub-agent

Context to include in Task tool prompt:
- What you just built (brief summary)
- What it should do (plan or requirements reference)
- Starting commit SHA (`BASE_SHA`)
- Ending commit SHA (`HEAD_SHA`)

### 3. Act on feedback
- Fix Critical issues immediately
- Fix Important issues before proceeding
- Note Minor issues for later
- Push back if reviewer is wrong (with reasoning)

## Red Flags

**Never:**
- Skip review because "it's simple"
- Ignore Critical issues
- Proceed with unfixed Important issues
- Argue with valid technical feedback

**If reviewer wrong:**
- Push back with technical reasoning
- Show code/tests that prove it works
- Request clarification
