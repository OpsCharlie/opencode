# GitHub Copilot Models Overview

This document tracks which GitHub Copilot models are available in the current subscription (via `opencode models | grep github-copilot`) along with their strengths, pricing, and recommended task mappings.

Last synced: 2026-08-10

## Overview

- Available models from `opencode models | grep github-copilot`:
  - OpenAI: `GPT-5 mini`, `GPT-5.3-Codex`, `GPT-5.4`, `GPT-5.4 mini`, `GPT-5.5`
  - Anthropic: `Claude Haiku 4.5`, `Claude Sonnet 4.5`/`4.6`/`5`, `Claude Opus 4.5`/`4.6`/`4.6-fast`/`4.7`/`4.7-fast`/`4.8`/`4.8-fast`/`5`
  - Google: `Gemini 3.1 Pro` (preview), `Gemini 3.5 Flash`
- Extended capabilities: **1M-token context window** and **configurable reasoning levels** on supported models.
- Scheduled for retirement on 2026-09-01: `Claude Opus 4.5`/`4.6`, `Claude Sonnet 4.5`/`4.6`, `Gemini 3.1 Pro`.
- Billing is usage-based: interactions consume tokens that convert to GitHub AI Credits (1 credit = $0.01 USD).

## Agent quick model map

Capability-first primary picks, with a lower-cost fallback:

- **General-purpose coding and writing**: `Claude Sonnet 5` (primary), `GPT-5 mini` (fast/low-cost fallback).
- **Fast/repetitive tasks**: `Claude Haiku 4.5` (primary), `Gemini 3.5 Flash` (fallback).
- **Deep reasoning/debugging**: `Claude Opus 5` (primary), `GPT-5.5` (fallback).
- **Multimodal/visual tasks**: `GPT-5 mini` (primary), `Gemini 3.1 Pro` (fallback, retiring 2026-09-01).
- **Agentic multi-step workflows**: `Claude Sonnet 5` (primary), `GPT-5.3-Codex` (fallback).

## Models table

| Model                   | Provider  | opencode ID                          | Category                   | Strengths                                                         | Status / Notes            |
| ----------------------- | --------- | ------------------------------------ | -------------------------- | ----------------------------------------------------------------- | ------------------------- |
| GPT-5 mini              | OpenAI    | `github-copilot/gpt-5-mini`         | General-purpose multimodal | Fast, reliable default for coding/writing; supports visual input. | GA                        |
| GPT-5.3-Codex           | OpenAI    | `github-copilot/gpt-5.3-codex`      | Codex / agentic            | High-quality codegen for refactors, tests, multi-file diffs.      | GA                        |
| GPT-5.4                 | OpenAI    | `github-copilot/gpt-5.4`            | Deep reasoning & debugging | Complex reasoning; 1M-context and configurable reasoning.         | GA                        |
| GPT-5.4 mini            | OpenAI    | `github-copilot/gpt-5.4-mini`       | Agentic                    | Agentic dev; effective with grep-style codebase exploration.      | GA                        |
| GPT-5.5                 | OpenAI    | `github-copilot/gpt-5.5`            | Deep reasoning & debugging | Complex reasoning, code analysis, technical decisions.            | GA                        |
| Claude Haiku 4.5        | Anthropic | `github-copilot/claude-haiku-4.5`   | Fast & lightweight         | Fast responses at good quality for small tasks.                   | GA                        |
| Claude Opus 4.5         | Anthropic | `github-copilot/claude-opus-4.5`    | Deep reasoning & debugging | Sophisticated reasoning for complex debugging.                    | GA (retiring 2026-09-01) |
| Claude Opus 4.6         | Anthropic | `github-copilot/claude-opus-4.6`    | Deep reasoning & debugging | Strong reasoning; 1M-context and configurable reasoning.          | GA (retiring 2026-09-01) |
| Claude Opus 4.6 (fast)  | Anthropic | `github-copilot/claude-opus-4.6-fast` | Deep reasoning & debugging | Faster Opus 4.6 variant.                                         | GA                        |
| Claude Opus 4.7         | Anthropic | `github-copilot/claude-opus-4.7`    | Deep reasoning & debugging | Improves on Opus 4.6; high-context multi-file work.               | GA                        |
| Claude Opus 4.7 (fast)  | Anthropic | `github-copilot/claude-opus-4.7-fast` | Deep reasoning & debugging | Faster Opus 4.7 variant.                                         | GA                        |
| Claude Opus 4.8         | Anthropic | `github-copilot/claude-opus-4.8`    | Deep reasoning & debugging | Anthropic's most powerful reasoning model.                        | GA                        |
| Claude Opus 4.8 (fast)  | Anthropic | `github-copilot/claude-opus-4.8-fast` | Deep reasoning & debugging | Faster Opus 4.8 variant; configurable reasoning.                  | GA                        |
| Claude Opus 5           | Anthropic | `github-copilot/claude-opus-5`      | Deep reasoning & debugging | Anthropic's newest, most powerful reasoning model.                | GA                        |
| Claude Sonnet 4.5       | Anthropic | `github-copilot/claude-sonnet-4.5`  | Coding & agentic           | Structured outputs for coding and agent tasks.                    | GA (retiring 2026-09-01) |
| Claude Sonnet 4.6       | Anthropic | `github-copilot/claude-sonnet-4.6`  | Coding, multimodal & agentic | Reliable completions; 1M-context.                               | GA (retiring 2026-09-01) |
| Claude Sonnet 5         | Anthropic | `github-copilot/claude-sonnet-5`    | Coding & agentic           | Strong coding/agent model; 1M-context. Promo pricing to 2026-08-31. | GA                     |
| Gemini 3.1 Pro          | Google    | `github-copilot/gemini-3.1-pro-preview` | Deep reasoning & visual | Long-context reasoning; multimodal; edit-then-test loops.         | Preview (retiring 2026-09-01) |
| Gemini 3.5 Flash        | Google    | `github-copilot/gemini-3.5-flash`   | Fast & lightweight         | Low-latency lightweight coding answers.                           | GA                        |

