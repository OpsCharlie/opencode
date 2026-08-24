# Anthropic Models Overview

This document tracks which Anthropic (first-party Claude API) models are available in the current
subscription (via `opencode models | grep anthropic`) along with their strengths, pricing, and
recommended task mappings.

Last synced: 2026-08-24

## Overview

- Available models from `opencode models | grep anthropic`:
  - Frontier: `Claude Fable 5`
  - Opus: `Claude Opus 4.5`, `4.6`, `4.7`, `4.8`, `4.8-fast`, `5`, `5-fast`
  - Sonnet: `Claude Sonnet 4.5`, `4.6`, `5`
  - Haiku: `Claude Haiku 4.5`
- Extended capabilities: **1M-token context** on Claude 4.6 and later (at standard pricing),
  **128k max output**, **adaptive thinking**, and a configurable **`effort`** level.
- No listed model is deprecated. Tentative retirement dates run from 2026-09-29 (Sonnet 4.5)
  through 2027-07-24 (Opus 5).
- Billing is direct usage-based per-token on the Claude API (USD), not credits.

## Naming notes

- IDs ending in a date (`-20250929`, `-20251001`, `-20251101`) are the pinned snapshots that the
  dateless aliases resolve to. They are duplicates, not extra models.
- From the 4.6 generation onward, dateless IDs (`claude-opus-4-6`, `claude-sonnet-5`) are
  themselves pinned snapshots, not evergreen pointers.
- `-fast` IDs select **fast mode** (research preview): same model, faster output, 2x price.
  Available only on Opus 5 and Opus 4.8, and only on the first-party Claude API.

## Agent quick model map

Capability-first primary picks, with a lower-cost fallback:

- **General-purpose coding and writing**: `Claude Sonnet 5` (primary), `Claude Haiku 4.5` (fallback).
- **Fast/repetitive tasks**: `Claude Haiku 4.5` (primary), `Claude Sonnet 5` (fallback).
- **Deep reasoning/debugging**: `Claude Opus 5` (primary), `Claude Opus 4.8` (fallback).
- **Long-running agents / hardest problems**: `Claude Fable 5` (primary), `Claude Opus 5` (fallback).
- **Latency-critical interactive work**: `Claude Opus 5 (fast)` (primary), `Claude Sonnet 5` (fallback).

Single-provider caveat: unlike the Copilot setup, there is no cross-vendor model here to give a
reviewer independent blind spots. The closest approximation is to review with a *different tier*
than the builder (e.g. build with Sonnet 5, review with Opus 5). Fable 5 would separate the tiers
further but is excluded from agent assignments on cost grounds (2x Opus 5).

## Models table

| Model                     | opencode ID                            | Context | Max output | Category                   | Strengths                                                           | Status / Notes                               |
| ------------------------- | -------------------------------------- | ------: | ---------: | -------------------------- | ------------------------------------------------------------------- | -------------------------------------------- |
| Claude Fable 5            | `anthropic/claude-fable-5`             |      1M |       128k | Frontier / long-run agents | Highest available capability; adaptive thinking always on.          | Active; slower latency. Retire >= 2027-06-09 |
| Claude Opus 5             | `anthropic/claude-opus-5`              |      1M |       128k | Deep reasoning & agentic   | Complex agentic coding and enterprise work; `effort` defaults high. | Active. Retire >= 2027-07-24                 |
| Claude Opus 5 (fast)      | `anthropic/claude-opus-5-fast`         |      1M |       128k | Deep reasoning & agentic   | Opus 5 with markedly faster output.                                 | Research preview; 2x price; API-only         |
| Claude Opus 4.8           | `anthropic/claude-opus-4-8`            |      1M |       128k | Deep reasoning & debugging | Prior-gen frontier reasoning; `effort` defaults high everywhere.    | Legacy. Retire >= 2027-05-28                 |
| Claude Opus 4.8 (fast)    | `anthropic/claude-opus-4-8-fast`       |      1M |       128k | Deep reasoning & debugging | Opus 4.8 with faster output.                                        | Research preview; 2x price; API-only         |
| Claude Opus 4.7           | `anthropic/claude-opus-4-7`            |      1M |       128k | Deep reasoning & debugging | Strong reasoning; first release on the new tokenizer.               | Legacy; no fast mode. Retire >= 2027-04-16   |
| Claude Opus 4.6           | `anthropic/claude-opus-4-6`            |      1M |       128k | Deep reasoning & debugging | Strong reasoning; first Opus with 1M context.                       | Legacy. Retire >= 2027-02-05                 |
| Claude Opus 4.5           | `anthropic/claude-opus-4-5`            |    200k |        64k | Deep reasoning & debugging | Sophisticated reasoning; extended thinking.                         | Legacy. Retire >= 2026-11-24                 |
| Claude Opus 4.5 (dated)   | `anthropic/claude-opus-4-5-20251101`   |    200k |        64k | Deep reasoning & debugging | Pinned snapshot of Opus 4.5.                                        | Same model as the alias                      |
| Claude Sonnet 5           | `anthropic/claude-sonnet-5`            |      1M |       128k | Coding & agentic           | Best speed/intelligence balance; default build model.               | Active. Retire >= 2027-06-30                 |
| Claude Sonnet 4.6         | `anthropic/claude-sonnet-4-6`          |      1M |       128k | Coding & agentic           | Reliable completions with 1M context; old tokenizer.                | Legacy. Retire >= 2027-02-17                 |
| Claude Sonnet 4.5         | `anthropic/claude-sonnet-4-5`          |    200k |        64k | Coding & agentic           | Structured outputs; extended thinking (non-adaptive).               | Legacy. Retire >= 2026-09-29                 |
| Claude Sonnet 4.5 (dated) | `anthropic/claude-sonnet-4-5-20250929` |    200k |        64k | Coding & agentic           | Pinned snapshot of Sonnet 4.5.                                      | Same model as the alias                      |
| Claude Haiku 4.5          | `anthropic/claude-haiku-4-5`           |    200k |        64k | Fast & lightweight         | Fastest model with near-frontier quality; extended thinking.        | Active. Retire >= 2026-10-15                 |
| Claude Haiku 4.5 (dated)  | `anthropic/claude-haiku-4-5-20251001`  |    200k |        64k | Fast & lightweight         | Pinned snapshot of Haiku 4.5.                                       | Same model as the alias                      |

