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