## Quick recommendations by task

- **General-purpose coding & writing**: `Claude Sonnet 5`, `GPT-5.3-Codex`, then `GPT-5 mini` as a fast default.
- **Fast / repetitive work**: `Claude Haiku 4.5`, `Gemini 3.5 Flash`, `GPT-5 mini`.
- **Deep reasoning & debugging**: `Claude Opus 5`, `Claude Opus 4.8`, `GPT-5.5`, `GPT-5.4`, `Gemini 3.1 Pro` (retiring 2026-09-01).
- **Working with visuals & multimodal prompts**: `GPT-5 mini`, `Claude Sonnet 4.6` (retiring 2026-09-01), `Gemini 3.1 Pro` (retiring 2026-09-01).
- **Agentic workflows**: `Claude Sonnet 5`, `GPT-5.3-Codex`, `GPT-5.4 mini`.

## Examples

- **Coding prompt**: "Write a Python function that normalizes timestamps, document it, and add pytest coverage." Recommended: `Claude Sonnet 5`, `GPT-5.3-Codex`, `GPT-5 mini`.
- **README or docs**: "Generate a usage section with badges, CLI examples, and troubleshooting notes." Recommended: `Claude Sonnet 5` or `GPT-5 mini`.
- **Zabbix config**: "Create a Zabbix item/trigger for disk occupancy > 85% with macros and recovery actions." Recommended: `Claude Sonnet 5` or `Claude Haiku 4.5` (fast).
- **Ansible refactor**: "Refactor roles into a common collection and sync handlers across playbooks." Recommended: `Claude Sonnet 5`, `GPT-5.3-Codex`, or `GPT-5.4 mini`.
- **Visual debugging**: "Analyze this screenshot of the UI and suggest CSS/layout fixes." Recommended: `GPT-5 mini` or `Gemini 3.1 Pro` (retiring 2026-09-01).
- **Deep reasoning**: "Debug an inter-service deadlock with logs across three services." Recommended: `Claude Opus 5`, `GPT-5.5`.

## Availability & billing

- Billing is **usage-based**: interactions consume input, cached, and output tokens that convert to GitHub AI Credits (**1 AI credit = $0.01 USD**). Included allowances vary by plan; usage beyond the allowance is billed at the per-token rates below.
- Code completions and next edit suggestions are **not** billed in AI credits and remain unlimited on paid plans.

### Per-token pricing (per 1M tokens)

