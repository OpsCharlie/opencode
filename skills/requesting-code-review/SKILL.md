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

```markdown
## Review Request

### What changed
[Brief summary of changes - 1-2 sentences]

### What it should do
[Requirements or plan reference]

### Files changed
- src/feature.js (new)
- src/__tests__/feature.test.js (new)
- src/utils.js (modified)

### Commits
- BASE: abc1234
- HEAD: def5678

### Tests
- [ ] All tests pass
- [ ] Linter clean
- [ ] Build succeeds
```

### 3. Act on feedback
- Fix Critical issues immediately
- Fix Important issues before proceeding
- Note Minor issues for later
- Push back if reviewer is wrong (with reasoning)

### Review criteria to ask about

When requesting review, ask reviewer to check:

- **Security**: SQL injection, XSS, auth bypass, secrets in code
- **Performance**: N+1 queries, unnecessary loops, memory leaks
- **Edge cases**: Null handling, empty arrays, concurrent access
- **Error handling**: Try/catch, error messages, graceful degradation
- **Tests**: Coverage, meaningful assertions, test isolation

### Feedback categories

| Category | Action | Timeline |
|----------|--------|----------|
| **Critical** | Must fix before merge | Immediately |
| **Important** | Should fix, can be separate PR | Before next task |
| **Nit** | Style/preferences, optional | When convenient |

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

## Common pitfalls

| Pitfall | Why it's bad | What to do instead |
|---------|--------------|-------------------|
| Skipping review for "simple" changes | Simple changes can have bugs | Always review, even small changes |
| Vague review context | Reviewer can't focus | Be specific about what changed and why |
| Not running tests before review | Wastes reviewer time | Verify tests pass first |
| Ignoring feedback without discussion | Damages team trust | Discuss or push back with reasoning |
| Reviewing too much at once | Reviewer fatigue | Break into smaller PRs |

## Examples

### Good review request
```markdown
## Review Request

### What changed
Added rate limiting to /api/users endpoint

### What it should do
Limit requests to 100 per minute per IP address

### Files changed
- src/middleware/rateLimiter.js (new)
- src/routes/users.js (modified)
- src/__tests__/rateLimiter.test.js (new)

### Tests
- [x] All tests pass
- [x] Linter clean
- [x] Build succeeds
```

### Bad review request
```markdown
Fixed stuff. Tests pass. Please review.
```