Context values above are what the Claude API advertises. `opencode models` may report a smaller
effective window depending on provider config.

## Quick recommendations by task

- **General-purpose coding & writing**: `Claude Sonnet 5`, then `Claude Haiku 4.5` for cheap turns.
- **Fast / repetitive work**: `Claude Haiku 4.5`, `Claude Sonnet 5`.
- **Deep reasoning & debugging**: `Claude Opus 5`, `Claude Opus 4.8`, `Claude Fable 5`.
- **Long-horizon autonomous agents**: `Claude Fable 5`, `Claude Opus 5`.
- **Vision / multimodal prompts**: any current model -- all support image input and vision.
- **Cost-sensitive bulk work**: `Claude Haiku 4.5` plus the Batch API (50% off) and prompt caching.

## Examples

- **Coding prompt**: "Write a Python function that normalizes timestamps, document it, and add
  pytest coverage." Recommended: `Claude Sonnet 5`, or `Claude Haiku 4.5` for a quick pass.
- **README or docs**: "Generate a usage section with badges, CLI examples, and troubleshooting
  notes." Recommended: `Claude Sonnet 5`.
- **Zabbix config**: "Create a Zabbix item/trigger for disk occupancy > 85% with macros and
  recovery actions." Recommended: `Claude Haiku 4.5` (fast) or `Claude Sonnet 5`.
- **Ansible refactor**: "Refactor roles into a common collection and sync handlers across
  playbooks." Recommended: `Claude Sonnet 5`, escalate to `Claude Opus 5` if it stalls.
- **Repo-wide analysis**: "Load the whole service and map every call path into the auth module."
  Recommended: `Claude Opus 5` or `Claude Sonnet 5` (1M context).
- **Deep reasoning**: "Debug an inter-service deadlock with logs across three services."
  Recommended: `Claude Opus 5`, then `Claude Fable 5`.

## Availability & billing

- Billing is **direct per-token usage in USD** on the Claude API. There is no credit conversion
  (unlike Copilot AI credits or the CCU billing used on AWS/Azure marketplaces).
- **Prompt caching** multipliers, relative to base input price: 5m cache write 1.25x, 1h cache
  write 2x, cache read 0.1x. A 5m cache pays for itself after one read; a 1h cache after two.
- **Batch API** gives 50% off input and output. Not compatible with fast mode.
- **Long context is not surcharged**: Claude 4.6+ bills the full 1M window at standard rates.
- **Data residency**: `inference_geo: "us"` on 4.6+ applies a 1.1x multiplier to all token classes.
- **Tokenizer change**: Claude 4.7 and later use a newer tokenizer that produces roughly **30% more
  tokens for the same text**. Compare Opus 4.7+ against Sonnet 4.6 on effective cost, not headline
  rate.
- **Deprecated parameters**: `temperature`, `top_p`, `top_k` return a 400 error on Claude 4.7 and
  later when set to a non-default value.

### Per-token pricing (per 1M tokens)