| Model                         | Provider  |  Input | Cached input | Cache write | Output |
| ----------------------------- | --------- | -----: | -----------: | ----------: | -----: |
| GPT-5 mini                    | OpenAI    |  $0.25 |       $0.025 |           – |  $2.00 |
| GPT-5.3-Codex                 | OpenAI    |  $1.75 |       $0.175 |           – | $14.00 |
| GPT-5.4                       | OpenAI    |  $2.50 |        $0.25 |           – | $15.00 |
| GPT-5.4 (long context > 272K) | OpenAI    |  $5.00 |        $0.50 |           – | $22.50 |
| GPT-5.4 mini                  | OpenAI    |  $0.75 |       $0.075 |           – |  $4.50 |
| GPT-5.5                       | OpenAI    |  $5.00 |        $0.50 |           – | $30.00 |
| GPT-5.5 (long context > 272K) | OpenAI    | $10.00 |        $1.00 |           – | $45.00 |
| Claude Haiku 4.5              | Anthropic |  $1.00 |        $0.10 |       $1.25 |  $5.00 |
| Claude Sonnet 4.5             | Anthropic |  $3.00 |        $0.30 |       $3.75 | $15.00 |
| Claude Sonnet 4.6             | Anthropic |  $3.00 |        $0.30 |       $3.75 | $15.00 |
| Claude Sonnet 5               | Anthropic |  $2.00 |        $0.20 |       $2.50 | $10.00 |
| Claude Opus 4.5               | Anthropic |  $5.00 |        $0.50 |       $6.25 | $25.00 |
| Claude Opus 4.6               | Anthropic |  $5.00 |        $0.50 |       $6.25 | $25.00 |
| Claude Opus 4.7               | Anthropic |  $5.00 |        $0.50 |       $6.25 | $25.00 |
| Claude Opus 4.8               | Anthropic |  $5.00 |        $0.50 |       $6.25 | $25.00 |
| Claude Opus 5                 | Anthropic |  $5.00 |        $0.50 |       $6.25 | $25.00 |
| Claude Opus 4.8 (fast mode)   | Anthropic | $10.00 |        $1.00 |      $12.50 | $50.00 |
| Gemini 3.1 Pro                | Google    |  $2.00 |        $0.20 |           – | $12.00 |
| Gemini 3.1 Pro (> 200K)       | Google    |  $4.00 |        $0.40 |           – | $18.00 |
| Gemini 3.5 Flash              | Google    |  $1.50 |        $0.15 |           – |  $9.00 |

- Anthropic models incur a cache-write cost in addition to cached input; OpenAI and Google models do not.
- `Claude Sonnet 5` pricing is promotional through 2026-08-31.

## Updater prompt

```text
Run `opencode models | grep github-copilot` to get the current list of available models.

Fetch the latest GitHub Copilot model pages at these URLs:
- https://docs.github.com/en/copilot/reference/ai-models/supported-models
- https://docs.github.com/en/copilot/reference/ai-models/model-comparison
- https://docs.github.com/en/copilot/reference/copilot-billing/models-and-pricing

Parse the pages for:
- per-token pricing (input / cached input / cache write / output per 1M tokens) and AI-credit conversion
- recommended task mappings and any new model categories

Update README_copilot_models.md using ONLY models that appear in the `opencode models | grep github-copilot` output.
Preserve the top-level structure (Overview, Agent quick model map, Models table, Quick recommendations, Examples, Availability & billing, Updater prompt).
Mark retiring models with the retirement date, and update examples if new capabilities are advertised.

After updating the README, regenerate models.work.json from the available model list:
- Use the exact provider IDs from `opencode models | grep github-copilot` (e.g. `github-copilot/claude-sonnet-5`).
- Preserve the file structure: `$schema`, `model`, `small_model`, and `agent` keys for `plan`, `build`, `explore`, `implementer`, `code-reviewer`, `spec-reviewer`.
- Optimal flow: use a DIFFERENT model family for `code-reviewer` than `build`/`implementer` to avoid shared blind spots. Mapping:
  - `plan` -> strongest reasoning model (e.g. Claude Opus)
  - `build`/`implementer` -> strong coding model (e.g. Claude Sonnet)
  - `code-reviewer` -> strong reasoning from a DIFFERENT family than the builder (e.g. GPT-5.5 if builder is Claude)
  - `spec-reviewer` -> strongest reasoning model (e.g. Claude Opus)
  - `explore` and `small_model` -> fast/lightweight (e.g. Claude Haiku / GPT-5 mini)

Fix markdownlint issues in README_copilot_models.md
```

---

References:

- Supported models: [GitHub Copilot -- Supported models](https://docs.github.com/en/copilot/reference/ai-models/supported-models)
- Model comparison: [GitHub Copilot -- Model comparison](https://docs.github.com/en/copilot/reference/ai-models/model-comparison)
- Models and pricing: [GitHub Copilot -- Models and pricing](https://docs.github.com/en/copilot/reference/copilot-billing/models-and-pricing)
