---
name: systematic-debugging
description: Use when encountering any bug, test failure, or unexpected behavior, before proposing fixes
compatibility: opencode
---

## What I do

- Systematic root cause investigation before proposing fixes
- Four-phase debugging process: Root Cause → Pattern Analysis → Hypothesis Testing → Implementation
- Evidence-based debugging with scientific method
- Prevention of "quick fix" thrashing and architectural questioning after 3+ failed fixes

## When to use me

Use this skill for ANY technical issue: test failures, bugs, unexpected behavior, performance problems, build failures, integration issues. Especially use when under time pressure or when previous fixes didn't work.

## The Four Phases

### Phase 1: Root Cause Investigation
1. Read error messages carefully - they often contain the exact solution
2. Reproduce consistently - if not reproducible, gather more data
3. Check recent changes - git diff, new dependencies, config changes
4. Gather evidence in multi-component systems - add diagnostic instrumentation
5. Trace data flow - find where bad value originates

### Phase 2: Pattern Analysis
1. Find working examples in same codebase
2. Compare against references - read reference implementations completely
3. Identify differences between working and broken code
4. Understand dependencies and assumptions

### Phase 3: Hypothesis and Testing
1. Form single hypothesis - state clearly what you think is the root cause
2. Test minimally - make smallest possible change to test hypothesis
3. Verify before continuing - did it work? If not, form new hypothesis
4. When you don't know, say so - don't pretend to know

#### Hypothesis template

```
Hypothesis: [What I think is wrong]
Evidence:   [Why I think this - error messages, logs, behavior]
Test:       [How I'll verify - smallest possible change]
Result:     [What happened - confirmed or new hypothesis]
```

Example:
```
Hypothesis: API returns 500 because database connection pool is exhausted
Evidence:   Logs show "connection pool exhausted" at time of failure
Test:       Increase pool size from 10 to 20
Result:     Still fails - hypothesis rejected, new hypothesis needed
```

### Phase 4: Implementation
1. Create failing test case first
2. Implement single fix addressing root cause
3. Verify fix works and no regressions
4. If 3+ fixes failed: Question the architecture

## Common root causes

| Root Cause | Symptoms | Investigation |
|------------|----------|---------------|
| **Race condition** | Intermittent failures, works sometimes | Check timing, add logging, use locks |
| **Memory leak** | Gradual slowdown, OOM errors | Monitor memory usage, check for unclosed resources |
| **Config drift** | Works in dev, fails in prod | Compare configs, check environment variables |
| **Dependency conflict** | Build fails, version errors | Check package.json, lockfile, compatibility |
| **Null/undefined** | Cannot read property of undefined | Add null checks, validate inputs |
| **Stale cache** | Old data served, inconsistent | Clear cache, check TTL settings |
| **Network timeout** | Intermittent connection failures | Check timeouts, retry logic, DNS |
| **Permission denied** | Works as admin, fails as user | Check file permissions, API keys, roles |

## Red Flags - STOP and Follow Process

- "Quick fix for now, investigate later"
- "Just try changing X and see if it works"
- "I don't fully understand but this might work"
- Proposing solutions before tracing data flow
- "One more fix attempt" (when already tried 2+)

## Quick Reference

| Phase | Key Activities | Success Criteria |
|-------|---------------|------------------|
| **1. Root Cause** | Read errors, reproduce, check changes, gather evidence | Understand WHAT and WHY |
| **2. Pattern** | Find working examples, compare | Identify differences |
| **3. Hypothesis** | Form theory, test minimally | Confirmed or new hypothesis |
| **4. Implementation** | Create test, fix, verify | Bug resolved, tests pass |

## Common pitfalls

| Pitfall | Why it's bad | What to do instead |
|---------|--------------|-------------------|
| Jumping to fix without understanding | May fix symptom, not cause | Always trace root cause first |
| Trying many fixes at once | Can't tell what worked | One change at a time, verify each |
| Not reproducing first | Can't verify fix works | Always reproduce before fixing |
| Ignoring error messages | They often contain the solution | Read them carefully |
| Giving up after 3 fixes | May be architecture issue | Step back, question assumptions |

## Examples

### Debugging workflow example

```
Problem: API returns 500 intermittently

Phase 1 - Root Cause:
  - Read error: "Connection pool exhausted"
  - Reproduce: Call API 100 times rapidly
  - Check changes: New feature added DB queries
  - Evidence: Logs show connection pool errors

Phase 2 - Pattern:
  - Find working: Old code used connection pooling correctly
  - Compare: New code opens connections but doesn't close them

Phase 3 - Hypothesis:
  - Hypothesis: Connection leak in new feature
  - Evidence: connections not closed in finally block
  - Test: Add connection.close() in finally
  - Result: Fixed! No more 500 errors

Phase 4 - Implementation:
  - Create test: Simulate 100 rapid requests
  - Fix: Add connection.close() in finally block
  - Verify: Test passes, no regressions
```