| Model                           |  Input | Cache hit | 5m cache write | 1h cache write | Output |
| ------------------------------- | -----: | --------: | -------------: | -------------: | -----: |
| Claude Fable 5                  | $10.00 |     $1.00 |         $12.50 |         $20.00 | $50.00 |
| Claude Opus 5                   |  $5.00 |     $0.50 |          $6.25 |         $10.00 | $25.00 |
| Claude Opus 4.8                 |  $5.00 |     $0.50 |          $6.25 |         $10.00 | $25.00 |
| Claude Opus 4.7                 |  $5.00 |     $0.50 |          $6.25 |         $10.00 | $25.00 |
| Claude Opus 4.6                 |  $5.00 |     $0.50 |          $6.25 |         $10.00 | $25.00 |
| Claude Opus 4.5                 |  $5.00 |     $0.50 |          $6.25 |         $10.00 | $25.00 |
| Claude Sonnet 5                 |  $2.00 |     $0.20 |          $2.50 |          $4.00 | $10.00 |
| Claude Sonnet 4.6               |  $3.00 |     $0.30 |          $3.75 |          $6.00 | $15.00 |
| Claude Sonnet 4.5               |  $3.00 |     $0.30 |          $3.75 |          $6.00 | $15.00 |
| Claude Haiku 4.5                |  $1.00 |     $0.10 |          $1.25 |          $2.00 |  $5.00 |
| Claude Opus 5 / 4.8 (fast mode) | $10.00 |     $1.00 |         $12.50 |         $20.00 | $50.00 |

- Fast mode pricing applies across the full context window and stacks with caching and data
  residency multipliers.
- `Claude Sonnet 5`'s $2/$10 launch pricing is now the standard price; the previously announced
  increase to $3/$15 on 2026-09-01 was cancelled.

### Batch API pricing (per 1M tokens, 50% off)

| Model                   | Batch input | Batch output |
| ----------------------- | ----------: | -----------: |
| Claude Fable 5          |       $5.00 |       $25.00 |
| Claude Opus 4.5-5       |       $2.50 |       $12.50 |
| Claude Sonnet 5         |       $1.00 |        $5.00 |
| Claude Sonnet 4.5 / 4.6 |       $1.50 |        $7.50 |
| Claude Haiku 4.5        |       $0.50 |        $2.50 |

## Updater prompt

```text
Run `opencode models | grep anthropic` to get the current list of available models.

Fetch the latest Anthropic model pages at these URLs:
- https://platform.claude.com/docs/en/about-claude/models/overview
- https://platform.claude.com/docs/en/about-claude/pricing
- https://platform.claude.com/docs/en/about-claude/model-deprecations

Parse the pages for:
- per-token pricing (input / cache hit / 5m cache write / 1h cache write / output per 1M tokens),
  fast mode pricing, and Batch API pricing
- context window, max output, thinking mode, and latency per model
- deprecation state and tentative retirement dates

Update README_anthropic_models.md using ONLY models that appear in the
`opencode models | grep anthropic` output.
Preserve the top-level structure (Overview, Naming notes, Agent quick model map, Models table,
Quick recommendations, Examples, Availability & billing, Updater prompt).
Mark deprecated models with the retirement date, and note dated IDs that are snapshots of an alias.

After updating the README, regenerate models.claude.json from the available model list:
- Use the exact provider IDs from `opencode models | grep anthropic`
  (e.g. `anthropic/claude-sonnet-5`, note the dashed version format).
- Preserve the file structure: `$schema`, `model`, `small_model`, and `agent` keys for `plan`,
  `build`, `explore`, `implementer`, `code-reviewer`, `spec-reviewer`.
- Optimal flow within a single vendor: vary by TIER instead of family, since no cross-vendor model
  is available to provide independent blind spots. Mapping:
  - `plan` -> strongest reasoning model (e.g. Claude Opus 5)
  - `build`/`implementer` -> strong coding model (e.g. Claude Sonnet 5)
  - `code-reviewer` -> a HIGHER tier than the builder (e.g. Claude Opus 5)
  - do NOT assign Claude Fable 5 to any agent: at $10/$50 per MTok it is 2x Opus 5, and it is
    excluded on cost grounds until that changes
  - `spec-reviewer` -> strongest reasoning model (e.g. Claude Opus 5)
  - `explore` and `small_model` -> fast/lightweight (e.g. Claude Haiku 4.5)

Fix markdownlint issues in README_anthropic_models.md
```

---

References:

- Models overview: [Anthropic -- Models overview](https://platform.claude.com/docs/en/about-claude/models/overview)
- Pricing: [Anthropic -- Pricing](https://platform.claude.com/docs/en/about-claude/pricing)
- Model deprecations: [Anthropic -- Model deprecations](https://platform.claude.com/docs/en/about-claude/model-deprecations)
